import Image from "next/image";
import type { ComponentProps } from "react";
import hljs from "highlight.js";
import "highlight.js/styles/github-dark.css";

import { RichText } from "@payloadcms/richtext-lexical/react";

import type { Media } from "@/payload-types";

type RichTextData = ComponentProps<typeof RichText>["data"];

/**
 * Preprocesses Lexical JSON data to convert paragraphs containing markdown-style code blocks
 * (e.g. ```asm ... ```) into proper Lexical code block nodes.
 */
function preprocessLexicalJSON(data: any): any {
  if (!data || typeof data !== "object") return data;
  
  // Deep clone to avoid mutating the cached/original object
  const result = JSON.parse(JSON.stringify(data));

  const processChildren = (children: any[]): any[] => {
    if (!children || !Array.isArray(children)) return children;

    const newChildren: any[] = [];
    let isInsideCodeBlock = false;
    let codeLanguage = "";
    let codeLines: string[] = [];

    for (let i = 0; i < children.length; i++) {
      const child = children[i];

      if (!isInsideCodeBlock) {
        // Look for a paragraph starting with triple backticks
        if (child.type === "paragraph" && child.children) {
          const firstChild = child.children[0];
          if (
            firstChild &&
            firstChild.type === "text" &&
            typeof firstChild.text === "string" &&
            firstChild.text.trim().startsWith("```")
          ) {
            isInsideCodeBlock = true;
            const match = firstChild.text.trim().match(/^```(\w*)/);
            codeLanguage = match ? match[1] : "text";

            // Reconstruct full paragraph text (including tabs/linebreaks)
            let fullText = child.children
              .map((c: any) => {
                if (c.type === "text") return c.text;
                if (c.type === "linebreak") return "\n";
                if (c.type === "tab") return "\t";
                return "";
              })
              .join("");

            // Strip the opening backticks and language prefix
            const openingPrefix = match ? match[0] : "```";
            fullText = fullText.slice(fullText.indexOf(openingPrefix) + openingPrefix.length);

            // Check if it also closes in the same paragraph
            if (fullText.includes("```")) {
              const closingIndex = fullText.indexOf("```");
              const codeContent = fullText.slice(0, closingIndex);
              isInsideCodeBlock = false;
              newChildren.push({
                type: "code",
                language: codeLanguage || "text",
                children: [
                  {
                    type: "text",
                    text: codeContent.trim(),
                  },
                ],
              });
              continue;
            } else {
              if (fullText.trim()) {
                codeLines.push(fullText);
              }
              continue;
            }
          }
        }

        // Recurse children if any
        if (child.children) {
          child.children = processChildren(child.children);
        }
        newChildren.push(child);
      } else {
        // Inside a code block, gather text until we find closing backticks
        if (child.type === "paragraph" && child.children) {
          let fullText = child.children
            .map((c: any) => {
              if (c.type === "text") return c.text;
              if (c.type === "linebreak") return "\n";
              if (c.type === "tab") return "\t";
              return "";
            })
            .join("");

          if (fullText.includes("```")) {
            const closingIndex = fullText.indexOf("```");
            const finalPart = fullText.slice(0, closingIndex);
            if (finalPart.trim()) {
              codeLines.push(finalPart);
            }
            isInsideCodeBlock = false;

            newChildren.push({
              type: "code",
              language: codeLanguage || "text",
              children: [
                {
                  type: "text",
                  text: codeLines.join("\n").trim(),
                },
              ],
            });
            codeLines = [];
          } else {
            codeLines.push(fullText);
          }
        } else {
          codeLines.push(child.text || "");
        }
      }
    }

    // Fallback if code block was not closed by the end of document
    if (isInsideCodeBlock && codeLines.length > 0) {
      newChildren.push({
        type: "code",
        language: codeLanguage || "text",
        children: [
          {
            type: "text",
            text: codeLines.join("\n").trim(),
          },
        ],
      });
    }

    return newChildren;
  };

  if (result.root && result.root.children) {
    result.root.children = processChildren(result.root.children);
  }

  return result;
}

/**
 * Renders Payload Lexical content with custom converters that:
 *  - guard `upload` nodes whose related media is missing (`value: null`), so a
 *    deleted/orphaned image doesn't crash the page;
 *  - render tables with plain elements (no hardcoded inline styles), so the
 *    `.article-body` CSS controls borders/padding/header background.
 *  - highlight code blocks with highlight.js on the server side
 */
export default function RichTextBody({ data }: { data: RichTextData }) {
  const processedData = preprocessLexicalJSON(data);
  return (
    <RichText
      data={processedData}
      converters={({ defaultConverters }) => ({
        ...defaultConverters,
        upload: ({ node }) => {
          const value = node.value;
          if (!value || typeof value !== "object") return null;
          const media = value as Media;
          if (!media.url) return null;
          return (
            <figure>
              <Image
                src={media.url}
                alt={media.alt ?? ""}
                width={media.width ?? 1200}
                height={media.height ?? 800}
                sizes="(min-width: 768px) 768px, 100vw"
                className="h-auto w-full"
              />
              {media.alt ? <figcaption>{media.alt}</figcaption> : null}
            </figure>
          );
        },
        code: ({ node }) => {
          const codeText = node.children?.map((child: any) => child.text || "").join("") || "";
          const language = node.language || "text";
          let highlightedHtml = "";
          try {
            if (language && hljs.getLanguage(language)) {
              highlightedHtml = hljs.highlight(codeText, { language }).value;
            } else {
              highlightedHtml = hljs.highlightAuto(codeText).value;
            }
          } catch (e) {
            highlightedHtml = codeText;
          }
          return (
            <pre className={`hljs language-${language}`}>
              <code
                className={`language-${language}`}
                dangerouslySetInnerHTML={{ __html: highlightedHtml }}
              />
            </pre>
          );
        },
        table: ({ node, nodesToJSX }) => (
          <table>
            <tbody>{nodesToJSX({ nodes: node.children })}</tbody>
          </table>
        ),
        tablerow: ({ node, nodesToJSX }) => <tr>{nodesToJSX({ nodes: node.children })}</tr>,
        tablecell: ({ node, nodesToJSX }) => {
          const Tag = node.headerState > 0 ? "th" : "td";
          const colSpan = node.colSpan && node.colSpan > 1 ? node.colSpan : undefined;
          const rowSpan = node.rowSpan && node.rowSpan > 1 ? node.rowSpan : undefined;
          return (
            <Tag colSpan={colSpan} rowSpan={rowSpan}>
              {nodesToJSX({ nodes: node.children })}
            </Tag>
          );
        },
      })}
    />
  );
}
