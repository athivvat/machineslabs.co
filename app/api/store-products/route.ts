import { NextResponse } from "next/server";
import { db } from "@/db";
import { storeProduct } from "@/db/schema/store";

export const dynamic = "force-dynamic";

export async function GET() {
  try {
    const products = await db
      .select({
        id: storeProduct.id,
        name: storeProduct.name,
      })
      .from(storeProduct)
      .orderBy(storeProduct.name);

    return NextResponse.json(products);
  } catch (error) {
    console.error("Failed to fetch store products:", error);
    return NextResponse.json({ error: "Internal Server Error" }, { status: 500 });
  }
}
