import type { Metadata } from "next";
import Link from "next/link";
import { 
  Search, 
  Cpu, 
  Radar, 
  Zap, 
  Settings, 
  Cable, 
  Monitor, 
  Hash, 
  Grid, 
  ShoppingBag,
  ArrowRight,
  ChevronRight,
  Truck,
  ShieldCheck,
  Star
} from "lucide-react";

export const metadata: Metadata = {
  title: "Machines Store — แหล่งรวมอะไหล่และอุปกรณ์อิเล็กทรอนิกส์",
  description: "คลังอะไหล่และเซนเซอร์คุณภาพสูงสำหรับงาน IoT, หุ่นยนต์ และเมกเกอร์ ค้นหาและสั่งซื้อชิ้นส่วนอิเล็กทรอนิกส์แท้สำหรับโครงงานวิศวกรรมของคุณ",
};

// Mock Categories Data
const categories = [
  {
    id: "mcu",
    name: "Microcontrollers",
    description: "ESP32, Arduino, STM32 & Dev Boards",
    icon: Cpu,
    count: 124,
  },
  {
    id: "sensors",
    name: "Sensors & Modules",
    description: "IMU, Gas, Distance, Light & Temp",
    icon: Radar,
    count: 185,
  },
  {
    id: "power",
    name: "Power & Battery",
    description: "LiPo, Buck Converters, Chargers & PMU",
    icon: Zap,
    count: 82,
  },
  {
    id: "actuators",
    name: "Motors & Actuators",
    description: "Servos, Stepper Motors, Drivers & Solenoids",
    icon: Settings,
    count: 65,
  },
  {
    id: "wireless",
    name: "Wireless & IoT",
    description: "LoRa, Wi-Fi, Bluetooth & GPS Modules",
    icon: Radar, // Reuse or fallback
    count: 48,
  },
  {
    id: "displays",
    name: "Displays & LEDs",
    description: "OLED, TFT, e-Paper & Addressable LEDs",
    icon: Monitor,
    count: 53,
  },
  {
    id: "components",
    name: "Passive & Active",
    description: "Resistors, Capacitors, ICs & Transistors",
    icon: Hash,
    count: 240,
  },
  {
    id: "wiring",
    name: "Prototyping & Cables",
    description: "Jumpers, Breadboards, Cable Harness & Connectors",
    icon: Cable,
    count: 90,
  },
];

// Mock Featured Products Data
const featuredProducts = [
  {
    id: "prod-1",
    name: "ESP32-S3 DevKitC-1 (WROOM-1)",
    category: "Microcontrollers",
    price: 350,
    rating: 4.9,
    reviews: 24,
    badge: "Hot",
    specs: "Dual-core 240MHz, 8MB Flash, Wi-Fi & BLE 5.0",
    image: "https://images.unsplash.com/photo-1608564697071-ddf911d8a37e?w=500&auto=format&fit=crop&q=80", // High quality mockup representation
  },
  {
    id: "prod-2",
    name: "MPU-6050 6-Axis Gyro & Accelerometer",
    category: "Sensors",
    price: 85,
    rating: 4.8,
    reviews: 42,
    badge: "Popular",
    specs: "I2C interface, 16-bit ADC, embedded temp sensor",
    image: "https://images.unsplash.com/photo-1518770660439-4636190af475?w=500&auto=format&fit=crop&q=80",
  },
  {
    id: "prod-3",
    name: "SG90 Micro Servo Motor 9g",
    category: "Actuators",
    price: 45,
    rating: 4.7,
    reviews: 68,
    badge: null,
    specs: "1.6 kg/cm stall torque, 180 degree rotation",
    image: "https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=500&auto=format&fit=crop&q=80",
  },
  {
    id: "prod-4",
    name: "LM2596 DC-DC Buck Converter Module",
    category: "Power",
    price: 55,
    rating: 4.8,
    reviews: 35,
    badge: "Sale",
    specs: "Input 3.2V-40V, Output 1.25V-35V (Adjustable), 3A max",
    image: "https://images.unsplash.com/photo-1555664424-778a1e5e1b48?w=500&auto=format&fit=crop&q=80",
  },
];

