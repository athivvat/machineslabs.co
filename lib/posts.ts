import config from "@payload-config";
import { getPayload } from "payload";

import type { Post } from "@/payload-types";

/** Fetch posts (newest first). Omit `limit` to return all. */
export async function getPosts({ limit }: { limit?: number } = {}): Promise<Post[]> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "posts",
    depth: 1,
    sort: "-publishedAt",
    where: {
      _status: {
        equals: "published",
      },
    },
    ...(limit ? { limit } : { pagination: false }),
  });
  return docs;
}

export async function getPostBySlug(
  slug: string,
  { draft = false }: { draft?: boolean } = {},
): Promise<Post | null> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "posts",
    depth: 2,
    limit: 1,
    draft,
    where: {
      and: [
        { slug: { equals: slug } },
        ...(draft ? [] : [{ _status: { equals: "published" } }]),
      ],
    },
  });
  return docs[0] ?? null;
}
