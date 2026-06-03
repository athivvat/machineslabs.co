import { getImageProps } from "next/image";

export default function Hero() {
  const common = { alt: "", fill: true, priority: true, sizes: "100vw" } as const;
  const { props: square } = getImageProps({
    ...common,
    src: "/images/machineslabs-bg-square.webp",
  });
  const { props: wide } = getImageProps({
    ...common,
    src: "/images/machineslabs-bg.webp",
  });

  return (
    <section className="relative isolate overflow-hidden bg-black text-white">
      {/* Feature image — square crop on mobile, wide on larger screens.
          <picture> art direction: only the matching source is downloaded. */}
      <picture>
        <source media="(min-width: 768px)" srcSet={wide.srcSet} />
        <img
          {...square}
          alt=""
          className="absolute inset-0 -z-10 h-full w-full object-cover object-center"
        />
      </picture>
      {/* Readability overlay */}
      <div className="absolute inset-0 -z-10 bg-linear-to-b from-black to-transparent" />

      <div className="max-w-6xl mx-auto px-6 min-h-[70vh] flex flex-col justify-start pt-20">
        <h1 className="font-sans font-bold tracking-tight text-5xl md:text-8xl">
          <span className="font-tiny5 text-7xl md:text-9xl">M</span>achines Labs
        </h1>
        <p className="mt-2 text-lg md:text-2xl text-gray-300 leading-relaxed">
          ห้องปฏิบัติการสำหรับทดลอง สร้าง และเรียนรู้ Electronics, Robotics และ
          Physical Intelligence
        </p>
      </div>
    </section>
  );
}
