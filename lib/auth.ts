import { betterAuth } from "better-auth";
import { drizzleAdapter } from "@better-auth/drizzle-adapter";
import { db } from "@/db";

export const auth = betterAuth({
  database: drizzleAdapter(db, {
    provider: "pg",
  }),
  emailAndPassword: {
    enabled: true,
    // Set DISABLE_SIGNUP=true in your .env file to disable registrations
    disableSignUp: process.env.DISABLE_SIGNUP === "true",
  },
  user: {
    modelName: "auth_user",
  },
  session: {
    modelName: "auth_session",
  },
  account: {
    modelName: "auth_account",
  },
  verification: {
    modelName: "auth_verification",
  },
});