export default function StoreFrontPage() {
  return (
    <div className="bg-black min-h-screen text-white pb-20">
      
      {/* Hero Header & Centered Search */}
      <div className="relative w-full border-b border-white/10 overflow-hidden pt-36 pb-20">
        
        {/* Cover Hero Background Image */}
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src="/images/electionics-components.webp"
          alt=""
          className="absolute inset-0 w-full h-full object-cover select-none pointer-events-none"
        />

        {/* Vertical/Horizontal Gradients for text contrast and edge blending */}
        <div className="absolute inset-0 bg-gradient-to-b from-black/90 via-black/70 to-black/40" />
        
        {/* Subtle decorative grid/glow behind search */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#80808012_1px,transparent_1px),linear-gradient(to_bottom,#80808012_1px,transparent_1px)] bg-[size:24px_24px] pointer-events-none opacity-40" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[350px] h-[350px] bg-blaze-orange/5 rounded-full blur-[100px] pointer-events-none" />

        <div className="relative max-w-4xl mx-auto px-6 text-center">
          
          <div className="flex justify-center mb-4">
            <span className="inline-flex items-center gap-1.5 border border-blaze-orange/40 bg-blaze-orange/10 px-3 py-1 rounded-full font-mono text-[10px] font-medium uppercase tracking-widest text-blaze-orange">
              <ShoppingBag size={12} />
              Machines Labs Store
            </span>
          </div>

          <h1 className="text-4xl md:text-6xl font-extrabold tracking-tight text-white leading-tight">
            ค้นหาชิ้นส่วนอิเล็กทรอนิกส์
          </h1>
          <p className="mt-4 text-base md:text-lg text-gray-400 max-w-xl mx-auto leading-relaxed">
            คลังอะไหล่แท้ บอร์ดไมโครคอนโทรลเลอร์ และเซนเซอร์คุณภาพสูงสำหรับงานประดิษฐ์และโครงงานวิศวกรรม
          </p>

          {/* Centered Search Bar */}
          <div className="mt-8 max-w-2xl mx-auto relative">
            <div className="relative bg-zinc-900 border border-white/10 focus-within:border-white/30 rounded-2xl flex items-center px-4 py-3.5 transition-colors duration-200">
              <Search className="text-gray-400 mr-3 shrink-0" size={20} />
              <input
                type="text"
                placeholder="ค้นหาบอร์ดพัฒนา, เซนเซอร์, มอเตอร์ หรือพิมพ์ชื่ออะไหล่..."
                className="w-full bg-transparent text-white outline-none placeholder-gray-500 text-sm md:text-base font-sans"
              />
              <button className="bg-blaze-orange hover:bg-flame-orange text-white px-5 py-2 rounded-xl text-sm font-semibold transition duration-200 hidden sm:block">
                ค้นหา
              </button>
            </div>
            
            {/* Quick search tags */}
            <div className="mt-3.5 flex flex-wrap gap-2 justify-center items-center text-xs text-white font-mono">
              <span>ยอดนิยม:</span>
              <a href="#" className="hover:text-blaze-orange transition-colors">ESP32</a>
              <span>•</span>
              <a href="#" className="hover:text-blaze-orange transition-colors">IMU Sensor</a>
              <span>•</span>
              <a href="#" className="hover:text-blaze-orange transition-colors">Step-Down Buck</a>
              <span>•</span>
              <a href="#" className="hover:text-blaze-orange transition-colors">Servo 9g</a>
            </div>
          </div>

        </div>
      </div>

      <div className="max-w-6xl mx-auto px-6 mt-16 space-y-20">
        
        {/* Category by Parts (4-Column Grid) */}
        <div>
          <div className="flex items-end justify-between border-b border-white/10 pb-5 mb-8">
            <div>
              <p className="font-mono text-xs uppercase tracking-widest text-blaze-orange">Categories</p>
              <h2 className="mt-2 text-2xl md:text-3xl font-bold tracking-tight text-white">แยกตามประเภทอุปกรณ์</h2>
            </div>
            <span className="text-xs text-gray-500 font-mono hidden sm:inline">หมวดหมู่ทั้งหมด {categories.length} กลุ่ม</span>
          </div>

          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
            {categories.map((cat) => {
              const IconComponent = cat.icon;
              return (
                <div 
                  key={cat.id}
                  className="group relative flex items-center gap-4 rounded-xl border border-white/[0.08] bg-white/[0.02] p-4 hover:border-white/[0.18] hover:bg-white/[0.05] transition-all duration-300 cursor-pointer hover:-translate-y-0.5"
                >
                  {/* Media Icon on Left */}
                  <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg border border-white/10 bg-zinc-900 text-blaze-orange group-hover:bg-blaze-orange group-hover:text-white transition-colors duration-300">
                    <IconComponent size={22} />
                  </div>
                  
                  {/* Name of Cat on Right */}
                  <div className="min-w-0 flex-1">
                    <h3 className="font-bold text-white text-sm truncate group-hover:text-blaze-orange transition-colors duration-200">
                      {cat.name}
                    </h3>
                    <p className="text-[11px] text-gray-500 truncate mt-0.5 leading-normal">
                      {cat.description}
                    </p>
                  </div>
                  
                  <ChevronRight size={14} className="text-gray-600 group-hover:text-blaze-orange transition-colors shrink-0" />
                </div>
              );
            })}
          </div>
        </div>


        {/* Brand Promise Section */}
        <div className="grid gap-6 md:grid-cols-3 border border-white/10 rounded-2xl p-6 bg-zinc-950/30">
          <div className="flex gap-4 items-start">
            <div className="h-10 w-10 shrink-0 rounded-lg bg-blaze-orange/10 border border-blaze-orange/30 flex items-center justify-center text-blaze-orange">
              <Truck size={20} />
            </div>
            <div>
              <h4 className="font-bold text-white text-sm">จัดส่งรวดเร็วจากกรุงเทพฯ</h4>
              <p className="text-xs text-gray-400 mt-1 leading-relaxed">
                สั่งก่อน 14:00 น. จัดส่งออกในวันเดียวกัน มั่นใจได้ของเร็วทันใช้โครงงานด่วน
              </p>
            </div>
          </div>
          <div className="flex gap-4 items-start">
            <div className="h-10 w-10 shrink-0 rounded-lg bg-blaze-orange/10 border border-blaze-orange/30 flex items-center justify-center text-blaze-orange">
              <ShieldCheck size={20} />
            </div>
            <div>
              <h4 className="font-bold text-white text-sm">คัดสรรคุณภาพและทดสอบจริง</h4>
              <p className="text-xs text-gray-400 mt-1 leading-relaxed">
                บอร์ดและอุปกรณ์เสริมได้รับการคัดเลือกและทดสอบคุณภาพโดยทีมวิศวกรของ Machines Labs
              </p>
            </div>
          </div>
          <div className="flex gap-4 items-start">
            <div className="h-10 w-10 shrink-0 rounded-lg bg-blaze-orange/10 border border-blaze-orange/30 flex items-center justify-center text-blaze-orange">
              <Cpu size={20} />
            </div>
            <div>
              <h4 className="font-bold text-white text-sm">รับประกันเปลี่ยนใหม่ทันที</h4>
              <p className="text-xs text-gray-400 mt-1 leading-relaxed">
                บอร์ดเสีย บอร์ดเปิดไม่ติดเนื่องจากกระบวนการผลิต เปลี่ยนบอร์ดชิ้นใหม่ให้ภายใน 7 วัน
              </p>
            </div>
          </div>
        </div>

      </div>

    </div>
  );
}
