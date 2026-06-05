import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload, req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TABLE "cms"."projects" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"title" varchar NOT NULL,
  	"slug" varchar NOT NULL,
  	"sub_title" varchar,
  	"excerpt" varchar,
  	"feature_image_image_id" integer,
  	"feature_image_caption" varchar,
  	"feature_image_credits" varchar,
  	"body" jsonb,
  	"parts_used" jsonb,
  	"updated_at" timestamp(3) with time zone DEFAULT now() NOT NULL,
  	"created_at" timestamp(3) with time zone DEFAULT now() NOT NULL
  );
  
  CREATE TABLE "cms"."projects_rels" (
  	"id" serial PRIMARY KEY NOT NULL,
  	"order" integer,
  	"parent_id" integer NOT NULL,
  	"path" varchar NOT NULL,
  	"categories_id" integer,
  	"tags_id" integer
  );
  
  ALTER TABLE "cms"."payload_locked_documents_rels" ADD COLUMN "projects_id" integer;
  ALTER TABLE "cms"."projects" ADD CONSTRAINT "projects_feature_image_image_id_media_id_fk" FOREIGN KEY ("feature_image_image_id") REFERENCES "cms"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "cms"."projects_rels" ADD CONSTRAINT "projects_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "cms"."projects"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."projects_rels" ADD CONSTRAINT "projects_rels_categories_fk" FOREIGN KEY ("categories_id") REFERENCES "cms"."categories"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "cms"."projects_rels" ADD CONSTRAINT "projects_rels_tags_fk" FOREIGN KEY ("tags_id") REFERENCES "cms"."tags"("id") ON DELETE cascade ON UPDATE no action;
  CREATE UNIQUE INDEX "projects_slug_idx" ON "cms"."projects" USING btree ("slug");
  CREATE INDEX "projects_feature_image_feature_image_image_idx" ON "cms"."projects" USING btree ("feature_image_image_id");
  CREATE INDEX "projects_updated_at_idx" ON "cms"."projects" USING btree ("updated_at");
  CREATE INDEX "projects_created_at_idx" ON "cms"."projects" USING btree ("created_at");
  CREATE INDEX "projects_rels_order_idx" ON "cms"."projects_rels" USING btree ("order");
  CREATE INDEX "projects_rels_parent_idx" ON "cms"."projects_rels" USING btree ("parent_id");
  CREATE INDEX "projects_rels_path_idx" ON "cms"."projects_rels" USING btree ("path");
  CREATE INDEX "projects_rels_categories_id_idx" ON "cms"."projects_rels" USING btree ("categories_id");
  CREATE INDEX "projects_rels_tags_id_idx" ON "cms"."projects_rels" USING btree ("tags_id");
  ALTER TABLE "cms"."payload_locked_documents_rels" ADD CONSTRAINT "payload_locked_documents_rels_projects_fk" FOREIGN KEY ("projects_id") REFERENCES "cms"."projects"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "payload_locked_documents_rels_projects_id_idx" ON "cms"."payload_locked_documents_rels" USING btree ("projects_id");`)
}

export async function down({ db, payload, req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "cms"."projects" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "cms"."projects_rels" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "cms"."projects" CASCADE;
  DROP TABLE "cms"."projects_rels" CASCADE;
  ALTER TABLE "cms"."payload_locked_documents_rels" DROP CONSTRAINT "payload_locked_documents_rels_projects_fk";
  
  DROP INDEX "cms"."payload_locked_documents_rels_projects_id_idx";
  ALTER TABLE "cms"."payload_locked_documents_rels" DROP COLUMN "projects_id";`)
}
