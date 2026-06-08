import type { NextConfig } from "next";
import { withPayload } from "@payloadcms/next/withPayload";

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "*.r2.dev",
      },
    ],
    localPatterns: [
      {
        pathname: "/api/media/file/**",
      },
    ],
  },
};

export default withPayload(nextConfig);
