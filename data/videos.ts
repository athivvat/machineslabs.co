export interface VideoItem {
  id: string;
  title: string;
  youtubeUrl: string;
  youtubeId: string;
  channelName: string;
  channelUrl?: string;
  description?: string;
  duration?: string;
  publishedAt?: string;
  category?: string;
}

export const YOUTUBE_CHANNEL_URL = "https://www.youtube.com/@machineslabs";

export function getYoutubeThumbnail(youtubeId: string): string {
  // Use hqdefault for maximum reliability across all YouTube videos
  return `https://img.youtube.com/vi/${youtubeId}/hqdefault.jpg`;
}

export const videoCollectionData: VideoItem[] = [
  {
    id: "YLfieoATDqg",
    title: "แกะกล่อง QiDi Q2 เครื่องพิมพ์ 3D เกรดวัสดุวิศวกรรม ราคาคุ้มค่า",
    youtubeUrl: "https://youtu.be/YLfieoATDqg",
    youtubeId: "YLfieoATDqg",
    channelName: "Machines Labs",
    channelUrl: YOUTUBE_CHANNEL_URL,
    description: "แกะกล่อง QiDi Q2 เครื่องพิมพ์ 3D ที่ออกแบบมาสำหรับงานวัสดุวิศวกรรม ทั้ง ABS, ASA, Nylon, PC ไปจนถึง Carbon Fiber ในราคาที่คุ้มค่ากว่าเครื่องระดับเดียวกันครับ ",
    category: "Featured",
  }
];
