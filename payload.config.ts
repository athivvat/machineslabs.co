import path from 'path'
import { fileURLToPath } from 'url'

import { postgresAdapter } from '@payloadcms/db-postgres'
import { EXPERIMENTAL_TableFeature, lexicalEditor } from '@payloadcms/richtext-lexical'
import { s3Storage } from '@payloadcms/storage-s3'
import { buildConfig } from 'payload'

import { Categories } from './collections/Categories'
import { Media } from './collections/Media'
import { Posts } from './collections/Posts'
import { Tags } from './collections/Tags'
import { Users } from './collections/Users'

const filename = fileURLToPath(import.meta.url)
const dirname = path.dirname(filename)

// Use Cloudflare R2 in production; fall back to local-disk storage in dev so
// you don't need R2 credentials to develop. Set USE_R2=true to test R2 locally.
const useR2 = process.env.NODE_ENV === 'production' || process.env.USE_R2 === 'true'

export default buildConfig({
  admin: {
    user: Users.slug,
    importMap: {
      baseDir: path.resolve(dirname),
    },
  },
  collections: [Posts, Categories, Tags, Media, Users],
  editor: lexicalEditor({
    features: ({ defaultFeatures }) => [...defaultFeatures, EXPERIMENTAL_TableFeature()],
  }),
  secret: process.env.PAYLOAD_SECRET || '',
  typescript: {
    outputFile: path.resolve(dirname, 'payload-types.ts'),
  },
  db: postgresAdapter({
    // Keep all Payload tables (collections + payload_* internals) in their own schema.
    schemaName: 'cms',
    // Payload migrations live here; Drizzle (auth_/lms_/store_) will use migrations/app.
    migrationDir: path.resolve(dirname, 'migrations/cms'),
    pool: {
      connectionString: process.env.DATABASE_URL || '',
    },
  }),
  graphQL: {
    schemaOutputFile: path.resolve(dirname, 'schema.graphql'),
  },
  plugins: [
    // `media` uploads are stored in Cloudflare R2 (S3-compatible) when enabled.
    // When disabled (dev default), the adapter is a no-op and Payload falls back
    // to the collection's local-disk storage (see Media.upload.staticDir).
    s3Storage({
      enabled: useR2,
      collections: {
        media: true,
      },
      bucket: process.env.S3_BUCKET || '',
      config: {
        credentials: {
          accessKeyId: process.env.S3_ACCESS_KEY_ID || '',
          secretAccessKey: process.env.S3_SECRET_ACCESS_KEY || '',
        },
        // Cloudflare R2 always uses the "auto" region.
        region: 'auto',
        endpoint: process.env.S3_ENDPOINT || '',
      },
    }),
  ],
})
