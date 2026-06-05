import type { Metadata } from "next";

import ProjectCard from "@/components/project-card";
import { getProjects } from "@/lib/projects";

export const metadata: Metadata = {
  title: "โปรเจกต์ — Machines Labs",
  description: "โปรเจกต์ล่าสุดจาก Machines Labs",
};

export default async function ProjectsPage() {
  const projects = await getProjects();

  return (
    <div className="bg-black min-h-screen text-white pt-24 pb-20">
      <section className="mx-auto max-w-6xl px-6">
        <div className="border-b border-white/10 pb-8">
          <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">PROJECTS</p>
          <h1 className="mt-3 text-4xl font-bold tracking-tight md:text-6xl">โปรเจกต์ทั้งหมด</h1>
          <p className="mt-4 text-gray-400 max-w-2xl font-sans">
            สำรวจโครงงานวิศวกรรม ระบบหุ่นยนต์ทำงานจริง และโปรเจกต์ IoT สำหรับการศึกษาและการใช้งานในอุตสาหกรรม
          </p>
        </div>

        {projects.length === 0 ? (
          <p className="mt-12 text-muted-foreground font-mono">ยังไม่มีโปรเจกต์ในขณะนี้</p>
        ) : (
          <div className="mt-12 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            {projects.map((project) => (
              <ProjectCard key={project.id} project={project} />
            ))}
          </div>
        )}
      </section>
    </div>
  );
}
