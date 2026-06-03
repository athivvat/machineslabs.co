import type { CollectionConfig, FieldHook } from 'payload'

// URL-friendly slug: lowercase, spaces → hyphens, strip other characters.
const formatSlug = (val: string): string =>
  val
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9-]+/g, '')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')

// Clean whatever was typed; if left blank, derive from the title.
const ensureSlug: FieldHook = ({ value, data, originalDoc }) => {
  if (typeof value === 'string' && value.length > 0) return formatSlug(value)
  const fallback = data?.title ?? originalDoc?.title
  return typeof fallback === 'string' ? formatSlug(fallback) : value
}

export const Posts: CollectionConfig = {
  slug: 'posts',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'slug', 'subTitle', 'updatedAt'],
  },
  fields: [
    {
      name: 'title',
      type: 'text',
      required: true,
    },
    {
      name: 'slug',
      type: 'text',
      required: true,
      unique: true,
      index: true,
      admin: {
        position: 'sidebar',
        description: 'URL path, e.g. 10-tools-for-beginner-embedded-systems',
      },
      hooks: {
        beforeValidate: [ensureSlug],
      },
    },
    {
      name: 'subTitle',
      type: 'text',
    },
    {
      name: 'excerpt',
      type: 'textarea',
      admin: {
        description: 'Short summary shown on cards, the article page, and used as the meta description.',
      },
    },
    {
      name: 'featureImage',
      type: 'group',
      fields: [
        {
          name: 'image',
          type: 'upload',
          relationTo: 'media',
        },
        {
          name: 'caption',
          type: 'text',
        },
        {
          name: 'credits',
          type: 'text',
        },
      ],
    },
    {
      name: 'body',
      type: 'richText',
    },
    {
      name: 'categories',
      type: 'relationship',
      relationTo: 'categories',
      hasMany: true,
    },
    {
      name: 'tags',
      type: 'relationship',
      relationTo: 'tags',
      hasMany: true,
    },
  ],
}
