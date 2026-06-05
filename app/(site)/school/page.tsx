import type { Metadata } from "next";
import { getCourses } from "@/lib/courses";
import CourseCard from "@/components/course-card";

export const metadata: Metadata = {
  title: "คอร์สเรียนทั้งหมด — Machines Labs",
  description: "คอร์สเรียนออนไลน์ด้านฮาร์ดแวร์ หุ่นยนต์ และ IoT โดย Machines Labs",
};

export default async function CoursesPage() {
  const courses = await getCourses();

  return (
    <div className="bg-black min-h-screen text-white pt-24 pb-20">
      <section className="mx-auto max-w-6xl px-6">
        <div className="border-b border-white/10 pb-8">
          <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">Machines School</p>
          <h1 className="mt-3 text-4xl font-bold tracking-tight md:text-6xl">คอร์สเรียนทั้งหมด</h1>
          <p className="mt-4 text-gray-400 max-w-2xl">
            ยกระดับทักษะเมกเกอร์ของคุณผ่านห้องปฏิบัติการและหลักสูตรออนไลน์ 
            เรียนรู้การสร้างบอร์ดสมองกลฝังตัว การพัฒนาแอปพลิเคชัน IoT และระบบหุ่นยนต์ทำงานจริง
          </p>
        </div>

        {courses.length === 0 ? (
          <p className="mt-12 text-muted-foreground font-mono">ยังไม่มีคอร์สเรียนที่เปิดสอนในขณะนี้</p>
        ) : (
          <div className="mt-12 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            {courses.map((course, index) => (
              <CourseCard key={course.id} course={course} index={index} />
            ))}
          </div>
        )}
      </section>
    </div>
  );
}
