import type { Metadata } from "next";
import { Geist, Geist_Mono, Prompt, Tiny5 } from "next/font/google";
import "../globals.css";
import { cn } from "@/lib/utils";
import Header from "@/components/header";
import Footer from "@/components/footer";

const geistSans = Geist({
  variable: "--font-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

const tiny5 = Tiny5({
  variable: "--font-tiny5",
  subsets: ["latin"],
  weight: "400",
});

const prompt = Prompt({
  variable: "--font-prompt",
  subsets: ["latin", "thai"],
  weight: ["400", "500", "600", "700"],
  style: ["normal", "italic"],
});

export const metadata: Metadata = {
  title: "Machines Labs — ห้องปฏิบัติการสำหรับทดลอง สร้าง และเรียนรู้ Electronics, Robotics และ Physical Intelligence",
  description:
      "Machines Labs คือห้องปฏิบัติการออนไลน์ด้าน Electronics, Robotics และ Physical Intelligence — รวมบทความเชิงลึก โปรเจกต์ลงมือทำจริง และร้านค้าสำหรับเมกเกอร์ เพื่อร่วมสร้างเทคโนโลยีที่ผสาน AI เข้ากับโลกกายภาพ (Physical AI)",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      className={cn("dark", "h-full", "antialiased", geistSans.variable, geistMono.variable, tiny5.variable, prompt.variable, "font-sans")}
    >
      <body className="min-h-full flex flex-col">
        <Header />
        <main className="flex-1 pt-16">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
