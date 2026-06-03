import type { ReactNode } from "react";

export default function CategoryBadge({ children }: { children: ReactNode }) {
  return (
    <span className="inline-flex items-center border border-blaze-orange/40 bg-blaze-orange/10 px-2.5 py-1 font-mono text-[10px] font-medium uppercase tracking-widest text-blaze-orange">
      {children}
    </span>
  );
}
