import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   DROP TABLE IF EXISTS "cms"."_posts_v_rels" CASCADE;
   DROP TABLE IF EXISTS "cms"."_posts_v" CASCADE;
   DROP TABLE IF EXISTS "cms"."_projects_v_rels" CASCADE;
   DROP TABLE IF EXISTS "cms"."_projects_v" CASCADE;
   ALTER TABLE "cms"."posts" DROP COLUMN IF EXISTS "_status";
   ALTER TABLE "cms"."projects" DROP COLUMN IF EXISTS "_status";
   DROP TYPE IF EXISTS "cms"."enum_posts_status" CASCADE;
   DROP TYPE IF EXISTS "cms"."enum__posts_v_version_status" CASCADE;
   DROP TYPE IF EXISTS "cms"."enum_projects_status" CASCADE;
   DROP TYPE IF EXISTS "cms"."enum__projects_v_version_status" CASCADE;
   CREATE TYPE "cms"."enum_posts_status" AS ENUM('draft', 'published');
   CREATE TYPE "cms"."enum__posts_v_version_status" AS ENUM('draft', 'published');
  CREATE TYPE "cms"."enum_projects_status" AS ENUM('draft', 'published');
  CREATE TYPE "cms"."enum__projects_v_version_status" AS ENUM('draft', 'published');
  CREATE TABLE "cms"."_posts_v" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"parent_id" integer,
  	"version_title" varchar,
  	"version_slug" varchar,
  	"version_sub_title" varchar,
  	"version_excerpt" varchar,
  	"version_feature_image_image_id" integer,
  	"version_feature_image_caption" varchar,
  	"version_feature_image_credits" varchar,
  	"version_body" jsonb,
  	"version_updated_at" timestamp(3) with time zone,
  	"version_created_at" timestamp(3) with time zone,
  	"version__status" "cms"."enum__posts_v_version_status" DEFAULT 'draft',
  	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"latest" boolean
  );
  
  CREATE TABLE "cms"."_posts_v_rels" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"order" integer,
  	"parent_id" integer NOT NULL,
  	"path" varchar NOT NULL,
  	"categories_id" integer,
  	"tags_id" integer
  );
  
  CREATE TABLE "cms"."_projects_v" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"parent_id" integer,
  	"version_title" varchar,
  	"version_slug" varchar,
  	"version_sub_title" varchar,
  	"version_excerpt" varchar,
  	"version_feature_image_image_id" integer,
  	"version_feature_image_caption" varchar,
  	"version_feature_image_credits" varchar,
  	"version_body" jsonb,
  	"version_parts_used" jsonb,
  	"version_updated_at" timestamp(3) with time zone,
  	"version_created_at" timestamp(3) with time zone,
  	"version__status" "cms"."enum__projects_v_version_status" DEFAULT 'draft',
  	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"latest" boolean
  );
  
  CREATE TABLE "cms"."_projects_v_rels" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"order" integer,
  	"parent_id" integer NOT NULL,
  	"path" varchar NOT NULL,
  	"categories_id" integer,
  	"tags_id" integer
  );
  
  ALTER TABLE "cms"."posts" ALTER COLUMN "title" DROP NOT NULL;
  ALTER TABLE "cms"."posts" ALTER COLUMN "slug" DROP NOT NULL;
  ALTER TABLE "cms"."projects" ALTER COLUMN "title" DROP NOT NULL;
  ALTER TABLE "cms"."projects" ALTER COLUMN "slug" DROP NOT NULL;
  ALTER TABLE "cms"."posts" ADD COLUMN "_status" "cms"."enum_posts_status" DEFAULT 'draft';
  ALTER TABLE "cms"."projects" ADD COLUMN "_status" "cms"."enum_projects_status" DEFAULT 'draft';
  ALTER TABLE "cms"."_posts_v" ADD CONSTRAINT "_posts_v_parent_id_posts_id_fk" FOREIGN KEY ("parent_id") REFERENCES "cms"."posts"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "cms"."_posts_v" ADD CONSTRAINT "_posts_v_version_feature_image_image_id_media_id_fk" FOREIGN KEY ("version_feature_image_image_id") REFERENCES "cms"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "cms"."_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "cms"."_posts_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "cms"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."_posts_v_rels" ADD CONSTRAINT "_posts_v_rels_tags_fk" FOREIGN KEY ("tags_id") REFERENCES "cms"."tags"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."_projects_v" ADD CONSTRAINT "_projects_v_parent_id_projects_id_fk" FOREIGN KEY ("parent_id") REFERENCES "cms"."projects"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "cms"."_projects_v" ADD CONSTRAINT "_projects_v_version_feature_image_image_id_media_id_fk" FOREIGN KEY ("version_feature_image_image_id") REFERENCES "cms"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "cms"."_projects_v_rels" ADD CONSTRAINT "_projects_v_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "cms"."_projects_v"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."_projects_v_rels" ADD CONSTRAINT "_projects_v_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "cms"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."_projects_v_rels" ADD CONSTRAINT "_projects_v_rels_tags_fk" FOREIGN KEY ("tags_id") REFERENCES "cms"."tags"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "_posts_v_parent_idx" ON "cms"."_posts_v" USING btree ("parent_id");
  CREATE INDEX "_posts_v_version_version_slug_idx" ON "cms"."_posts_v" USING btree ("version_slug");
  CREATE INDEX "_posts_v_version_feature_image_version_feature_image_ima_idx" ON "cms"."_posts_v" USING btree ("version_feature_image_image_id");
  CREATE INDEX "_posts_v_version_version_updated_at_idx" ON "cms"."_posts_v" USING btree ("version_updated_at");
  CREATE INDEX "_posts_v_version_version_created_at_idx" ON "cms"."_posts_v" USING btree ("version_created_at");
  CREATE INDEX "_posts_v_version_version__status_idx" ON "cms"."_posts_v" USING btree ("version__status");
  CREATE INDEX "_posts_v_created_at_idx" ON "cms"."_posts_v" USING btree ("created_at");
  CREATE INDEX "_posts_v_updated_at_idx" ON "cms"."_posts_v" USING btree ("updated_at");
  CREATE INDEX "_posts_v_latest_idx" ON "cms"."_posts_v" USING btree ("latest");
  CREATE INDEX "_posts_v_rels_order_idx" ON "cms"."_posts_v_rels" USING btree ("order");
  CREATE INDEX "_posts_v_rels_parent_idx" ON "cms"."_posts_v_rels" USING btree ("parent_id");
  CREATE INDEX "_posts_v_rels_path_idx" ON "cms"."_posts_v_rels" USING btree ("path");
  CREATE INDEX "_posts_v_rels_categories_id_idx" ON "cms"."_posts_v_rels" USING btree ("categories_id");
  CREATE INDEX "_posts_v_rels_tags_id_idx" ON "cms"."_posts_v_rels" USING btree ("tags_id");
  CREATE INDEX "_projects_v_parent_idx" ON "cms"."_projects_v" USING btree ("parent_id");
  CREATE INDEX "_projects_v_version_version_slug_idx" ON "cms"."_projects_v" USING btree ("version_slug");
  CREATE INDEX "_projects_v_version_feature_image_version_feature_image__idx" ON "cms"."_projects_v" USING btree ("version_feature_image_image_id");
  CREATE INDEX "_projects_v_version_version_updated_at_idx" ON "cms"."_projects_v" USING btree ("version_updated_at");
  CREATE INDEX "_projects_v_version_version_created_at_idx" ON "cms"."_projects_v" USING btree ("version_created_at");
  CREATE INDEX "_projects_v_version_version__status_idx" ON "cms"."_projects_v" USING btree ("version__status");
  CREATE INDEX "_projects_v_created_at_idx" ON "cms"."_projects_v" USING btree ("created_at");
  CREATE INDEX "_projects_v_updated_at_idx" ON "cms"."_projects_v" USING btree ("updated_at");
  CREATE INDEX "_projects_v_latest_idx" ON "cms"."_projects_v" USING btree ("latest");
  CREATE INDEX "_projects_v_rels_order_idx" ON "cms"."_projects_v_rels" USING btree ("order");
  CREATE INDEX "_projects_v_rels_parent_idx" ON "cms"."_projects_v_rels" USING btree ("parent_id");
  CREATE INDEX "_projects_v_rels_path_idx" ON "cms"."_projects_v_rels" USING btree ("path");
  CREATE INDEX "_projects_v_rels_categories_id_idx" ON "cms"."_projects_v_rels" USING btree ("categories_id");
  CREATE INDEX "_projects_v_rels_tags_id_idx" ON "cms"."_projects_v_rels" USING btree ("tags_id");
  CREATE INDEX "posts__status_idx" ON "cms"."posts" USING btree ("_status");
  CREATE INDEX "projects__status_idx" ON "cms"."projects" USING btree ("_status");
  UPDATE "cms"."posts" SET "_status" = 'published';
  UPDATE "cms"."projects" SET "_status" = 'published';`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "cms"."_posts_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "cms"."_posts_v_rels" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "cms"."_projects_v" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "cms"."_projects_v_rels" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "cms"."_posts_v" CASCADE;
  DROP TABLE "cms"."_posts_v_rels" CASCADE;
  DROP TABLE "cms"."_projects_v" CASCADE;
  DROP TABLE "cms"."_projects_v_rels" CASCADE;
  DROP INDEX "cms"."posts__status_idx";
  DROP INDEX "cms"."projects__status_idx";
  ALTER TABLE "cms"."posts" ALTER COLUMN "title" SET NOT NULL;
  ALTER TABLE "cms"."posts" ALTER COLUMN "slug" SET NOT NULL;
  ALTER TABLE "cms"."projects" ALTER COLUMN "title" SET NOT NULL;
  ALTER TABLE "cms"."projects" ALTER COLUMN "slug" SET NOT NULL;
  ALTER TABLE "cms"."media" ADD COLUMN "prefix" varchar DEFAULT 'articles/assets';
  ALTER TABLE "cms"."posts" DROP COLUMN "_status";
  ALTER TABLE "cms"."projects" DROP COLUMN "_status";
  DROP TYPE "cms"."enum_posts_status";
  DROP TYPE "cms"."enum__posts_v_version_status";
  DROP TYPE "cms"."enum_projects_status";
  DROP TYPE "cms"."enum__projects_v_version_status";`)
}
