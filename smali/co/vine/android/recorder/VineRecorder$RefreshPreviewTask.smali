.class Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;
.super Landroid/os/AsyncTask;
.source "VineRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefreshPreviewTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mSegment:Lco/vine/android/recorder/RecordSegment;

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)V
    .locals 0
    .parameter
    .parameter "segment"

    .prologue
    .line 1607
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1608
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    .line 1609
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1603
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 3
    .parameter "params"

    .prologue
    .line 1613
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1614
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$3100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSegment;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 1615
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    if-nez v0, :cond_1

    .line 1616
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->refreshFullPreview()V
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4300(Lco/vine/android/recorder/VineRecorder;)V

    .line 1624
    :cond_0
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 1618
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/RecordController;->makePreview(Lco/vine/android/recorder/RecordSegment;Z)V

    goto :goto_0

    .line 1620
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/SegmentEditorAdapter;

    move-result-object v0

    iget-boolean v0, v0, Lco/vine/android/recorder/SegmentEditorAdapter;->hasInitialized:Z

    if-eqz v0, :cond_0

    .line 1621
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->refreshFullPreview()V
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4300(Lco/vine/android/recorder/VineRecorder;)V

    goto :goto_0
.end method

.method public onCancelled()V
    .locals 2

    .prologue
    .line 1666
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x0

    #calls: Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$5000(Lco/vine/android/recorder/VineRecorder;Z)V

    .line 1667
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1603
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 11
    .parameter "aVoid"

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1629
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$4400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/SegmentEditorAdapter;

    move-result-object v0

    .line 1630
    .local v0, adapter:Lco/vine/android/recorder/SegmentEditorAdapter;
    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->isCancelled()Z

    move-result v5

    if-nez v5, :cond_9

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v5

    if-lez v5, :cond_9

    .line 1631
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/player/SdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 1632
    .local v1, group:Landroid/view/ViewGroup;
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoAttr:Landroid/util/AttributeSet;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$4500(Lco/vine/android/recorder/VineRecorder;)Landroid/util/AttributeSet;

    move-result-object v5

    if-nez v5, :cond_0

    .line 1633
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/player/SdkVideoView;->getAttributes()Landroid/util/AttributeSet;

    move-result-object v6

    #setter for: Lco/vine/android/recorder/VineRecorder;->mVideoAttr:Landroid/util/AttributeSet;
    invoke-static {v5, v6}, Lco/vine/android/recorder/VineRecorder;->access$4502(Lco/vine/android/recorder/VineRecorder;Landroid/util/AttributeSet;)Landroid/util/AttributeSet;

    .line 1635
    :cond_0
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1636
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    invoke-virtual {v5, v4}, Lco/vine/android/player/SdkVideoView;->setLooping(Z)V

    .line 1637
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    invoke-virtual {v5, v3}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 1639
    :cond_1
    if-eqz v1, :cond_2

    .line 1640
    new-instance v5, Lco/vine/android/recorder/VineRecorder$EditModePreviewClickListener;

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {v5, v6, v2}, Lco/vine/android/recorder/VineRecorder$EditModePreviewClickListener;-><init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1642
    :cond_2
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 1643
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v5

    new-instance v6, Landroid/graphics/Rect;

    iget-object v7, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I
    invoke-static {v7}, Lco/vine/android/recorder/VineRecorder;->access$2300(Lco/vine/android/recorder/VineRecorder;)I

    move-result v7

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$4800(Lco/vine/android/recorder/VineRecorder;)Landroid/graphics/Point;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Point;->x:I

    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I
    invoke-static {v9}, Lco/vine/android/recorder/VineRecorder;->access$2300(Lco/vine/android/recorder/VineRecorder;)I

    move-result v9

    iget-object v10, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;
    invoke-static {v10}, Lco/vine/android/recorder/VineRecorder;->access$4800(Lco/vine/android/recorder/VineRecorder;)Landroid/graphics/Point;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Point;->x:I

    add-int/2addr v9, v10

    invoke-direct {v6, v3, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v5, v1, v6}, Lco/vine/android/dragsort/DragSortWidget;->setContentView(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1646
    :cond_3
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->adjustEditBoundaries()V
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$4900(Lco/vine/android/recorder/VineRecorder;)V

    .line 1647
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    #setter for: Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v5, v6}, Lco/vine/android/recorder/VineRecorder;->access$3102(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;

    .line 1648
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    if-nez v5, :cond_8

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordingFile;->getPreviewVideoPath()Ljava/lang/String;

    move-result-object v2

    .line 1651
    .local v2, videoPath:Ljava/lang/String;
    :cond_4
    :goto_0
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    if-eqz v5, :cond_7

    if-eqz v2, :cond_7

    .line 1652
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v5

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/dragsort/DragSortWidget;->hasFloatView()Z

    move-result v6

    if-nez v6, :cond_6

    :cond_5
    move v3, v4

    :cond_6
    invoke-virtual {v5, v3}, Lco/vine/android/player/SdkVideoView;->setAutoPlayOnPrepared(Z)V

    .line 1653
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v3, v4}, Lco/vine/android/player/SdkVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 1654
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v3, v4}, Lco/vine/android/player/SdkVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 1655
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v3

    invoke-virtual {v3, v2}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 1662
    .end local v1           #group:Landroid/view/ViewGroup;
    .end local v2           #videoPath:Ljava/lang/String;
    :cond_7
    :goto_1
    return-void

    .line 1648
    .restart local v1       #group:Landroid/view/ViewGroup;
    :cond_8
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->mSegment:Lco/vine/android/recorder/RecordSegment;

    iget-object v2, v5, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    goto :goto_0

    .line 1658
    .end local v1           #group:Landroid/view/ViewGroup;
    :cond_9
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 1659
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    goto :goto_1
.end method
