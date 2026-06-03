import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "เกี่ยวกับ — Machines Labs",
  description:
    "MachineLabs คือห้องปฏิบัติการออนไลน์สำหรับผู้ที่หลงใหลในโลกของ Electronics, Robotics และ Physical Intelligence",
};

export default function AboutPage() {
  return (
    <section className="max-w-6xl mx-auto px-6 py-20">
      <p className="text-xs font-mono tracking-widest uppercase text-blaze-orange">
        เกี่ยวกับ
      </p>
      <h1 className="mt-3 font-sans font-bold tracking-tight text-4xl md:text-6xl">
        Machines Labs คืออะไร?
      </h1>
      <p className="mt-8 max-w-3xl text-lg md:text-xl text-muted-foreground leading-relaxed">
        Machines Labs คือห้องปฏิบัติการออนไลน์สำหรับผู้ที่หลงใหลในโลกของ
        Electronics, Robotics และ Physical Intelligence
        เราแบ่งปันความรู้เชิงลึกผ่านบทความ วิดีโอ และโปรเจกต์จริง
        ตั้งแต่การออกแบบวงจร การเขียนโค้ดสำหรับ Embedded Systems
        ไปจนถึงการสร้างหุ่นยนต์และระบบอัตโนมัติ
      </p>
    </section>
  );
}
