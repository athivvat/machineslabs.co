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

There is no test setup yet.

## Architecture

- **App Router** under `app/` — `layout.tsx` (root layout, loads Geist fonts via `next/font/google`), `page.tsx`, `globals.css`. This is currently the default `create-next-app` scaffold; the product (per README) is *Machines Labs*, an online lab for electronics, robotics, and physical intelligence with articles, projects, and a maker store.
- **Styling**: Tailwind CSS v4 via `@tailwindcss/postcss` (see `postcss.config.mjs`); global styles in `app/globals.css`. Dark mode uses Tailwind `dark:` variants.
- **Imports**: `@/*` is aliased to the repo root (`tsconfig.json`).
- **TypeScript**: strict mode, `noEmit`, bundler module resolution.
