.class Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector$1;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;)V
    .locals 0
    .parameter

    .prologue
    .line 2622
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector$1;->this$1:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 2625
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector$1;->this$1:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$6700(Lco/vine/android/recorder/VineRecorder;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 2626
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector$1;->this$1:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v0

    .line 2627
    .local v0, widget:Lco/vine/android/dragsort/DragSortWidget;
    if-eqz v0, :cond_0

    .line 2628
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector$1;->this$1:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget v1, v1, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->lastFirstItem:I

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->setFocused(I)V

    .line 2631
    .end local v0           #widget:Lco/vine/android/dragsort/DragSortWidget;
    :cond_0
    return-void
.end method
