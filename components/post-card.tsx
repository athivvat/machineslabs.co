import Image from "next/image";
import Link from "next/link";

import CategoryBadge from "@/components/category-badge";
import type { Category, Media, Post } from "@/payload-types";

export default function PostCard({ post }: { post: Post }) {
  const image = post.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const categories = (post.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  return (
    <Link href={`/articles/${post.slug}`} className="group flex flex-col no-underline">
      <div className="relative aspect-16/10 overflow-hidden border border-border bg-muted">
        {media?.url ? (
          <Image
            src={media.url}
            alt={media.alt ?? post.title}
            fill
            sizes="(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw"
            className="object-cover transition-transform duration-500 group-hover:scale-105"
          />
        ) : null}
      </div>

      {categories.length > 0 && (
        <div className="mt-4 flex flex-wrap gap-2">
          {categories.map((category) => (
            <CategoryBadge key={category.id}>{category.title}</CategoryBadge>
          ))}
        </div>
      )}

      <h3 className="mt-3 font-prompt text-lg font-medium leading-tight text-foreground transition-colors group-hover:text-blaze-orange">
        {post.title}
      </h3>
      {post.excerpt || post.subTitle ? (
        <p className="mt-2 line-clamp-3 text-sm text-muted-foreground">
          {post.excerpt || post.subTitle}
        </p>
      ) : null}
    </Link>
  );
}
