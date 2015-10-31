.class public Lco/vine/android/recorder/RecordController;
.super Ljava/lang/Object;
.source "RecordController.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Landroid/hardware/Camera$PreviewCallback;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/hardware/Camera$AutoFocusCallback;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/RecordController$1;,
        Lco/vine/android/recorder/RecordController$AudioRecordRunnable;,
        Lco/vine/android/recorder/RecordController$OnRecorderControllerStateChangedListener;,
        Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;,
        Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;
    }
.end annotation


# instance fields
.field private volatile isRecordingStarted:Z

.field private mAudioDataBufferMax:[S

.field private mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

.field private mAudioThread:Ljava/lang/Thread;

.field private volatile mAudioTimeRecorded:J

.field private volatile mAudioTimestamp:J

.field private mAutoFocus:Z

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBuffer:Ljava/nio/ByteBuffer;

.field private final mCameraManager:Lco/vine/android/recorder/CameraManager;

.field private volatile mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

.field private final mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;"
        }
    .end annotation
.end field

.field private mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

.field private mEncodingThreadWasRunning:Z

.field private mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

.field private mFlash:Z

.field private mFrameTime:J

.field private mGhostBitmap:Landroid/graphics/Bitmap;

.field private mGhostCanvas:Landroid/graphics/Canvas;

.field private mGhostFrame:Lco/vine/android/recorder/VideoData;

.field private mInvalidPreviewSizeException:Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

.field private mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

.field private mIsFocusing:Z

.field private mIsRecordingEnded:Z

.field private mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;

.field private mLastAudioTimestamp:J

.field private mLastCameraSetting:Lco/vine/android/recorder/CameraSetting;

.field private mLastFrame:Lco/vine/android/recorder/VideoData;

.field private mLastLastFrame:Lco/vine/android/recorder/VideoData;

.field private mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;

.field public mParent:Lco/vine/android/recorder/VineRecorder;

.field private mPictureConverter:Lco/vine/android/recorder/PictureConverter;

.field private mProcessThread:Ljava/lang/Thread;

.field private mRS:Landroid/support/v8/renderscript/RenderScript;

.field private mRotation:I

.field private volatile mRunAudioThread:Z

.field private mSession:Lco/vine/android/recorder/RecordSession;

.field private mStartTime:J

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mTextureView:Landroid/view/TextureView;

.field private mThumbnailBitmap:Landroid/graphics/Bitmap;

