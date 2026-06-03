# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## Critical: Next.js version

This repo runs **Next.js 16.2.7** with **React 19.2.4**. As AGENTS.md warns, this version differs from older Next.js — APIs and conventions may not match prior knowledge. Before writing routing, data-fetching, caching, or rendering code, read the relevant guide under `node_modules/next/dist/docs/` (`01-app`, `02-pages`, `03-architecture`, `04-community`, plus `index.md`).

## Commands

This project uses **Bun** as the package manager (`bun.lock`). Use `bun` / `bun install` / `bunx`.

- `bun run dev` — start the dev server
- `bun run build` — production build
- `bun run start` — serve the production build
- `bun run lint` — run ESLint
- `bun run ci` — `payload migrate && next build` (Vercel build command, set via `vercel.ts`)

Database/CMS commands are grouped by tool — `payload:*` (Payload, the `cms` schema) and `db:*` (Drizzle, the `auth_`/`lms_`/`store_` tables). See **Database & CMS** below.

There is no test setup yet.

## Architecture

*Machines Labs* — an online lab for electronics, robotics, and physical intelligence (articles, projects, courses, a maker store).

- **App Router with route groups** (no single `app/layout.tsx` — each group is its own root layout):
  - `app/(site)/` — the public site. Its `layout.tsx` is the root layout (Header/Footer, forced `dark` theme, fonts via `next/font/google`: Geist, Geist Mono, Tiny5, **Prompt** with the `thai` subset). Pages: `page.tsx` (hero + latest-posts grid), `articles/` (list + `[slug]` detail that renders the Lexical body with `RichText`), `about/`.
  - `app/(payload)/` — the generated Payload admin (`/admin`) and REST/GraphQL API (`/api/*`). Treat these files as generated.
- **Components** live in `components/`; shared server helpers in `lib/` (e.g. `lib/posts.ts` fetches via Payload's Local API `getPayload({ config })`).
- **Styling**: Tailwind CSS v4 via `@tailwindcss/postcss`; global styles + theme tokens in `app/globals.css`. Brand color token `blaze-orange`; fonts exposed as `font-*` tokens. Article bodies use `@tailwindcss/typography` (`prose`) plus the `.article-body` class. Site is hard-coded dark.
- **Imports**: `@/*` is aliased to the repo root (`tsconfig.json`); `@payload-config` → `payload.config.ts`.
- **TypeScript**: strict mode, `noEmit`, bundler module resolution. The project is ESM (`"type": "module"` — required by Payload's tooling).

## Database & CMS

The app runs **Payload CMS 3.85** on **Postgres** (Supabase in prod), with **Drizzle** reserved for non-CMS domains. Two systems share one database, isolated by Postgres schema / table prefix and managed by **separate** migration tools.

**Ownership**
- **Payload** owns the `cms` schema (adapter `schemaName: 'cms'`): collections (`posts`, `media`, `categories`, `tags`, `users`) + `payload_*` internals. Defined in `collections/*` + `payload.config.ts`; migrations in `migrations/cms/` (adapter `migrationDir`). Generated `payload-types.ts` at the repo root.
- **Drizzle** owns application/transactional tables, prefixed by domain so they never collide with Payload: `auth_*` (better-auth), `lms_*` (online course), `store_*` (shop). Schema in `db/schema/*`, client in `db/index.ts`; migrations in `migrations/app/` (`drizzle.config.ts` `out`), scoped by `tablesFilter: ['auth_*','lms_*','store_*']`.

**Rules**
- **Never run `drizzle-kit push` unscoped**, and keep `tablesFilter` in place — it's what stops Drizzle from dropping Payload's tables.
- Content-shaped data (product/course catalog, course content) → **Payload collections**. Transactional data (orders, carts, enrollments, sessions) → **Drizzle**.
- Keep Payload admin users and better-auth (customer) users as separate concepts.

**Scripts** — `payload:migrate` / `payload:migrate:create` / `payload:migrate:status` / `payload:generate:types` / `payload:generate:importmap`; `db:generate` / `db:migrate` / `db:studio`.

**Migrations & deploy**
- Dev auto-pushes the Payload schema (just load `/admin`). Production uses migrations — `bun run ci` runs `payload migrate && next build`. **Once Drizzle has tables, update `ci` to `payload migrate && drizzle-kit migrate && next build`.**
- After changing collections/fields: `bun run payload:migrate:create <name>`, commit `migrations/cms/`. After changing `db/schema`: `bun run db:generate`, commit `migrations/app/`.
- Use the Supabase **session/direct (5432)** connection for migrations (DDL) — **not** the 6543 transaction pooler.

**Media storage**: uploads go to **Cloudflare R2** (S3 adapter, `@payloadcms/storage-s3`) in production; in dev they fall back to local `./media` unless `USE_R2=true` (see `payload.config.ts`).

**Env** (`.env`, see `.env.example`): `DATABASE_URL`, `PAYLOAD_SECRET`, `S3_ENDPOINT`/`S3_BUCKET`/`S3_ACCESS_KEY_ID`/`S3_SECRET_ACCESS_KEY`, optional `USE_R2`.
