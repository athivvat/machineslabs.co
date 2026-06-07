import type { Metadata } from "next";

import PostCard from "@/components/post-card";
import { getPosts } from "@/lib/posts";

export const revalidate = 60;

export const metadata: Metadata = {
  title: "บทความ — Machines Labs",
  description: "บทความล่าสุดจาก Machines Labs",
};

export default async function ArticlesPage() {
  const posts = await getPosts();

  return (
    <section className="mx-auto max-w-6xl px-6 py-20">
      <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">บทความ</p>
      <h1 className="mt-3 text-4xl font-bold tracking-tight md:text-6xl">บทความทั้งหมด</h1>

      {posts.length === 0 ? (
        <p className="mt-8 text-muted-foreground">ยังไม่มีบทความ</p>
      ) : (
        <div className="mt-12 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          {posts.map((post) => (
            <PostCard key={post.id} post={post} />
          ))}
        </div>
      )}
    </section>
  );
}
