"use client";

import { useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";
import { toast } from "sonner";
import {
  Plus,
  Search,
  Trash2,
  Edit2,
  ExternalLink,
  Eye,
  EyeOff,
  BookOpen,
  Coins,
  Loader2,
  CheckCircle,
  Layers,
  Globe,
  Sparkles,
  Calendar,
} from "lucide-react";

import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetFooter,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  togglePublish,
  deleteCourse,
  createCourse,
} from "../actions";

interface DbCourse {
  id: string;
  title: string;
  slug: string;
  summary: string | null;
  description: string | null;
  thumbnailUrl: string | null;
  platform: "local" | "udemy" | "both";
  udemyUrl: string | null;
  price: number | null;
  published: boolean;
  comingSoon: boolean;
  intendedLearners: string[] | null;
  learningObjectives: string[] | null;
  requirements: string[] | null;
  createdAt: Date;
  updatedAt: Date;
}

interface CoursesClientProps {
  initialCourses: DbCourse[];
}

export function CoursesClient({ initialCourses }: CoursesClientProps) {
  const router = useRouter();
  const [searchTerm, setSearchTerm] = useState("");
  const [platformFilter, setPlatformFilter] = useState<string>("all");
  const [statusFilter, setStatusFilter] = useState<string>("all");
  const [isPending, startTransition] = useTransition();

  // Sheet states
  const [isCreateOpen, setIsCreateOpen] = useState(false);

  // Form states
  const [formTitle, setFormTitle] = useState("");
  const [formSlug, setFormSlug] = useState("");
  const [formSummary, setFormSummary] = useState("");
  const [formDescription, setFormDescription] = useState("");
  const [formThumbnailUrl, setFormThumbnailUrl] = useState("");
  const [formPlatform, setFormPlatform] = useState<"local" | "udemy" | "both">(
    "local",
  );
  const [formUdemyUrl, setFormUdemyUrl] = useState("");
  const [formPrice, setFormPrice] = useState("");
  const [formPublished, setFormPublished] = useState(false);
  const [formComingSoon, setFormComingSoon] = useState(false);
  const [formIntendedLearners, setFormIntendedLearners] = useState<string[]>([]);
  const [formLearningObjectives, setFormLearningObjectives] = useState<string[]>([]);
  const [formRequirements, setFormRequirements] = useState<string[]>([]);

  const handleAddRequirement = () => {
    setFormRequirements([...formRequirements, ""]);
  };

  const handleUpdateRequirement = (index: number, value: string) => {
    const newRequirements = [...formRequirements];
    newRequirements[index] = value;
    setFormRequirements(newRequirements);
  };

  const handleRemoveRequirement = (index: number) => {
    const newRequirements = formRequirements.filter((_, i) => i !== index);
    setFormRequirements(newRequirements);
  };

  const handleAddLearningObjective = () => {
    setFormLearningObjectives([...formLearningObjectives, ""]);
  };

  const handleUpdateLearningObjective = (index: number, value: string) => {
    const newObjectives = [...formLearningObjectives];
    newObjectives[index] = value;
    setFormLearningObjectives(newObjectives);
  };

  const handleRemoveLearningObjective = (index: number) => {
    const newObjectives = formLearningObjectives.filter((_, i) => i !== index);
    setFormLearningObjectives(newObjectives);
  };

  const handleAddIntendedLearner = () => {
    setFormIntendedLearners([...formIntendedLearners, ""]);
  };

  const handleUpdateIntendedLearner = (index: number, value: string) => {
    const newLearners = [...formIntendedLearners];
    newLearners[index] = value;
    setFormIntendedLearners(newLearners);
  };

  const handleRemoveIntendedLearner = (index: number) => {
    const newLearners = formIntendedLearners.filter((_, i) => i !== index);
    setFormIntendedLearners(newLearners);
  };

  // Upload state
  const [isUploading, setIsUploading] = useState(false);

  const handleImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    setIsUploading(true);
    const formData = new FormData();
    formData.append("file", file);

    try {
      const res = await fetch("/api/upload", {
        method: "POST",
        body: formData,
      });

      if (!res.ok) {
        const data = await res.json();
        throw new Error(data.error || "Upload failed");
      }

      const data = await res.json();
      setFormThumbnailUrl(data.url);
      toast.success("Image uploaded successfully!");
    } catch (err) {
      const error = err as Error;
      toast.error(error.message || "Failed to upload image");
    } finally {
      setIsUploading(false);
    }
  };
  // Auto-slugify helper
  const slugify = (text: string) => {
    return text
      .toLowerCase()
      .replace(/[^\u0E00-\u0E7F\w\s-]/g, "") // Allow Thai characters and normal word characters
      .replace(/[\s_-]+/g, "-")
      .replace(/^-+|-+$/g, "");
  };

  // Handle Title change to auto-fill Slug (only if slug was empty or matches previous slugified title)
  const handleTitleChange = (val: string, isEdit: boolean) => {
    setFormTitle(val);
    if (!isEdit) {
      setFormSlug(slugify(val));
    }
  };

  const handleOpenCreate = () => {
    setFormTitle("");
    setFormSlug("");
    setFormSummary("");
    setFormDescription("");
    setFormThumbnailUrl("");
    setFormPlatform("local");
    setFormUdemyUrl("");
    setFormPrice("0");
    setFormPublished(false);
    setFormComingSoon(false);
    setFormIntendedLearners([]);
    setFormLearningObjectives([]);
    setFormRequirements([]);
    setIsCreateOpen(true);
  };

  // Action handlers
  const handleTogglePublish = (id: string, currentStatus: boolean) => {
    startTransition(async () => {
      try {
        await togglePublish(id, !currentStatus);
        toast.success(
          `Course ${!currentStatus ? "published" : "set to draft"} successfully!`,
        );
        router.refresh();
      } catch (err) {
        const error = err as Error;
        toast.error(error.message || "Failed to update course status");
      }
    });
  };

  const handleDeleteCourse = (id: string, title: string) => {
    if (!confirm(`Are you sure you want to delete "${title}"?`)) return;

    startTransition(async () => {
      try {
        await deleteCourse(id);
        toast.success("Course deleted successfully!");
        router.refresh();
      } catch (err) {
        const error = err as Error;
        toast.error(error.message || "Failed to delete course");
      }
    });
  };

  const handleCreateSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!formTitle || !formSlug) {
      toast.error("Title and Slug are required");
      return;
    }

    startTransition(async () => {
      try {
        const id = `course_${Math.random().toString(36).substring(2, 9)}`;
        await createCourse({
          id,
          title: formTitle,
          slug: formSlug,
          summary: formSummary || undefined,
          description: formDescription || undefined,
          thumbnailUrl: formThumbnailUrl || undefined,
          platform: formPlatform,
          udemyUrl: formPlatform !== "local" ? formUdemyUrl : undefined,
          price: formPrice ? parseInt(formPrice, 10) : 0,
          published: formPublished,
          comingSoon: formComingSoon,
          intendedLearners: formIntendedLearners.filter(val => val.trim() !== ""),
          learningObjectives: formLearningObjectives.filter(val => val.trim() !== ""),
          requirements: formRequirements.filter(val => val.trim() !== ""),
        });
        toast.success("Course created successfully!");
        setIsCreateOpen(false);
        router.refresh();
      } catch (err) {
        const error = err as Error;
        toast.error(error.message || "Failed to create course");
      }
    });
  };

  // Filtering logic
  const filteredCourses = initialCourses.filter((course) => {
    const matchesSearch =
      course.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      course.slug.toLowerCase().includes(searchTerm.toLowerCase());

    const matchesPlatform =
      platformFilter === "all" || course.platform === platformFilter;

    const matchesStatus =
      statusFilter === "all" ||
      (statusFilter === "published" && course.published) ||
      (statusFilter === "draft" && !course.published);

    return matchesSearch && matchesPlatform && matchesStatus;
  });

  // Metrics calculations
  const totalCourses = initialCourses.length;
  const publishedCourses = initialCourses.filter((c) => c.published).length;
  const localCourses = initialCourses.filter(
    (c) => c.platform === "local" || c.platform === "both",
  ).length;
  const udemyCourses = initialCourses.filter(
    (c) => c.platform === "udemy" || c.platform === "both",
  ).length;

  return (
    <div className="flex flex-col gap-6">
      {/* Page Header */}
      <div className="flex flex-col gap-2 md:flex-row md:items-center md:justify-between">
        <div>
          <h2 className="text-3xl font-bold tracking-tight text-white">
            Machines School Management
          </h2>
          <p className="text-muted-foreground text-sm">
            Manage your local and Udemy course catalog, adjust pricing, and
            toggle publish status.
          </p>
        </div>
        <Button
          onClick={handleOpenCreate}
          className="bg-blaze-orange hover:bg-flame-orange text-white font-medium shadow-lg hover:shadow-blaze-orange/20 transition-all duration-200"
        >
          <Plus className="mr-2 h-4 w-4" /> Create Course
        </Button>
      </div>

      {/* Analytics Cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {/* Card 1 */}
        <div className="relative overflow-hidden rounded-xl border border-white/5 bg-white/[0.02] p-5 shadow-xs transition-all hover:bg-white/[0.04]">
          <div className="flex items-center justify-between">
            <span className="text-xs font-mono font-medium text-muted-foreground uppercase tracking-wider">
              Total Courses
            </span>
            <div className="rounded-lg bg-blaze-orange/10 p-2 text-blaze-orange">
              <BookOpen className="h-5 w-5" />
            </div>
          </div>
          <div className="mt-4 flex items-baseline gap-2">
            <span className="text-3xl font-bold tracking-tight text-white">
              {totalCourses}
            </span>
            <span className="text-xs text-muted-foreground">
              courses cataloged
            </span>
          </div>
        </div>

        {/* Card 2 */}
        <div className="relative overflow-hidden rounded-xl border border-white/5 bg-white/[0.02] p-5 shadow-xs transition-all hover:bg-white/[0.04]">
          <div className="flex items-center justify-between">
            <span className="text-xs font-mono font-medium text-muted-foreground uppercase tracking-wider">
              Published
            </span>
            <div className="rounded-lg bg-emerald-500/10 p-2 text-emerald-400">
              <CheckCircle className="h-5 w-5" />
            </div>
          </div>
          <div className="mt-4 flex items-baseline gap-2">
            <span className="text-3xl font-bold tracking-tight text-white">
              {publishedCourses}
            </span>
            <span className="text-xs text-muted-foreground">
              {totalCourses > 0
                ? Math.round((publishedCourses / totalCourses) * 100)
                : 0}
              % of total
            </span>
          </div>
        </div>

        {/* Card 3 */}
        <div className="relative overflow-hidden rounded-xl border border-white/5 bg-white/[0.02] p-5 shadow-xs transition-all hover:bg-white/[0.04]">
          <div className="flex items-center justify-between">
            <span className="text-xs font-mono font-medium text-muted-foreground uppercase tracking-wider">
              Local Platform
            </span>
            <div className="rounded-lg bg-indigo-500/10 p-2 text-indigo-400">
              <Layers className="h-5 w-5" />
            </div>
          </div>
          <div className="mt-4 flex items-baseline gap-2">
            <span className="text-3xl font-bold tracking-tight text-white">
              {localCourses}
            </span>
            <span className="text-xs text-muted-foreground">
              hosted on Machines Labs
            </span>
          </div>
        </div>

        {/* Card 4 */}
        <div className="relative overflow-hidden rounded-xl border border-white/5 bg-white/[0.02] p-5 shadow-xs transition-all hover:bg-white/[0.04]">
          <div className="flex items-center justify-between">
            <span className="text-xs font-mono font-medium text-muted-foreground uppercase tracking-wider">
              Udemy Platform
            </span>
            <div className="rounded-lg bg-amber-500/10 p-2 text-amber-400">
              <Globe className="h-5 w-5" />
            </div>
          </div>
          <div className="mt-4 flex items-baseline gap-2">
            <span className="text-3xl font-bold tracking-tight text-white">
              {udemyCourses}
            </span>
            <span className="text-xs text-muted-foreground">
              Udemy references
            </span>
          </div>
        </div>
      </div>

      {/* Controls Bar */}
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between bg-white/[0.01] border border-white/5 p-4 rounded-xl">
        <div className="relative flex-1 max-w-sm">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            placeholder="Search by title or slug..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="pl-9 bg-white/[0.02] border-white/10 text-white placeholder:text-muted-foreground focus-visible:ring-blaze-orange focus-visible:border-blaze-orange"
          />
        </div>
        <div className="flex flex-wrap items-center gap-3">
          <div className="flex items-center gap-2">
            <Label className="text-xs font-medium text-muted-foreground">
              Platform
            </Label>
            <Select value={platformFilter} onValueChange={setPlatformFilter}>
              <SelectTrigger className="w-[140px] bg-white/[0.02] border-white/10 text-white">
                <SelectValue placeholder="All Platforms" />
              </SelectTrigger>
              <SelectContent className="bg-zinc-950 border-white/10 text-white">
                <SelectItem value="all">All Platforms</SelectItem>
                <SelectItem value="local">Local LMS</SelectItem>
                <SelectItem value="udemy">Udemy</SelectItem>
                <SelectItem value="both">Both</SelectItem>
              </SelectContent>
            </Select>
          </div>
          <div className="flex items-center gap-2">
            <Label className="text-xs font-medium text-muted-foreground">
              Status
            </Label>
            <Select value={statusFilter} onValueChange={setStatusFilter}>
              <SelectTrigger className="w-[140px] bg-white/[0.02] border-white/10 text-white">
                <SelectValue placeholder="All Status" />
              </SelectTrigger>
              <SelectContent className="bg-zinc-950 border-white/10 text-white">
                <SelectItem value="all">All Status</SelectItem>
                <SelectItem value="published">Published</SelectItem>
                <SelectItem value="draft">Draft</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>
      </div>

      {/* Courses Table */}
      <div className="rounded-xl border border-white/5 bg-white/[0.01] overflow-hidden">
        {filteredCourses.length === 0 ? (
          <div className="flex flex-col items-center justify-center py-12 text-center">
            <BookOpen className="h-10 w-10 text-muted-foreground/30 mb-3 animate-pulse" />
            <p className="text-muted-foreground text-sm font-medium">
              No courses found matching the filters.
            </p>
            <Button
              variant="link"
              onClick={() => {
                setSearchTerm("");
                setPlatformFilter("all");
                setStatusFilter("all");
              }}
              className="text-blaze-orange text-xs mt-1"
            >
              Reset Filters
            </Button>
          </div>
        ) : (
          <Table>
            <TableHeader className="bg-white/[0.02] border-b border-white/5">
              <TableRow className="border-b border-white/5 hover:bg-transparent">
                <TableHead className="text-white font-semibold">
                  Course Detail
                </TableHead>
                <TableHead className="text-white font-semibold w-[120px]">
                  Platform
                </TableHead>
                <TableHead className="text-white font-semibold w-[120px]">
                  Price (Baht)
                </TableHead>
                <TableHead className="text-white font-semibold w-[100px]">
                  Status
                </TableHead>
                <TableHead className="text-white font-semibold w-[150px]">
                  Last Updated
                </TableHead>
                <TableHead className="text-white font-semibold text-right w-[150px]">
                  Actions
                </TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filteredCourses.map((course) => (
                <TableRow
                  key={course.id}
                  className="border-b border-white/5 hover:bg-white/[0.02] transition-colors duration-150"
                >
                  <TableCell className="align-top py-4">
                    <div className="flex flex-col gap-1">
                      <span className="font-semibold text-white text-base leading-tight">
                        {course.title}
                      </span>
                      <span className="text-xs font-mono text-muted-foreground flex items-center gap-1">
                        ID: {course.id} <span className="text-white/20">|</span>{" "}
                        Slug: {course.slug}
                      </span>
                      {course.summary && (
                        <p className="text-xs text-muted-foreground line-clamp-1 mt-1 max-w-[450px]">
                          {course.summary}
                        </p>
                      )}
                    </div>
                  </TableCell>
                  <TableCell className="align-top py-4">
                    <div className="mt-1">
                      {course.platform === "local" && (
                        <Badge className="bg-indigo-500/10 text-indigo-400 border border-indigo-500/20 hover:bg-indigo-500/10">
                          Local LMS
                        </Badge>
                      )}
                      {course.platform === "udemy" && (
                        <Badge className="bg-amber-500/10 text-amber-400 border border-amber-500/20 hover:bg-amber-500/10">
                          Udemy
                        </Badge>
                      )}
                      {course.platform === "both" && (
                        <Badge className="bg-teal-500/10 text-teal-400 border border-teal-500/20 hover:bg-teal-500/10">
                          Both
                        </Badge>
                      )}
                    </div>
                  </TableCell>
                  <TableCell className="align-top py-4 font-mono font-medium text-white">
                    <div className="mt-1 flex items-center gap-1">
                      <Coins className="h-3.5 w-3.5 text-muted-foreground" />
                      {course.price && course.price > 0
                        ? `฿${course.price.toLocaleString()}`
                        : "Free"}
                    </div>
                  </TableCell>
                  <TableCell className="align-top py-4">
                    <div className="mt-0.5">
                      <Button
                        variant="ghost"
                        size="sm"
                        disabled={isPending}
                        onClick={() =>
                          handleTogglePublish(course.id, course.published)
                        }
                        className={`h-7 px-2 text-xs font-semibold rounded-md border ${
                          course.published
                            ? "bg-emerald-500/10 text-emerald-400 border-emerald-500/20 hover:bg-emerald-500/20 hover:text-emerald-300"
                            : "bg-zinc-800 text-zinc-400 border-zinc-700 hover:bg-zinc-700 hover:text-zinc-300"
                        }`}
                      >
                        {course.published ? (
                          <>
                            <Eye className="mr-1 h-3 w-3" /> Published
                          </>
                        ) : (
                          <>
                            <EyeOff className="mr-1 h-3 w-3" /> Draft
                          </>
                        )}
                      </Button>
                    </div>
                  </TableCell>
                  <TableCell className="align-top py-4 text-xs font-mono text-muted-foreground">
                    <div className="mt-1 flex items-center gap-1.5">
                      <Calendar className="h-3.5 w-3.5" />
                      {new Date(course.updatedAt).toLocaleDateString("en-US", {
                        month: "short",
                        day: "numeric",
                        year: "numeric",
                      })}
                    </div>
                  </TableCell>
                  <TableCell className="align-top py-4 text-right">
                    <div className="flex items-center justify-end gap-1.5 mt-0.5">
                      {course.udemyUrl && (
                        <Button
                          asChild
                          variant="ghost"
                          size="icon"
                          className="h-8 w-8 text-muted-foreground hover:text-white hover:bg-white/5"
                        >
                          <a
                            href={course.udemyUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                          >
                            <ExternalLink className="h-4 w-4" />
                          </a>
                        </Button>
                      )}
                      <Button
                        asChild
                        variant="ghost"
                        size="icon"
                        className="h-8 w-8 text-indigo-400 hover:text-indigo-300 hover:bg-indigo-500/10"
                      >
                        <Link href={`/garage/courses/${course.id}`}>
                          <Edit2 className="h-4 w-4" />
                        </Link>
                      </Button>
                      <Button
                        variant="ghost"
                        size="icon"
                        disabled={isPending}
                        onClick={() =>
                          handleDeleteCourse(course.id, course.title)
                        }
                        className="h-8 w-8 text-rose-400 hover:text-rose-300 hover:bg-rose-500/10"
                      >
                        <Trash2 className="h-4 w-4" />
                      </Button>
                    </div>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </div>

      {/* Sheets (Create / Edit Drawers) */}
      {/* Create Course Sheet */}
      <Sheet open={isCreateOpen} onOpenChange={setIsCreateOpen}>
        <SheetContent className="bg-zinc-950 border-white/5 text-white w-full sm:max-w-lg overflow-y-auto max-h-screen p-6">
          <SheetHeader className="pb-4 border-b border-white/5">
            <SheetTitle className="text-xl font-bold text-white flex items-center gap-2">
              <Sparkles className="h-5 w-5 text-blaze-orange" /> Create New
              Course
            </SheetTitle>
            <SheetDescription className="text-muted-foreground text-sm">
              Add a new course to your curriculum catalog.
            </SheetDescription>
          </SheetHeader>
          <form onSubmit={handleCreateSubmit} className="space-y-5 py-5">
            <div className="space-y-2">
              <Label
                htmlFor="title"
                className="text-sm font-semibold text-white"
              >
                Course Title
              </Label>
              <Input
                id="title"
                placeholder="E.g., Intro to Microcontrollers"
                value={formTitle}
                onChange={(e) => handleTitleChange(e.target.value, false)}
                className="bg-white/[0.02] border-white/10 text-white "
                required
              />
            </div>

            <div className="space-y-2">
              <Label
                htmlFor="slug"
                className="text-sm font-semibold text-white"
              >
                Slug (URL identifier)
              </Label>
              <Input
                id="slug"
                placeholder="E.g., intro-to-microcontrollers"
                value={formSlug}
                onChange={(e) => setFormSlug(slugify(e.target.value))}
                className="bg-white/[0.02] border-white/10 text-white"
                required
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label
                  htmlFor="platform"
                  className="text-sm font-semibold text-white"
                >
                  Hosting Platform
                </Label>
                <Select
                  value={formPlatform}
                  onValueChange={(val: "local" | "udemy" | "both") =>
                    setFormPlatform(val)
                  }
                >
                  <SelectTrigger
                    id="platform"
                    className="bg-white/[0.02] border-white/10 text-white"
                  >
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent className="bg-zinc-950 border-white/10 text-white">
                    <SelectItem value="local">Local LMS</SelectItem>
                    <SelectItem value="udemy">Udemy</SelectItem>
                    <SelectItem value="both">Both</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <Label
                  htmlFor="price"
                  className="text-sm font-semibold text-white"
                >
                  Price (Baht)
                </Label>
                <Input
                  id="price"
                  type="number"
                  placeholder="0"
                  value={formPrice}
                  onChange={(e) => setFormPrice(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white"
                  min="0"
                />
              </div>
            </div>

            {(formPlatform === "udemy" || formPlatform === "both") && (
              <div className="space-y-2 animate-in fade-in slide-in-from-top-1 duration-150">
                <Label
                  htmlFor="udemyUrl"
                  className="text-sm font-semibold text-white"
                >
                  Udemy URL
                </Label>
                <Input
                  id="udemyUrl"
                  type="url"
                  placeholder="https://www.udemy.com/course/..."
                  value={formUdemyUrl}
                  onChange={(e) => setFormUdemyUrl(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white"
                  required
                />
              </div>
            )}

            <div className="space-y-2">
              <Label
                htmlFor="summary"
                className="text-sm font-semibold text-white"
              >
                Summary
              </Label>
              <Input
                id="summary"
                placeholder="A brief 1-sentence teaser of the course."
                value={formSummary}
                onChange={(e) => setFormSummary(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white"
              />
            </div>

            <div className="space-y-2">
              <Label
                htmlFor="thumbnailUrl"
                className="text-sm font-semibold text-white"
              >
                Thumbnail Image URL
              </Label>
              <div className="flex gap-2">
                <Input
                  id="thumbnailUrl"
                  placeholder="E.g., /media/my-course-thumbnail.jpg"
                  value={formThumbnailUrl}
                  onChange={(e) => setFormThumbnailUrl(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white flex-1"
                />
                <div className="relative">
                  <input
                    type="file"
                    id="create-thumbnail-file"
                    accept="image/*"
                    onChange={handleImageUpload}
                    className="hidden"
                    disabled={isUploading}
                  />
                  <Button
                    type="button"
                    variant="secondary"
                    onClick={() => document.getElementById("create-thumbnail-file")?.click()}
                    disabled={isUploading}
                    className="bg-zinc-800 text-white hover:bg-zinc-700 border border-white/10"
                  >
                    {isUploading ? (
                      <Loader2 className="h-4 w-4 animate-spin" />
                    ) : (
                      "Upload"
                    )}
                  </Button>
                </div>
              </div>
            </div>

            <div className="space-y-2">
              <Label
                htmlFor="description"
                className="text-sm font-semibold text-white"
              >
                Full Description / Syllabus
              </Label>
              <textarea
                id="description"
                placeholder="Describe what students will learn, supports markdown..."
                value={formDescription}
                onChange={(e) => setFormDescription(e.target.value)}
                rows={5}
                className="flex w-full rounded-md border border-white/10 bg-white/[0.02] px-3 py-2 text-sm text-white placeholder:text-muted-foreground focus-visible:outline-hidden focus-visible:border-ring focus-visible:ring-3 focus-visible:ring-ring/50 disabled:cursor-not-allowed disabled:opacity-50"
              />
            </div>

            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <Label className="text-sm text-muted-foreground font-semibold text-white">Intended Learners</Label>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleAddIntendedLearner}
                  className="h-8 text-xs text-white border-white/10 hover:bg-white/5 cursor-pointer"
                >
                  <Plus className="mr-1 h-3.5 w-3.5" /> Add Learner
                </Button>
              </div>
              <div className="space-y-2">
                {formIntendedLearners.map((learner, idx) => (
                  <div key={idx} className="flex items-center gap-2">
                    <Input
                      value={learner}
                      onChange={(e) => handleUpdateIntendedLearner(idx, e.target.value)}
                      placeholder="e.g. Electrical Engineers, IoT Makers, Students..."
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="icon"
                      onClick={() => handleRemoveIntendedLearner(idx)}
                      className="text-gray-400 hover:text-red-500 hover:bg-white/5 shrink-0 cursor-pointer"
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  </div>
                ))}
              </div>
              {formIntendedLearners.length === 0 && (
                <p className="text-xs text-muted-foreground italic">No intended learners specified yet. Click "Add Learner" to add.</p>
              )}
            </div>

            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <Label className="text-sm text-muted-foreground font-semibold text-white">Learning Objectives</Label>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleAddLearningObjective}
                  className="h-8 text-xs text-white border-white/10 hover:bg-white/5 cursor-pointer"
                >
                  <Plus className="mr-1 h-3.5 w-3.5" /> Add Objective
                </Button>
              </div>
              <div className="space-y-2">
                {formLearningObjectives.map((objective, idx) => (
                  <div key={idx} className="flex items-center gap-2">
                    <Input
                      value={objective}
                      onChange={(e) => handleUpdateLearningObjective(idx, e.target.value)}
                      placeholder="e.g. Design customized 3D printed objects, Configure IoT sensors..."
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="icon"
                      onClick={() => handleRemoveLearningObjective(idx)}
                      className="text-gray-400 hover:text-red-500 hover:bg-white/5 shrink-0 cursor-pointer"
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  </div>
                ))}
              </div>
              {formLearningObjectives.length === 0 && (
                <p className="text-xs text-muted-foreground italic">No learning objectives specified yet. Click "Add Objective" to add.</p>
              )}
            </div>

            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <Label className="text-sm text-muted-foreground font-semibold text-white">Course Requirements</Label>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={handleAddRequirement}
                  className="h-8 text-xs text-white border-white/10 hover:bg-white/5 cursor-pointer"
                >
                  <Plus className="mr-1 h-3.5 w-3.5" /> Add Requirement
                </Button>
              </div>
              <div className="space-y-2">
                {formRequirements.map((requirement, idx) => (
                  <div key={idx} className="flex items-center gap-2">
                    <Input
                      value={requirement}
                      onChange={(e) => handleUpdateRequirement(idx, e.target.value)}
                      placeholder="e.g. Basic understanding of electronics, A laptop with Arduino IDE..."
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                    />
                    <Button
                      type="button"
                      variant="ghost"
                      size="icon"
                      onClick={() => handleRemoveRequirement(idx)}
                      className="text-gray-400 hover:text-red-500 hover:bg-white/5 shrink-0 cursor-pointer"
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  </div>
                ))}
              </div>
              {formRequirements.length === 0 && (
                <p className="text-xs text-muted-foreground italic">No requirements specified yet. Click "Add Requirement" to add.</p>
              )}
            </div>

            <div className="flex items-center space-x-2 rounded-lg border border-white/5 bg-white/[0.01] p-3">
              <input
                type="checkbox"
                id="published"
                checked={formPublished}
                onChange={(e) => setFormPublished(e.target.checked)}
                className="h-4 w-4 rounded-sm border-white/20 bg-transparent"
              />
              <div className="grid gap-1.5 leading-none">
                <Label
                  htmlFor="published"
                  className="text-sm font-semibold text-white cursor-pointer"
                >
                  Publish immediately
                </Label>
                <p className="text-xs text-muted-foreground">
                  If selected, this course will show up in the public catalog
                  right away.
                </p>
              </div>
            </div>

            <div className="flex items-center space-x-2 rounded-lg border border-white/5 bg-white/[0.01] p-3">
              <input
                type="checkbox"
                id="coming-soon"
                checked={formComingSoon}
                onChange={(e) => setFormComingSoon(e.target.checked)}
                className="h-4 w-4 rounded-sm border-white/20 bg-transparent text-blaze-orange focus:ring-blaze-orange"
              />
              <div className="grid gap-1.5 leading-none">
                <Label
                  htmlFor="coming-soon"
                  className="text-sm font-semibold text-white cursor-pointer"
                >
                  Coming Soon
                </Label>
                <p className="text-xs text-muted-foreground">
                  Mark this course as coming soon (disables enrollment/Udemy buttons).
                </p>
              </div>
            </div>

            <SheetFooter className="pt-4 border-t border-white/5">
              <Button
                type="button"
                variant="ghost"
                onClick={() => setIsCreateOpen(false)}
                className="text-white hover:bg-white/5"
              >
                Cancel
              </Button>
              <Button
                type="submit"
                disabled={isPending}
                className="bg-blaze-orange hover:bg-flame-orange text-white"
              >
                {isPending && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                Create Course
              </Button>
            </SheetFooter>
          </form>
        </SheetContent>
      </Sheet>


    </div>
  );
}
