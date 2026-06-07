ALTER TABLE "lms_courses" ADD COLUMN "coming_soon" boolean DEFAULT false NOT NULL;--> statement-breakpoint
ALTER TABLE "lms_courses" ADD COLUMN "intended_learners" jsonb;--> statement-breakpoint
ALTER TABLE "lms_courses" ADD COLUMN "learning_objectives" jsonb;--> statement-breakpoint
ALTER TABLE "lms_courses" ADD COLUMN "requirements" jsonb;