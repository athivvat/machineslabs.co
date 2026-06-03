/**
 * Online shop tables — prefix: `store_`
 *
 * Keep *transactional* data here (orders, order items, carts, payments).
 * The product *catalog* is better modeled as Payload collections in the `cms`
 * schema; reference products by id from these tables.
 *
 * Example:
 *
 *   import { pgTable, text, integer, numeric, timestamp } from "drizzle-orm/pg-core";
 *
 *   export const order = pgTable("store_order", {
 *     id: text("id").primaryKey(),
 *     userId: text("user_id").notNull(),       // → auth_user.id
 *     total: numeric("total").notNull(),
 *     createdAt: timestamp("created_at").notNull().defaultNow(),
 *   });
 */
export {};
