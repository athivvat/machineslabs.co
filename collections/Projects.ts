import type { CollectionConfig, FieldHook, CollectionAfterChangeHook, CollectionAfterDeleteHook } from 'payload'
import { revalidatePath } from 'next/cache'

const formatSlug = (val: string): string =>
  val
    .toLowerCase()
    .trim()
    .replace(/\s+/g, '-')
    .replace(/[^a-z0-9-]+/g, '')
    .replace(/-+/g, '-')
    .replace(/^-|-$/g, '')

const ensureSlug: FieldHook = ({ value, data, originalDoc }) => {
  if (typeof value === 'string' && value.length > 0) return formatSlug(value)
  const fallback = data?.title ?? originalDoc?.title
  return typeof fallback === 'string' ? formatSlug(fallback) : value
}

const revalidateProject: CollectionAfterChangeHook = ({ doc }) => {
  try {
    revalidatePath('/projects')
    if (doc?.slug) {
      revalidatePath(`/projects/${doc.slug}`)
    }
  } catch (err) {
    console.error('Failed to revalidate projects path:', err)
  }
  return doc
}

const revalidateDeleteProject: CollectionAfterDeleteHook = ({ doc }) => {
  try {
    revalidatePath('/projects')
    if (doc?.slug) {
      revalidatePath(`/projects/${doc.slug}`)
    }
  } catch (err) {
    console.error('Failed to revalidate projects path on delete:', err)
  }
}

export const Projects: CollectionConfig = {
  slug: 'projects',
  admin: {
    useAsTitle: 'title',
    defaultColumns: ['title', 'slug', 'subTitle', 'updatedAt'],
    preview: (doc) => {
      if (doc?.slug) {
        return `/api/preview?collection=projects&slug=${doc.slug}`
      }
      return null
    },
  },
  access: {
    read: ({ req }) => {
      if (req.user) return true
      return {
        _status: {
          equals: 'published',
        },
      }
    },
  },
  versions: {
    drafts: {
      schedulePublish: true,
    },
  },
  hooks: {
    afterChange: [revalidateProject],
    afterDelete: [revalidateDeleteProject],
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
        description: 'URL path, e.g. smart-irrigation-system-with-esp32',
      },
      hooks: {
        beforeValidate: [ensureSlug],
      },
    },
    {
      name: 'publishedAt',
      type: 'date',
      admin: {
        position: 'sidebar',
        date: {
          pickerAppearance: 'dayAndTime',
        },
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
        description: 'Short summary shown on cards and lists.',
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
      name: 'partsUsed',
      type: 'json',
      admin: {
        components: {
          Field: '@/components/payload/ProductsSelect#ProductsSelect',
        },
        description: 'Electronics parts and components from our store used in this project.',
      },
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
