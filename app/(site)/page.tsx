import Link from "next/link";

import Hero from "@/components/hero";
import PostCard from "@/components/post-card";
import { getPosts } from "@/lib/posts";

export const dynamic = "force-dynamic";

export default async function Home() {
  const posts = await getPosts({ limit: 3 });

  return (
    <>
      <Hero />

      {posts.length > 0 && (
        <section className="mx-auto max-w-6xl px-6 py-20">
          <div className="flex items-end justify-between gap-4">
            <h2 className="text-3xl font-bold tracking-tight md:text-4xl">บทความล่าสุด</h2>
            <Link
              href="/articles"
              className="font-mono text-xs uppercase tracking-widest text-blaze-orange no-underline hover:underline"
            >
              บทความทั้งหมด
            </Link>
          </div>

          <div className="mt-10 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            {posts.map((post) => (
              <PostCard key={post.id} post={post} />
            ))}
          </div>
        </section>
      )}
    </>
  );
}
