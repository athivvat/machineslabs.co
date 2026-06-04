import Image from "next/image";
import type { ComponentProps } from "react";

import { RichText } from "@payloadcms/richtext-lexical/react";

import type { Media } from "@/payload-types";

type RichTextData = ComponentProps<typeof RichText>["data"];

/**
 * Renders Payload Lexical content with custom converters that:
 *  - guard `upload` nodes whose related media is missing (`value: null`), so a
 *    deleted/orphaned image doesn't crash the page;
 *  - render tables with plain elements (no hardcoded inline styles), so the
 *    `.article-body` CSS controls borders/padding/header background.
 */
export default function RichTextBody({ data }: { data: RichTextData }) {
  return (
    <RichText
      data={data}
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