.field private mVideoDataBufferMax:[B

.field private final mVideoRecordLock:[I

.field private mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

.field private mVideoTimestamp:J

.field private volatile recordingAudio:Z


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 3
    .parameter "parent"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 44
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mVideoRecordLock:[I

    .line 50
    iput-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mRunAudioThread:Z

    .line 51
    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    .line 55
    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    .line 56
    iput-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    .line 79
    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    .line 95
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    .line 96
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->getInstance()Lco/vine/android/recorder/CameraManager;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    .line 97
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, p0}, Lco/vine/android/recorder/CameraManager;->setPreviewCallback(Lco/vine/android/recorder/RecordController;)V

    .line 98
    return-void
.end method

.method static synthetic access$100(Lco/vine/android/recorder/RecordController;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lco/vine/android/recorder/RecordController;->updateGhostBitmap(Z)V

    return-void
.end method

.method static synthetic access$1000(Lco/vine/android/recorder/RecordController;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->recordingAudio:Z

    return v0
.end method

.method static synthetic access$1100(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;

    return-object v0
.end method

.method static synthetic access$1102(Lco/vine/android/recorder/RecordController;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;

    return-object p1
.end method

.method static synthetic access$1200(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/recorder/RecordController;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 40
    iget-wide v0, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    return-wide v0
.end method

.method static synthetic access$302(Lco/vine/android/recorder/RecordController;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput-wide p1, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    return-wide p1
.end method

.method static synthetic access$402(Lco/vine/android/recorder/RecordController;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 40
    iput-wide p1, p0, Lco/vine/android/recorder/RecordController;->mAudioTimeRecorded:J

    return-wide p1
.end method

.method static synthetic access$500(Lco/vine/android/recorder/RecordController;)[S
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioDataBufferMax:[S

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/recorder/RecordController;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mRunAudioThread:Z

    return v0
.end method

.method static synthetic access$700(Lco/vine/android/recorder/RecordController;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 40
    iget-wide v0, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    return-wide v0
.end method

.method static synthetic access$800(Lco/vine/android/recorder/RecordController;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mIsRecordingEnded:Z

    return v0
.end method

.method static synthetic access$900(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 40
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    return-object v0
.end method

.method private onSurfaceCreated()V
    .locals 1

    .prologue
    .line 465
    const-string v0, "Surface created..."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 466
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p0}, Lco/vine/android/recorder/VineRecorder;->onSurfaceReady(Lco/vine/android/recorder/RecordController;)V

    .line 467
    return-void
.end method

.method private onSurfaceDestroyed()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 470
    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 471
    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    .line 472
    return-void
.end method

.method private onSurfaceUpdated()V
    .locals 1

    .prologue
    .line 719
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    if-nez v0, :cond_0

    .line 720
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 721
    const-string v0, "Surface updated. mCameraManager is previewing..."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 723
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->stopPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 727
    :goto_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 728
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->startPreview()V

    .line 732
    :cond_0
    return-void

    .line 724
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private updateGhostBitmap(Z)V
    .locals 6
    .parameter "updateForParent"

    .prologue
    .line 421
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget-object v3, v2, Lco/vine/android/recorder/PictureConverter;->LOCK:[I

    monitor-enter v3

    .line 422
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    iget-object v2, v2, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v0

    .line 423
    .local v0, cameraSetting:Lco/vine/android/recorder/CameraSetting;
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    invoke-virtual {v2, v0}, Lco/vine/android/recorder/PictureConverter;->updateSettingsIfNeeded(Lco/vine/android/recorder/CameraSetting;)Z

    move-result v1

    .line 424
    .local v1, hasChanged:Z
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget v4, v0, Lco/vine/android/recorder/CameraSetting;->degrees:I

    iget-boolean v5, v0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    invoke-virtual {v2, v4, v5}, Lco/vine/android/recorder/PictureConverter;->giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(IZ)V

    .line 425
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    invoke-virtual {v2, v0, v4, v1}, Lco/vine/android/recorder/PictureConverter;->convert(Lco/vine/android/recorder/CameraSetting;Lco/vine/android/recorder/VideoData;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 426
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mGhostCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v2, v4}, Lco/vine/android/recorder/PictureConverter;->draw(Landroid/graphics/Canvas;)V

    .line 427
    if-eqz p1, :cond_0

    .line 428
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mGhostBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v4}, Lco/vine/android/recorder/VineRecorder;->updateGhostBitmap(Landroid/graphics/Bitmap;)V

    .line 431
    :cond_0
    monitor-exit v3

    .line 432
    return-void

    .line 431
    .end local v0           #cameraSetting:Lco/vine/android/recorder/CameraSetting;
    .end local v1           #hasChanged:Z
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private writeToFile(Ljava/util/ArrayList;[B[SZI)V
    .locals 12
    .parameter
    .parameter "videoData"
    .parameter "audioData"
    .parameter "preview"
    .parameter "frameRate"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;[B[SZI)V"
        }
    .end annotation

    .prologue
    .line 301
    .local p1, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    :try_start_0
    const-string v2, "Write to file: {}"

    invoke-static/range {p4 .. p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 302
    :goto_0
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    iget-boolean v2, v2, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    if-eqz v2, :cond_0

    .line 303
    const-wide/16 v2, 0x14

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 305
    :catch_0
    move-exception v11

    .line 306
    .local v11, e:Ljava/lang/InterruptedException;
    const-string v2, "No..."

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 309
    .end local v11           #e:Ljava/lang/InterruptedException;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_1

    .line 310
    const/16 v2, 0x1e0

    const/16 v3, 0x1e0

    sget-object v4, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    .line 314
    :cond_1
    if-eqz p4, :cond_2

    .line 315
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v3}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordingFile;->getPreviewVideoPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".temp_video.mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1e0

    move/from16 v0, p5

    invoke-static {v2, v0, v3}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;II)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v7

    .line 318
    .local v7, videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    invoke-virtual {v7}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V

    .line 322
    :goto_1
    new-instance v1, Lco/vine/android/recorder/CombingRunnable;

    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v2

    iget-object v8, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    iget-object v9, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->getFrameBuffer()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v10

    move/from16 v3, p4

    move-object v4, p3

    move-object v5, p2

    move-object v6, p1

    invoke-direct/range {v1 .. v10}, Lco/vine/android/recorder/CombingRunnable;-><init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLjava/util/ArrayList;Lco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    .line 325
    .local v1, combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    invoke-virtual {v1}, Lco/vine/android/recorder/CombingRunnable;->run()V

    .line 329
    .end local v1           #combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    .end local v7           #videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :goto_2
    return-void

    .line 320
    :cond_2
    iget-object v7, p0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :try_end_1
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_1 .. :try_end_1} :catch_1

    .restart local v7       #videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    goto :goto_1

    .line 326
    .end local v7           #videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catch_1
    move-exception v11

    .line 327
    .local v11, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v2, "Cannot start audio recorder. "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v11, v2, v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2
.end method


# virtual methods
.method public autoFocus(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 159
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    if-nez v0, :cond_0

    .line 160
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, p1, p2}, Lco/vine/android/recorder/CameraManager;->setFocusAreas(II)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, p0}, Lco/vine/android/recorder/CameraManager;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    .line 162
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p1, p2}, Lco/vine/android/recorder/VineRecorder;->showFocusIndicator(II)V

    .line 165
    :cond_0
    return-void
.end method

.method public canChangeFocus()Z
    .locals 1

    .prologue
    .line 624
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->canChangeFocus()Z

    move-result v0

    return v0
.end method

.method public finishLastIfNeeded()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 200
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mEncodingThreadWasRunning:Z

    .line 207
    return-void

    .line 203
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    const/16 v1, 0x1e0

    .line 653
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 654
    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    .line 657
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getCameraSetting()Lco/vine/android/recorder/CameraSetting;
    .locals 1

    .prologue
    .line 336
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v0

    return-object v0
.end method

.method public getFinishProcessTask()Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    .locals 1

    .prologue
    .line 670
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    return-object v0
.end method

.method public getFrameBuffer()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 3

    .prologue
    const/16 v2, 0x1e0

    .line 661
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-nez v0, :cond_0

    .line 662
    const/16 v0, 0x8

    const/4 v1, 0x4

    invoke-static {v2, v2, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 666
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    return-object v0
.end method

.method protected getGhostBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 4

    .prologue
    .line 808
    const-string v0, "Recorder Timestamp: {}."

    iget-wide v1, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 809
    iget-wide v0, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method protected initializeGhostBitmapsIfNeeded()V
    .locals 2

    .prologue
    const/16 v1, 0x1e0

    .line 777
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 778
    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostBitmap:Landroid/graphics/Bitmap;

    .line 779
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mGhostBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostCanvas:Landroid/graphics/Canvas;

    .line 781
    :cond_0
    return-void
.end method

.method public invalidateGhostFrame()V
    .locals 1

    .prologue
    .line 674
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    .line 675
    return-void
.end method

.method public isAudioReady()Z
    .locals 1

    .prologue
    .line 332
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCameraReady()Z
    .locals 1

    .prologue
    .line 461
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isCameraReady()Z

    move-result v0

    return v0
.end method

.method public isFlashSupported()Z
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isFlashSupported()Z

    move-result v0

    return v0
.end method

.method public isPreviewing()Z
    .locals 1

    .prologue
    .line 620
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v0

    return v0
.end method

.method public isRecording()Z
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRecordingStarted()Z
    .locals 1

    .prologue
    .line 515
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    return v0
.end method

.method public isSurfaceReady()Z
    .locals 1

    .prologue
    .line 457
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public logPreviewSizeExceptionIfNeeded()V
    .locals 1

    .prologue
    .line 340
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mInvalidPreviewSizeException:Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    if-eqz v0, :cond_0

    .line 341
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mInvalidPreviewSizeException:Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 343
    :cond_0
    return-void
.end method

.method public makePreview(Lco/vine/android/recorder/RecordSegment;Z)V
    .locals 9
    .parameter "segment"
    .parameter "getLastSegmentOnlyMode"

    .prologue
    .line 276
    if-nez p2, :cond_0

    :try_start_0
    iget-object v1, p1, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    iget-object v2, p1, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 277
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordingFile;->getPreviewVideoPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".temp_video.mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v2

    iget v2, v2, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    const/16 v4, 0x1e0

    invoke-static {v1, v2, v4}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;II)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v3

    .line 280
    .local v3, videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    invoke-virtual {v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V

    .line 281
    new-instance v0, Lco/vine/android/recorder/CombingRunnable;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->getFrameBuffer()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v6

    move-object v2, p1

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lco/vine/android/recorder/CombingRunnable;-><init>(Lco/vine/android/recorder/RecordingFile;Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Z)V

    .line 283
    .local v0, combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    invoke-virtual {v0}, Lco/vine/android/recorder/CombingRunnable;->run()V
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    .end local v0           #combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    .end local v3           #videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :cond_1
    :goto_0
    return-void

    .line 285
    :catch_0
    move-exception v8

    .line 286
    .local v8, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v1, "Cannot start audio recorder"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v8, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public modifyZoom(Z)V
    .locals 1
    .parameter "zoomIn"

    .prologue
    .line 556
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/CameraManager;->modifyZoom(Z)I

    .line 557
    return-void
.end method

.method public offerLastFrame(Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VideoData;)V
    .locals 7
    .parameter "segment"
    .parameter "next"

    .prologue
    .line 784
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mVideoRecordLock:[I

    monitor-enter v2

    .line 785
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    if-eqz v1, :cond_1

    .line 786
    iget-wide v3, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mFrameTime:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    .line 787
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    iget-wide v3, v1, Lco/vine/android/recorder/VideoData;->timestamp:J

    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    cmp-long v1, v3, v5

    if-lez v1, :cond_0

    .line 788
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    iget-wide v3, v1, Lco/vine/android/recorder/VideoData;->timestamp:J

    iput-wide v3, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    .line 790
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    invoke-virtual {v1, p1}, Lco/vine/android/recorder/VideoData;->setSegment(Lco/vine/android/recorder/RecordSegment;)V

    .line 791
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordSegment;->getVideoData()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 792
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    invoke-virtual {v1, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 794
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v1}, Lco/vine/android/recorder/CameraManager;->getSharedByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 795
    .local v0, bb:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 796
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    iget-object v1, v1, Lco/vine/android/recorder/VideoData;->data:[B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 797
    new-instance v1, Lco/vine/android/recorder/VideoData;

    const-wide/16 v3, 0x0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-direct {v1, v3, v4, v5}, Lco/vine/android/recorder/VideoData;-><init>(J[B)V

    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    .line 798
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    invoke-virtual {v1, p1}, Lco/vine/android/recorder/VideoData;->setSegment(Lco/vine/android/recorder/RecordSegment;)V

    .line 799
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;

    .line 801
    const-string v1, "Video timestamp {}, actual {}, segment: {}"

    iget-wide v3, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    iget-wide v4, v4, Lco/vine/android/recorder/VideoData;->timestamp:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v3, v4, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 802
    iput-object p2, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    .line 804
    .end local v0           #bb:Ljava/nio/ByteBuffer;
    :cond_1
    monitor-exit v2

    .line 805
    return-void

    .line 804
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onAutoFocus(ZLandroid/hardware/Camera;)V
    .locals 1
    .parameter "success"
    .parameter "camera"

    .prologue
    .line 629
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    .line 630
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/VineRecorder;->onAutoFocusComplete(Z)V

    .line 631
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 168
    invoke-virtual {p0, v1}, Lco/vine/android/recorder/RecordController;->setRecording(Lco/vine/android/recorder/RecordSegment;)V

    .line 169
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->releaseCameraAndPreview()V

    .line 170
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->setPreviewCallback(Lco/vine/android/recorder/RecordController;)V

    .line 171
    return-void
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 11
    .parameter "data"
    .parameter "camera"

    .prologue
    const-wide/16 v9, 0x3e8

    const-wide/16 v3, 0x0

    .line 737
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    cmp-long v5, v5, v3

    if-nez v5, :cond_1

    .line 739
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mStartTime:J

    cmp-long v5, v5, v3

    if-lez v5, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v7, p0, Lco/vine/android/recorder/RecordController;->mStartTime:J

    sub-long/2addr v5, v7

    mul-long v3, v5, v9

    .line 751
    .local v3, timestamp:J
    :cond_0
    :goto_0
    if-nez p1, :cond_3

    .line 752
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    new-instance v6, Lco/vine/android/VineException;

    const-string v7, "Camera is not supported yet."

    invoke-direct {v6, v7}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lco/vine/android/recorder/VineRecorder;->onDeviceNotSupported(Ljava/lang/Throwable;)V

    .line 774
    :goto_1
    return-void

    .line 742
    .end local v3           #timestamp:J
    :cond_1
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mLastAudioTimestamp:J

    iget-wide v7, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    cmp-long v5, v5, v7

    if-nez v5, :cond_2

    .line 743
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    iget-wide v7, p0, Lco/vine/android/recorder/RecordController;->mFrameTime:J

    add-long v3, v5, v7

    .restart local v3       #timestamp:J
    goto :goto_0

    .line 745
    .end local v3           #timestamp:J
    :cond_2
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    iget-wide v7, p0, Lco/vine/android/recorder/RecordController;->mAudioTimeRecorded:J

    sub-long/2addr v5, v7

    div-long v0, v5, v9

    .line 746
    .local v0, offset:J
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    add-long v3, v0, v5

    .line 747
    .restart local v3       #timestamp:J
    iget-wide v5, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    iput-wide v5, p0, Lco/vine/android/recorder/RecordController;->mLastAudioTimestamp:J

    .line 748
    const-string v5, "Offset {}."

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 756
    .end local v0           #offset:J
    :cond_3
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v5, p1}, Lco/vine/android/recorder/CameraManager;->removeBufferFromAvailableQueue([B)V

    .line 757
    iget-object v6, p0, Lco/vine/android/recorder/RecordController;->mVideoRecordLock:[I

    monitor-enter v6

    .line 758
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 759
    .local v2, segment:Lco/vine/android/recorder/RecordSegment;
    if-eqz v2, :cond_5

    .line 760
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    if-nez v5, :cond_4

    .line 761
    new-instance v5, Lco/vine/android/recorder/VideoData;

    invoke-direct {v5, v3, v4, p1}, Lco/vine/android/recorder/VideoData;-><init>(J[B)V

    iput-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    .line 762
    const/4 v5, 0x0

    invoke-virtual {p0, v2, v5}, Lco/vine/android/recorder/RecordController;->offerLastFrame(Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VideoData;)V

    .line 773
    :goto_2
    monitor-exit v6

    goto :goto_1

    .end local v2           #segment:Lco/vine/android/recorder/RecordSegment;
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 764
    .restart local v2       #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_4
    :try_start_1
    new-instance v5, Lco/vine/android/recorder/VideoData;

    invoke-direct {v5, v3, v4, p1}, Lco/vine/android/recorder/VideoData;-><init>(J[B)V

    invoke-virtual {p0, v2, v5}, Lco/vine/android/recorder/RecordController;->offerLastFrame(Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VideoData;)V

    goto :goto_2

    .line 767
    :cond_5
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastLastFrame:Lco/vine/android/recorder/VideoData;

    if-eqz v5, :cond_6

    .line 768
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v7, p0, Lco/vine/android/recorder/RecordController;->mLastLastFrame:Lco/vine/android/recorder/VideoData;

    iget-object v7, v7, Lco/vine/android/recorder/VideoData;->data:[B

    invoke-virtual {v5, v7}, Lco/vine/android/recorder/CameraManager;->addCallbackBuffer([B)V

    .line 770
    :cond_6
    iget-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    iput-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastLastFrame:Lco/vine/android/recorder/VideoData;

    .line 771
    new-instance v5, Lco/vine/android/recorder/VideoData;

    invoke-direct {v5, v3, v4, p1}, Lco/vine/android/recorder/VideoData;-><init>(J[B)V

    iput-object v5, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 695
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 696
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceCreated()V

    .line 697
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .parameter "surface"

    .prologue
    .line 708
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceDestroyed()V

    .line 709
    const/4 v0, 0x1

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 701
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 702
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceCreated()V

    .line 703
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceUpdated()V

    .line 704
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .parameter "surface"

    .prologue
    .line 714
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 715
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceUpdated()V

    .line 716
    return-void
.end method

.method public openDefaultCamera(ZZ)Z
    .locals 6
    .parameter "frontFacing"
    .parameter "reOpen"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 178
    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v4, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v4

    iget v5, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    invoke-virtual {v3, v4, p1, v5, p2}, Lco/vine/android/recorder/CameraManager;->openDefaultCamera(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;ZIZ)Lco/vine/android/recorder/CameraSetting;

    move-result-object v0

    .line 179
    .local v0, cameraSetting:Lco/vine/android/recorder/CameraSetting;
    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mLastCameraSetting:Lco/vine/android/recorder/CameraSetting;

    .line 180
    if-eqz v0, :cond_0

    .line 181
    const-string v3, "Received camera info."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 182
    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget v4, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-virtual {v3, v4}, Lco/vine/android/recorder/CameraManager;->setPreviewHeight(I)V

    .line 183
    iget-object v3, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget v4, v0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    invoke-virtual {v3, v4}, Lco/vine/android/recorder/CameraManager;->setPreviewWidth(I)V

    .line 184
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->startPreview()V

    .line 185
    iput-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    .line 186
    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v2, p0}, Lco/vine/android/recorder/VineRecorder;->onCameraReady(Lco/vine/android/recorder/RecordController;)V

    .line 190
    :goto_0
    return v1

    .line 189
    :cond_0
    const-string v3, "Failed to open camera: {}."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v3, v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v2

    .line 190
    goto :goto_0
.end method

.method public refreshBufferMax(Lco/vine/android/recorder/RecordSession;)V
    .locals 1
    .parameter "session"

    .prologue
    .line 813
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    .line 814
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mVideoDataBufferMax:[B

    .line 815
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioDataBufferMax:[S

    .line 816
    return-void
.end method

.method public releaseCallbacks()V
    .locals 2

    .prologue
    .line 599
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-eqz v0, :cond_0

    .line 600
    const-string v0, "releasing surface holder callback"

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 601
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 603
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_1

    .line 604
    const-string v0, "releasing surface holder callback"

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 605
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 607
    :cond_1
    return-void
.end method

.method protected releaseCameraAndPreview()V
    .locals 1

    .prologue
    .line 452
    const-string v0, "Release camera and preview."

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 453
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->releaseCameraAndPreview()V

    .line 454
    return-void
.end method

.method public releaseCameraResources()V
    .locals 1

    .prologue
    .line 564
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->releaseCameraResources()V

    .line 565
    return-void
.end method

.method public releaseParent()V
    .locals 1

    .prologue
    .line 568
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    .line 569
    return-void
.end method

.method public releaseResources()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 573
    const-string v0, "releaseResources"

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 574
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-eqz v0, :cond_0

    .line 575
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->release()V

    .line 577
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 578
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 579
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mBuffer:Ljava/nio/ByteBuffer;

    .line 580
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    if-eqz v0, :cond_1

    .line 581
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->destroy()V

    .line 582
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    .line 584
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 585
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 587
    :cond_2
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mBitmap:Landroid/graphics/Bitmap;

    .line 588
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    .line 589
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 591
    :cond_3
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 592
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;

    .line 593
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;

    .line 594
    iput-object v1, p0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    .line 595
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 596
    return-void
.end method

.method public requestGhostDrawing(Z)V
    .locals 2
    .parameter "synchronous"

    .prologue
    .line 634
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    if-eqz v0, :cond_0

    .line 635
    if-eqz p1, :cond_1

    .line 636
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->initializeGhostBitmapsIfNeeded()V

    .line 637
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/recorder/RecordController;->updateGhostBitmap(Z)V

    .line 642
    :cond_0
    :goto_0
    return-void

    .line 639
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/RecordController$GhostUpdateRunnable;-><init>(Lco/vine/android/recorder/RecordController;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public setAudioTimestamp(I)V
    .locals 2
    .parameter "timeStampInNsFromSampleCounted"

    .prologue
    .line 645
    int-to-long v0, p1

    iput-wide v0, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    .line 646
    return-void
.end method

.method public setAutoFocus(Z)V
    .locals 3
    .parameter "isOn"

    .prologue
    .line 137
    iput-boolean p1, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    .line 139
    :try_start_0
    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    if-eqz v1, :cond_1

    .line 140
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v1}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 141
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v2}, Lco/vine/android/recorder/CameraManager;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/CameraManager;->startContinuousAutoFocus(Landroid/hardware/Camera$Parameters;)Z

    .line 156
    :cond_0
    :goto_0
    return-void

    .line 144
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v1}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v2, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v2}, Lco/vine/android/recorder/CameraManager;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/CameraManager;->allowSetFocus(Landroid/hardware/Camera$Parameters;)Z

    .line 146
    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z

    if-nez v1, :cond_0

    .line 147
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v1, p0}, Lco/vine/android/recorder/CameraManager;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 148
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mIsFocusing:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "It\'s ok if we failed to auto focus here."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setFinishProcessTask(Lco/vine/android/recorder/VineRecorder$FinishProcessTask;)V
    .locals 2
    .parameter "finishProcessTask"

    .prologue
    .line 549
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    .line 550
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/EncodingRunnable;->setAsyncTask(Lco/vine/android/recorder/VineRecorder$FinishProcessTask;)V

    .line 553
    :cond_0
    return-void
.end method

.method public setPreviewSurface(Landroid/view/View;)V
    .locals 1
    .parameter "previewView"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 610
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0, p0}, Lco/vine/android/recorder/CameraManager;->setPreviewCallback(Lco/vine/android/recorder/RecordController;)V

    .line 611
    instance-of v0, p1, Landroid/view/TextureView;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 612
    check-cast v0, Landroid/view/TextureView;

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/RecordController;->switchSurface(Landroid/view/TextureView;)V

    .line 614
    :cond_0
    instance-of v0, p1, Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 615
    check-cast p1, Landroid/view/SurfaceView;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/RecordController;->switchSurface(Landroid/view/SurfaceView;)V

    .line 617
    :cond_1
    return-void
.end method

.method public setRecording(Lco/vine/android/recorder/RecordSegment;)V
    .locals 2
    .parameter "segment"

    .prologue
    .line 539
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 540
    if-eqz p1, :cond_0

    .line 541
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/recorder/RecordController;->mStartTime:J

    .line 542
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v0

    invoke-virtual {p1, v0}, Lco/vine/android/recorder/RecordSegment;->setCameraSetting(Lco/vine/android/recorder/CameraSetting;)Lco/vine/android/recorder/RecordSegment;

    .line 544
    :cond_0
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 546
    :cond_1
    return-void
.end method

.method public setRecordingAudio(Z)V
    .locals 0
    .parameter "recordingAudio"

    .prologue
    .line 560
    iput-boolean p1, p0, Lco/vine/android/recorder/RecordController;->recordingAudio:Z

    .line 561
    return-void
.end method

.method public setVideoTimeStamp(J)V
    .locals 0
    .parameter "timestamp"

    .prologue
    .line 649
    iput-wide p1, p0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    .line 650
    return-void
.end method

.method public declared-synchronized start(Landroid/app/Activity;Ljava/lang/String;II)Z
    .locals 20
    .parameter "activity"
    .parameter "output"
    .parameter "currentAudioSampleCount"
    .parameter "currentVideoSampleCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;
        }
    .end annotation

    .prologue
    .line 349
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v3}, Lco/vine/android/recorder/CameraManager;->isCameraReady()Z

    move-result v3

    if-nez v3, :cond_0

    .line 350
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "You have to choose a camera via open() first."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 349
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 352
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    if-nez v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v3, :cond_1

    .line 353
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "You have to set a preview surface via switchSurface first."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 355
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    if-eqz v3, :cond_2

    .line 356
    new-instance v3, Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;

    invoke-direct {v3}, Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;-><init>()V

    throw v3

    .line 358
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v3}, Lco/vine/android/recorder/CameraManager;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v16

    .line 359
    .local v16, cs:Lco/vine/android/recorder/CameraSetting;
    if-nez v16, :cond_3

    .line 360
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Camera is ready but camera setting is null, something is terribly wrong."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 362
    :cond_3
    const-string v3, "START Recorder"

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 363
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lco/vine/android/recorder/RecordController;->mIsRecordingEnded:Z

    .line 364
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    .line 365
    new-instance v3, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;-><init>(Lco/vine/android/recorder/RecordController;Ljava/lang/String;ILco/vine/android/recorder/RecordController$1;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    .line 366
    const-string v3, "Audio recorder initialized with count {}."

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 367
    const-string v3, "Starting timestamps: {}"

    move-object/from16 v0, p0

    iget-wide v4, v0, Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, p0

    iget-wide v5, v0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 368
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lco/vine/android/recorder/RecordController;->mRunAudioThread:Z

    .line 369
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    .line 370
    new-instance v3, Ljava/lang/Thread;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    const-string v5, "AudioRunnable"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mAudioThread:Ljava/lang/Thread;

    .line 371
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mAudioThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 372
    const-wide/16 v3, 0x0

    move-object/from16 v0, p0

    iput-wide v3, v0, Lco/vine/android/recorder/RecordController;->mStartTime:J

    .line 373
    move-object/from16 v0, v16

    iget v8, v0, Lco/vine/android/recorder/CameraSetting;->frameRate:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 374
    .local v8, frameRate:I
    const/16 v18, 0x1e0

    .line 377
    .local v18, targetSize:I
    :try_start_2
    invoke-static/range {p1 .. p1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tryLoad(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 381
    :goto_0
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->updateTimestamp()V

    .line 382
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    if-nez v3, :cond_4

    .line 383
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".video.mp4"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1e0

    invoke-static {v3, v8, v4}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;II)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 385
    :try_start_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 390
    :cond_4
    :try_start_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-nez v3, :cond_5

    .line 391
    const/16 v3, 0x1e0

    const/16 v4, 0x1e0

    const/16 v5, 0x8

    const/4 v6, 0x4

    invoke-static {v3, v4, v5, v6}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mIplImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 393
    :cond_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    if-nez v3, :cond_6

    .line 394
    invoke-static/range {p1 .. p1}, Landroid/support/v8/renderscript/RenderScript;->create(Landroid/content/Context;)Landroid/support/v8/renderscript/RenderScript;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    .line 396
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mBuffer:Ljava/nio/ByteBuffer;

    if-nez v3, :cond_7

    .line 397
    const v3, 0xe1000

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mBuffer:Ljava/nio/ByteBuffer;

    .line 400
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v3}, Lco/vine/android/recorder/VineRecorder;->getSize()Landroid/graphics/Point;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Point;->x:I

    div-int/lit8 v19, v3, 0x2

    .line 402
    .local v19, thumbnailSize:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    if-nez v3, :cond_8

    .line 403
    sget-object v3, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    move/from16 v0, v19

    move/from16 v1, v19

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 406
    :cond_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v3}, Lco/vine/android/recorder/CameraManager;->isCameraReady()Z

    move-result v3

    if-nez v3, :cond_9

    .line 407
    new-instance v3, Lco/vine/android/VineException;

    const-string v4, "Camera was released already. "

    invoke-direct {v3, v4}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 408
    const/4 v3, 0x0

    .line 417
    :goto_1
    monitor-exit p0

    return v3

    .line 378
    .end local v19           #thumbnailSize:I
    :catch_0
    move-exception v17

    .line 379
    .local v17, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    :try_start_6
    const-string v3, "Failed to load native libraries."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v17

    invoke-static {v0, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 386
    .end local v17           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    :catch_1
    move-exception v17

    .line 387
    .restart local v17       #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    move-object/from16 v0, v17

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 411
    .end local v17           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .restart local v19       #thumbnailSize:I
    :cond_9
    new-instance v3, Lco/vine/android/recorder/PictureConverter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/RecordController;->mRS:Landroid/support/v8/renderscript/RenderScript;

    const/16 v5, 0x1e0

    move-object/from16 v0, v16

    invoke-direct {v3, v4, v5, v0}, Lco/vine/android/recorder/PictureConverter;-><init>(Landroid/support/v8/renderscript/RenderScript;ILco/vine/android/recorder/CameraSetting;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    .line 413
    new-instance v3, Lco/vine/android/recorder/EncodingRunnable;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/RecordController;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/recorder/RecordController;->mVideoDataBufferMax:[B

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/RecordController;->getFrameBuffer()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v10, v0, Lco/vine/android/recorder/RecordController;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/RecordController;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/recorder/RecordController;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/recorder/RecordController;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    move-object/from16 v6, p0

    move-object/from16 v7, p2

    move/from16 v14, p4

    invoke-direct/range {v3 .. v15}, Lco/vine/android/recorder/EncodingRunnable;-><init>(Ljava/util/concurrent/ConcurrentLinkedQueue;[BLco/vine/android/recorder/RecordController;Ljava/lang/String;ILcom/googlecode/javacv/cpp/opencv_core$IplImage;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lco/vine/android/recorder/PictureConverter;ILco/vine/android/recorder/CameraManager;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    .line 415
    new-instance v3, Ljava/lang/Thread;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    const-string v5, "EncodingRunnable"

    invoke-direct {v3, v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    .line 416
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 417
    const/4 v3, 0x1

    goto :goto_1
.end method

.method public startPreview()V
    .locals 14

    .prologue
    .line 475
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isCameraReady()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 476
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v0}, Lco/vine/android/recorder/CameraManager;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v7

    .line 477
    .local v7, cs:Lco/vine/android/recorder/CameraSetting;
    if-eqz v7, :cond_0

    .line 478
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->setFrameRate(I)I

    move-result v0

    iput v0, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    .line 479
    iget v0, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    if-lez v0, :cond_0

    .line 480
    const-wide/32 v0, 0xf4240

    iget v2, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    iput-wide v0, p0, Lco/vine/android/recorder/RecordController;->mFrameTime:J

    .line 481
    const-string v0, "Determined frame rate: {}, frame time: {}."

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-wide v2, p0, Lco/vine/android/recorder/RecordController;->mFrameTime:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 483
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_1

    .line 484
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    iget-boolean v3, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    iget v4, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    iget v5, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    iget-wide v10, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v6, v10

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/graphics/SurfaceTexture;ZZIII)V

    .line 508
    .end local v7           #cs:Lco/vine/android/recorder/CameraSetting;
    :cond_0
    :goto_0
    return-void

    .line 486
    .restart local v7       #cs:Lco/vine/android/recorder/CameraSetting;
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    iget-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    iget-boolean v3, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    iget v4, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    iget v5, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    iget-wide v10, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v6, v10

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/view/Surface;ZZIII)V
    :try_end_0
    .catch Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 488
    :catch_0
    move-exception v8

    .line 489
    .local v8, e:Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;
    const/16 v0, 0xf0

    iput v0, v7, Lco/vine/android/recorder/CameraSetting;->originalH:I

    .line 490
    const/16 v0, 0x140

    iput v0, v7, Lco/vine/android/recorder/CameraSetting;->originalW:I

    .line 491
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CAUGHT INVALID PREVIEW SIZE, trying to use a smaller size again: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->originalW:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " * "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ff: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, v7, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 492
    iput-object v8, p0, Lco/vine/android/recorder/RecordController;->mInvalidPreviewSizeException:Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    .line 493
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->originalH:I

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->setPreviewHeight(I)V

    .line 494
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget v1, v7, Lco/vine/android/recorder/CameraSetting;->originalW:I

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->setPreviewWidth(I)V

    .line 496
    :try_start_1
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_2

    .line 497
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    iget-boolean v3, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    iget v4, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    iget v5, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    iget-wide v10, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v6, v10

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/graphics/SurfaceTexture;ZZIII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 501
    :catch_1
    move-exception v9

    .line 502
    .local v9, e2:Ljava/lang/Exception;
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 499
    .end local v9           #e2:Ljava/lang/Exception;
    :cond_2
    :try_start_2
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    iget-boolean v2, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    iget-boolean v3, p0, Lco/vine/android/recorder/RecordController;->mAutoFocus:Z

    iget v4, v7, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    iget v5, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    iget-wide v10, p0, Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v6, v10

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/view/Surface;ZZIII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0
.end method

.method public stop(ZZ)V
    .locals 5
    .parameter "discard"
    .parameter "stopPreview"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 210
    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    if-nez v1, :cond_0

    .line 211
    sget-boolean v1, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v1, :cond_0

    .line 212
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "You can\'t stop before you have start it."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 216
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mRunAudioThread:Z

    .line 217
    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    if-eqz v1, :cond_3

    .line 218
    const-string v1, "Finishing recording, calling stop and release on recorder"

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 219
    if-eqz p2, :cond_5

    .line 220
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->releaseCameraAndPreview()V

    .line 224
    :goto_0
    const-string v1, "Waiting..........."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 225
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    .line 226
    if-eqz p1, :cond_6

    .line 227
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    if-eqz v1, :cond_1

    .line 228
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mEncodingRunnable:Lco/vine/android/recorder/EncodingRunnable;

    invoke-virtual {v1}, Lco/vine/android/recorder/EncodingRunnable;->terminate()V

    .line 230
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    if-eqz v1, :cond_2

    .line 231
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mProcessThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->finishLastIfNeeded()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 238
    :goto_1
    :try_start_2
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->releaseResources()V

    .line 257
    :cond_3
    :goto_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mIsRecordingEnded:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 261
    :goto_3
    iput-boolean v3, p0, Lco/vine/android/recorder/RecordController;->isRecordingStarted:Z

    .line 262
    if-eqz p2, :cond_9

    .line 263
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->releaseCameraAndPreview()V

    .line 268
    :goto_4
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    if-eqz v1, :cond_4

    .line 269
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mFinishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publish(I)V

    .line 271
    :cond_4
    const-string v1, "Recorder is stopped."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 272
    return-void

    .line 222
    :cond_5
    :try_start_3
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/CameraManager;->setPreviewCallback(Lco/vine/android/recorder/RecordController;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Stop failed"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3

    .line 235
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 236
    .restart local v0       #e:Ljava/lang/Exception;
    :try_start_4
    const-string v1, "discard failed."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 240
    .end local v0           #e:Ljava/lang/Exception;
    :cond_6
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_7

    .line 241
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mEncodingThreadWasRunning:Z

    goto :goto_2

    .line 243
    :cond_7
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v1

    if-nez v1, :cond_8

    .line 244
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mEncodingThreadWasRunning:Z

    .line 246
    :cond_8
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->finishLastIfNeeded()V

    .line 247
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v1

    if-nez v1, :cond_3

    .line 248
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 249
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 250
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lco/vine/android/recorder/RecordController;->writeToFile(Z)V

    .line 251
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController;->releaseResources()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2

    .line 265
    :cond_9
    iget-object v1, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    invoke-virtual {v1, v4}, Lco/vine/android/recorder/CameraManager;->setPreviewCallback(Lco/vine/android/recorder/RecordController;)V

    goto :goto_4
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .parameter "holder"
    .parameter "format"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 527
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 528
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    .line 529
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceCreated()V

    .line 530
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceUpdated()V

    .line 531
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .parameter "holder"

    .prologue
    .line 520
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 521
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurface:Landroid/view/Surface;

    .line 522
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceCreated()V

    .line 523
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0
    .parameter "holder"

    .prologue
    .line 535
    invoke-direct {p0}, Lco/vine/android/recorder/RecordController;->onSurfaceDestroyed()V

    .line 536
    return-void
.end method

.method public swapSession()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 101
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    .line 102
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mVideoDataBufferMax:[B

    .line 103
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioDataBufferMax:[S

    .line 104
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 105
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mLastFrame:Lco/vine/android/recorder/VideoData;

    .line 106
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mLastLastFrame:Lco/vine/android/recorder/VideoData;

    .line 107
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;

    .line 108
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;

    .line 109
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mIsRecordingEnded:Z

    .line 110
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    .line 111
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    if-eqz v0, :cond_0

    .line 113
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->forceQuit:Z

    .line 116
    :cond_0
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mAudioThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    :cond_1
    :goto_0
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mAudioThread:Ljava/lang/Thread;

    .line 122
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mAudioRunnable:Lco/vine/android/recorder/RecordController$AudioRecordRunnable;

    .line 123
    iput-object v2, p0, Lco/vine/android/recorder/RecordController;->mGhostFrame:Lco/vine/android/recorder/VideoData;

    .line 124
    return-void

    .line 117
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public switchFlash()V
    .locals 2

    .prologue
    .line 132
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    .line 133
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    iget-boolean v1, p0, Lco/vine/android/recorder/RecordController;->mFlash:Z

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->changeFlashState(Z)V

    .line 134
    return-void

    .line 132
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public switchSurface(Landroid/view/SurfaceView;)V
    .locals 1
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 447
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 448
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 449
    return-void
.end method

.method public switchSurface(Landroid/view/TextureView;)V
    .locals 3
    .parameter "view"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 439
    iput-object p1, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    .line 440
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 441
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 442
    invoke-virtual {p1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/TextureView;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/TextureView;->getHeight()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lco/vine/android/recorder/RecordController;->onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V

    .line 444
    :cond_0
    return-void
.end method

.method public updateRotation(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 128
    invoke-static {p1}, Lco/vine/android/recorder/CameraManager;->getCameraRotation(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/RecordController;->mRotation:I

    .line 129
    return-void
.end method

.method public wasEncodingThreadRunning()Z
    .locals 1

    .prologue
    .line 195
    iget-boolean v0, p0, Lco/vine/android/recorder/RecordController;->mEncodingThreadWasRunning:Z

    return v0
.end method

.method public writeToFile(Ljava/util/ArrayList;[B[SI)V
    .locals 6
    .parameter
    .parameter "videoData"
    .parameter "audioData"
    .parameter "frameRate"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;[B[SI)V"
        }
    .end annotation

    .prologue
    .line 291
    .local p1, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lco/vine/android/recorder/RecordController;->writeToFile(Ljava/util/ArrayList;[B[SZI)V

    .line 292
    return-void
.end method

.method public writeToFile(Z)V
    .locals 7
    .parameter "preview"

    .prologue
    .line 295
    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v6

    .line 296
    .local v6, session:Lco/vine/android/recorder/RecordSession;
    invoke-virtual {v6}, Lco/vine/android/recorder/RecordSession;->getSegments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v6}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v2

    invoke-virtual {v6}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v3

    iget-object v0, p0, Lco/vine/android/recorder/RecordController;->mLastCameraSetting:Lco/vine/android/recorder/CameraSetting;

    iget v5, v0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    move-object v0, p0

    move v4, p1

    invoke-direct/range {v0 .. v5}, Lco/vine/android/recorder/RecordController;->writeToFile(Ljava/util/ArrayList;[B[SZI)V

    .line 297
    return-void
.end method
