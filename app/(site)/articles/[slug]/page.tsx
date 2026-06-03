import type { Metadata } from "next";
import Image from "next/image";
import { notFound } from "next/navigation";

import { RichText } from "@payloadcms/richtext-lexical/react";

import CategoryBadge from "@/components/category-badge";
import type { Category, Media } from "@/payload-types";
import { getPostBySlug } from "@/lib/posts";

export const dynamic = "force-dynamic";

type Params = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug } = await params;
  const post = await getPostBySlug(slug);
  if (!post) return {};
  return {
    title: `${post.title} — Machines Labs`,
    description: post.excerpt ?? post.subTitle ?? undefined,
  };
}

export default async function ArticlePage({ params }: Params) {
  const { slug } = await params;
  const post = await getPostBySlug(slug);
  if (!post) notFound();

  const image = post.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const { caption, credits } = post.featureImage ?? {};
  const categories = (post.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  return (
    <article className="mx-auto max-w-3xl px-6 py-20">
      {categories.length > 0 && (
        <div className="mb-4 flex flex-wrap gap-2">
          {categories.map((category) => (
            <CategoryBadge key={category.id}>{category.title}</CategoryBadge>
          ))}
        </div>
      )}
      <h1 className="font-prompt text-4xl font-medium leading-tight tracking-tight md:text-5xl">{post.title}</h1>
      {post.subTitle && (
        <p className="mt-4 text-lg text-muted-foreground">{post.subTitle}</p>
      )}
      {post.excerpt && (
        <p className="mt-6 border-l-2 border-blaze-orange pl-4 text-base leading-relaxed text-muted-foreground">
          {post.excerpt}
        </p>
      )}

      {media?.url && (
        <figure className="mt-10">
          <div className="relative aspect-video overflow-hidden border border-border bg-muted">
            <Image
              src={media.url}
              alt={media.alt ?? post.title}
              fill
              sizes="(min-width: 768px) 768px, 100vw"
              className="object-cover"
              priority
            />
          </div>
          {(caption || credits) && (
            <figcaption className="mt-2 text-xs text-muted-foreground">
              {caption}
              {caption && credits ? " · " : ""}
              {credits}
            </figcaption>
          )}
        </figure>
      )}

      {post.body && (
        <div className="article-body prose prose-invert mt-10 max-w-none prose-a:text-blaze-orange prose-headings:tracking-tight">
          <RichText data={post.body} />
        </div>
      )}
    </article>
  );
}
