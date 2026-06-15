import type { Metadata } from "next";
import Image from "next/image";
import { notFound } from "next/navigation";
import { draftMode } from "next/headers";

import CategoryBadge from "@/components/category-badge";
import RichTextBody from "@/components/rich-text";
import ShareButtons from "@/components/share-buttons";
import type { Category, Media } from "@/payload-types";
import { getPostBySlug, getPosts } from "@/lib/posts";

export const revalidate = 60;

type Params = { params: Promise<{ slug: string }> };

export async function generateStaticParams() {
  const posts = await getPosts();
  return posts.map((post) => ({
    slug: post.slug,
  }));
}

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug } = await params;
  const draft = await draftMode();
  const post = await getPostBySlug(slug, { draft: draft.isEnabled });
  if (!post) return {};

  const description = post.excerpt ?? post.subTitle ?? undefined;

  const base = process.env.NEXT_PUBLIC_APP_URL || "https://machineslabs.co";
  const url = `${base}/articles/${post.slug}`;

  const image = post.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const ogImages =
    media?.url != null
      ? [
          {
            url: media.url.startsWith("http") ? media.url : `${base}${media.url}`,
            width: media.width ?? undefined,
            height: media.height ?? undefined,
            alt: media.alt ?? post.title,
          },
        ]
      : undefined;

  return {
    title: `${post.title} — Machines Labs`,
    description,
    alternates: { canonical: url },
    openGraph: {
      type: "article",
      title: post.title,
      description,
      url,
      siteName: "Machines Labs",
      locale: "th_TH",
      images: ogImages,
    },
    twitter: {
      card: ogImages ? "summary_large_image" : "summary",
      title: post.title,
      description,
      creator: "@athivvat",
      images: ogImages?.map((i) => i.url),
    },
  };
}

export default async function ArticlePage({ params }: Params) {
  const { slug } = await params;
  const draft = await draftMode();
  const post = await getPostBySlug(slug, { draft: draft.isEnabled });
  if (!post) notFound();

  const image = post.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const { caption, credits } = post.featureImage ?? {};
  const categories = (post.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  const base = process.env.NEXT_PUBLIC_APP_URL || "https://machineslabs.co";
  const shareUrl = `${base}/articles/${post.slug}`;

  return (
    <article className="mx-auto max-w-2xl px-6 py-20">
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
        <p className="mt-6 border-l-2 border-blaze-orange pl-4 text-lg leading-relaxed text-muted-foreground">
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
        <div className="article-body mt-10">
          <RichTextBody data={post.body} />
        </div>
      )}

      <div className="mt-12 border-t border-border pt-6">
        <p className="mb-3 font-mono text-xs uppercase tracking-widest text-muted-foreground">
          แชร์บทความนี้
        </p>
        <ShareButtons url={shareUrl} title={post.title} />
      </div>
    </article>
  );
}
