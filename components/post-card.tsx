import Image from "next/image";
import Link from "next/link";

import CategoryBadge from "@/components/category-badge";
import type { Category, Media, Post } from "@/payload-types";

interface PostCardProps {
  post: Post;
  compact?: boolean;
}

export default function PostCard({ post, compact = false }: PostCardProps) {
  const image = post.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const categories = (post.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  return (
    <Link href={`/articles/${post.slug}`} className="group flex flex-col no-underline">
      <div className={`relative overflow-hidden border border-border bg-muted ${
        compact ? "aspect-16/10" : "aspect-video"
      }`}>
        {media?.url ? (
          <Image
            src={media.url}
            alt={media.alt ?? post.title}
            fill
            sizes={
              compact
                ? "(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw"
                : "(min-width: 768px) 50vw, 100vw"
            }
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

      <h3 className={`mt-3 font-prompt font-medium leading-tight text-foreground transition-colors group-hover:text-blaze-orange ${
        compact ? "text-base md:text-lg" : "text-xl md:text-2xl"
      }`}>
        {post.title}
      </h3>
      
      {!compact && (post.excerpt || post.subTitle) ? (
        <p className="mt-2 line-clamp-3 text-sm text-muted-foreground">
          {post.excerpt || post.subTitle}
        </p>
      ) : null}

      {compact && (post.excerpt || post.subTitle) ? (
        <p className="mt-2 line-clamp-2 text-xs text-muted-foreground/80">
          {post.excerpt || post.subTitle}
        </p>
      ) : null}
    </Link>
  );
}
