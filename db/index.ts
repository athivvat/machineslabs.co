import { drizzle } from "drizzle-orm/node-postgres";
import { Pool } from "pg";

import * as schema from "./schema";

// Reuse a single pool across hot-reloads / serverless invocations to avoid
// exhausting database connections.
const globalForDb = globalThis as unknown as { __dbPool?: Pool };

const pool =
  globalForDb.__dbPool ?? new Pool({ connectionString: process.env.DATABASE_URL });

if (process.env.NODE_ENV !== "production") {
  globalForDb.__dbPool = pool;
}

export const db = drizzle(pool, { schema });
export { schema };
