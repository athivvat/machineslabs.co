/**
 * Online course (LMS) tables — prefix: `lms_`
 *
 * Keep *transactional* data here (enrollments, lesson progress, certificates).
 * Course *content* (modules, lessons, rich text) is better modeled as Payload
 * collections in the `cms` schema; reference it by id from these tables.
 *
 * Example:
 *
 *   import { pgTable, text, integer, timestamp } from "drizzle-orm/pg-core";
 *
 *   export const enrollment = pgTable("lms_enrollment", {
 *     id: text("id").primaryKey(),
 *     userId: text("user_id").notNull(),     // → auth_user.id
 *     courseId: integer("course_id").notNull(), // → cms course collection id
 *     enrolledAt: timestamp("enrolled_at").notNull().defaultNow(),
 *   });
 */
export {};
