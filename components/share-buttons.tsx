"use client";

import {
  EmailIcon,
  EmailShareButton,
  FacebookIcon,
  FacebookShareButton,
  LineIcon,
  LineShareButton,
  TelegramIcon,
  TelegramShareButton,
  TwitterIcon,
  TwitterShareButton,
} from "next-share";

export default function ShareButtons({ url, title }: { url: string; title: string }) {
  const size = 32;

  return (
    <div className="flex flex-wrap items-center gap-2">
      <FacebookShareButton url={url} quote={title}>
        <FacebookIcon size={size} round />
      </FacebookShareButton>
      <TwitterShareButton url={url} title={title}>
        <TwitterIcon size={size} round />
      </TwitterShareButton>
      <LineShareButton url={url} title={title}>
        <LineIcon size={size} round />
      </LineShareButton>
      <TelegramShareButton url={url} title={title}>
        <TelegramIcon size={size} round />
      </TelegramShareButton>
      <EmailShareButton url={url} subject={title} body={title}>
        <EmailIcon size={size} round />
      </EmailShareButton>
    </div>
  );
}
