import { draftMode } from "next/headers";

export default async function PreviewBanner() {
  const draft = await draftMode();

  if (!draft.isEnabled) return null;

  return (
    <div className="fixed bottom-0 left-0 right-0 z-50 bg-blaze-orange text-white text-xs font-mono py-3 px-6 flex items-center justify-between">
      <div className="flex items-center gap-2">
        <span className="relative flex h-2 w-2">
          <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-white opacity-75"></span>
          <span className="relative inline-flex rounded-full h-2 w-2 bg-white"></span>
        </span>
        <span className="font-bold tracking-wider uppercase">Preview Mode Active</span>
      </div>
      <a
        href="/api/preview/disable"
        className="bg-white/10 hover:bg-white/20 border border-white/20 rounded px-3 py-1 font-semibold transition duration-200"
      >
        Exit Preview
      </a>
    </div>
  );
}
