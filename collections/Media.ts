import path from 'path'
import { fileURLToPath } from 'url'

import type { CollectionConfig } from 'payload'

const dirname = path.dirname(fileURLToPath(import.meta.url))

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
  ],
}
