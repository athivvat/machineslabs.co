import config from "@payload-config";
import { getPayload } from "payload";

import type { Post } from "@/payload-types";

/** Fetch posts (newest first). Omit `limit` to return all. */
export async function getPosts({ limit }: { limit?: number } = {}): Promise<Post[]> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "posts",
    depth: 1,
    sort: "-createdAt",
    ...(limit ? { limit } : { pagination: false }),
  });
  return docs;
}

export async function getPostBySlug(slug: string): Promise<Post | null> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "posts",
    depth: 2,
    limit: 1,
    where: { slug: { equals: slug } },
  });
  return docs[0] ?? null;
}
