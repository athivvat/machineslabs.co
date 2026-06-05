import { db } from "@/db"
import { lmsCourses, lmsModules, lmsLessons } from "@/db/schema"
import { eq, sql } from "drizzle-orm"

export interface Lesson {
  id: string
  title: string
  slug: string
  type: "video" | "article" | "quiz" | "assignment"
  duration: number // in minutes
  isFreePreview: boolean
  videoUrl?: string
  content?: string
}

export interface Module {
  id: string
  title: string
  description?: string
  order: number
  lessons: Lesson[]
}

export interface Course {
  id: string
  title: string
  slug: string
  summary: string
  description: string
  thumbnailUrl: string
  platform: "local" | "udemy" | "both"
  udemyUrl?: string
  price: number // in Baht
  published: boolean
  modules?: Module[]
  createdAt: string
  updatedAt: string
}

export async function getCourses(): Promise<Course[]> {
  const dbCourses = await db.query.lmsCourses.findMany({
    where: eq(lmsCourses.published, true),
    orderBy: (courses, { desc }) => [desc(courses.createdAt)],
  })

  return dbCourses.map((c) => ({
    id: c.id,
    title: c.title,
    slug: c.slug,
    summary: c.summary || "",
    description: c.description || "",
    thumbnailUrl: c.thumbnailUrl || "",
    platform: c.platform,
    udemyUrl: c.udemyUrl || undefined,
    price: c.price || 0,
    published: c.published,
    createdAt: c.createdAt.toISOString(),
    updatedAt: c.updatedAt.toISOString(),
  }))
}

export async function getCourseBySlug(slug: string): Promise<Course | null> {

  const decodedSlug = decodeURIComponent(slug)

  const c = await db.query.lmsCourses.findFirst({
    where: eq(lmsCourses.slug, decodedSlug),
    with: {
      modules: {
        orderBy: (modules, { asc }) => [asc(modules.order)],
      },
      lessons: {
        orderBy: (lessons, { asc }) => [asc(lessons.order)],
      },
    },
  })

  if (!c || !c.published) {
    return null
  }

  return {
    id: c.id,
    title: c.title,
    slug: c.slug,
    summary: c.summary || "",
    description: c.description || "",
    thumbnailUrl: c.thumbnailUrl || "",
    platform: c.platform,
    udemyUrl: c.udemyUrl || undefined,
    price: c.price || 0,
    published: c.published,
    createdAt: c.createdAt.toISOString(),
    updatedAt: c.updatedAt.toISOString(),
    modules: c.modules.map((m) => ({
      id: m.id,
      title: m.title,
      description: m.description || undefined,
      order: m.order,
      lessons: c.lessons
        .filter((l) => l.moduleId === m.id)
        .map((l) => ({
          id: l.id,
          title: l.title,
          slug: l.slug,
          type: l.type,
          duration: l.duration || 0,
          isFreePreview: l.isFreePreview,
          videoUrl: l.videoUrl || undefined,
          content: l.content || undefined,
        })),
    })),
  }
}
