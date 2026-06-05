import { AppSidebar } from "@/components/app-sidebar"
import { SiteHeader } from "@/components/site-header"
import { SidebarInset, SidebarProvider } from "@/components/ui/sidebar"

import { auth } from "@/lib/auth"
import { headers } from "next/headers"
import { redirect, notFound } from "next/navigation"
import { db } from "@/db"
import { lmsCourses } from "@/db/schema"
import { eq } from "drizzle-orm"
import { EditCourseClient } from "./edit-client"
import React from "react"

export const dynamic = "force-dynamic"

interface PageProps {
  params: Promise<{ id: string }>
}

export default async function Page({ params }: PageProps) {
  const session = await auth.api.getSession({
    headers: await headers(),
  })

  if (!session) {
    redirect("/login")
  }

  const { id } = await params

  // Fetch course details with modules and lessons ordered by 'order'
  const course = await db.query.lmsCourses.findFirst({
    where: eq(lmsCourses.id, id),
    with: {
      modules: {
        orderBy: (modules, { asc }) => [asc(modules.order)],
      },
      lessons: {
        orderBy: (lessons, { asc }) => [asc(lessons.order)],
      },
    },
  })

  if (!course) {
    notFound()
  }

  const user = {
    name: session.user.name || "User",
    email: session.user.email,
    avatar: session.user.image || null,
  }

  return (
    <SidebarProvider
      style={
        {
          "--sidebar-width": "calc(var(--spacing) * 72)",
          "--header-height": "calc(var(--spacing) * 12)",
        } as React.CSSProperties
      }
    >
      <AppSidebar variant="inset" user={user} />
      <SidebarInset>
        <SiteHeader />
        <div className="flex flex-1 flex-col p-4 md:p-6 bg-zinc-950/20">
          <div className="@container/main flex flex-1 flex-col gap-2">
            <EditCourseClient course={course} />
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
