import { LoginForm } from "@/components/login-form"
import { auth } from "@/lib/auth"
import { headers } from "next/headers"
import { redirect } from "next/navigation"

export default async function Page() {
  const session = await auth.api.getSession({
    headers: await headers(),
  })

  if (session) {
    redirect("/garage")
  }

  return (
    <div className="relative flex min-h-svh w-full items-center justify-center overflow-hidden bg-black p-6 md:p-10">
      {/* Background Grid Pattern */}
      <div className="absolute inset-0 bg-[linear-gradient(to_right,#1f2937_1px,transparent_1px),linear-gradient(to_bottom,#1f2937_1px,transparent_1px)] bg-[size:4rem_4rem] opacity-20 [mask-image:radial-gradient(ellipse_60%_50%_at_50%_50%,#000_70%,transparent_100%)]" />

      {/* Decorative Radial Glows */}
      <div className="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[500px] h-[500px] bg-blaze-orange/10 rounded-full blur-[120px] pointer-events-none -z-10" />
      <div className="absolute bottom-0 right-1/4 w-[300px] h-[300px] bg-zinc-800/20 rounded-full blur-[80px] pointer-events-none -z-10" />

      <div className="relative w-full max-w-sm z-10 animate-fade-in">
        <LoginForm />
      </div>
    </div>
  )
}
