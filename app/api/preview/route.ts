import { draftMode } from "next/headers";
import { redirect } from "next/navigation";

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const slug = searchParams.get("slug");
  const collection = searchParams.get("collection") || "posts";

  if (!slug) {
    return new Response("Missing slug", { status: 400 });
  }

  // Enable Draft Mode by setting the cookies
  const draft = await draftMode();
  draft.enable();

  // Redirect to the target page
  if (collection === "projects") {
    redirect(`/projects/${slug}`);
  } else {
    redirect(`/articles/${slug}`);
  }
}
