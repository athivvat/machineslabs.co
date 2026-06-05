import { relations } from "drizzle-orm";
import { pgTable, text, integer, timestamp, boolean, jsonb, index, uniqueIndex } from "drizzle-orm/pg-core";

/**
 * LMS Courses Table
 * Contains the catalog of online courses.
 */
export const lmsCourses = pgTable(
  "lms_courses",
  {
    id: text("id").primaryKey(), // E.g., UUID or slug-based string ID
    title: text("title").notNull(),
    slug: text("slug").notNull().unique(),
    summary: text("summary"),
    description: text("description"), // Full description or syllabus markdown/HTML
    thumbnailUrl: text("thumbnail_url"),
    
    // Platform flag to indicate if course is hosted locally, on Udemy, or both
    platform: text("platform")
      .$type<"local" | "udemy" | "both">()
      .notNull()
      .default("local"),
    
    // Udemy enrollment link (used when platform is 'udemy' or 'both')
    udemyUrl: text("udemy_url"), 
    
    price: integer("price"), // Price in cents (e.g. 4900 for $49.00). Null/0 = Free
    published: boolean("published").notNull().default(false),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true })
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (table) => [
    index("lms_courses_slug_idx").on(table.slug),
    index("lms_courses_platform_idx").on(table.platform),
  ]
);

/**
 * LMS Modules Table (Chapters)
 * Groups lessons within a course. Applicable to self-hosted or 'both' hosted courses.
 */
export const lmsModules = pgTable(
  "lms_modules",
  {
    id: text("id").primaryKey(),
    courseId: text("course_id")
      .notNull()
      .references(() => lmsCourses.id, { onDelete: "cascade" }),
    title: text("title").notNull(),
    description: text("description"),
    order: integer("order").notNull().default(1),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true })
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (table) => [
    index("lms_modules_course_idx").on(table.courseId),
    index("lms_modules_order_idx").on(table.order),
  ]
);

/**
 * LMS Lessons Table (Lectures)
 * Individual units of content (video, text, quizzes, assignments).
 */
