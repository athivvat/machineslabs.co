import { AppSidebar } from "@/components/app-sidebar"
import { SiteHeader } from "@/components/site-header"
import { SidebarInset, SidebarProvider } from "@/components/ui/sidebar"

import { auth } from "@/lib/auth"
import { headers } from "next/headers"
import { redirect } from "next/navigation"
import { db } from "@/db"
import { lmsCourses } from "@/db/schema"
import { desc } from "drizzle-orm"
import { CoursesClient } from "./courses-client"
import React from "react"

export const dynamic = "force-dynamic"

export default async function Page() {
  const session = await auth.api.getSession({
    headers: await headers(),
  })

  if (!session) {
    redirect("/login")
  }

  const user = {
    name: session.user.name || "User",
    email: session.user.email,
    avatar: session.user.image || null,
  }

  // Fetch courses from the database sorted by creation date
  const courses = await db.select().from(lmsCourses).orderBy(desc(lmsCourses.createdAt))

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
        <div className="flex flex-1 flex-col p-4 md:p-6">
          <div className="@container/main flex flex-1 flex-col gap-2">
            <CoursesClient initialCourses={courses} />
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
