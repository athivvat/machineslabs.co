import config from "@payload-config";
import { getPayload } from "payload";

import type { Project } from "@/payload-types";

/** Fetch projects (newest first). Omit `limit` to return all. */
export async function getProjects({ limit }: { limit?: number } = {}): Promise<Project[]> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "projects",
    depth: 1,
    sort: "-createdAt",
    ...(limit ? { limit } : { pagination: false }),
  });
  return docs;
}

export async function getProjectBySlug(slug: string): Promise<Project | null> {
  const payload = await getPayload({ config });
  const { docs } = await payload.find({
    collection: "projects",
    depth: 2,
    limit: 1,
    where: { slug: { equals: slug } },
  });
  return docs[0] ?? null;
}
