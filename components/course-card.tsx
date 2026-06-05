import Link from "next/link";
import type { Course } from "@/lib/courses";

interface CourseCardProps {
  course: Course;
  lightBg?: boolean;
  index?: number;
}

export default function CourseCard({ course, lightBg = false, index }: CourseCardProps) {
  const { title, slug, summary, price, description, thumbnailUrl } = course;

  // Price formatting
  const priceDisplay = price && price > 0 ? `฿${price.toLocaleString()}` : "ฟรี";

  // Determine responsive side position classes based on grid column index
  const isMdLeft = index !== undefined && index % 2 === 1;
  const isLgLeft = index !== undefined && index % 3 === 2;

  const hoverPositionClasses = index !== undefined 
    ? `${isMdLeft ? "md:right-full md:left-auto md:mr-4 md:ml-0" : "md:left-full md:right-auto md:ml-4 md:mr-0"} ${
       isLgLeft ? "lg:right-full lg:left-auto lg:mr-4 lg:ml-0" : "lg:left-full lg:right-auto lg:ml-4 lg:mr-0"
      }`
    : "md:left-full md:right-auto md:ml-4"; // fallback default to right

  const arrowClasses = index !== undefined
    ? `absolute top-6 border-8 border-transparent ${
        isMdLeft
          ? "md:left-full md:right-auto md:border-l-white md:border-r-transparent"
          : "md:right-full md:left-auto md:border-r-white md:border-l-transparent"
      } ${
        isLgLeft
          ? "lg:left-full lg:right-auto lg:border-l-white lg:border-r-transparent"
          : "lg:right-full lg:left-auto lg:border-r-white lg:border-l-transparent"
      }`
    : "absolute top-6 right-full border-8 border-transparent border-r-white";

  return (
    <div
      className={`relative group flex flex-col justify-between rounded-xl p-6 transition-all duration-300 hover:z-30 ${
        lightBg
          ? "bg-white border border-gray-100 hover:border-gray-200 shadow-sm hover:shadow-md hover:-translate-y-1"
          : "bg-white/[0.03] border border-white/[0.08] hover:border-white/[0.15] hover:bg-white/[0.06] hover:-translate-y-1"
      }`}
    >
      <div>
        {/* Thumbnail Image */}
        <div className={`relative aspect-video w-[calc(100%+3rem)] max-w-none overflow-hidden rounded-t-xl -mx-6 -mt-6 mb-5 border-b ${
          lightBg ? "border-gray-100 bg-gray-50" : "border-white/5 bg-zinc-950"
        }`}>
          {thumbnailUrl ? (
            /* eslint-disable-next-line @next/next/no-img-element */
            <img
              src={thumbnailUrl}
              alt={title}
              className="object-cover w-full h-full group-hover:scale-105 transition-transform duration-300"
            />
          ) : (
            <div className="flex h-full w-full items-center justify-center text-muted-foreground/30">
              <span className="text-xs font-mono">No Image</span>
            </div>
          )}
        </div>

        {/* Title */}
        <h3
          className={`text-xl font-bold tracking-tight mb-2 group-hover:text-blaze-orange transition-colors duration-200 line-clamp-2 ${
            lightBg ? "text-gray-900" : "text-white"
          }`}
        >
          {title}
        </h3>

        {/* Summary */}
        <p className={`text-sm mb-6 line-clamp-3 ${lightBg ? "text-gray-600" : "text-gray-400"}`}>
          {summary}
        </p>
      </div>

      <div className="flex items-center justify-between pt-4 border-t border-dashed mt-auto">
        {/* Price */}
        <div>
          <span className={`block text-xs font-mono ${lightBg ? "text-gray-400" : "text-gray-500"}`}>ราคา</span>
          <span className={`text-lg font-bold ${lightBg ? "text-gray-900" : "text-white"}`}>{priceDisplay}</span>
        </div>

        {/* Button link */}
        <Link
          href={`/school/${slug}`}
          className={`inline-flex items-center justify-center rounded-lg px-4 py-2 text-sm font-semibold transition-all duration-200 ${
            lightBg
              ? "bg-gray-900 text-white hover:bg-blaze-orange hover:text-white"
              : "bg-white/10 text-white hover:bg-blaze-orange"
          }`}
        >
          รายละเอียดคอร์ส
        </Link>
      </div>

      {/* Desktop Hover Card */}
      <div
        className={`absolute top-0 w-80 rounded-xl p-5 shadow-2xl opacity-0 scale-95 pointer-events-none group-hover:opacity-100 group-hover:scale-100 group-hover:pointer-events-auto transition-all duration-200 z-50 border border-gray-200 hidden md:block bg-white text-gray-900 ${hoverPositionClasses}`}
      >
        <h3 className="font-bold text-sm leading-snug mb-2 text-gray-900">{title}</h3>
        <div className="text-[11px] text-gray-600 space-y-2 leading-relaxed">
          {description.split("\n\n").map((block, idx) => {
            const trimmed = block.trim();
            if (!trimmed) return null;
            if (trimmed.startsWith("###")) {
              return (
                <h4 key={idx} className="font-bold text-gray-800 mt-3 mb-1">
                  {trimmed.replace("###", "").trim()}
                </h4>
              );
            }
            if (trimmed.startsWith("-") || trimmed.startsWith("*")) {
              const items = trimmed.split("\n").map((line) => line.replace(/^[-*]\s+/, "").trim());
              return (
                <ul key={idx} className="list-disc pl-4 space-y-0.5 my-1.5">
                  {items.map((item, i) => (
                    <li key={i}>{item}</li>
                  ))}
                </ul>
              );
            }
            return <p key={idx}>{trimmed}</p>;
          })}
        </div>
        
        {/* Tooltip Arrow pointing to the card */}
        <div className={arrowClasses} />
      </div>
    </div>
  );
}
