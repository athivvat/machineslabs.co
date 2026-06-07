"use client";

import { useState } from "react";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Field, FieldGroup, FieldLabel } from "@/components/ui/field";
import { Input } from "@/components/ui/input";
import { authClient } from "@/lib/auth-client";
import { Loader2 } from "lucide-react";
import Link from "next/link";
import { toast } from "sonner";

export function RegisterForm({
  className,
  ...props
}: React.ComponentProps<"div">) {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const res = await authClient.signUp.email({
        email,
        password,
        name,
      });

      if (res.error) {
        toast.error(res.error.message || "Failed to create account.");
      } else {
        window.location.href = "/garage";
      }
    } catch (err: any) {
      toast.error(err?.message || "An unexpected error occurred.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <Card className={cn("border-white/10 bg-zinc-900/40 backdrop-blur-md shadow-2xl relative overflow-hidden", className)} {...props}>
      <div className="absolute top-0 left-0 right-0 h-[2px] bg-gradient-to-r from-transparent via-blaze-orange to-transparent" />
      <CardHeader className="text-center pt-6">
        <div className="flex justify-center mb-3">
          <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-blaze-orange/10 border border-blaze-orange/20 shadow-[0_0_20px_rgba(240,90,0,0.15)]">
            <span className="font-tiny5 text-3xl font-normal text-blaze-orange">M</span>
          </div>
        </div>
        <CardTitle className="text-xl font-bold tracking-tight">Create Garage Account</CardTitle>
        <CardDescription className="text-xs text-muted-foreground mt-1">
          Register a new administrator account below
        </CardDescription>
      </CardHeader>
      <CardContent className="pb-6">
        <form onSubmit={handleSubmit}>
          <FieldGroup>
            <Field>
              <FieldLabel htmlFor="name" className="text-xs text-zinc-400 font-medium">
                Full Name
              </FieldLabel>
              <Input
                id="name"
                type="text"
                placeholder="Athiwat Hirunworawongkun"
                required
                value={name}
                onChange={(e) => setName(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange focus-visible:border-blaze-orange focus-visible:ring-1"
              />
            </Field>
            <Field>
              <FieldLabel htmlFor="email" className="text-xs text-zinc-400 font-medium">
                Email
              </FieldLabel>
              <Input
                id="email"
                type="email"
                placeholder="admin@machineslabs.co"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange focus-visible:border-blaze-orange focus-visible:ring-1"
              />
            </Field>
            <Field>
              <FieldLabel htmlFor="password" className="text-xs text-zinc-400 font-medium">
                Password
              </FieldLabel>
              <Input
                id="password"
                type="password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="••••••••"
                className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange focus-visible:border-blaze-orange focus-visible:ring-1"
              />
            </Field>
            <Field className="pt-3">
              <Button
                type="submit"
                size="lg"
                className="w-full cursor-pointer bg-blaze-orange hover:bg-flame-orange text-white font-medium shadow-md shadow-blaze-orange/10 transition-colors duration-200"
                disabled={loading}
              >
                {loading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                Sign Up
              </Button>
            </Field>
            <div className="text-center text-xs text-muted-foreground mt-3">
              Already have an account?{" "}
              <Link href="/login" className="text-blaze-orange hover:underline font-medium">
                Login
              </Link>
            </div>
          </FieldGroup>
        </form>
      </CardContent>
    </Card>
  );
}
