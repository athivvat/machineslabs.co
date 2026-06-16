import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { draftMode } from "next/headers";
import { ArrowLeftIcon, CpuIcon, ExternalLinkIcon } from "lucide-react";

import CategoryBadge from "@/components/category-badge";
import RichTextBody from "@/components/rich-text";
import ShareButtons from "@/components/share-buttons";
import type { Category, Media } from "@/payload-types";
import { getProjectBySlug, getProjects } from "@/lib/projects";
import { db } from "@/db";
import { storeProduct } from "@/db/schema/store";
import { inArray } from "drizzle-orm";

interface ProjectPageProps {
  params: Promise<{ slug: string }>;
}

export async function generateStaticParams() {
  const projects = await getProjects();
  return projects.map((project) => ({
    slug: project.slug,
  }));
}

export async function generateMetadata({ params }: ProjectPageProps): Promise<Metadata> {
  const { slug } = await params;
  const draft = await draftMode();
  const project = await getProjectBySlug(slug, { draft: draft.isEnabled });
  if (!project) return {};

  const description = project.excerpt ?? project.subTitle ?? undefined;

  const base = process.env.NEXT_PUBLIC_APP_URL || "https://machineslabs.co";
  const url = `${base}/projects/${project.slug}`;

  const image = project.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const ogImages =
    media?.url != null
      ? [
          {
            url: media.url.startsWith("http") ? media.url : `${base}${media.url}`,
            width: media.width ?? undefined,
            height: media.height ?? undefined,
            alt: media.alt ?? project.title,
          },
        ]
      : undefined;

  return {
    title: `${project.title} — Projects | Machines Labs`,
    description,
    alternates: { canonical: url },
    openGraph: {
      type: "article",
      title: project.title,
      description,
      url,
      siteName: "Machines Labs",
      locale: "th_TH",
      images: ogImages,
    },
    twitter: {
      card: ogImages ? "summary_large_image" : "summary",
      title: project.title,
      description,
      creator: "@athivvat",
      images: ogImages?.map((i) => i.url),
    },
  };
}

export default async function ProjectDetailPage({ params }: ProjectPageProps) {
  const { slug } = await params;
  const draft = await draftMode();
  const project = await getProjectBySlug(slug, { draft: draft.isEnabled });
  if (!project) notFound();

  const image = project.featureImage?.image;
  const media = image && typeof image === "object" ? (image as Media) : null;
  const { caption, credits } = project.featureImage ?? {};
  const categories = (project.categories ?? []).filter(
    (c): c is Category => typeof c === "object" && c !== null,
  );

  const base = process.env.NEXT_PUBLIC_APP_URL || "https://machineslabs.co";
  const shareUrl = `${base}/projects/${project.slug}`;

  // Fetch Parts Used from database
  const partsIds = project.partsUsed as string[] | null;
  let componentsList: any[] = [];
  
  if (partsIds && partsIds.length > 0) {
    try {
      componentsList = await db
        .select()
        .from(storeProduct)
        .where(inArray(storeProduct.id, partsIds));
    } catch (err) {
      console.error("Failed to query partsUsed from store_product:", err);
    }
  }

  return (
    <div className="bg-black min-h-screen text-white pt-24 pb-20">
      <article className="mx-auto max-w-2xl px-6">
        
        {/* Back Button */}
        <Link 
          href="/projects" 
          className="inline-flex items-center gap-2 text-sm text-gray-400 hover:text-blaze-orange transition-colors duration-200 mb-8 font-mono"
        >
          <ArrowLeftIcon size={16} />
          กลับหน้าโปรเจกต์ทั้งหมด
        </Link>

        {/* Categories */}
        {categories.length > 0 && (
          <div className="mb-4 flex flex-wrap gap-2">
            {categories.map((category) => (
              <CategoryBadge key={category.id}>{category.title}</CategoryBadge>
            ))}
          </div>
        )}

        {/* Title */}
        <h1 className="font-prompt text-4xl font-medium leading-tight tracking-tight md:text-5xl">{project.title}</h1>
        
        {/* Subtitle */}
        {project.subTitle && (
          <p className="mt-4 text-lg text-gray-400 font-sans">{project.subTitle}</p>
        )}
        
        {/* Excerpt */}
        {project.excerpt && (
          <p className="mt-6 border-l-2 border-blaze-orange pl-4 text-lg leading-relaxed text-gray-400 font-sans">
            {project.excerpt}
          </p>
        )}

        {/* Feature Image */}
        {media?.url && (
          <figure className="mt-10">
            <div className="relative aspect-video overflow-hidden border border-white/10 bg-zinc-950">
              <Image
                src={media.url}
                alt={media.alt ?? project.title}
                fill
                sizes="(min-width: 768px) 768px, 100vw"
                className="object-cover"
                priority
              />
            </div>
            {(caption || credits) && (
              <figcaption className="mt-2 text-xs text-gray-500">
                {caption}
                {caption && credits ? " · " : ""}
                {credits ? (
                  <span dangerouslySetInnerHTML={{ __html: credits }} />
                ) : null}
              </figcaption>
            )}
          </figure>
        )}

        {/* Main Body */}
        {project.body && (
          <div className="article-body mt-10">
            <RichTextBody data={project.body} />
          </div>
        )}

        {/* Parts Used Section (Linked components from store) */}
        {componentsList.length > 0 && (
          <div className="mt-16 border-t border-white/10 pt-10">
            <h3 className="text-xl font-bold tracking-tight text-white mb-6 flex items-center gap-2">
              <CpuIcon size={20} className="text-blaze-orange" />
              อุปกรณ์ที่ใช้ในโปรเจกต์นี้
            </h3>
            
            <div className="grid gap-4 sm:grid-cols-2">
              {componentsList.map((part) => (
                <div 
                  key={part.id} 
                  className="flex items-center justify-between p-4 rounded-xl border border-white/[0.08] bg-white/[0.01] hover:border-white/[0.15] hover:bg-white/[0.03] transition duration-200"
                >
                  <div className="min-w-0">
                    <span className="text-[10px] uppercase font-mono text-gray-500 tracking-wider">
                      {part.category || "General Part"}
                    </span>
                    <h4 className="font-bold text-white text-sm truncate mt-0.5" title={part.name}>
                      {part.name}
                    </h4>
                    <span className="text-xs font-semibold text-blaze-orange mt-1 block">
                      ฿{part.price.toLocaleString()}
                    </span>
                  </div>

                  <Link 
                    href={`/store`} // Back to store front page
                    className="flex h-9 w-9 items-center justify-center rounded-lg border border-white/10 bg-zinc-950 text-gray-400 hover:text-white hover:border-blaze-orange hover:bg-blaze-orange/10 transition duration-200 shrink-0 ml-3"
                    title="ดูอุปกรณ์ในร้านค้า"
                  >
                    <ExternalLinkIcon size={16} />
                  </Link>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Share Section */}
        <div className="mt-12 border-t border-white/10 pt-6">
          <p className="mb-3 font-mono text-xs uppercase tracking-widest text-gray-500">
            แชร์โปรเจกต์นี้
          </p>
          <ShareButtons url={shareUrl} title={project.title} />
        </div>
      </article>
    </div>
  );
}
