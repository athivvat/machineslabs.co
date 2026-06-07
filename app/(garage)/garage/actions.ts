"use server";

import { db } from "@/db";
import { lmsCourses, lmsModules, lmsLessons } from "@/db/schema";
import { eq } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { auth } from "@/lib/auth";
import { headers } from "next/headers";

// Helper to verify admin session
async function verifySession() {
  const session = await auth.api.getSession({
    headers: await headers(),
  });
  if (!session) {
    throw new Error("Unauthorized");
  }
  return session;
}

export async function createCourse(data: {
  id: string;
  title: string;
  slug: string;
  summary?: string;
  description?: string;
  thumbnailUrl?: string;
  platform: "local" | "udemy" | "both";
  udemyUrl?: string;
  price?: number;
  published: boolean;
  comingSoon?: boolean;
  intendedLearners?: string[];
  learningObjectives?: string[];
  requirements?: string[];
}) {
  await verifySession();

  await db.insert(lmsCourses).values({
    id: data.id,
    title: data.title,
    slug: data.slug,
    summary: data.summary || null,
    description: data.description || null,
    thumbnailUrl: data.thumbnailUrl || null,
    platform: data.platform,
    udemyUrl: data.udemyUrl || null,
    price: data.price !== undefined ? data.price : 0,
    published: data.published,
    comingSoon: data.comingSoon !== undefined ? data.comingSoon : false,
    intendedLearners: data.intendedLearners || null,
    learningObjectives: data.learningObjectives || null,
    requirements: data.requirements || null,
  });

  revalidatePath("/garage");
  revalidatePath("/garage/courses");
  revalidatePath("/school");
  revalidatePath("/");
}

export async function updateCourse(
  id: string,
  data: {
    title: string;
    slug: string;
    summary?: string;
    description?: string;
    thumbnailUrl?: string;
    platform: "local" | "udemy" | "both";
    udemyUrl?: string;
    price?: number;
    published: boolean;
    comingSoon?: boolean;
    intendedLearners?: string[];
    learningObjectives?: string[];
    requirements?: string[];
  }
) {
  await verifySession();

  await db
    .update(lmsCourses)
    .set({
      title: data.title,
      slug: data.slug,
      summary: data.summary || null,
      description: data.description || null,
      thumbnailUrl: data.thumbnailUrl || null,
      platform: data.platform,
      udemyUrl: data.udemyUrl || null,
      price: data.price !== undefined ? data.price : 0,
      published: data.published,
      comingSoon: data.comingSoon !== undefined ? data.comingSoon : false,
      intendedLearners: data.intendedLearners || null,
      learningObjectives: data.learningObjectives || null,
      requirements: data.requirements || null,
      updatedAt: new Date(),
    })
    .where(eq(lmsCourses.id, id));

  revalidatePath("/garage");
  revalidatePath("/garage/courses");
  revalidatePath(`/garage/courses/${id}`);
  revalidatePath("/school");
  revalidatePath(`/school/${data.slug}`);
  revalidatePath("/");
}

export async function deleteCourse(id: string) {
  await verifySession();

  await db.delete(lmsCourses).where(eq(lmsCourses.id, id));

  revalidatePath("/garage");
  revalidatePath("/garage/courses");
  revalidatePath("/school");
  revalidatePath("/");
}

export async function togglePublish(id: string, published: boolean) {
  await verifySession();

  const [course] = await db
    .update(lmsCourses)
    .set({
      published: published,
      updatedAt: new Date(),
    })
    .where(eq(lmsCourses.id, id))
    .returning();

  revalidatePath("/garage");
  revalidatePath("/garage/courses");
  if (course) {
    revalidatePath(`/garage/courses/${id}`);
    revalidatePath(`/school/${course.slug}`);
  }
  revalidatePath("/school");
  revalidatePath("/");
}

// --- MODULE ACTIONS ---

export async function createModule(data: {
  id: string;
  courseId: string;
  title: string;
  description?: string;
  order: number;
}) {
  await verifySession();

  await db.insert(lmsModules).values({
    id: data.id,
    courseId: data.courseId,
    title: data.title,
    description: data.description || null,
    order: data.order,
  });

  revalidatePath(`/garage/courses/${data.courseId}`);
  revalidatePath(`/school/${data.courseId}`);
}

export async function updateModule(
  id: string,
  courseId: string,
  data: {
    title: string;
    description?: string;
    order: number;
  }
) {
  await verifySession();

  await db
    .update(lmsModules)
    .set({
      title: data.title,
      description: data.description || null,
      order: data.order,
      updatedAt: new Date(),
    })
    .where(eq(lmsModules.id, id));

  revalidatePath(`/garage/courses/${courseId}`);
}

export async function deleteModule(id: string, courseId: string) {
  await verifySession();

  await db.delete(lmsModules).where(eq(lmsModules.id, id));

  revalidatePath(`/garage/courses/${courseId}`);
}

// --- LESSON ACTIONS ---

export async function createLesson(data: {
  id: string;
  courseId: string;
  moduleId: string;
  title: string;
  slug: string;
  type: "video" | "article" | "quiz" | "assignment";
  content?: string;
  videoUrl?: string;
  duration?: number;
  isFreePreview: boolean;
  order: number;
}) {
  await verifySession();

  await db.insert(lmsLessons).values({
    id: data.id,
    courseId: data.courseId,
    moduleId: data.moduleId,
    title: data.title,
    slug: data.slug,
    type: data.type,
    content: data.content || null,
    videoUrl: data.videoUrl || null,
    duration: data.duration !== undefined ? data.duration : 0,
    isFreePreview: data.isFreePreview,
    order: data.order,
  });

  revalidatePath(`/garage/courses/${data.courseId}`);
}

export async function updateLesson(
  id: string,
  courseId: string,
  data: {
    title: string;
    slug: string;
    type: "video" | "article" | "quiz" | "assignment";
    content?: string;
    videoUrl?: string;
    duration?: number;
    isFreePreview: boolean;
    order: number;
  }
) {
  await verifySession();

  await db
    .update(lmsLessons)
    .set({
      title: data.title,
      slug: data.slug,
      type: data.type,
      content: data.content || null,
      videoUrl: data.videoUrl || null,
      duration: data.duration !== undefined ? data.duration : 0,
      isFreePreview: data.isFreePreview,
      order: data.order,
      updatedAt: new Date(),
    })
    .where(eq(lmsLessons.id, id));

  revalidatePath(`/garage/courses/${courseId}`);
}

export async function deleteLesson(id: string, courseId: string) {
  await verifySession();

  await db.delete(lmsLessons).where(eq(lmsLessons.id, id));

  revalidatePath(`/garage/courses/${courseId}`);
}
