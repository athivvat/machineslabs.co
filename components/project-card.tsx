import Image from "next/image";
import Link from "next/link";

import CategoryBadge from "@/components/category-badge";
import type { Category, Media, Project } from "@/payload-types";

export default function ProjectCard({ project }: { project: Project }) {
  const image = project.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const categories = (project.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  return (
    <Link href={`/projects/${project.slug}`} className="group flex flex-col no-underline">
      <div className="relative aspect-16/10 overflow-hidden border border-border bg-muted">
        {media?.url ? (
          <Image
            src={media.url}
            alt={media.alt ?? project.title}
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
        {project.title}
      </h3>
      {project.excerpt || project.subTitle ? (
        <p className="mt-2 line-clamp-3 text-sm text-muted-foreground font-sans">
          {project.excerpt || project.subTitle}
        </p>
      ) : null}
    </Link>
  );
}
