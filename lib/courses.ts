import { db } from "@/db"
import { lmsCourses, lmsModules, lmsLessons } from "@/db/schema"
import { eq, sql } from "drizzle-orm"

export interface Lesson {
  id: string
  title: string
  slug: string
  type: "video" | "article" | "quiz" | "assignment"
  duration: number // in minutes
  isFreePreview: boolean
  videoUrl?: string
  content?: string
}

export interface Module {
  id: string
  title: string
  description?: string
  order: number
  lessons: Lesson[]
}

export interface Course {
  id: string
  title: string
  slug: string
  summary: string
  description: string
  thumbnailUrl: string
  platform: "local" | "udemy" | "both"
  udemyUrl?: string
  price: number // in Baht
  published: boolean
  modules?: Module[]
  createdAt: string
  updatedAt: string
}

async function seedMockCourses() {
  const countRes = await db.select({ count: sql<number>`count(*)` }).from(lmsCourses)
  if (countRes[0].count > 0) return

  // Insert courses
  await db.insert(lmsCourses).values([
    {
      id: "course_1",
      title: "คอร์สเริ่มต้นหุ่นยนต์และระบบสมองกลฝังตัว (Intro to Robotics & Embedded Systems)",
      slug: "intro-to-robotics-embedded-systems",
      summary: "เรียนรู้วิธีการสร้างหุ่นยนต์ตั้งแต่เริ่มต้นจนถึงการเขียนโปรแกรมควบคุมบอร์ดไมโครคอนโทรลเลอร์ ESP32",
      description: `คอร์สนี้จะพาทุกคนเข้าสู่โลกของหุ่นยนต์และการทำงานของ Embedded Systems โดยเริ่มตั้งแต่การทำความเข้าใจพื้นฐานไฟฟ้าและอิเล็กทรอนิกส์ การเขียนโปรแกรมควบคุม Arduino/ESP32 จนถึงการสร้างหุ่นยนต์เคลื่อนที่แบบสองล้อที่สมบูรณ์แบบ
      
      ### สิ่งที่คุณจะได้เรียนรู้จากคอร์สนี้:
      - พื้นฐานไฟฟ้า วงจรอนุกรม ขนาน และการใช้งาน Breadboard
      - การควบคุมบอร์ด ESP32 ด้วย Arduino IDE
      - การอ่านค่าเซ็นเซอร์ประเภทต่างๆ และการเขียน Logic เงื่อนไขควบคุม
      - การขับเคลื่อน DC Motor ด้วย L298N Motor Driver
      - การสร้างหุ่นยนต์หลบหลีกสิ่งกีดขวาง (Obstacle Avoidance Robot)
      
      ### เหมาะสำหรับใคร:
      - นักเรียน นักศึกษา หรือผู้เริ่มต้นเรียนรู้การสร้างหุ่นยนต์
      - เมกเกอร์ (Maker) ที่อยากต่อยอดไปเขียนโปรแกรมควบคุมฮาร์ดแวร์
      - ครูหรืออาจารย์ที่ต้องการใช้เป็นสื่อการสอนอิเล็กทรอนิกส์และโค้ดดิ้ง`,
      thumbnailUrl: "/media/robotics-course.jpg",
      platform: "local",
      price: 1590,
      published: true,
      createdAt: new Date("2026-05-01T08:00:00Z"),
      updatedAt: new Date("2026-06-01T08:00:00Z"),
    },
    {
      id: "course_2",
      title: "การพัฒนา IoT Application ด้วย ESP32 และ Node-RED",
      slug: "iot-development-esp32-node-red",
      summary: "สร้างระบบ Smart Home และบันทึกข้อมูลเซ็นเซอร์ขึ้น Cloud Dashboard ด้วย Node-RED และ MQTT Protocol",
      description: `เรียนรู้กระบวนการพัฒนาอุปกรณ์ Internet of Things (IoT) ตั้งแต่ต้นจนจบ พัฒนา Firmware บน ESP32 เพื่อส่งข้อมูลผ่าน MQTT Protocol และนำมาแสดงผลบน Dashboard ที่สร้างด้วย Node-RED ตลอดจนการเก็บข้อมูลย้อนหลังลงฐานข้อมูล
      
      ### สิ่งที่คุณจะได้เรียนรู้จากคอร์สนี้:
      - ความเข้าใจสถาปัตยกรรมของ IoT และการเชื่อมต่อเครือข่าย WiFi บน ESP32
      - การเชื่อมต่อและติดตั้ง MQTT Broker (e.g. HiveMQ, EMQX)
      - วิธีลงโปรแกรม Node-RED และสร้าง User Interface (UI) Dashboard อย่างรวดเร็ว
      - การอ่านค่าอุณหภูมิและความชื้นสัมพัทธ์จากเซ็นเซอร์ DHT22 และส่งข้อมูล Real-time
      - การทำ Automation สั่งเปิด/ปิดเครื่องใช้ไฟฟ้าผ่าน LINE Notify`,
      thumbnailUrl: "/media/iot-course.jpg",
      platform: "both",
      udemyUrl: "https://www.udemy.com/course/mock-iot-esp32-node-red/",
      price: 1290,
      published: true,
      createdAt: new Date("2026-05-10T08:00:00Z"),
      updatedAt: new Date("2026-06-02T08:00:00Z"),
    },
    {
      id: "course_3",
      title: "การออกแบบแผงวงจรพิมพ์ด้วย KiCad สำหรับผู้เริ่มต้น (KiCad PCB Design)",
      slug: "kicad-pcb-design-beginners",
      summary: "คอร์สสั้นเพื่อเรียนรู้วิธีการวาด Schematic และออกแบบแผ่น PCB 2 ชั้น ไปจนถึงการส่งผลิตที่โรงงานอย่างมืออาชีพ",
      description: `ออกแบบแผ่นวงจรพิมพ์ (PCB) ของคุณเองด้วยโปรแกรม Open-source ยอดนิยมอย่าง KiCad เรียนรู้วิธีวาด Schematic Diagrams, การจับคู่ Footprint, การลากเส้นลายทองแดง (Routing) การเทกราวด์ทองแดง (GND Pour) และขั้นตอนการตรวจสอบความถูกต้อง (DRC)
      
      ### สิ่งที่คุณจะได้เรียนรู้จากคอร์สนี้:
      - ติดตั้งโปรแกรม KiCad และการแนะนำส่วนติดต่อผู้ใช้งาน (UI)
      - การวาดผัง Schematic การเพิ่มสัญลักษณ์อุปกรณ์ (Symbols)
      - เชื่อมโยง Symbols เข้ากับ Footprints ทางกายภาพจริง
      - การจัดวางอุปกรณ์ลงแผ่นบอร์ดและการเดินลายทองแดง 2 ชั้น (Top/Bottom Copper Layers)
      - การส่งออกไฟล์การผลิต Gerber Files และ BOM (Bill of Materials)`,
      thumbnailUrl: "/media/kicad-course.jpg",
      platform: "udemy",
      udemyUrl: "https://www.udemy.com/course/mock-kicad-pcb-design/",
      price: 990,
      published: true,
      createdAt: new Date("2026-05-15T08:00:00Z"),
      updatedAt: new Date("2026-06-03T08:00:00Z"),
    }
  ])

  // Insert modules
  await db.insert(lmsModules).values([
    {
      id: "mod_1",
      courseId: "course_1",
      title: "Module 1: พื้นฐานอิเล็กทรอนิกส์และวงจรไฟฟ้า (Electronics Fundamentals)",
      description: "เรียนรู้เรื่องกระแสไฟ แรงดัน อุปกรณ์พื้นฐาน และการเชื่อมต่อวงจรอย่างปลอดภัย",
      order: 1,
    },
    {
      id: "mod_2",
      courseId: "course_1",
      title: "Module 2: บอร์ดสมองกลฝังตัวและการเขียนโค้ด (Microcontroller Coding)",
      description: "เจาะลึกบอร์ด ESP32 การติดตั้งเครื่องมือ และคำสั่งควบคุมขั้นต้น",
      order: 2,
    },
    {
      id: "mod_3",
      courseId: "course_1",
      title: "Module 3: โครงสร้างและการขับเคลื่อนหุ่นยนต์ (Robotics Control)",
      description: "สร้างและเขียนโปรแกรมควบคุมล้อหุ่นยนต์ให้วิ่งตามคำสั่ง",
      order: 3,
    },
    {
      id: "iot_mod_1",
      courseId: "course_2",
      title: "Module 1: แนะนำ IoT และโปรโตคอล MQTT",
      description: "ภาพรวมสถาปัตยกรรมอินเทอร์เน็ตของสรรพสิ่ง และรูปแบบการสื่อสาร Publish/Subscribe",
      order: 1,
    },
    {
      id: "iot_mod_2",
      courseId: "course_2",
      title: "Module 2: พัฒนาบอร์ด ESP32 เชื่อมต่อ MQTT",
      description: "เขียนภาษา C++ บน Arduino IDE เพื่อควบคุมเซ็นเซอร์และคุยกับ Broker",
      order: 2,
    }
  ])

  // Insert lessons
  await db.insert(lmsLessons).values([
    {
      id: "les_1",
      courseId: "course_1",
      moduleId: "mod_1",
      title: "1.1 ทำความรู้จักกับแรงดันไฟฟ้า กระแสไฟฟ้า และความต้านทาน",
      slug: "intro-to-voltage-current-resistance",
      type: "video",
      duration: 15,
      isFreePreview: true,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "แนะนำเรื่องไฟฟ้ากระแสตรง (DC) ตัวต้านทาน (Resistor) และกฎของโอห์ม (Ohm's Law)",
      order: 1,
    },
    {
      id: "les_2",
      courseId: "course_1",
      moduleId: "mod_1",
      title: "1.2 การต่อวงจรบน Breadboard และการอ่านค่าต้านทาน",
      slug: "breadboard-and-resistor-color-codes",
      type: "article",
      content: "เรียนรู้วิธีการทำวงจรขนานและวงจรอบุกรมผ่านการทดลองจริงโดยใช้ Breadboard และตัวต้านทาน 220 Ohm",
      isFreePreview: false,
      duration: 20,
      order: 2,
    },
    {
      id: "les_3",
      courseId: "course_1",
      moduleId: "mod_2",
      title: "2.1 แนะนำบอร์ด ESP32 และการตั้งค่า Arduino IDE",
      slug: "intro-to-esp32-arduino-ide",
      type: "video",
      duration: 25,
      isFreePreview: true,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "สอนการดาวน์โหลด ซอฟต์แวร์ Arduino IDE 2.x ติดตั้ง ESP32 Board Manager และเทคนิคการ Upload โค้ดลงบอร์ด",
      order: 1,
    },
    {
      id: "les_4",
      courseId: "course_1",
      moduleId: "mod_2",
      title: "2.2 การควบคุม Digital Input/Output และการอ่านปุ่มกด",
      slug: "digital-io-control-and-button-read",
      type: "video",
      duration: 30,
      isFreePreview: false,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "เรียนรู้คำสั่ง pinMode, digitalWrite และ digitalRead สำหรับปิด/เปิดไฟ LED และการรับค่าจากปุ่มกด",
      order: 2,
    },
    {
      id: "les_5",
      courseId: "course_1",
      moduleId: "mod_3",
      title: "3.1 หลักการทำงานของ DC Motor และ Motor Driver",
      slug: "dc-motor-and-motor-driver-l298n",
      type: "video",
      duration: 35,
      isFreePreview: false,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "อธิบายเรื่อง H-Bridge, สัญญาณ PWM สำหรับปรับความเร็วรอบมอเตอร์ และควบคุมมอเตอร์ซ้าย-ขวา",
      order: 1,
    },
    {
      id: "les_6",
      courseId: "course_1",
      moduleId: "mod_3",
      title: "3.2 ประกอบและทดสอบหุ่นยนต์หลบหลีกสิ่งกีดขวาง",
      slug: "assemble-obstacle-avoidance-robot",
      type: "assignment",
      duration: 45,
      isFreePreview: false,
      content: "โปรเจกต์ใหญ่ประจำคอร์ส: นำเซ็นเซอร์วัดระยะทางแบบอัลตร้าโซนิก (HC-SR04) มาติดบนหัวหุ่นยนต์ และเขียนโค้ดสั่งเลี้ยวหลบสิ่งกีดขวางโดยอัตโนมัติ",
      order: 2,
    },
    {
      id: "iot_les_1",
      courseId: "course_2",
      moduleId: "iot_mod_1",
      title: "1.1 พื้นฐาน IoT และหลักการทำงานของ MQTT Protocol",
      slug: "basics-of-mqtt-protocol",
      type: "video",
      duration: 20,
      isFreePreview: true,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "รู้จักความแตกต่างของ MQTT, HTTP และการใช้งาน Topics ย่อยในเครือข่าย",
      order: 1,
    },
    {
      id: "iot_les_2",
      courseId: "course_2",
      moduleId: "iot_mod_2",
      title: "2.1 เขียนโค้ด ESP32 เชื่อมต่อ WiFi และ HiveMQ Cloud",
      slug: "esp32-wifi-mqtt-connection",
      type: "video",
      duration: 30,
      isFreePreview: false,
      videoUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
      content: "สอนใช้งานไลบรารี PubSubClient และการจัดการกรณีเครือข่ายหลุดการเชื่อมต่อ",
      order: 1,
    }
  ])
}

