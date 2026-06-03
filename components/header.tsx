"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import Logo from "@/components/logo";
import { ShoppingBagIcon } from "lucide-react";

const navLinks = [
  { label: "บทความ", href: "/articles" },
  { label: "โปรเจกต์", href: "/projects" },
  { label: "คอร์ส", href: "/school" },
  { label: "เกี่ยวกับ", href: "/about" },
];

export default function Header() {
  const [isOpen, setIsOpen] = useState(false);
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    const onScroll = () => {
      const scrolled = window.scrollY;
      const total = document.documentElement.scrollHeight - window.innerHeight;
      setProgress(total > 0 ? (scrolled / total) * 100 : 0);
    };
    onScroll();
    window.addEventListener("scroll", onScroll);
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  useEffect(() => {
    document.body.style.overflow = isOpen ? "hidden" : "";
    return () => {
      document.body.style.overflow = "";
    };
  }, [isOpen]);

  return (
    <>
      <header className="fixed top-0 left-0 right-0 z-50 bg-black text-white">
        <div className="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3 no-underline group">
            <Logo />
          </Link>

          {/* Desktop nav: full height, left/right borders only */}
          <nav className="hidden md:flex h-16 items-stretch border-x border-white/15 divide-x divide-white/15">
            {navLinks.map(({ label, href }) => (
              <Link
                key={href}
                href={href}
                className="flex items-center px-5 text-gray-400 hover:text-white hover:bg-white/5 transition-all duration-200 no-underline"
              >
                {label}
              </Link>
            ))}
            <Link
              href="/store"
              className="flex items-center gap-2 px-5 text-blaze-orange hover:text-white hover:bg-blaze-orange transition-all duration-200 no-underline"
            >
              <ShoppingBagIcon size={16} />
              ร้านค้า
            </Link>
          </nav>

          {/* Hamburger (mobile only) */}
          <button
            onClick={() => setIsOpen((v) => !v)}
            className="md:hidden flex flex-col gap-1.25 justify-center items-center w-10 h-10 cursor-pointer bg-white/5 border border-white/20 hover:border-blaze-orange hover:bg-white/10 transition-colors duration-200"
            aria-label="Toggle menu"
            aria-expanded={isOpen}
            aria-controls="mobile-menu"
          >
            <span
              className="block w-5 h-px bg-white transition-all duration-300 origin-center"
              style={isOpen ? { transform: "translateY(6px) rotate(45deg)" } : undefined}
            />
            <span
              className="block w-5 h-px bg-white transition-all duration-300 origin-center"
              style={isOpen ? { opacity: 0 } : undefined}
            />
            <span
              className="block h-px bg-blaze-orange transition-all duration-300 origin-center"
              style={
                isOpen
                  ? { width: "1.25rem", backgroundColor: "white", transform: "translateY(-6px) rotate(-45deg)" }
                  : { width: "0.75rem" }
              }
            />
          </button>
        </div>

        {/* Scroll progress line */}
        <div className="h-px bg-white/20 relative">
          <div
            className="absolute left-0 top-0 h-full bg-blaze-orange"
            style={{ width: `${progress}%` }}
          />
        </div>
      </header>

      {/* Mobile menu */}
      <div
        id="mobile-menu"
        className={`fixed inset-0 z-40 bg-black flex flex-col justify-between pt-24 pb-12 px-6 transition-opacity duration-300 ${
          isOpen ? "opacity-100" : "opacity-0 pointer-events-none"
        }`}
        aria-hidden={!isOpen}
      >
        <div
          className="absolute inset-0 opacity-[0.03]"
          style={{
            backgroundImage:
              "linear-gradient(#fff 1px, transparent 1px), linear-gradient(90deg, #fff 1px, transparent 1px)",
            backgroundSize: "60px 60px",
          }}
        />

        <nav className="relative z-10">
          <ul className="list-none m-0 p-0 flex flex-col gap-2">
            {navLinks.map(({ label, href }, i) => (
              <li key={href} className="overflow-hidden border-b border-white/20">
                <Link
                  href={href}
                  onClick={() => setIsOpen(false)}
                  className="flex items-center gap-4 py-5 text-4xl font-sans font-semibold text-white hover:text-blaze-orange no-underline transition-all duration-300"
                  style={{
                    transform: isOpen ? "translateY(0)" : "translateY(100%)",
                    opacity: isOpen ? 1 : 0,
                    transitionDelay: `${isOpen ? i * 60 : 0}ms`,
                  }}
                >
                  <span className="text-xs font-mono text-gray-600 w-6">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  {label}
                </Link>
              </li>
            ))}
          </ul>
          <div className="mt-8 flex flex-col gap-4">
            <div className="overflow-hidden">
              <Link
                href="/store"
                onClick={() => setIsOpen(false)}
                className="flex items-center justify-center gap-3 w-full text-sm font-mono tracking-[0.15em] uppercase px-6 py-4 border border-blaze-orange text-blaze-orange hover:bg-blaze-orange hover:text-black transition-all duration-300 no-underline"
                style={{
                  transform: isOpen ? "translateY(0)" : "translateY(100%)",
                  opacity: isOpen ? 1 : 0,
                  transitionDelay: `${isOpen ? 200 : 0}ms`,
                }}
              >
                <svg
                  width="16"
                  height="16"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                >
                  <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z" />
                  <line x1="3" y1="6" x2="21" y2="6" />
                  <path d="M16 10a4 4 0 0 1-8 0" />
                </svg>
                ร้านค้า
              </Link>
            </div>
          </div>
        </nav>

        <div className="relative z-10 flex items-center gap-3">
          <span className="block w-2 h-2 rounded-full bg-blaze-orange animate-pulse" />
          <span className="text-xs font-mono text-gray-500 tracking-widest uppercase">
            System online
          </span>
        </div>
      </div>
    </>
  );
}
