import config from "@payload-config";
import { getPayload } from "payload";

import type { Project } from "@/payload-types";

/** Fetch projects (newest first). Omit `limit` to return all. */
export async function getProjects({ limit }: { limit?: number } = {}): Promise<Project[]> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "projects",
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

export async function getProjectBySlug(
  slug: string,
  { draft = false }: { draft?: boolean } = {},
): Promise<Project | null> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "projects",
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
