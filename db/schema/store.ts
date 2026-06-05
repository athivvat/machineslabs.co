import { pgTable, text, integer, timestamp } from "drizzle-orm/pg-core";

export const storeProduct = pgTable("store_product", {
  id: text("id").primaryKey(),
  name: text("name").notNull(),
  slug: text("slug").notNull().unique(),
  price: integer("price").notNull(),
  sku: text("sku"),
  image: text("image"),
  description: text("description"),
  category: text("category"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});
