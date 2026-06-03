// Barrel for all Drizzle-managed schemas. Each domain uses a table-name prefix
// so it never collides with Payload's `cms` schema:
//   auth_*   → authentication (better-auth)
//   lms_*    → online course
//   store_*  → online shop
export * from "./auth";
export * from "./lms";
export * from "./store";
