import type { Metadata } from "next";

import PostCard from "@/components/post-card";
import { getPosts } from "@/lib/posts";

export const dynamic = "force-dynamic";

export const metadata: Metadata = {
  title: "คอร์ส — Machines Labs",
  description: "คอร์สล่าสุดจาก Machines Labs",
};

export default async function CoursesPage() {
  const posts = await getPosts();

  return (
    <section className="mx-auto max-w-6xl px-6 py-20">
      <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">คอร์ส</p>
      <h1 className="mt-3 text-4xl font-bold tracking-tight md:text-6xl">คอร์สทั้งหมด</h1>

      {posts.length === 0 ? (
        <p className="mt-8 text-muted-foreground">ยังไม่มีคอร์ส</p>
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
