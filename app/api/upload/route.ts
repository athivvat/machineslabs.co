import { NextRequest, NextResponse } from "next/server"
import { auth } from "@/lib/auth"
import { headers } from "next/headers"
import { S3Client, PutObjectCommand } from "@aws-sdk/client-s3"
import path from "path"
import fs from "fs/promises"

export const dynamic = "force-dynamic"

export async function POST(request: NextRequest) {
  // 1. Authenticate user
  const session = await auth.api.getSession({
    headers: await headers(),
  })

  if (!session) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 })
  }

  try {
    // 2. Parse FormData
    const formData = await request.formData()
    const file = formData.get("file") as File | null
    if (!file) {
      return NextResponse.json({ error: "No file uploaded" }, { status: 400 })
    }

    const bytes = await file.arrayBuffer()
    const buffer = Buffer.from(bytes)

    // 3. Generate unique safe filename
    const originalName = file.name
    const ext = path.extname(originalName) || ".jpg"
    const randomName = `${Date.now()}_${Math.random().toString(36).substring(2, 9)}${ext}`

    const useR2 = process.env.NODE_ENV === "production" || process.env.USE_R2 === "true"

    if (useR2) {
      // 4. Cloudflare R2 Upload
      const s3 = new S3Client({
        region: "auto",
        endpoint: process.env.S3_ENDPOINT || "",
        credentials: {
          accessKeyId: process.env.S3_ACCESS_KEY_ID || "",
          secretAccessKey: process.env.S3_SECRET_ACCESS_KEY || "",
        },
      })

      const key = `uploads/assets/${randomName}`
      await s3.send(
        new PutObjectCommand({
          Bucket: process.env.S3_BUCKET || "",
          Key: key,
          Body: buffer,
          ContentType: file.type || "image/jpeg",
        })
      )

      // Use custom domain / public R2 URL if configured, otherwise fallback to parsing endpoint
      let fileUrl = ""
      if (process.env.NEXT_PUBLIC_R2_PUBLIC_URL) {
        const publicBase = process.env.NEXT_PUBLIC_R2_PUBLIC_URL.replace(/\/$/, "")
        fileUrl = `${publicBase}/${key}`
      } else {
        const endpoint = process.env.S3_ENDPOINT || ""
        const match = endpoint.match(/https:\/\/([^.]+)\.r2\.cloudflarestorage\.com/)
        const accountId = match ? match[1] : ""
        fileUrl = `https://pub-${accountId}.r2.dev/${key}`
      }
      return NextResponse.json({ url: fileUrl })
    } else {
      // 5. Local Storage (/public/uploads/assets)
      const uploadDir = path.join(process.cwd(), "public", "uploads", "assets")
      await fs.mkdir(uploadDir, { recursive: true })
      
      const filePath = path.join(uploadDir, randomName)
      await fs.writeFile(filePath, buffer)
      
      const fileUrl = `/uploads/assets/${randomName}`
      return NextResponse.json({ url: fileUrl })
    }
  } catch (err) {
    const error = err as Error
    return NextResponse.json({ error: error.message || "Upload failed" }, { status: 500 })
  }
}
