"use client"

import { useState, useTransition } from "react"
import NextImage from "next/image"
import { useRouter } from "next/navigation"
import Link from "next/link"
import { toast } from "sonner"
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog"
import {
  ArrowLeft,
  Save,
  Plus,
  Edit2,
  Trash2,
  Loader2,
  Play,
  FileText,
  HelpCircle,
  CheckSquare,
  Folder,
  ChevronRight,
  ChevronDown,
  Sparkles,
  Layers,
  Image as ImageIcon,
} from "lucide-react"

import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Sheet, SheetContent, SheetDescription, SheetFooter, SheetHeader, SheetTitle } from "@/components/ui/sheet"
import {
  updateCourse,
  createModule,
  updateModule,
  deleteModule,
  createLesson,
  updateLesson,
  deleteLesson,
} from "../../actions"

interface DbLesson {
  id: string
  courseId: string
  moduleId: string
  title: string
  slug: string
  type: "video" | "article" | "quiz" | "assignment"
  content: string | null
  videoUrl: string | null
  duration: number | null
  isFreePreview: boolean
  order: number
  createdAt: Date
  updatedAt: Date
}

interface DbModule {
  id: string
  courseId: string
  title: string
  description: string | null
  order: number
  createdAt: Date
  updatedAt: Date
}

interface DbCourseWithRelations {
  id: string
  title: string
  slug: string
  summary: string | null
  description: string | null
  thumbnailUrl: string | null
  platform: "local" | "udemy" | "both"
  udemyUrl: string | null
  price: number | null
  published: boolean
  comingSoon: boolean
  intendedLearners: string[] | null
  learningObjectives: string[] | null
  requirements: string[] | null
  createdAt: Date
  updatedAt: Date
  modules: DbModule[]
  lessons: DbLesson[]
}

interface EditCourseClientProps {
  course: DbCourseWithRelations
}

