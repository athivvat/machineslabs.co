import type { Metadata } from "next";
import Link from "next/link";

import PostCard from "@/components/post-card";
import { getPosts } from "@/lib/posts";

export const revalidate = 60;

export const metadata: Metadata = {
  title: "บทความ — Machines Labs",
  description: "บทความล่าสุดจาก Machines Labs",
};

interface SearchParams {
  category?: string;
  tag?: string;
}

export default async function ArticlesPage({
  searchParams,
}: {
  searchParams: Promise<SearchParams>;
}) {
  const { category: categoryIdStr, tag: tagIdStr } = await searchParams;
  const selectedCategoryId = categoryIdStr ? parseInt(categoryIdStr, 10) : undefined;
  const selectedTagId = tagIdStr ? parseInt(tagIdStr, 10) : undefined;

  // Fetch all posts (newest first)
  const posts = await getPosts();

  // Calculate post counts per category dynamically in-memory based on all available posts
  const categoryCounts: Record<number, number> = {};
  const allCategoriesMap = new Map<number, { id: number; title: string }>();

  for (const post of posts) {
    const postCategories = post.categories ?? [];
    for (const cat of postCategories) {
      if (typeof cat === "object" && cat !== null) {
        allCategoriesMap.set(cat.id, { id: cat.id, title: cat.title });
        categoryCounts[cat.id] = (categoryCounts[cat.id] || 0) + 1;
      }
    }
  }

  // Calculate post counts per tag dynamically in-memory based on all available posts
  const tagCounts: Record<number, number> = {};
  const allTagsMap = new Map<number, { id: number; title: string }>();

  for (const post of posts) {
    const postTags = post.tags ?? [];
    for (const tag of postTags) {
      if (typeof tag === "object" && tag !== null) {
        allTagsMap.set(tag.id, { id: tag.id, title: tag.title });
        tagCounts[tag.id] = (tagCounts[tag.id] || 0) + 1;
      }
    }
  }

  // Filter posts
  let displayedPosts = posts;

  if (selectedCategoryId !== undefined) {
    displayedPosts = displayedPosts.filter((post) =>
      (post.categories ?? []).some(
        (cat) => (typeof cat === "object" && cat !== null ? cat.id : cat) === selectedCategoryId
      )
    );
  }

  if (selectedTagId !== undefined) {
    displayedPosts = displayedPosts.filter((post) =>
      (post.tags ?? []).some(
        (tag) => (typeof tag === "object" && tag !== null ? tag.id : tag) === selectedTagId
      )
    );
  }

  return (
    <section className="mx-auto max-w-6xl px-6 py-20">
      <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">บทความ</p>
      <h1 className="mt-3 text-4xl font-bold tracking-tight md:text-6xl">บทความทั้งหมด</h1>

      <div className="mt-12 grid gap-12 lg:grid-cols-3">
        {/* Main Content (Left 2 Columns) */}
        <div className="lg:col-span-2">
          {displayedPosts.length === 0 ? (
            <p className="text-muted-foreground">ยังไม่มีบทความในตัวเลือกนี้</p>
          ) : (
            <div>
              {/* Post 1 (Featured Card) */}
              <PostCard post={displayedPosts[0]} compact={false} />

              {/* Post 2 onwards (2-Column Grid directly under Post 1) */}
              {displayedPosts.length > 1 && (
                <div className="mt-8 grid gap-8 sm:grid-cols-2">
                  {displayedPosts.slice(1).map((post) => (
                    <PostCard key={post.id} post={post} compact={true} />
                  ))}
                </div>
              )}
            </div>
          )}
        </div>

        {/* Sidebar: Categories & Tags (Right 1 Column) */}
        <div className="lg:col-span-1">
          <div className="sticky top-24 space-y-8">
            {/* Categories Box (border-radius 0 / rounded-none) */}
            <div className="border border-border bg-muted/20 rounded-none p-6">
              <h3 className="font-mono text-xs uppercase tracking-widest text-muted-foreground mb-4">
                หมวดหมู่ / Categories
              </h3>
              <ul className="space-y-3">
                <li>
                  <Link
                    href={selectedTagId !== undefined ? `/articles?tag=${selectedTagId}` : "/articles"}
                    className={`flex items-center justify-between text-sm transition-colors ${
                      selectedCategoryId === undefined
                        ? "text-blaze-orange font-medium"
                        : "text-zinc-400 hover:text-white"
                  }`}
                  >
                    <span>ทั้งหมด (All posts)</span>
                    <span className="font-mono text-xs bg-muted border border-border px-2 py-0.5 rounded-full">
                      {posts.length}
                    </span>
                  </Link>
                </li>
                {Array.from(allCategoriesMap.values()).map((category) => {
                  const count = categoryCounts[category.id] || 0;
                  const isActive = selectedCategoryId === category.id;
                  
                  // Keep the active tag when filtering by category, toggle if active
                  const queryParams = new URLSearchParams();
                  if (selectedTagId !== undefined) {
                    queryParams.set("tag", selectedTagId.toString());
                  }
                  if (!isActive) {
                    queryParams.set("category", category.id.toString());
                  }
                  const queryString = queryParams.toString();
                  const href = queryString ? `/articles?${queryString}` : "/articles";

                  return (
                    <li key={category.id}>
                      <Link
                        href={href}
                        className={`flex items-center justify-between text-sm transition-colors ${
                          isActive
                            ? "text-blaze-orange font-medium"
                            : "text-zinc-400 hover:text-white"
                        }`}
                      >
                        <span className="truncate pr-4">{category.title}</span>
                        <span className="font-mono text-xs bg-muted border border-border px-2 py-0.5 rounded-full shrink-0">
                          {count}
                        </span>
                      </Link>
                    </li>
                  );
                })}
              </ul>
            </div>

            {/* Tags Cloud Filter (Outside of Category Block) */}
            {allTagsMap.size > 0 && (
              <div className="px-1">
                <h3 className="font-mono text-xs uppercase tracking-widest text-muted-foreground mb-4">
                  แท็ก / Tags
                </h3>
                <div className="flex flex-wrap gap-2">
                  {Array.from(allTagsMap.values()).map((tag) => {
                    const count = tagCounts[tag.id] || 0;
                    const isActive = selectedTagId === tag.id;
                    
                    // Keep the active category when filtering by tag, toggle if active
                    const queryParams = new URLSearchParams();
                    if (selectedCategoryId !== undefined) {
                      queryParams.set("category", selectedCategoryId.toString());
                    }
                    if (!isActive) {
                      queryParams.set("tag", tag.id.toString());
                    }
                    const queryString = queryParams.toString();
                    const href = queryString ? `/articles?${queryString}` : "/articles";

                    return (
                      <Link
                        key={tag.id}
                        href={href}
                        className={`inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs transition-all border ${
                          isActive
                            ? "bg-blaze-orange/20 border-blaze-orange text-blaze-orange font-medium"
                            : "bg-muted/40 border-border text-zinc-400 hover:text-white hover:border-zinc-500"
                        }`}
                      >
                        <span>#{tag.title}</span>
                        <span className={`font-mono text-[10px] px-1.5 py-0.2 rounded-full ${
                          isActive ? "bg-blaze-orange/30 text-white" : "bg-muted text-zinc-500"
                        }`}>
                          {count}
                        </span>
                      </Link>
                    );
                  })}
                </div>
              </div>
            )}

            {(selectedCategoryId !== undefined || selectedTagId !== undefined) && (
              <div className="pt-4 border-t border-border px-1">
                <Link
                  href="/articles"
                  className="inline-flex items-center text-xs font-mono uppercase tracking-wider text-muted-foreground hover:text-white transition-colors"
                >
                  ล้างตัวกรองทั้งหมด / Clear filters &times;
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