export async function getCourses(): Promise<Course[]> {
  await seedMockCourses()

  const dbCourses = await db.query.lmsCourses.findMany({
    where: eq(lmsCourses.published, true),
    orderBy: (courses, { desc }) => [desc(courses.createdAt)],
  })

  return dbCourses.map((c) => ({
    id: c.id,
    title: c.title,
    slug: c.slug,
    summary: c.summary || "",
    description: c.description || "",
    thumbnailUrl: c.thumbnailUrl || "",
    platform: c.platform,
    udemyUrl: c.udemyUrl || undefined,
    price: c.price || 0,
    published: c.published,
    createdAt: c.createdAt.toISOString(),
    updatedAt: c.updatedAt.toISOString(),
  }))
}

export async function getCourseBySlug(slug: string): Promise<Course | null> {
  await seedMockCourses()

  const decodedSlug = decodeURIComponent(slug)

  const c = await db.query.lmsCourses.findFirst({
    where: eq(lmsCourses.slug, decodedSlug),
    with: {
      modules: {
        orderBy: (modules, { asc }) => [asc(modules.order)],
      },
      lessons: {
        orderBy: (lessons, { asc }) => [asc(lessons.order)],
      },
    },
  })

  if (!c || !c.published) {
    return null
  }

  return {
    id: c.id,
    title: c.title,
    slug: c.slug,
    summary: c.summary || "",
    description: c.description || "",
    thumbnailUrl: c.thumbnailUrl || "",
    platform: c.platform,
    udemyUrl: c.udemyUrl || undefined,
    price: c.price || 0,
    published: c.published,
    createdAt: c.createdAt.toISOString(),
    updatedAt: c.updatedAt.toISOString(),
    modules: c.modules.map((m) => ({
      id: m.id,
      title: m.title,
      description: m.description || undefined,
      order: m.order,
      lessons: c.lessons
        .filter((l) => l.moduleId === m.id)
        .map((l) => ({
          id: l.id,
          title: l.title,
          slug: l.slug,
          type: l.type,
          duration: l.duration || 0,
          isFreePreview: l.isFreePreview,
          videoUrl: l.videoUrl || undefined,
          content: l.content || undefined,
        })),
    })),
  }
}
