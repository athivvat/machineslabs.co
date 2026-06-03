import { defineConfig } from "drizzle-kit";

// Drizzle manages the application-side tables (auth_/lms_/store_).
// Payload owns the `cms` schema and is migrated separately via `payload migrate`.
export default defineConfig({
  dialect: "postgresql",
  schema: "./db/schema/index.ts",
  out: "./migrations/app",
  dbCredentials: {
    url: process.env.DATABASE_URL ?? "",
  },
  // Safety: only ever diff/manage our prefixed tables. This prevents drizzle-kit
  // (especially `push`) from touching Payload's tables.
  tablesFilter: ["auth_*", "lms_*", "store_*"],
});
