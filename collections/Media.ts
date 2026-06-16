import path from 'path'
import { fileURLToPath } from 'url'

import type { CollectionConfig } from 'payload'

const dirname = path.dirname(fileURLToPath(import.meta.url))

const useR2 = process.env.NODE_ENV === 'production' || process.env.USE_R2 === 'true'

export const Media: CollectionConfig = {
  slug: 'media',
  access: {
    read: () => true,
  },
  admin: {
    useAsTitle: 'filename',
  },
  upload: {
    // Local-disk location used in development (when R2 is disabled).
    // Ignored when the S3/R2 adapter is enabled.
    staticDir: path.resolve(dirname, '../media'),
  },
  fields: [
    {
      name: 'alt',
      type: 'text',
    },
    // When S3 plugin is disabled (local dev), manually define the `prefix` field 
    // to match production database schema and prevent Drizzle from dropping it.
    ...(!useR2
      ? [
          {
            name: 'prefix',
            type: 'text',
            admin: {
              readOnly: true,
              hidden: true,
            },
          },
        ]
      : []),
  ],
}