export const lmsLessons = pgTable(
  "lms_lessons",
  {
    id: text("id").primaryKey(),
    courseId: text("course_id")
      .notNull()
      .references(() => lmsCourses.id, { onDelete: "cascade" }),
    moduleId: text("module_id")
      .notNull()
      .references(() => lmsModules.id, { onDelete: "cascade" }),
    title: text("title").notNull(),
    slug: text("slug").notNull(),
    type: text("type")
      .$type<"video" | "article" | "quiz" | "assignment">()
      .notNull()
      .default("video"),
    content: text("content"), // Rich text markdown or JSON content
    videoUrl: text("video_url"), // Self-hosted media link or external (Vimeo/YouTube)
    duration: integer("duration"), // Duration in minutes
    isFreePreview: boolean("is_free_preview").notNull().default(false),
    order: integer("order").notNull().default(1),
    createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
    updatedAt: timestamp("updated_at", { withTimezone: true })
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (table) => [
    index("lms_lessons_course_idx").on(table.courseId),
    index("lms_lessons_module_idx").on(table.moduleId),
    index("lms_lessons_order_idx").on(table.order),
    uniqueIndex("lms_lessons_course_slug_idx").on(table.courseId, table.slug),
  ]
);

/**
 * LMS Enrollments Table
 * Records when a user enrolls in a local course (paid, free, or self-hosted path of a 'both' course).
 */
export const lmsEnrollment = pgTable(
  "lms_enrollment",
  {
    id: text("id").primaryKey(),
    userId: text("user_id").notNull(), // References auth_user.id
    courseId: text("course_id")
      .notNull()
      .references(() => lmsCourses.id, { onDelete: "cascade" }),
    status: text("status")
      .$type<"active" | "completed" | "cancelled">()
      .notNull()
      .default("active"),
    progress: integer("progress").notNull().default(0), // Calculated percentage (0-100)
    enrolledAt: timestamp("enrolled_at", { withTimezone: true }).notNull().defaultNow(),
    completedAt: timestamp("completed_at", { withTimezone: true }),
    updatedAt: timestamp("updated_at", { withTimezone: true })
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (table) => [
    uniqueIndex("lms_enrollment_user_course_idx").on(table.userId, table.courseId),
    index("lms_enrollment_course_idx").on(table.courseId),
  ]
);

/**
 * LMS Lesson Progress Table
 * Tracks which self-hosted lessons a user has completed.
 */
export const lmsLessonProgress = pgTable(
  "lms_lesson_progress",
  {
    id: text("id").primaryKey(),
    userId: text("user_id").notNull(), // References auth_user.id
    courseId: text("course_id")
      .notNull()
      .references(() => lmsCourses.id, { onDelete: "cascade" }),
    lessonId: text("lesson_id")
      .notNull()
      .references(() => lmsLessons.id, { onDelete: "cascade" }),
    completed: boolean("completed").notNull().default(false),
    completedAt: timestamp("completed_at", { withTimezone: true }),
    lastAccessedAt: timestamp("last_accessed_at", { withTimezone: true })
      .notNull()
      .defaultNow()
      .$onUpdate(() => new Date()),
  },
  (table) => [
    uniqueIndex("lms_lesson_progress_user_lesson_idx").on(table.userId, table.lessonId),
    index("lms_lesson_progress_user_course_idx").on(table.userId, table.courseId),
  ]
);

/**
 * LMS Certificates Table
 * Issued when a student completes all required course components on our platform.
 */
export const lmsCertificate = pgTable(
  "lms_certificate",
  {
    id: text("id").primaryKey(),
    userId: text("user_id").notNull(), // References auth_user.id
    courseId: text("course_id")
      .notNull()
      .references(() => lmsCourses.id, { onDelete: "cascade" }),
    certificateCode: text("certificate_code").notNull().unique(), // Public verification code
    issuedAt: timestamp("issued_at", { withTimezone: true }).notNull().defaultNow(),
    metadata: jsonb("metadata").$type<{
      studentName: string;
      courseTitle: string;
      grade?: string;
    }>(),
  },
  (table) => [
    index("lms_certificate_user_course_idx").on(table.userId, table.courseId),
  ]
);

// --- DRIZZLE ORM RELATIONSHIPS ---

export const lmsCoursesRelations = relations(lmsCourses, ({ many }) => ({
  modules: many(lmsModules),
  lessons: many(lmsLessons),
  enrollments: many(lmsEnrollment),
  certificates: many(lmsCertificate),
}));

export const lmsModulesRelations = relations(lmsModules, ({ one, many }) => ({
  course: one(lmsCourses, {
    fields: [lmsModules.courseId],
    references: [lmsCourses.id],
  }),
  lessons: many(lmsLessons),
}));

export const lmsLessonsRelations = relations(lmsLessons, ({ one, many }) => ({
  course: one(lmsCourses, {
    fields: [lmsLessons.courseId],
    references: [lmsCourses.id],
  }),
  module: one(lmsModules, {
    fields: [lmsLessons.moduleId],
    references: [lmsModules.id],
  }),
  progress: many(lmsLessonProgress),
}));

export const lmsEnrollmentRelations = relations(lmsEnrollment, ({ one }) => ({
  course: one(lmsCourses, {
    fields: [lmsEnrollment.courseId],
    references: [lmsCourses.id],
  }),
}));

export const lmsLessonProgressRelations = relations(lmsLessonProgress, ({ one }) => ({
  course: one(lmsCourses, {
    fields: [lmsLessonProgress.courseId],
    references: [lmsCourses.id],
  }),
  lesson: one(lmsLessons, {
    fields: [lmsLessonProgress.lessonId],
    references: [lmsLessons.id],
  }),
}));

export const lmsCertificateRelations = relations(lmsCertificate, ({ one }) => ({
  course: one(lmsCourses, {
    fields: [lmsCertificate.courseId],
    references: [lmsCourses.id],
  }),
}));