export function EditCourseClient({ course }: EditCourseClientProps) {
  const router = useRouter()
  const [isPending, startTransition] = useTransition()
  const [moduleToDelete, setModuleToDelete] = useState<{ id: string; title: string } | null>(null)
  const [lectureToDelete, setLectureToDelete] = useState<{ id: string; title: string } | null>(null)

  const orderedLessons = course.modules.flatMap((mod) =>
    course.lessons.filter((l) => l.moduleId === mod.id)
  )

  // Course Form States
  const [courseTitle, setCourseTitle] = useState(course.title)
  const [courseSlug, setCourseSlug] = useState(course.slug)
  const [courseSummary, setCourseSummary] = useState(course.summary || "")
  const [courseDescription, setCourseDescription] = useState(course.description || "")
  const [courseThumbnailUrl, setCourseThumbnailUrl] = useState(course.thumbnailUrl || "")
  const [thumbnailError, setThumbnailError] = useState(false)

  const updateThumbnailUrl = (url: string) => {
    setCourseThumbnailUrl(url)
    setThumbnailError(false)
  }
  const [coursePlatform, setCoursePlatform] = useState<"local" | "udemy" | "both">(course.platform)
  const [courseUdemyUrl, setCourseUdemyUrl] = useState(course.udemyUrl || "")
  const [coursePrice, setCoursePrice] = useState((course.price ?? 0).toString())
  const [coursePublished, setCoursePublished] = useState(course.published)
  const [courseComingSoon, setCourseComingSoon] = useState(course.comingSoon)
  const [courseIntendedLearners, setCourseIntendedLearners] = useState<string[]>(
    course.intendedLearners || []
  )

  const handleAddIntendedLearner = () => {
    setCourseIntendedLearners([...courseIntendedLearners, ""])
  }

  const handleUpdateIntendedLearner = (index: number, value: string) => {
    const newLearners = [...courseIntendedLearners]
    newLearners[index] = value
    setCourseIntendedLearners(newLearners)
  }

  const handleRemoveIntendedLearner = (index: number) => {
    const newLearners = courseIntendedLearners.filter((_, i) => i !== index)
    setCourseIntendedLearners(newLearners)
  }

  const [courseLearningObjectives, setCourseLearningObjectives] = useState<string[]>(
    course.learningObjectives || []
  )

  const handleAddLearningObjective = () => {
    setCourseLearningObjectives([...courseLearningObjectives, ""])
  }

  const handleUpdateLearningObjective = (index: number, value: string) => {
    const newObjectives = [...courseLearningObjectives]
    newObjectives[index] = value
    setCourseLearningObjectives(newObjectives)
  }

  const handleRemoveLearningObjective = (index: number) => {
    const newObjectives = courseLearningObjectives.filter((_, i) => i !== index)
    setCourseLearningObjectives(newObjectives)
  }

  const [courseRequirements, setCourseRequirements] = useState<string[]>(
    course.requirements || []
  )

  const handleAddRequirement = () => {
    setCourseRequirements([...courseRequirements, ""])
  }

  const handleUpdateRequirement = (index: number, value: string) => {
    const newRequirements = [...courseRequirements]
    newRequirements[index] = value
    setCourseRequirements(newRequirements)
  }

  const handleRemoveRequirement = (index: number) => {
    const newRequirements = courseRequirements.filter((_, i) => i !== index)
    setCourseRequirements(newRequirements)
  }

  // Upload state
  const [isUploading, setIsUploading] = useState(false)

  const handleImageUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    setIsUploading(true)
    const formData = new FormData()
    formData.append("file", file)

    try {
      const res = await fetch("/api/upload", {
        method: "POST",
        body: formData,
      })

      if (!res.ok) {
        const data = await res.json()
        throw new Error(data.error || "Upload failed")
      }

      const data = await res.json()
      updateThumbnailUrl(data.url)
      toast.success("Image uploaded successfully!")
    } catch (err) {
      const error = err as Error
      toast.error(error.message || "Failed to upload image")
    } finally {
      setIsUploading(false)
    }
  }

  // Module Sheet States
  const [isModuleOpen, setIsModuleOpen] = useState(false)
  const [moduleMode, setModuleMode] = useState<"create" | "edit">("create")
  const [selectedModuleId, setSelectedModuleId] = useState<string | null>(null)
  const [moduleTitle, setModuleTitle] = useState("")
  const [moduleDescription, setModuleDescription] = useState("")
  const [moduleOrder, setModuleOrder] = useState("")

  // Lesson Sheet States
  const [isLessonOpen, setIsLessonOpen] = useState(false)
  const [lessonMode, setLessonMode] = useState<"create" | "edit">("create")
  const [selectedLessonId, setSelectedLessonId] = useState<string | null>(null)
  const [lessonParentModuleId, setLessonParentModuleId] = useState("")
  const [lessonTitle, setLessonTitle] = useState("")
  const [lessonSlug, setLessonSlug] = useState("")
  const [lessonType, setLessonType] = useState<"video" | "article" | "quiz" | "assignment">("video")
  const [lessonVideoUrl, setLessonVideoUrl] = useState("")
  const [lessonContent, setLessonContent] = useState("")
  const [lessonDuration, setLessonDuration] = useState("0")
  const [lessonIsFreePreview, setLessonIsFreePreview] = useState(false)
  const [lessonOrder, setLessonOrder] = useState("")

  // Collapsed state for modules list
  const [expandedModules, setExpandedModules] = useState<Record<string, boolean>>(
    course.modules.reduce((acc, m) => ({ ...acc, [m.id]: true }), {})
  )

  const toggleModuleExpand = (moduleId: string) => {
    setExpandedModules((prev) => ({ ...prev, [moduleId]: !prev[moduleId] }))
  }

  // Slugifier for Lesson / Course
  const slugify = (text: string) => {
    return text
      .toLowerCase()
      .replace(/[^\u0E00-\u0E7F\w\s-]/g, "") // Allow Thai
      .replace(/[\s_-]+/g, "-")
      .replace(/^-+|-+$/g, "")
  }

  const handleCourseTitleChange = (val: string) => {
    setCourseTitle(val)
    setCourseSlug(slugify(val))
  }

  const handleLessonTitleChange = (val: string) => {
    setLessonTitle(val)
    setLessonSlug(slugify(val))
  }

  // Retrieve lessons for a specific module
  const getModuleLessons = (moduleId: string) => {
    return course.lessons.filter((l) => l.moduleId === moduleId)
  }

  // Submissions
  const handleSaveCourseDetails = (e: React.FormEvent) => {
    e.preventDefault()
    if (!courseTitle || !courseSlug) {
      toast.error("Title and Slug are required")
      return
    }

    startTransition(async () => {
      try {
        await updateCourse(course.id, {
          title: courseTitle,
          slug: courseSlug,
          summary: courseSummary || undefined,
          description: courseDescription || undefined,
          thumbnailUrl: courseThumbnailUrl || undefined,
          platform: coursePlatform,
          udemyUrl: coursePlatform !== "local" ? courseUdemyUrl : undefined,
          price: coursePrice ? parseInt(coursePrice, 10) : 0,
          published: coursePublished,
          comingSoon: courseComingSoon,
          intendedLearners: courseIntendedLearners.filter(val => val.trim() !== ""),
          learningObjectives: courseLearningObjectives.filter(val => val.trim() !== ""),
          requirements: courseRequirements.filter(val => val.trim() !== ""),
        })
        toast.success("Course details saved successfully!")
        router.refresh()
      } catch (err) {
        const error = err as Error
        toast.error(error.message || "Failed to save course details")
      }
    })
  }

  // Module CRUD
  const handleOpenCreateModule = () => {
    setModuleMode("create")
    setSelectedModuleId(null)
    setModuleTitle("")
    setModuleDescription("")
    // Auto-calculate order
    const nextOrder = course.modules.length > 0 ? Math.max(...course.modules.map((m) => m.order)) + 1 : 1
    setModuleOrder(nextOrder.toString())
    setIsModuleOpen(true)
  }

  const handleOpenEditModule = (mod: DbModule) => {
    setModuleMode("edit")
    setSelectedModuleId(mod.id)
    setModuleTitle(mod.title)
    setModuleDescription(mod.description || "")
    setModuleOrder(mod.order.toString())
    setIsModuleOpen(true)
  }

  const handleModuleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!moduleTitle) {
      toast.error("Module Title is required")
      return
    }

    startTransition(async () => {
      try {
        const orderNum = parseInt(moduleOrder, 10) || 1
        if (moduleMode === "create") {
          const modId = `module_${Math.random().toString(36).substring(2, 9)}`
          await createModule({
            id: modId,
            courseId: course.id,
            title: moduleTitle,
            description: moduleDescription || undefined,
            order: orderNum,
          })
          toast.success("Module created successfully!")
          setExpandedModules((prev) => ({ ...prev, [modId]: true }))
        } else if (moduleMode === "edit" && selectedModuleId) {
          await updateModule(selectedModuleId, course.id, {
            title: moduleTitle,
            description: moduleDescription || undefined,
            order: orderNum,
          })
          toast.success("Module updated successfully!")
        }
        setIsModuleOpen(false)
        router.refresh()
      } catch (err) {
        const error = err as Error
        toast.error(error.message || "Failed to save module")
      }
    })
  }

  const handleDeleteModule = (moduleId: string, title: string) => {
    setModuleToDelete({ id: moduleId, title })
  }

  // Lesson CRUD
  const handleOpenCreateLesson = (moduleId: string) => {
    setLessonMode("create")
    setSelectedLessonId(null)
    setLessonParentModuleId(moduleId)
    setLessonTitle("")
    setLessonSlug("")
    setLessonType("video")
    setLessonVideoUrl("")
    setLessonContent("")
    setLessonIsFreePreview(false)
    // Auto-calculate order
    const moduleLessons = getModuleLessons(moduleId)
    const nextOrder = moduleLessons.length > 0 ? Math.max(...moduleLessons.map((l) => l.order)) + 1 : 1
    setLessonOrder(nextOrder.toString())
    setLessonDuration("10")
    setIsLessonOpen(true)
  }

  const handleOpenEditLesson = (lesson: DbLesson) => {
    setLessonMode("edit")
    setSelectedLessonId(lesson.id)
    setLessonParentModuleId(lesson.moduleId)
    setLessonTitle(lesson.title)
    setLessonSlug(lesson.slug)
    setLessonType(lesson.type)
    setLessonVideoUrl(lesson.videoUrl || "")
    setLessonContent(lesson.content || "")
    setLessonDuration((lesson.duration ?? 0).toString())
    setLessonIsFreePreview(lesson.isFreePreview)
    setLessonOrder(lesson.order.toString())
    setIsLessonOpen(true)
  }

  const handleLessonSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!lessonTitle || !lessonSlug) {
      toast.error("Title and Slug are required")
      return
    }

    startTransition(async () => {
      try {
        const orderNum = parseInt(lessonOrder, 10) || 1
        const durationNum = parseInt(lessonDuration, 10) || 0

        if (lessonMode === "create") {
          const lessonId = `lesson_${Math.random().toString(36).substring(2, 9)}`
          await createLesson({
            id: lessonId,
            courseId: course.id,
            moduleId: lessonParentModuleId,
            title: lessonTitle,
            slug: lessonSlug,
            type: lessonType,
            content: lessonContent || undefined,
            videoUrl: lessonVideoUrl || undefined,
            duration: durationNum,
            isFreePreview: lessonIsFreePreview,
            order: orderNum,
          })
          toast.success("Lecture created successfully!")
        } else if (lessonMode === "edit" && selectedLessonId) {
          await updateLesson(selectedLessonId, course.id, {
            title: lessonTitle,
            slug: lessonSlug,
            type: lessonType,
            content: lessonContent || undefined,
            videoUrl: lessonVideoUrl || undefined,
            duration: durationNum,
            isFreePreview: lessonIsFreePreview,
            order: orderNum,
          })
          toast.success("Lecture updated successfully!")
        }
        setIsLessonOpen(false)
        router.refresh()
      } catch (err) {
        const error = err as Error
        toast.error(error.message || "Failed to save lecture")
      }
    })
  }

  const handleDeleteLesson = (lessonId: string, title: string) => {
    setLectureToDelete({ id: lessonId, title })
  }

  return (
    <div className="flex flex-col gap-6">
      {/* Header */}
      <div className="flex flex-col gap-3 md:flex-row md:items-center md:justify-between border-b border-white/5 pb-5">
        <div className="flex items-center gap-3">
          <Button
            asChild
            variant="ghost"
            size="icon"
            className="text-muted-foreground hover:text-white hover:bg-white/5"
          >
            <Link href="/garage/courses">
              <ArrowLeft className="h-5 w-5" />
            </Link>
          </Button>
          <div>
            <div className="flex items-center gap-2">
              <Badge className="bg-blaze-orange/10 text-blaze-orange border-blaze-orange/20">Course Edit</Badge>
              <span className="text-xs font-mono text-muted-foreground">ID: {course.id}</span>
            </div>
            <h2 className="text-2xl font-bold text-white tracking-tight mt-1">{course.title}</h2>
          </div>
        </div>
      </div>

      <Tabs defaultValue="details" className="w-full">
        <TabsList className="bg-white/[0.02] border border-white/5 p-1 rounded-lg mb-6">
          <TabsTrigger
            value="details"
            className="data-[state=active]:bg-blaze-orange data-[state=active]:text-white text-muted-foreground px-4 py-2 text-sm font-medium rounded-md transition-all"
          >
            General Details
          </TabsTrigger>
          <TabsTrigger
            value="curriculum"
            className="data-[state=active]:bg-blaze-orange data-[state=active]:text-white text-muted-foreground px-4 py-2 text-sm font-medium rounded-md transition-all"
          >
            Curriculum Builder ({course.modules.length} Modules)
          </TabsTrigger>
        </TabsList>

        {/* Tab 1: Course Info */}
        <TabsContent value="details" className="mt-0">
          <form onSubmit={handleSaveCourseDetails} className="grid gap-6 md:grid-cols-3">
            {/* Form Fields */}
            <div className="md:col-span-2 space-y-6 bg-white/[0.01] border border-white/5 p-6 rounded-xl">
              <div className="space-y-4">
                <h3 className="text-lg font-semibold text-white">Course Metadata</h3>

                <div className="space-y-2">
                  <Label htmlFor="course-title" className="text-sm text-muted-foreground">Course Title</Label>
                  <Input
                    id="course-title"
                    value={courseTitle}
                    onChange={(e) => handleCourseTitleChange(e.target.value)}
                    className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                    required
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="course-slug" className="text-sm text-muted-foreground">Slug (URL endpoint)</Label>
                  <Input
                    id="course-slug"
                    value={courseSlug}
                    onChange={(e) => setCourseSlug(slugify(e.target.value))}
                    className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                    required
                  />
                </div>

                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <Label htmlFor="course-platform" className="text-sm text-muted-foreground">Platform</Label>
                    <Select
                      value={coursePlatform}
                      onValueChange={(val: "local" | "udemy" | "both") => setCoursePlatform(val)}
                    >
                      <SelectTrigger id="course-platform" className="bg-white/[0.02] border-white/10 text-white">
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
                    <Label htmlFor="course-price" className="text-sm text-muted-foreground">Price (Baht)</Label>
                    <Input
                      id="course-price"
                      type="number"
                      value={coursePrice}
                      onChange={(e) => setCoursePrice(e.target.value)}
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                      min="0"
                    />
                  </div>
                </div>

                {(coursePlatform === "udemy" || coursePlatform === "both") && (
                  <div className="space-y-2 animate-in fade-in slide-in-from-top-1 duration-150">
                    <Label htmlFor="course-udemyUrl" className="text-sm text-muted-foreground">Udemy Enrollment Link</Label>
                    <Input
                      id="course-udemyUrl"
                      type="url"
                      placeholder="https://www.udemy.com/course/..."
                      value={courseUdemyUrl}
                      onChange={(e) => setCourseUdemyUrl(e.target.value)}
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                      required
                    />
                  </div>
                )}

                <div className="space-y-2">
                  <Label htmlFor="course-thumbnail" className="text-sm text-muted-foreground">Thumbnail Image URL</Label>
                  <div className="flex gap-2">
                    <Input
                      id="course-thumbnail"
                      value={courseThumbnailUrl}
                      onChange={(e) => updateThumbnailUrl(e.target.value)}
                      placeholder="/media/your-thumbnail.jpg"
                      className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange flex-1"
                    />
                    <div className="relative">
                      <input
                        type="file"
                        id="thumbnail-file"
                        accept="image/*"
                        onChange={handleImageUpload}
                        className="hidden"
                        disabled={isUploading}
                      />
                      <Button
                        type="button"
                        variant="secondary"
                        onClick={() => document.getElementById("thumbnail-file")?.click()}
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
                  <Label htmlFor="course-summary" className="text-sm text-muted-foreground">Teaser Summary</Label>
                  <Input
                    id="course-summary"
                    value={courseSummary}
                    onChange={(e) => setCourseSummary(e.target.value)}
                    className="bg-white/[0.02] border-white/10 text-white focus-visible:ring-blaze-orange"
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="course-description" className="text-sm text-muted-foreground">Full Description / Syllabus</Label>
                  <textarea
                    id="course-description"
                    value={courseDescription}
                    onChange={(e) => setCourseDescription(e.target.value)}
                    rows={8}
                    className="flex w-full rounded-md border border-white/10 bg-white/[0.02] px-3 py-2 text-sm text-white focus-visible:outline-hidden focus-visible:ring-1 focus-visible:ring-blaze-orange"
                  />
                </div>

                <div className="space-y-3">
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
                    {courseIntendedLearners.map((learner, idx) => (
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
                  {courseIntendedLearners.length === 0 && (
                    <p className="text-xs text-muted-foreground italic">No intended learners specified yet. Click "Add Learner" to add.</p>
                  )}
                </div>

                <div className="space-y-3">
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
                    {courseLearningObjectives.map((objective, idx) => (
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
                  {courseLearningObjectives.length === 0 && (
                    <p className="text-xs text-muted-foreground italic">No learning objectives specified yet. Click "Add Objective" to add.</p>
                  )}
                </div>

                <div className="space-y-3">
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
                    {courseRequirements.map((requirement, idx) => (
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
                  {courseRequirements.length === 0 && (
                    <p className="text-xs text-muted-foreground italic">No requirements specified yet. Click "Add Requirement" to add.</p>
                  )}
                </div>

                <div className="flex items-center space-x-2 rounded-lg border border-white/5 bg-white/[0.02] p-4">
                  <input
                    type="checkbox"
                    id="course-published"
                    checked={coursePublished}
                    onChange={(e) => setCoursePublished(e.target.checked)}
                    className="h-4 w-4 rounded-sm border-white/20 bg-transparent text-blaze-orange focus:ring-blaze-orange"
                  />
                  <div className="grid gap-1 leading-none">
                    <Label htmlFor="course-published" className="text-sm font-semibold text-white cursor-pointer">
                      Published status
                    </Label>
                    <p className="text-xs text-muted-foreground">
                      Enable to display this course on the public Machines Labs School catalog.
                    </p>
                  </div>
                </div>

                <div className="flex items-center space-x-2 rounded-lg border border-white/5 bg-white/[0.02] p-4">
                  <input
                    type="checkbox"
                    id="course-coming-soon"
                    checked={courseComingSoon}
                    onChange={(e) => setCourseComingSoon(e.target.checked)}
                    className="h-4 w-4 rounded-sm border-white/20 bg-transparent text-blaze-orange focus:ring-blaze-orange"
                  />
                  <div className="grid gap-1 leading-none">
                    <Label htmlFor="course-coming-soon" className="text-sm font-semibold text-white cursor-pointer">
                      Coming Soon status
                    </Label>
                    <p className="text-xs text-muted-foreground">
                      Mark this course as coming soon (disables enrollment/Udemy buttons).
                    </p>
                  </div>
                </div>
              </div>

              <div className="flex justify-end gap-3 pt-4 border-t border-white/5">
                <Button
                  type="submit"
                  disabled={isPending}
                  className="bg-blaze-orange hover:bg-flame-orange text-white px-5 shadow-lg shadow-blaze-orange/10"
                >
                  {isPending ? (
                    <>
                      <Loader2 className="mr-2 h-4 w-4 animate-spin" /> Saving...
                    </>
                  ) : (
                    <>
                      <Save className="mr-2 h-4 w-4" /> Save Course Details
                    </>
                  )}
                </Button>
              </div>
            </div>

            {/* Thumbnail Preview Side-panel */}
            <div className="space-y-6">
              <Card className="bg-white/[0.01] border-white/5 text-white">
                <CardHeader>
                  <CardTitle className="text-base font-semibold flex items-center gap-2">
                    <ImageIcon className="h-4 w-4 text-blaze-orange" /> Course Image Thumbnail
                  </CardTitle>
                  <CardDescription className="text-xs text-muted-foreground">
                    Live preview of the cover card image.
                  </CardDescription>
                </CardHeader>
                <CardContent className="flex flex-col items-center justify-center p-6 pt-0">
                  <div className="relative aspect-video w-full overflow-hidden rounded-lg border border-white/10 bg-zinc-950 flex items-center justify-center">
                    {courseThumbnailUrl && !thumbnailError ? (
                      <NextImage
                        src={courseThumbnailUrl}
                        alt="Course thumbnail preview"
                        fill
                        className="object-cover"
                        onError={() => setThumbnailError(true)}
                      />
                    ) : null}
                    {(!courseThumbnailUrl || thumbnailError) && (
                      <div className="absolute inset-0 flex flex-col items-center justify-center text-muted-foreground/40 gap-1 bg-zinc-900 pointer-events-none select-none">
                        <ImageIcon className="h-10 w-10 text-muted-foreground/20" />
                        <span className="text-xs">
                          {thumbnailError ? "Failed to load image" : "No image provided"}
                        </span>
                      </div>
                    )}
                  </div>
                  <div className="w-full mt-4 space-y-2 border-t border-white/5 pt-4">
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">Host platform:</span>
                      <span className="font-medium text-white capitalize">{coursePlatform}</span>
                    </div>
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">LMS Catalog:</span>
                      <span>
                        {coursePublished ? (
                          <Badge className="bg-emerald-500/10 text-emerald-400 border-emerald-500/20 text-[10px] h-4">Active</Badge>
                        ) : (
                          <Badge className="bg-zinc-800 text-zinc-400 border-zinc-700 text-[10px] h-4">Draft</Badge>
                        )}
                      </span>
                    </div>
                    <div className="flex justify-between text-xs">
                      <span className="text-muted-foreground">Price tag:</span>
                      <span className="font-mono text-white">
                        {parseInt(coursePrice) > 0 ? `฿${parseInt(coursePrice).toLocaleString()}` : "Free"}
                      </span>
                    </div>
                  </div>
                </CardContent>
              </Card>

              {/* Tips card */}
              <div className="rounded-xl border border-blue-500/10 bg-blue-500/[0.02] p-5 text-xs text-blue-400/90 leading-relaxed">
                <h4 className="font-semibold text-blue-300 flex items-center gap-1.5 mb-2">
                  <Sparkles className="h-4 w-4" /> Editing Instructions
                </h4>
                <p className="mb-2">
                  Modify the general catalog properties here. Next.js router uses the <strong>Slug</strong> to render the page at <code>/school/[slug]</code>.
                </p>
                <p>
                  To manage modules, lectures, and upload video links, switch to the <strong>Curriculum Builder</strong> tab above.
                </p>
              </div>
            </div>
          </form>
        </TabsContent>

        {/* Tab 2: Curriculum Builder */}
        <TabsContent value="curriculum" className="mt-0">
          <div className="flex flex-col gap-4">
            {/* Builder Header */}
            <div className="flex items-center justify-between bg-white/[0.01] border border-white/5 p-4 rounded-xl">
              <div>
                <h3 className="text-lg font-semibold text-white">Modules & Lectures</h3>
                <p className="text-xs text-muted-foreground mt-0.5">
                  Organize modules, lectures, adjust lessons, and set previews.
                </p>
              </div>
              <Button
                onClick={handleOpenCreateModule}
                className="bg-white/10 hover:bg-white/25 text-white border border-white/10"
              >
                <Plus className="mr-2 h-4 w-4" /> Add Module
              </Button>
            </div>

            {/* Modules List */}
            {course.modules.length === 0 ? (
              <div className="flex flex-col items-center justify-center py-16 bg-white/[0.01] border border-white/5 border-dashed rounded-xl text-center">
                <Layers className="h-12 w-12 text-muted-foreground/20 mb-3" />
                <h4 className="text-base font-semibold text-white">No modules defined</h4>
                <p className="text-xs text-muted-foreground max-w-sm mt-1 mb-4">
                  Modules group lectures together. Create a module first to start adding lectures.
                </p>
                <Button onClick={handleOpenCreateModule} className="bg-blaze-orange hover:bg-flame-orange text-white">
                  <Plus className="mr-2 h-4 w-4" /> Add Your First Module
                </Button>
              </div>
            ) : (
              <div className="flex flex-col gap-4">
                {course.modules.map((mod, moduleIdx) => {
                  const lessons = getModuleLessons(mod.id)
                  const isExpanded = expandedModules[mod.id]

                  return (
                    <div
                      key={mod.id}
                      className="rounded-xl border border-white/5 bg-white/[0.01] overflow-hidden transition-all duration-200"
                    >
                      {/* Module Header */}
                      <div className="flex items-center justify-between p-4 bg-white/[0.02] border-b border-white/5">
                        <div className="flex items-center gap-3 flex-1 min-w-0">
                          <button
                            onClick={() => toggleModuleExpand(mod.id)}
                            className="text-muted-foreground hover:text-white p-1 hover:bg-white/5 rounded-md transition-colors"
                          >
                            {isExpanded ? <ChevronDown className="h-5 w-5" /> : <ChevronRight className="h-5 w-5" />}
                          </button>
                          <div className="flex items-center gap-2 shrink-0">
                            <span className="font-mono text-xs text-muted-foreground bg-white/5 px-2 py-0.5 rounded-md whitespace-nowrap">
                              Order {mod.order}
                            </span>
                          </div>
                          <div className="min-w-0">
                            <h4 className="font-semibold text-white text-base truncate">Module {moduleIdx + 1}: {mod.title}</h4>
                            {mod.description && (
                              <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">
                                {mod.description}
                              </p>
                            )}
                          </div>
                        </div>

                        <div className="flex items-center gap-2 ml-4">
                          <Button
                            size="sm"
                            variant="ghost"
                            onClick={() => handleOpenCreateLesson(mod.id)}
                            className="h-8 text-xs text-indigo-400 hover:text-indigo-300 hover:bg-indigo-500/10"
                          >
                            <Plus className="mr-1 h-3.5 w-3.5" /> Add Lecture
                          </Button>
                          <Button
                            size="icon"
                            variant="ghost"
                            onClick={() => handleOpenEditModule(mod)}
                            className="h-8 w-8 text-muted-foreground hover:text-white hover:bg-white/5"
                          >
                            <Edit2 className="h-4 w-4" />
                          </Button>
                          <Button
                            size="icon"
                            variant="ghost"
                            onClick={() => handleDeleteModule(mod.id, mod.title)}
                            className="h-8 w-8 text-rose-400 hover:text-rose-300 hover:bg-rose-500/10"
                          >
                            <Trash2 className="h-4 w-4" />
                          </Button>
                        </div>
                      </div>

                      {/* Module Lessons list */}
                      {isExpanded && (
                        <div className="p-4 bg-zinc-950/20">
                          {lessons.length === 0 ? (
                            <div className="text-center py-6 text-xs text-muted-foreground">
                              No lectures in this module. Click <strong>Add Lecture</strong> to build content.
                            </div>
                          ) : (
                            <div className="overflow-x-auto">
                              <table className="w-full text-sm text-left border-collapse">
                                <thead>
                                  <tr className="border-b border-white/5 text-xs text-muted-foreground uppercase font-mono tracking-wider">
                                    <th className="py-2 font-semibold">Lecture Detail</th>
                                    <th className="py-2 font-semibold w-[100px]">Type</th>
                                    <th className="py-2 font-semibold w-[100px]">Duration</th>
                                    <th className="py-2 font-semibold w-[120px]">Free Preview</th>
                                    <th className="py-2 font-semibold text-right w-[100px]">Actions</th>
                                  </tr>
                                </thead>
                                <tbody>
                                  {lessons.map((lesson) => {
                                    const lessonIndex = orderedLessons.findIndex((l) => l.id === lesson.id) + 1
                                    return (
                                      <tr
                                        key={lesson.id}
                                        className="border-b border-white/5 last:border-b-0 hover:bg-white/[0.01] transition-colors"
                                      >
                                        <td className="py-3">
                                          <div className="flex flex-col gap-0.5 min-w-0">
                                            <div className="flex items-start gap-1.5 font-semibold text-white min-w-0">
                                              <span className="shrink-0 text-muted-foreground font-mono select-none">{lessonIndex}.</span>
                                              <span className="break-words">{lesson.title}</span>
                                            </div>
                                            <span className="text-[10px] font-mono text-muted-foreground pl-5">
                                              Order {lesson.order} &bull; Slug: {lesson.slug}
                                            </span>
                                          </div>
                                        </td>
                                      <td className="py-3">
                                        <div className="flex items-center gap-1.5 text-xs text-muted-foreground mt-0.5">
                                          {lesson.type === "video" && <Play className="h-3.5 w-3.5 text-blue-400" />}
                                          {lesson.type === "article" && <FileText className="h-3.5 w-3.5 text-amber-400" />}
                                          {lesson.type === "quiz" && <HelpCircle className="h-3.5 w-3.5 text-purple-400" />}
                                          {lesson.type === "assignment" && <CheckSquare className="h-3.5 w-3.5 text-teal-400" />}
                                          <span className="capitalize">{lesson.type}</span>
                                        </div>
                                      </td>
                                      <td className="py-3 font-mono text-xs text-white">
                                        {lesson.duration ? `${lesson.duration}m` : "—"}
                                      </td>
                                      <td className="py-3">
                                        {lesson.isFreePreview ? (
                                          <Badge className="bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 text-[10px] h-4">
                                            Free Preview
                                          </Badge>
                                        ) : (
                                          <span className="text-xs text-muted-foreground">Locked</span>
                                        )}
                                      </td>
                                      <td className="py-3 text-right">
                                        <div className="flex items-center justify-end gap-1">
                                          <Button
                                            size="icon"
                                            variant="ghost"
                                            onClick={() => handleOpenEditLesson(lesson)}
                                            className="h-7 w-7 text-indigo-400 hover:text-indigo-300 hover:bg-indigo-500/10"
                                          >
                                            <Edit2 className="h-3.5 w-3.5" />
                                          </Button>
                                          <Button
                                            size="icon"
                                            variant="ghost"
                                            onClick={() => handleDeleteLesson(lesson.id, lesson.title)}
                                            className="h-7 w-7 text-rose-400 hover:text-rose-300 hover:bg-rose-500/10"
                                          >
                                            <Trash2 className="h-3.5 w-3.5" />
                                          </Button>
                                        </div>
                                      </td>
                                    </tr>
                                  );
                                })}
                                </tbody>
                              </table>
                            </div>
                          )}
                        </div>
                      )}
                    </div>
                  )
                })}
              </div>
            )}
          </div>
        </TabsContent>
      </Tabs>

      {/* --- FORM SHEETS --- */}

      {/* Module Create/Edit Sheet */}
      <Sheet open={isModuleOpen} onOpenChange={setIsModuleOpen}>
        <SheetContent className="bg-zinc-950 border-white/5 text-white w-full sm:max-w-md overflow-y-auto p-6">
          <SheetHeader className="pb-4 border-b border-white/5">
            <SheetTitle className="text-lg font-bold text-white flex items-center gap-2">
              <Folder className="h-5 w-5 text-blaze-orange" />
              {moduleMode === "create" ? "Add Module" : "Edit Module"}
            </SheetTitle>
            <SheetDescription className="text-muted-foreground text-xs">
              Define the module settings. Modules contain lectures.
            </SheetDescription>
          </SheetHeader>
          <form onSubmit={handleModuleSubmit} className="space-y-4 py-4">
            <div className="space-y-1.5">
              <Label htmlFor="module-title" className="text-xs text-muted-foreground">Module Title</Label>
              <Input
                id="module-title"
                placeholder="E.g., Module 1: Introduction to Electronics"
                value={moduleTitle}
                onChange={(e) => setModuleTitle(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white"
                required
              />
            </div>

            <div className="space-y-1.5">
              <Label htmlFor="module-desc" className="text-xs text-muted-foreground">Description (Optional)</Label>
              <Input
                id="module-desc"
                placeholder="Brief summary of the module lessons"
                value={moduleDescription}
                onChange={(e) => setModuleDescription(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white"
              />
            </div>

            <div className="space-y-1.5">
              <Label htmlFor="module-order" className="text-xs text-muted-foreground">Sort Order</Label>
              <Input
                id="module-order"
                type="number"
                value={moduleOrder}
                onChange={(e) => setModuleOrder(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white w-32"
                min="1"
                required
              />
            </div>

            <SheetFooter className="pt-4 border-t border-white/5 flex gap-2 justify-end">
              <Button
                type="button"
                variant="ghost"
                onClick={() => setIsModuleOpen(false)}
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
                {moduleMode === "create" ? "Add Module" : "Save Changes"}
              </Button>
            </SheetFooter>
          </form>
        </SheetContent>
      </Sheet>

      {/* Lesson Create/Edit Sheet */}
      <Sheet open={isLessonOpen} onOpenChange={setIsLessonOpen}>
        <SheetContent className="bg-zinc-950 border-white/5 text-white w-full sm:max-w-lg overflow-y-auto max-h-screen p-6">
          <SheetHeader className="pb-4 border-b border-white/5">
            <SheetTitle className="text-lg font-bold text-white flex items-center gap-2">
              <Play className="h-5 w-5 text-indigo-400" />
              {lessonMode === "create" ? "Add Lecture" : "Edit Lecture"}
            </SheetTitle>
            <SheetDescription className="text-muted-foreground text-xs">
              Configure content detail, media links, and preview permissions.
            </SheetDescription>
          </SheetHeader>
          <form onSubmit={handleLessonSubmit} className="space-y-4 py-4">
            <div className="space-y-1.5">
              <Label htmlFor="lesson-title" className="text-xs text-muted-foreground">Lecture Title</Label>
              <Input
                id="lesson-title"
                placeholder="E.g., 1.1 Intro to Resistors"
                value={lessonTitle}
                onChange={(e) => handleLessonTitleChange(e.target.value)}
                className="bg-white/[0.02] border-white/10 text-white"
                required
              />
            </div>

            <div className="space-y-1.5">
              <Label htmlFor="lesson-slug" className="text-xs text-muted-foreground">Slug (URL endpoint)</Label>
              <Input
                id="lesson-slug"
                placeholder="intro-to-resistors"
                value={lessonSlug}
                onChange={(e) => setLessonSlug(slugify(e.target.value))}
                className="bg-white/[0.02] border-white/10 text-white"
                required
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-1.5">
                <Label htmlFor="lesson-type" className="text-xs text-muted-foreground">Lecture Type</Label>
                <Select
                  value={lessonType}
                  onValueChange={(val: "video" | "article" | "quiz" | "assignment") => setLessonType(val)}
                >
                  <SelectTrigger id="lesson-type" className="bg-white/[0.02] border-white/10 text-white">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent className="bg-zinc-950 border-white/10 text-white">
                    <SelectItem value="video">Video</SelectItem>
                    <SelectItem value="article">Article (Text)</SelectItem>
                    <SelectItem value="quiz">Quiz</SelectItem>
                    <SelectItem value="assignment">Assignment</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-1.5">
                <Label htmlFor="lesson-duration" className="text-xs text-muted-foreground">Duration (Minutes)</Label>
                <Input
                  id="lesson-duration"
                  type="number"
                  value={lessonDuration}
                  onChange={(e) => setLessonDuration(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white"
                  min="0"
                />
              </div>
            </div>

            {lessonType === "video" && (
              <div className="space-y-1.5 animate-in fade-in duration-150">
                <Label htmlFor="lesson-video" className="text-xs text-muted-foreground">Video URL (Self-hosted or Vimeo/YouTube)</Label>
                <Input
                  id="lesson-video"
                  placeholder="https://example.com/lecture.mp4"
                  value={lessonVideoUrl}
                  onChange={(e) => setLessonVideoUrl(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white"
                />
              </div>
            )}

            <div className="space-y-1.5">
              <Label htmlFor="lesson-content" className="text-xs text-muted-foreground">
                {lessonType === "video" ? "Notes / Description" : "Lecture Body Content (Markdown)"}
              </Label>
              <textarea
                id="lesson-content"
                placeholder="Write lesson notes, markdown body, or quiz instructions..."
                value={lessonContent}
                onChange={(e) => setLessonContent(e.target.value)}
                rows={6}
                className="flex w-full rounded-md border border-white/10 bg-white/[0.02] px-3 py-2 text-sm text-white focus-visible:outline-hidden focus-visible:ring-1 focus-visible:ring-blaze-orange"
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-1.5">
                <Label htmlFor="lesson-order" className="text-xs text-muted-foreground">Sort Order</Label>
                <Input
                  id="lesson-order"
                  type="number"
                  value={lessonOrder}
                  onChange={(e) => setLessonOrder(e.target.value)}
                  className="bg-white/[0.02] border-white/10 text-white"
                  min="1"
                  required
                />
              </div>

              <div className="flex items-center space-x-2 mt-6">
                <input
                  type="checkbox"
                  id="lesson-preview"
                  checked={lessonIsFreePreview}
                  onChange={(e) => setLessonIsFreePreview(e.target.checked)}
                  className="h-4 w-4 rounded-sm border-white/20 bg-transparent text-blaze-orange focus:ring-blaze-orange"
                />
                <div className="grid gap-1 leading-none">
                  <Label htmlFor="lesson-preview" className="text-sm font-semibold text-white cursor-pointer">
                    Free Preview
                  </Label>
                  <p className="text-[10px] text-muted-foreground">
                    Available without purchase.
                  </p>
                </div>
              </div>
            </div>

            <SheetFooter className="pt-4 border-t border-white/5 flex gap-2 justify-end">
              <Button
                type="button"
                variant="ghost"
                onClick={() => setIsLessonOpen(false)}
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
                {lessonMode === "create" ? "Add Lecture" : "Save Changes"}
              </Button>
            </SheetFooter>
          </form>
        </SheetContent>
      </Sheet>

      <AlertDialog open={!!moduleToDelete} onOpenChange={(open) => !open && setModuleToDelete(null)}>
        <AlertDialogContent className="bg-zinc-950 border-white/5 text-white">
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
            <AlertDialogDescription className="text-zinc-400">
              This action cannot be undone. This will permanently delete module{" "}
              <span className="font-semibold text-white">"{moduleToDelete?.title}"</span> and all lectures inside this module.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel className="bg-transparent border-white/10 hover:bg-white/5 hover:text-white text-zinc-400">Cancel</AlertDialogCancel>
            <AlertDialogAction
              className="bg-rose-600 hover:bg-rose-700 text-white"
              onClick={() => {
                if (moduleToDelete) {
                  const { id } = moduleToDelete
                  setModuleToDelete(null)
                  startTransition(async () => {
                    try {
                      await deleteModule(id, course.id)
                      toast.success("Module deleted successfully!")
                      router.refresh()
                    } catch (err) {
                      const error = err as Error
                      toast.error(error.message || "Failed to delete module")
                    }
                  })
                }
              }}
            >
              Delete
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

      <AlertDialog open={!!lectureToDelete} onOpenChange={(open) => !open && setLectureToDelete(null)}>
        <AlertDialogContent className="bg-zinc-950 border-white/5 text-white">
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
            <AlertDialogDescription className="text-zinc-400">
              This action cannot be undone. This will permanently delete lecture{" "}
              <span className="font-semibold text-white">"{lectureToDelete?.title}"</span>.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel className="bg-transparent border-white/10 hover:bg-white/5 hover:text-white text-zinc-400">Cancel</AlertDialogCancel>
            <AlertDialogAction
              className="bg-rose-600 hover:bg-rose-700 text-white"
              onClick={() => {
                if (lectureToDelete) {
                  const { id } = lectureToDelete
                  setLectureToDelete(null)
                  startTransition(async () => {
                    try {
                      await deleteLesson(id, course.id)
                      toast.success("Lecture deleted successfully!")
                      router.refresh()
                    } catch (err) {
                      const error = err as Error
                      toast.error(error.message || "Failed to delete lecture")
                    }
                  })
                }
              }}
            >
              Delete
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>

    </div>
  )
}
