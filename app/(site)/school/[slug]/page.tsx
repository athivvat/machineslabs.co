import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import { getCourseBySlug, getCourses } from "@/lib/courses";

export const revalidate = 60;
import { 
  ArrowLeftIcon, 
  BookOpenIcon, 
  ExternalLinkIcon, 
  ClockIcon, 
  TvIcon, 
  FileTextIcon, 
  HelpCircleIcon, 
  CheckCircle2Icon,
  PlayIcon,
  LockIcon,
  ChevronDownIcon
} from "lucide-react";

interface CoursePageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({ params }: CoursePageProps): Promise<Metadata> {
  const { slug } = await params;
  const course = await getCourseBySlug(slug);

  if (!course) {
    return {
      title: "ไม่พบคอร์สเรียน — Machines Labs",
    };
  }

  return {
    title: `${course.title} — Machines Labs`,
    description: course.summary,
  };
}

export async function generateStaticParams() {
  const courses = await getCourses();
  return courses.map((course) => ({
    slug: course.slug,
  }));
}

export default async function CourseDetailPage({ params }: CoursePageProps) {
  const { slug } = await params;
  const course = await getCourseBySlug(slug);

  if (!course) {
    notFound();
  }

  const { title, summary, description, platform, price, udemyUrl, modules, thumbnailUrl, comingSoon, intendedLearners, learningObjectives, requirements } = course;

  // Format Price
  const priceDisplay = price && price > 0 ? `฿${price.toLocaleString()}` : "ฟรี";

  // Calculate total lessons and hours
  const totalLessons = modules?.reduce((acc, m) => acc + m.lessons.length, 0) || 0;
  const totalMinutes = modules?.reduce((acc, m) => acc + m.lessons.reduce((sum, l) => sum + l.duration, 0), 0) || 0;
  const totalHours = Math.round((totalMinutes / 60) * 10) / 10;
  let lessonCounter = 0;

  return (
    <div className="bg-black min-h-screen text-white pb-20">
      
      {/* Full-width Hero Header with Background Image & Gradient */}
      <div className="relative w-full border-b border-white/10 overflow-hidden z-0">
        {thumbnailUrl && (
          <>
            <Image
              src={thumbnailUrl}
              alt=""
              fill
              priority
              sizes="100vw"
              className="absolute inset-0 object-cover select-none pointer-events-none -z-10"
            />
            {/* Vertical Gradient: Darker top and bottom to blend with header and page content */}
            <div className="absolute inset-0 bg-gradient-to-b from-black/95  via-black/70 to-black/50 -z-10" />
          </>
        )}
        
        <div className="relative max-w-6xl mx-auto px-6 pt-32 pb-16">
          {/* Back Button */}
          <Link 
            href="/school" 
            className="inline-flex items-center gap-2 text-sm text-gray-400 hover:text-blaze-orange transition-colors duration-200 mb-8 font-mono"
          >
            <ArrowLeftIcon size={16} />
            กลับหน้าหลักสูตร
          </Link>

          <div className="max-w-3xl">
            {/* Badges */}
            {price === 0 && (
              <div className="flex flex-wrap items-center gap-3 mb-6">
                <span className="inline-flex items-center rounded-md bg-white/10 px-2.5 py-0.5 text-xs font-mono font-medium text-white">
                  FREE
                </span>
              </div>
            )}

            {/* Course Title */}
            <h1 className="text-3xl md:text-5xl font-bold tracking-tight text-white leading-tight">
              {title}
            </h1>
            
            {/* Course Summary */}
            <p className="mt-4 text-lg text-white leading-relaxed">
              {summary}
            </p>

            {/* Quick stats */}
            {totalLessons > 0 && (
              <div className="mt-6 flex flex-wrap gap-2.5">
                <span className="inline-flex items-center gap-1.5 border border-blaze-orange bg-blaze-orange/70 px-2.5 py-1 font-mono text-[10px] font-medium uppercase tracking-widest text-white">
                  <BookOpenIcon size={12} className="shrink-0" />
                  {modules?.length} บทเรียนหลัก
                </span>
                <span className="inline-flex items-center gap-1.5 border border-blaze-orange bg-blaze-orange/70 px-2.5 py-1 font-mono text-[10px] font-medium uppercase tracking-widest text-white">
                  <TvIcon size={12} className="shrink-0" />
                  {totalLessons} หัวข้อการเรียนรู้
                </span>
                <span className="inline-flex items-center gap-1.5 border border-blaze-orange bg-blaze-orange/70 px-2.5 py-1 font-mono text-[10px] font-medium uppercase tracking-widest text-white">
                  <ClockIcon size={12} className="shrink-0" />
                  ~{totalHours} ชั่วโมงการเรียน ({totalMinutes} นาที)
                </span>
              </div>
            )}
          </div>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-6 mt-12">
        {/* Content & Sidebar Grid */}
        <div className="grid gap-12 lg:grid-cols-3 items-start">
          
          {/* Details (Syllabus/Description) */}
          <div className="lg:col-span-2 space-y-12">
            
            {/* About Course */}
            <div>
              <h2 className="text-2xl font-bold tracking-tight text-white mb-6 border-l-4 border-blaze-orange pl-3">
                รายละเอียดหลักสูตร
              </h2>
              <div className="text-gray-300 space-y-4 leading-relaxed">
                {description.split("\n\n").map((block, idx) => {
                  const trimmed = block.trim();
                  if (!trimmed) return null;
                  if (trimmed.startsWith("###")) {
                    return (
                      <h3 key={idx} className="text-xl font-bold text-white mt-8 mb-3">
                        {trimmed.replace("###", "").trim()}
                      </h3>
                    );
                  }
                  if (trimmed.startsWith("-") || trimmed.startsWith("*")) {
                    const items = trimmed.split("\n").map((line) => line.replace(/^[-*]\s+/, "").trim());
                    return (
                      <ul key={idx} className="list-disc pl-6 space-y-2 text-gray-300 my-4">
                        {items.map((item, i) => (
                          <li key={i}>{item}</li>
                        ))}
                      </ul>
                    );
                  }
                  return (
                    <p key={idx} className="text-gray-300">
                      {trimmed}
                    </p>
                  );
                })}
              </div>
            </div>

            {/* Learning Objectives */}
            {learningObjectives && learningObjectives.length > 0 && (
              <div>
                <h2 className="text-2xl font-bold tracking-tight text-white mb-6 border-l-4 border-blaze-orange pl-3">
                  สิ่งที่คุณจะได้เรียนรู้จากคอร์สนี้
                </h2>
                <div className="grid gap-3 sm:grid-cols-2 bg-white/[0.02] border border-white/5 rounded-2xl p-6">
                  {learningObjectives.map((objective, idx) => (
                    <div 
                      key={idx} 
                      className="flex items-start gap-2.5 py-1"
                    >
                      <CheckCircle2Icon className="h-5 w-5 text-blaze-orange shrink-0 mt-0.5" />
                      <span className="text-gray-300 text-sm leading-relaxed">{objective}</span>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {/* Intended Learners */}
            {intendedLearners && intendedLearners.length > 0 && (
              <div>
                <h2 className="text-2xl font-bold tracking-tight text-white mb-6 border-l-4 border-blaze-orange pl-3">
                  คอร์สนี้เหมาะสำหรับใคร?
                </h2>
                <div className="grid gap-1 sm:grid-cols-1">
                  {intendedLearners.map((learner, idx) => (
                    <div 
                      key={idx} 
                      className="flex items-start gap-2 py-1 px-2"
                    >
                      <CheckCircle2Icon className="h-5 w-5 text-blaze-orange shrink-0 mt-0.5" />
                      <span className="text-gray-300 text-sm leading-relaxed">{learner}</span>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {/* Requirements */}
            {requirements && requirements.length > 0 && (
              <div>
                <h2 className="text-2xl font-bold tracking-tight text-white mb-6 border-l-4 border-blaze-orange pl-3">
                  ความรู้หรือเครื่องมือพื้นฐานที่จำเป็น
                </h2>
                <div className="grid gap-1 sm:grid-cols-1">
                  {requirements.map((req, idx) => (
                    <div 
                      key={idx} 
                      className="flex items-start gap-2 py-1 px-2"
                    >
                      <CheckCircle2Icon className="h-5 w-5 text-blaze-orange shrink-0 mt-0.5" />
                      <span className="text-gray-300 text-sm leading-relaxed">{req}</span>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {/* Curriculum */}
            {modules && modules.length > 0 && (
              <div>
                <h2 className="text-2xl font-bold tracking-tight text-white mb-6 border-l-4 border-blaze-orange pl-3">
                  เนื้อหาในคอร์สเรียน ({totalLessons} บทเรียน)
                </h2>

                <div className="space-y-6">
                  {modules.map((module, moduleIdx) => (
                    <details 
                      key={module.id} 
                      open={moduleIdx === 0}
                      className="group border border-white/10 rounded-xl overflow-hidden bg-white/[0.01] [&_summary::-webkit-details-marker]:hidden"
                    >
                      {/* Module Header */}
                      <summary className="flex items-center justify-between bg-white/[0.03] px-6 py-4 cursor-pointer list-none select-none hover:bg-white/[0.05] transition-colors focus:outline-hidden">
                        <div>
                          <h3 className="font-bold text-white text-lg">Module {moduleIdx + 1}: {module.title}</h3>
                          {module.description && (
                            <p className="text-sm text-gray-400 mt-1">{module.description}</p>
                          )}
                        </div>
                        <span className="text-gray-400 group-open:rotate-180 transition-transform duration-200 shrink-0 ml-4">
                          <ChevronDownIcon size={18} />
                        </span>
                      </summary>

                      {/* Lesson List */}
                      <div className="divide-y divide-white/5 font-mono border-t border-white/10">
                        {module.lessons.map((lesson) => {
                          lessonCounter++;
                          return (
                            <div 
                              key={lesson.id} 
                              className="px-6 py-3.5 flex items-start justify-between text-sm hover:bg-white/[0.02] transition-colors gap-4"
                            >
                              <div className="flex items-start gap-3 min-w-0">
                                {lesson.type === "video" && <PlayIcon size={14} className="text-blaze-orange shrink-0 mt-0.5" />}
                                {lesson.type === "article" && <FileTextIcon size={14} className="text-blaze-orange shrink-0 mt-0.5" />}
                                {lesson.type === "quiz" && <HelpCircleIcon size={14} className="text-blaze-orange shrink-0 mt-0.5" />}
                                {lesson.type === "assignment" && <CheckCircle2Icon size={14} className="text-blaze-orange shrink-0" />}
                                
                                <div className="flex items-start gap-2 text-gray-300 min-w-0">
                                  <span className="shrink-0 text-gray-500 font-mono select-none">{lessonCounter}.</span>
                                  <span className="break-words">{lesson.title}</span>
                                </div>
                              </div>

                              <div className="flex items-center gap-3 shrink-0 mt-0.5">
                                {lesson.isFreePreview ? (
                                  <span className="text-xs bg-blaze-orange/20 text-blaze-orange px-2 py-0.5 rounded font-bold">
                                    ตัวอย่างฟรี
                                  </span>
                                ) : (
                                  <LockIcon size={12} className="text-gray-600" />
                                )}
                                <span className="text-xs text-gray-500">{lesson.duration} นาที</span>
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </details>
                  ))}
                </div>
              </div>
            )}
          </div>

          {/* Right Sidebar - Pricing & Instructor Card */}
          <div className="space-y-6 lg:sticky lg:top-28">
            
            {/* Pricing & CTA Card */}
            <div className="bg-white/[0.03] border border-white/[0.08] rounded-2xl p-6 lg:p-8 flex flex-col justify-between">
              <div>
                <span className="text-xs uppercase font-mono tracking-widest text-gray-500">ค่าลงทะเบียน</span>
                <div className="mt-2 flex items-baseline gap-2">
                  <span className="text-4xl font-extrabold text-white">{priceDisplay}</span>
                  {price && price > 0 && (
                    <span className="text-xs text-gray-400 font-mono">ชำระครั้งเดียวเข้าเรียนได้ตลอดชีพ</span>
                  )}
                </div>
              </div>

              <div className="mt-8 space-y-3">
                {comingSoon ? (
                  <button
                    disabled
                    className="flex w-full items-center justify-center gap-2 rounded-xl bg-white/5 border border-white/10 px-4 py-3 text-center text-sm font-semibold text-gray-500 cursor-not-allowed select-none"
                  >
                    Coming Soon
                  </button>
                ) : (
                  <>
                    {/* Udemy Button */}
                    {(platform === "udemy" || platform === "both") && udemyUrl && (
                      <a
                        href={udemyUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex w-full items-center justify-center gap-2 rounded-xl bg-violet-600 px-4 py-3 text-center text-sm font-semibold text-white hover:bg-violet-700 transition-colors duration-200"
                      >
                        ลงทะเบียนเรียนบน Udemy
                        <ExternalLinkIcon size={16} />
                      </a>
                    )}

                    {/* Local Platform Button */}
                    {(platform === "local" || platform === "both") && (
                      <button
                        className="flex w-full items-center justify-center gap-2 rounded-xl bg-blaze-orange px-4 py-3 text-center text-sm font-semibold text-white hover:bg-flame-orange transition-colors duration-200 shadow-lg shadow-blaze-orange/20 cursor-pointer"
                      >
                        เริ่มเข้าเรียนหลักสูตรนี้
                      </button>
                    )}
                  </>
                )}
              </div>

              <ul className="mt-6 space-y-2 text-xs text-gray-400">
                <li className="flex items-center gap-2">
                  <CheckCircle2Icon size={14} className="text-blaze-orange" /> เข้าเรียนได้ทันทีตลอด 24 ชม.
                </li>
                <li className="flex items-center gap-2">
                  <CheckCircle2Icon size={14} className="text-blaze-orange" /> พร้อมซอร์สโค้ดและไฟล์ประกอบการเรียน
                </li>
                <li className="flex items-center gap-2">
                  <CheckCircle2Icon size={14} className="text-blaze-orange" /> ปรึกษาคำถาม/ข้อสงสัยกับผู้สอนโดยตรง
                </li>
              </ul>
            </div>

            {/* Instructor Card */}
            <div className="border border-white/10 rounded-2xl p-6 bg-white/[0.01]">
              <h3 className="font-bold text-white text-lg mb-4">ผู้จัดสอน</h3>
              <div className="flex items-center gap-3">
                <div className="h-12 w-12 rounded-full bg-blaze-orange flex items-center justify-center font-bold text-lg text-white font-mono">
                  ML
                </div>
                <div>
                  <h4 className="font-bold text-white text-sm">Machines Labs Team</h4>
                  <p className="text-xs text-gray-400">Maker & Robotics Engineers</p>
                </div>
              </div>
              <p className="mt-4 text-xs text-gray-400 leading-relaxed">
                ทีมวิศวกรและผู้เชี่ยวชาญด้านฮาร์ดแวร์ เทคโนโลยีหุ่นยนต์ และระบบ IoT 
                ที่มุ่งเน้นการสร้างองค์ความรู้ภาคปฏิบัติเพื่อการใช้งานจริงในอุตสาหกรรมยุคใหม่
              </p>
            </div>
          </div>

        </div>
      </div>

    </div>
  );
}
