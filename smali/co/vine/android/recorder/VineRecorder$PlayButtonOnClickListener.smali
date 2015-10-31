.class Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlayButtonOnClickListener"
.end annotation


# instance fields
.field forceRefresh:Z

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;

.field toPlay:Lco/vine/android/recorder/RecordSegment;


# direct methods
.method private constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 1
    .parameter

    .prologue
    .line 2150
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2151
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    .line 2152
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->forceRefresh:Z

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 2150
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    const/4 v1, -0x1

    .line 2156
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    if-nez v0, :cond_1

    .line 2157
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    #setter for: Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$6702(Lco/vine/android/recorder/VineRecorder;I)I

    .line 2158
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2159
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v0

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->setSelection(I)V

    .line 2161
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x2

    #calls: Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$6400(Lco/vine/android/recorder/VineRecorder;I)V

    .line 2163
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->forceRefresh:Z

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->playPreview(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 2164
    return-void
.end method
