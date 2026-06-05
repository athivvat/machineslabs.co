CREATE TABLE "lms_certificate" (
	"id" text PRIMARY KEY NOT NULL,
	"user_id" text NOT NULL,
	"course_id" text NOT NULL,
	"certificate_code" text NOT NULL,
	"issued_at" timestamp with time zone DEFAULT now() NOT NULL,
	"metadata" jsonb,
	CONSTRAINT "lms_certificate_certificate_code_unique" UNIQUE("certificate_code")
);
--> statement-breakpoint
CREATE TABLE "lms_courses" (
	"id" text PRIMARY KEY NOT NULL,
	"title" text NOT NULL,
	"slug" text NOT NULL,
	"summary" text,
	"description" text,
	"thumbnail_url" text,
	"platform" text DEFAULT 'local' NOT NULL,
	"udemy_url" text,
	"price" integer,
	"published" boolean DEFAULT false NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "lms_courses_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "lms_enrollment" (
	"id" text PRIMARY KEY NOT NULL,
	"user_id" text NOT NULL,
	"course_id" text NOT NULL,
	"status" text DEFAULT 'active' NOT NULL,
	"progress" integer DEFAULT 0 NOT NULL,
	"enrolled_at" timestamp with time zone DEFAULT now() NOT NULL,
	"completed_at" timestamp with time zone,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "lms_lesson_progress" (
	"id" text PRIMARY KEY NOT NULL,
	"user_id" text NOT NULL,
	"course_id" text NOT NULL,
	"lesson_id" text NOT NULL,
	"completed" boolean DEFAULT false NOT NULL,
	"completed_at" timestamp with time zone,
	"last_accessed_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "lms_lessons" (
	"id" text PRIMARY KEY NOT NULL,
	"course_id" text NOT NULL,
	"module_id" text NOT NULL,
	"title" text NOT NULL,
	"slug" text NOT NULL,
	"type" text DEFAULT 'video' NOT NULL,
	"content" text,
	"video_url" text,
	"duration" integer,
	"is_free_preview" boolean DEFAULT false NOT NULL,
	"order" integer DEFAULT 1 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "lms_modules" (
	"id" text PRIMARY KEY NOT NULL,
	"course_id" text NOT NULL,
	"title" text NOT NULL,
	"description" text,
	"order" integer DEFAULT 1 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "lms_certificate" ADD CONSTRAINT "lms_certificate_course_id_lms_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."lms_courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_enrollment" ADD CONSTRAINT "lms_enrollment_course_id_lms_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."lms_courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_lesson_progress" ADD CONSTRAINT "lms_lesson_progress_course_id_lms_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."lms_courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_lesson_progress" ADD CONSTRAINT "lms_lesson_progress_lesson_id_lms_lessons_id_fk" FOREIGN KEY ("lesson_id") REFERENCES "public"."lms_lessons"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_lessons" ADD CONSTRAINT "lms_lessons_course_id_lms_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."lms_courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_lessons" ADD CONSTRAINT "lms_lessons_module_id_lms_modules_id_fk" FOREIGN KEY ("module_id") REFERENCES "public"."lms_modules"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "lms_modules" ADD CONSTRAINT "lms_modules_course_id_lms_courses_id_fk" FOREIGN KEY ("course_id") REFERENCES "public"."lms_courses"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "lms_certificate_user_course_idx" ON "lms_certificate" USING btree ("user_id","course_id");--> statement-breakpoint
CREATE INDEX "lms_courses_slug_idx" ON "lms_courses" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "lms_courses_platform_idx" ON "lms_courses" USING btree ("platform");--> statement-breakpoint
CREATE UNIQUE INDEX "lms_enrollment_user_course_idx" ON "lms_enrollment" USING btree ("user_id","course_id");--> statement-breakpoint
CREATE INDEX "lms_enrollment_course_idx" ON "lms_enrollment" USING btree ("course_id");--> statement-breakpoint
CREATE UNIQUE INDEX "lms_lesson_progress_user_lesson_idx" ON "lms_lesson_progress" USING btree ("user_id","lesson_id");--> statement-breakpoint
CREATE INDEX "lms_lesson_progress_user_course_idx" ON "lms_lesson_progress" USING btree ("user_id","course_id");--> statement-breakpoint
CREATE INDEX "lms_lessons_course_idx" ON "lms_lessons" USING btree ("course_id");--> statement-breakpoint
CREATE INDEX "lms_lessons_module_idx" ON "lms_lessons" USING btree ("module_id");--> statement-breakpoint
CREATE INDEX "lms_lessons_order_idx" ON "lms_lessons" USING btree ("order");--> statement-breakpoint
CREATE UNIQUE INDEX "lms_lessons_course_slug_idx" ON "lms_lessons" USING btree ("course_id","slug");--> statement-breakpoint
CREATE INDEX "lms_modules_course_idx" ON "lms_modules" USING btree ("course_id");--> statement-breakpoint
CREATE INDEX "lms_modules_order_idx" ON "lms_modules" USING btree ("order");