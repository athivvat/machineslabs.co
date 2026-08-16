import path from 'path'
import { fileURLToPath } from 'url'

import type { CollectionConfig, Field } from 'payload'

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
  hooks: {
    afterRead: [
      ({ doc }) => {
        if (useR2 && doc?.url && process.env.NEXT_PUBLIC_R2_PUBLIC_URL) {
          const publicBase = process.env.NEXT_PUBLIC_R2_PUBLIC_URL.replace(/\/$/, '')
          if (typeof doc.url === 'string') {
            if (doc.url.includes('.r2.cloudflarestorage.com')) {
              // Strip scheme, host, and bucket name from the URL path
              const urlPath = doc.url.replace(/^https?:\/\/[^\/]+\/[^\/]+\//, '')
              doc.url = `${publicBase}/${urlPath}`
            } else if (doc.url.startsWith('/api/media/file/')) {
              const filename = doc.url.replace('/api/media/file/', '')
              const prefix = doc.prefix ? `${doc.prefix}/` : 'articles/assets/'
              doc.url = `${publicBase}/${prefix}${filename}`
            }
          }
        }
        return doc
      },
    ],
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
          } as Field,
        ]
      : []),
  ],
}
