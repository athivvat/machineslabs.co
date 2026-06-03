import type { VercelConfig } from '@vercel/config/v1';

// Run Payload migrations before building so the production schema is in sync.
export const config: VercelConfig = {
  framework: 'nextjs',
  buildCommand: 'bun run ci',
};
