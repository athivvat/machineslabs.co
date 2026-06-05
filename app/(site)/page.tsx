import Link from "next/link";
import Hero from "@/components/hero";
import PostCard from "@/components/post-card";
import CourseCard from "@/components/course-card";
import { getPosts } from "@/lib/posts";
import { getCourses } from "@/lib/courses";

export default async function Home() {
  const [posts, courses] = await Promise.all([
    getPosts({ limit: 3 }),
    getCourses()
  ]);

  return (
    <>
      <Hero />

      {/* Latest Blog Posts Section */}
      {posts.length > 0 && (
        <section className="mx-auto max-w-6xl px-6 py-20">
          <div className="flex items-end justify-between gap-4">
            <h2 className="text-3xl font-bold tracking-tight md:text-4xl">บทความล่าสุด</h2>
            <Link
              href="/articles"
              className="font-mono text-xs uppercase tracking-widest text-blaze-orange no-underline hover:underline"
            >
              บทความทั้งหมด
            </Link>
          </div>

          <div className="mt-10 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            {posts.map((post) => (
              <PostCard key={post.id} post={post} />
            ))}
          </div>
        </section>
      )}

           {/* Featured Courses Section - Full White Background */}
      {courses.length > 0 && (
        <section className="w-full bg-white text-gray-900 py-20 border-y border-gray-200">
          <div className="mx-auto max-w-6xl px-6">
            <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
              <div>
                <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange font-bold">Machines School</p>
                <h2 className="mt-3 text-3xl font-extrabold tracking-tight md:text-5xl text-gray-900">
                  คอร์สเรียนแนะนำ
                </h2>
                <p className="mt-4 text-gray-600 max-w-2xl">
                  พัฒนาทักษะวิศวกรรมและการเป็นเมกเกอร์ด้วยคอร์สสอนลงมือทำจริง 
                  เรียนรู้การออกแบบวงจรไฟฟ้า พัฒนาโปรแกรมควบคุมบอร์ด ESP32 และ IoT Application
                </p>
              </div>
              <Link
                href="/school"
                className="inline-flex items-center gap-1 font-mono text-xs uppercase tracking-widest text-gray-900 font-bold no-underline hover:text-blaze-orange transition-colors shrink-0"
              >
                ดูคอร์สทั้งหมด &rarr;
              </Link>
            </div>

            <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
              {courses.slice(0, 3).map((course, index) => (
                <CourseCard key={course.id} course={course} lightBg={true} index={index} />
              ))}
            </div>
          </div>
        </section>
      )}
    </>
  );
}
