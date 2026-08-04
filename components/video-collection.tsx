import Image from "next/image";
import { Play, ExternalLink } from "lucide-react";
import { videoCollectionData, YOUTUBE_CHANNEL_URL, getYoutubeThumbnail, type VideoItem } from "@/data/videos";

function YoutubeIcon({ className = "w-4 h-4" }: { className?: string }) {
  return (
    <svg
      className={className}
      viewBox="0 0 24 24"
      fill="currentColor"
      aria-hidden="true"
    >
      <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
    </svg>
  );
}

interface VideoCollectionProps {
  videos?: VideoItem[];
  title?: string;
  subtitle?: string;
  channelUrl?: string;
}

export default function VideoCollection({
  videos = videoCollectionData,
  title = "วิดีโอจากช่องของเรา",
  subtitle = "โปรเจกต์ บทเรียน รีวิว และการทดลอง ด้าน Electronics, Robotics และ AI ที่ลงมือทำจริง",
  channelUrl = YOUTUBE_CHANNEL_URL,
}: VideoCollectionProps) {
  return (
    <section className="w-full bg-black/90 py-20 border-t border-white/10">
      <div className="mx-auto max-w-6xl px-6">
        {/* Section Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-12">
          <div>
            <div className="flex items-center gap-2 font-mono text-xs uppercase tracking-widest text-blaze-orange font-bold">
              <YoutubeIcon className="w-4 h-4 text-red-500" />
              <span>YouTube Channel</span>
            </div>
            <h2 className="mt-3 text-3xl font-bold tracking-tight md:text-4xl text-white">
              {title}
            </h2>
            <p className="mt-2 text-gray-400 max-w-2xl text-sm md:text-base">
              {subtitle}
            </p>
          </div>

          <a
            href={channelUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center gap-2 px-5 py-2.5 bg-red-600 hover:bg-red-700 text-white font-medium text-xs font-mono tracking-wider uppercase transition-all duration-200 shadow-lg shadow-red-600/20 hover:shadow-red-600/40 rounded-sm no-underline shrink-0"
          >
            <YoutubeIcon className="w-4 h-4" />
            <span>ไปที่ช่อง YouTube</span>
            <ExternalLink className="w-3.5 h-3.5 opacity-80" />
          </a>
        </div>

        {/* Video Grid View */}
        <div className="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          {videos.map((video) => {
            const targetUrl = video.youtubeUrl || video.channelUrl || channelUrl;
            const thumbnailUrl = getYoutubeThumbnail(video.youtubeId);

            return (
              <a
                key={video.id}
                href={targetUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="group flex flex-col bg-zinc-900/60 border border-white/10 rounded-sm overflow-hidden hover:border-blaze-orange/50 transition-all duration-300 no-underline shadow-md hover:shadow-xl hover:shadow-blaze-orange/5 hover:-translate-y-1"
              >
                {/* Thumbnail Container */}
                <div className="relative aspect-video w-full overflow-hidden bg-zinc-950">
                  <Image
                    src={thumbnailUrl}
                    alt={video.title}
                    fill
                    sizes="(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw"
                    className="object-cover transition-transform duration-500 group-hover:scale-105"
                    unoptimized
                  />

                  {/* Dark overlay gradient */}
                  <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-60 group-hover:opacity-40 transition-opacity" />

                  {/* Category Pill Tag */}
                  {video.category && (
                    <span className="absolute top-3 left-3 px-2.5 py-1 text-[10px] font-mono font-semibold uppercase tracking-wider text-white bg-black/70 border border-white/20 backdrop-blur-md">
                      {video.category}
                    </span>
                  )}

                  {/* Duration Pill Tag */}
                  {video.duration && (
                    <span className="absolute bottom-3 right-3 px-2 py-0.5 text-[11px] font-mono text-gray-200 bg-black/80 rounded-xs">
                      {video.duration}
                    </span>
                  )}

                  {/* Play Button Overlay */}
                  <div className="absolute inset-0 flex items-center justify-center">
                    <div className="w-12 h-12 rounded-full bg-red-600/90 text-white flex items-center justify-center shadow-lg group-hover:scale-110 group-hover:bg-red-600 transition-all duration-300 pl-0.5">
                      <Play className="w-5 h-5 fill-white" />
                    </div>
                  </div>
                </div>

                {/* Content */}
                <div className="p-5 flex flex-col flex-1 justify-between gap-3">
                  <div>
                    <div className="flex items-center gap-1.5 text-xs font-mono text-gray-400 mb-2">
                      <YoutubeIcon className="w-3.5 h-3.5 text-red-500" />
                      <span>{video.channelName}</span>
                    </div>

                    <h3 className="font-prompt text-base font-semibold leading-snug text-white group-hover:text-blaze-orange transition-colors line-clamp-2">
                      {video.title}
                    </h3>

                    {video.description && (
                      <p className="mt-2 text-xs text-gray-400 line-clamp-2 leading-relaxed">
                        {video.description}
                      </p>
                    )}
                  </div>

                  <div className="pt-3 border-t border-white/10 flex items-center justify-between text-xs font-mono text-blaze-orange group-hover:text-white transition-colors">
                    <span>ชมบน YouTube</span>
                    <ExternalLink className="w-3.5 h-3.5 transition-transform group-hover:translate-x-0.5 group-hover:-translate-y-0.5" />
                  </div>
                </div>
              </a>
            );
          })}
        </div>
      </div>
    </section>
  );
}
