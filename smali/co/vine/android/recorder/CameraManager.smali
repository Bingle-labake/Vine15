.class public Lco/vine/android/recorder/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;,
        Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;,
        Lco/vine/android/recorder/CameraManager$AddBufferThread;
    }
.end annotation


# static fields
.field private static INSTANCE:Lco/vine/android/recorder/CameraManager;

.field private static hasPreallocateBuffers:Z

.field private static final mBackFacing:[Ljava/lang/Integer;

.field private static final mFrontFacing:[Ljava/lang/Integer;


# instance fields
.field private volatile isPreviewing:Z

.field private final mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private final mAddedBufferArray:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<[B>;"
        }
    .end annotation
.end field

.field private final mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<[B>;"
        }
    .end annotation
.end field

.field private mCamera:Landroid/hardware/Camera;

.field private mCameraSetting:Lco/vine/android/recorder/CameraSetting;

.field private mCurrentCamera:I

.field private mFixedDegrees:I

.field private mFocusArea:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/hardware/Camera$Area;",
            ">;"
        }
    .end annotation
.end field

.field private mFrameSize:I

.field private mIsCurrentFront:Z

.field private final mLOCK:[I

.field private final mMatrix:Landroid/graphics/Matrix;

.field private mMaxZoom:I

.field private mPreviewCallback:Lco/vine/android/recorder/RecordController;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private volatile mRunAddBufferThraed:Z

.field private mSharedByteBuffer:Ljava/nio/ByteBuffer;

.field private mZoom:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    .line 43
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 45
    .local v1, cameraInfo:Landroid/hardware/Camera$CameraInfo;
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v5

    .line 47
    .local v5, numberOfCameras:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v3, frontFacing:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v0, backFacing:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v5, :cond_2

    .line 52
    :try_start_0
    invoke-static {v4, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 53
    iget v6, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v6, v10, :cond_1

    .line 54
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 55
    :cond_1
    iget v6, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v6, :cond_0

    .line 56
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 58
    :catch_0
    move-exception v2

    .line 59
    .local v2, e:Ljava/lang/Exception;
    const-string v6, "Cannot get camera info for camera #{}."

    new-array v7, v10, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v2, v6, v7}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 62
    .end local v2           #e:Ljava/lang/Exception;
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/Integer;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Integer;

    sput-object v6, Lco/vine/android/recorder/CameraManager;->mFrontFacing:[Ljava/lang/Integer;

    .line 63
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/Integer;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Integer;

    sput-object v6, Lco/vine/android/recorder/CameraManager;->mBackFacing:[Ljava/lang/Integer;

    .line 64
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    .line 75
    iput-boolean v1, p0, Lco/vine/android/recorder/CameraManager;->mIsCurrentFront:Z

    .line 76
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    .line 83
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddedBufferArray:Ljava/util/Set;

    .line 84
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 85
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 110
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mMatrix:Landroid/graphics/Matrix;

    .line 111
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/recorder/CameraManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-boolean v0, p0, Lco/vine/android/recorder/CameraManager;->mRunAddBufferThraed:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/recorder/CameraManager;)Landroid/hardware/Camera;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/recorder/CameraManager;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/recorder/CameraManager;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object v0
.end method

.method private calculateTapArea(IIFIIIILandroid/graphics/Rect;)V
    .locals 10
    .parameter "focusWidth"
    .parameter "focusHeight"
    .parameter "areaMultiple"
    .parameter "x"
    .parameter "y"
    .parameter "previewWidth"
    .parameter "previewHeight"
    .parameter "rect"

    .prologue
    .line 206
    int-to-float v6, p1

    mul-float/2addr v6, p3

    float-to-int v2, v6

    .line 207
    .local v2, areaWidth:I
    int-to-float v6, p2

    mul-float/2addr v6, p3

    float-to-int v1, v6

    .line 208
    .local v1, areaHeight:I
    div-int/lit8 v6, v2, 0x2

    sub-int v6, p4, v6

    const/4 v7, 0x0

    sub-int v8, p6, v2

    invoke-static {v6, v7, v8}, Lco/vine/android/util/MathUtil;->clamp(III)I

    move-result v3

    .line 209
    .local v3, left:I
    div-int/lit8 v6, v1, 0x2

    sub-int v6, p5, v6

    const/4 v7, 0x0

    sub-int v8, p7, v1

    invoke-static {v6, v7, v8}, Lco/vine/android/util/MathUtil;->clamp(III)I

    move-result v5

    .line 211
    .local v5, top:I
    new-instance v4, Landroid/graphics/RectF;

    int-to-float v6, v3

    int-to-float v7, v5

    add-int v8, v3, v2

    int-to-float v8, v8

    add-int v9, v5, v1

    int-to-float v9, v9

    invoke-direct {v4, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 212
    .local v4, rectF:Landroid/graphics/RectF;
    iget-object v6, p0, Lco/vine/android/recorder/CameraManager;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 213
    move-object/from16 v0, p8

    invoke-static {v4, v0}, Lco/vine/android/util/MathUtil;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 214
    return-void
.end method

.method private disableVideoStab(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .parameter "parameters"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .prologue
    .line 724
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xf

    if-lt v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 725
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 727
    :cond_0
    return-void
.end method

.method public static getCameraDisplayOrientation(II)I
    .locals 4
    .parameter "degrees"
    .parameter "cameraId"

    .prologue
    .line 896
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 898
    .local v0, info:Landroid/hardware/Camera$CameraInfo;
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 900
    const-string v2, "Set rotation to {} degrees"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 903
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 904
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v2, p0

    rem-int/lit16 v1, v2, 0x168

    .line 905
    .local v1, result:I
    rsub-int v2, v1, 0x168

    rem-int/lit16 v1, v2, 0x168

    .line 909
    :goto_0
    return v1

    .line 907
    .end local v1           #result:I
    :cond_0
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v2, p0

    add-int/lit16 v2, v2, 0x168

    rem-int/lit16 v1, v2, 0x168

    .restart local v1       #result:I
    goto :goto_0
.end method

.method public static getCameraRotation(Landroid/app/Activity;)I
    .locals 3
    .parameter "activity"

    .prologue
    const/4 v1, 0x0

    .line 370
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 372
    .local v0, rotation:I
    packed-switch v0, :pswitch_data_0

    .line 382
    :goto_0
    :pswitch_0
    return v1

    .line 376
    :pswitch_1
    const/16 v1, 0x5a

    goto :goto_0

    .line 378
    :pswitch_2
    const/16 v1, 0xb4

    goto :goto_0

    .line 380
    :pswitch_3
    const/16 v1, 0x10e

    goto :goto_0

    .line 372
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static getInstance()Lco/vine/android/recorder/CameraManager;
    .locals 1

    .prologue
    .line 116
    sget-object v0, Lco/vine/android/recorder/CameraManager;->INSTANCE:Lco/vine/android/recorder/CameraManager;

    if-nez v0, :cond_0

    .line 117
    new-instance v0, Lco/vine/android/recorder/CameraManager;

    invoke-direct {v0}, Lco/vine/android/recorder/CameraManager;-><init>()V

    sput-object v0, Lco/vine/android/recorder/CameraManager;->INSTANCE:Lco/vine/android/recorder/CameraManager;

    .line 119
    :cond_0
    sget-object v0, Lco/vine/android/recorder/CameraManager;->INSTANCE:Lco/vine/android/recorder/CameraManager;

    return-object v0
.end method

.method public static hasBackFacingCamera()Z
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lco/vine/android/recorder/CameraManager;->mBackFacing:[Ljava/lang/Integer;

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static hasCamera()Z
    .locals 1

    .prologue
    .line 94
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasFrontFacingCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static hasFrontFacingCamera()Z
    .locals 1

    .prologue
    .line 98
    sget-object v0, Lco/vine/android/recorder/CameraManager;->mFrontFacing:[Ljava/lang/Integer;

    array-length v0, v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initializeFocusAreas(II)V
    .locals 9
    .parameter "x"
    .parameter "y"

    .prologue
    const/16 v1, 0x64

    .line 194
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    .line 196
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    new-instance v2, Landroid/hardware/Camera$Area;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_0
    const/high16 v3, 0x3f80

    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    iget v6, v0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    iget v7, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Area;

    iget-object v8, v0, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    move-object v0, p0

    move v2, v1

    move v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v8}, Lco/vine/android/recorder/CameraManager;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 202
    return-void
.end method

.method private safeCameraOpen(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;ZIIZ)Lco/vine/android/recorder/CameraSetting;
    .locals 5
    .parameter "config"
    .parameter "frontFacing"
    .parameter "id"
    .parameter "rotation"
    .parameter "reOpen"

    .prologue
    const/4 v2, 0x0

    .line 322
    const/4 v3, -0x1

    if-ne p3, v3, :cond_0

    .line 354
    :goto_0
    return-object v2

    .line 326
    :cond_0
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v3

    .line 327
    if-nez p5, :cond_1

    :try_start_0
    iget v4, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    if-eq v4, p3, :cond_2

    .line 328
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/recorder/CameraManager;->releaseCameraAndPreview()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    :cond_2
    if-nez p5, :cond_3

    :try_start_1
    iget-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v4, :cond_3

    iget v4, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    if-eq v4, p3, :cond_4

    .line 332
    :cond_3
    invoke-static {p3}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v4

    iput-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    .line 336
    :goto_1
    const/4 v4, 0x0

    iput-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    .line 337
    iget-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 338
    .local v1, params:Landroid/hardware/Camera$Parameters;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/hardware/Camera$Parameters;->setRecordingHint(Z)V

    .line 339
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    move-result v4

    iput v4, p0, Lco/vine/android/recorder/CameraManager;->mMaxZoom:I

    .line 340
    const/4 v4, 0x1

    iput v4, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    .line 341
    iget-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v4, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 342
    iget-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v4, :cond_5

    .line 343
    const-string v4, "1. Open Camera."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 344
    iput p3, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    .line 345
    iput-boolean p2, p0, Lco/vine/android/recorder/CameraManager;->mIsCurrentFront:Z

    .line 346
    invoke-virtual {p0, p1, v1, p4}, Lco/vine/android/recorder/CameraManager;->getCameraInfo(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;Landroid/hardware/Camera$Parameters;I)Lco/vine/android/recorder/CameraSetting;

    move-result-object v4

    iput-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    .line 347
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    monitor-exit v3

    goto :goto_0

    .line 352
    .end local v1           #params:Landroid/hardware/Camera$Parameters;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 334
    :cond_4
    :try_start_3
    const-string v4, "Camera was already opened."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 349
    :catch_0
    move-exception v0

    .line 350
    .local v0, e:Ljava/lang/Exception;
    :try_start_4
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 352
    .end local v0           #e:Ljava/lang/Exception;
    :cond_5
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method private declared-synchronized startPreview(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;ZZIII)V
    .locals 27
    .parameter "surface"
    .parameter "texture"
    .parameter "flash"
    .parameter "autoFocus"
    .parameter "frameRate"
    .parameter "rotation"
    .parameter "currentDuration"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;
        }
    .end annotation

    .prologue
    .line 609
    monitor-enter p0

    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/recorder/CameraManager;->isPreviewing:Z

    move/from16 v22, v0

    if-eqz v22, :cond_1

    .line 610
    const-string v22, "Do not preview again."

    invoke-static/range {v22 .. v22}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 720
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 613
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    if-eqz v22, :cond_0

    .line 614
    const-string v22, "2,3: Set preview display and start preview."

    invoke-static/range {v22 .. v22}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 615
    if-eqz p1, :cond_2

    .line 616
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    new-instance v23, Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lco/vine/android/recorder/CameraManager$DummySurfaceHolder;-><init>(Landroid/view/Surface;)V

    invoke-virtual/range {v22 .. v23}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 625
    :goto_1
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/recorder/CameraManager;->isPreviewing:Z

    .line 626
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, p6

    move/from16 v3, p3

    move/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/recorder/CameraManager;->enableFancyCameraFeatures(Landroid/hardware/Camera$Parameters;IZZ)Z

    move-result v11

    .line 627
    .local v11, flip:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v17

    .line 628
    .local v17, parameters:Landroid/hardware/Camera$Parameters;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    move/from16 v23, v0

    move-object/from16 v0, v17

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 629
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    move/from16 v23, v0

    move-object/from16 v0, v17

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 630
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "x"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 631
    .local v21, v:Ljava/lang/String;
    const-string v22, "video-size"

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    const-string v22, "Set preview size: {} * {}, {}"

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 633
    const/16 v22, 0x11

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 634
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lco/vine/android/recorder/CameraManager;->disableVideoStab(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 636
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 641
    :try_start_3
    invoke-virtual/range {v17 .. v17}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v22

    invoke-static/range {v22 .. v22}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v7

    .line 642
    .local v7, bpp:I
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    move/from16 v23, v0

    mul-int v22, v22, v23

    mul-int v22, v22, v7

    div-int/lit8 v22, v22, 0x8

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/CameraManager;->mFrameSize:I

    .line 643
    new-instance v5, Lco/vine/android/recorder/CameraManager$AddBufferThread;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Lco/vine/android/recorder/CameraManager$AddBufferThread;-><init>(Lco/vine/android/recorder/CameraManager;)V

    .line 644
    .local v5, addThread:Lco/vine/android/recorder/CameraManager$AddBufferThread;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewCallback:Lco/vine/android/recorder/RecordController;

    move-object/from16 v22, v0

    if-eqz v22, :cond_c

    .line 645
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewCallback:Lco/vine/android/recorder/RecordController;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lco/vine/android/recorder/VineRecorder;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v9

    .line 646
    .local v9, config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    iget v14, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    .line 647
    .local v14, maxDuration:I
    iget v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->bufferCount:I

    move/from16 v22, v0

    iget v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    move/from16 v23, v0

    div-int v23, p5, v23

    mul-int v22, v22, v23

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    sub-int v23, v14, p7

    move/from16 v0, v23

    int-to-float v0, v0

    move/from16 v23, v0

    int-to-float v0, v14

    move/from16 v24, v0

    div-float v23, v23, v24

    mul-float v22, v22, v23

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    const/16 v23, 0x1e

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 651
    .local v8, bufferCount:I
    const-string v22, "Buffer count: {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 652
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mAddedBufferArray:Ljava/util/Set;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 653
    .local v6, b:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 654
    add-int/lit8 v8, v8, -0x1

    .line 655
    goto :goto_2

    .line 618
    .end local v5           #addThread:Lco/vine/android/recorder/CameraManager$AddBufferThread;
    .end local v6           #b:[B
    .end local v7           #bpp:I
    .end local v8           #bufferCount:I
    .end local v9           #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .end local v11           #flip:Z
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #maxDuration:I
    .end local v17           #parameters:Landroid/hardware/Camera$Parameters;
    .end local v21           #v:Ljava/lang/String;
    :cond_2
    if-eqz p2, :cond_3

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_1

    .line 713
    :catch_0
    move-exception v10

    .line 714
    .local v10, e:Ljava/lang/Exception;
    const/16 v22, 0x0

    :try_start_4
    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/recorder/CameraManager;->isPreviewing:Z

    .line 715
    const-string v22, "Failed to startPreview: {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual {v10}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 716
    instance-of v0, v10, Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    move/from16 v22, v0

    if-eqz v22, :cond_0

    .line 717
    check-cast v10, Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    .end local v10           #e:Ljava/lang/Exception;
    throw v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 609
    :catchall_0
    move-exception v22

    monitor-exit p0

    throw v22

    .line 621
    :cond_3
    :try_start_5
    const-string v22, "Surface is not ready, wait..."

    invoke-static/range {v22 .. v22}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 637
    .restart local v11       #flip:Z
    .restart local v17       #parameters:Landroid/hardware/Camera$Parameters;
    .restart local v21       #v:Ljava/lang/String;
    :catch_1
    move-exception v10

    .line 638
    .restart local v10       #e:Ljava/lang/Exception;
    new-instance v22, Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;

    invoke-virtual {v10}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 656
    .end local v10           #e:Ljava/lang/Exception;
    .restart local v5       #addThread:Lco/vine/android/recorder/CameraManager$AddBufferThread;
    .restart local v7       #bpp:I
    .restart local v8       #bufferCount:I
    .restart local v9       #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .restart local v13       #i$:Ljava/util/Iterator;
    .restart local v14       #maxDuration:I
    :cond_4
    const-string v22, "After reused unused required buffer count: {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 657
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    .line 658
    .restart local v6       #b:[B
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/recorder/CameraManager;->addCallbackBuffer([B)V

    .line 659
    add-int/lit8 v8, v8, -0x1

    .line 660
    goto :goto_3

    .line 661
    .end local v6           #b:[B
    :cond_5
    const-string v22, "After reused flushed required buffer count: {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 662
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 663
    .local v18, start:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mPreviewCallback:Lco/vine/android/recorder/RecordController;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 664
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 665
    const/16 v16, 0x0

    .line 666
    .local v16, oomPreAlloc:Z
    iget-boolean v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocateBuffer:Z

    move/from16 v22, v0

    if-eqz v22, :cond_7

    sget-boolean v22, Lco/vine/android/recorder/CameraManager;->hasPreallocateBuffers:Z

    if-nez v22, :cond_7

    .line 667
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mFrameSize:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v23

    sub-int v23, v8, v23

    mul-int v22, v22, v23

    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v22, v0

    iget-wide v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    move-wide/from16 v24, v0

    mul-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-int v15, v0

    .line 668
    .local v15, n:I
    const-string v22, "Pre-allocate buffer {}: {}."

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    iget-wide v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 669
    const/16 v22, 0x1

    sput-boolean v22, Lco/vine/android/recorder/CameraManager;->hasPreallocateBuffers:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 672
    :try_start_6
    new-array v0, v15, [B

    move-object/from16 v20, v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 678
    .local v20, tempBuffer:[B
    :goto_4
    :try_start_7
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mFrameSize:I

    move/from16 v22, v0

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/CameraManager;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    .line 679
    if-eqz v20, :cond_6

    .line 680
    const/16 v22, 0x0

    const/16 v23, 0x1

    aput-byte v23, v20, v22

    .line 682
    :cond_6
    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v20, v0

    .line 683
    const/16 v20, 0x0

    .line 684
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 686
    .end local v15           #n:I
    .end local v20           #tempBuffer:[B
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    move-object/from16 v22, v0

    if-nez v22, :cond_8

    .line 687
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CameraManager;->mFrameSize:I

    move/from16 v22, v0

    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/CameraManager;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    .line 689
    :cond_8
    if-eqz v16, :cond_9

    .line 690
    iget-wide v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    move-wide/from16 v22, v0

    const-wide/high16 v24, 0x3ff0

    cmpg-double v22, v22, v24

    if-gtz v22, :cond_9

    int-to-double v0, v8

    move-wide/from16 v22, v0

    const-wide/high16 v24, 0x3fe0

    mul-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-int v8, v0

    .line 692
    :cond_9
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/recorder/CameraManager;->mRunAddBufferThraed:Z

    .line 693
    invoke-virtual {v5}, Lco/vine/android/recorder/CameraManager$AddBufferThread;->start()V

    .line 694
    const/4 v12, 0x0

    .local v12, i:I
    :goto_5
    if-ge v12, v8, :cond_b

    .line 695
    rem-int/lit8 v22, v12, 0xf

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_a

    .line 696
    const-string v22, "Add buffer {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 698
    :cond_a
    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/CameraManager;->addBuffer([BZ)V

    .line 694
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 673
    .end local v12           #i:I
    .restart local v15       #n:I
    :catch_2
    move-exception v10

    .line 674
    .local v10, e:Ljava/lang/OutOfMemoryError;
    const/16 v20, 0x0

    .line 675
    .restart local v20       #tempBuffer:[B
    const/16 v16, 0x1

    .line 676
    const-string v22, "Pre-allocation failed with ratio {}, ignore pre-allocation step."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    iget-wide v0, v9, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 700
    .end local v10           #e:Ljava/lang/OutOfMemoryError;
    .end local v15           #n:I
    .end local v20           #tempBuffer:[B
    .restart local v12       #i:I
    :cond_b
    const-string v22, "Waiting for adding to be done."

    invoke-static/range {v22 .. v22}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 701
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/recorder/CameraManager;->mRunAddBufferThraed:Z

    .line 706
    const-string v22, "Making buffer took {} ms."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v25

    sub-long v25, v25, v18

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 708
    .end local v8           #bufferCount:I
    .end local v9           #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .end local v12           #i:I
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #maxDuration:I
    .end local v16           #oomPreAlloc:Z
    .end local v18           #start:J
    :cond_c
    invoke-virtual {v5}, Lco/vine/android/recorder/CameraManager$AddBufferThread;->join()V

    .line 709
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    if-eqz v22, :cond_0

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/hardware/Camera;->startPreview()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method public addBuffer([BZ)V
    .locals 2
    .parameter "bytes"
    .parameter "isFlushing"

    .prologue
    .line 139
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v1

    .line 140
    if-eqz p2, :cond_1

    .line 141
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 158
    :cond_0
    :goto_0
    monitor-exit v1

    .line 159
    return-void

    .line 143
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_4

    .line 144
    if-nez p1, :cond_2

    .line 145
    iget v0, p0, Lco/vine/android/recorder/CameraManager;->mFrameSize:I

    new-array p1, v0, [B

    .line 147
    :cond_2
    iget-boolean v0, p0, Lco/vine/android/recorder/CameraManager;->mRunAddBufferThraed:Z

    if-nez v0, :cond_3

    .line 148
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/CameraManager;->addCallbackBuffer([B)V

    goto :goto_0

    .line 158
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 150
    :cond_3
    :try_start_1
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 153
    :cond_4
    if-eqz p1, :cond_0

    .line 154
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public addCallbackBuffer([B)V
    .locals 2
    .parameter "bytes"

    .prologue
    .line 162
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v1

    .line 163
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 165
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddedBufferArray:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 169
    :goto_0
    monitor-exit v1

    .line 170
    return-void

    .line 167
    :cond_0
    const-string v0, "Buffer couldn\'t be added."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public allowSetFocus(Landroid/hardware/Camera$Parameters;)Z
    .locals 4
    .parameter "params"

    .prologue
    .line 221
    const-string v1, ""

    .line 223
    .local v1, supportedMode:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    .line 225
    .local v0, focusModes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v2, "Has galaxy problem: {}"

    sget-boolean v3, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->HAS_GALAXY_FOCUS_PROBLEM:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 227
    if-eqz v0, :cond_3

    .line 229
    const-string v2, "auto"

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-boolean v2, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->HAS_GALAXY_FOCUS_PROBLEM:Z

    if-eqz v2, :cond_2

    .line 231
    :cond_0
    const-string v1, "auto"

    .line 232
    const-string v2, "Focus Mode: FOCUS_MODE_AUTO"

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 240
    :cond_1
    :goto_0
    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 241
    invoke-virtual {p1, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 242
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 243
    const/4 v2, 0x1

    .line 246
    :goto_1
    return v2

    .line 234
    :cond_2
    const-string v2, "continuous-picture"

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 235
    const-string v1, "continuous-picture"

    .line 236
    const-string v2, "Focus Mode: FOCUS_MODE_CONTINUOUS_PICTURE"

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 246
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)Z
    .locals 4
    .parameter "cb"

    .prologue
    const/4 v1, 0x0

    .line 251
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    const/4 v1, 0x1

    .line 255
    :goto_0
    return v1

    .line 253
    :catch_0
    move-exception v0

    .line 254
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "Failed to autoFocus."

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public canChangeFocus()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 174
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getMaxNumFocusAreas()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-lez v2, :cond_0

    const/4 v1, 0x1

    .line 176
    :cond_0
    :goto_0
    return v1

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, e:Ljava/lang/Exception;
    goto :goto_0
.end method

.method public changeFlashState(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 890
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 891
    .local v0, parameters:Landroid/hardware/Camera$Parameters;
    if-eqz p1, :cond_0

    const-string v1, "torch"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 892
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 893
    return-void

    .line 891
    :cond_0
    const-string v1, "off"

    goto :goto_0
.end method

.method public enableFancyCameraFeatures(Landroid/hardware/Camera$Parameters;IZZ)Z
    .locals 3
    .parameter "parameters"
    .parameter "rotation"
    .parameter "flash"
    .parameter "autoFocus"

    .prologue
    const/4 v1, 0x1

    .line 879
    invoke-virtual {p0, p2}, Lco/vine/android/recorder/CameraManager;->fixOrientation(I)I

    move-result v0

    .line 880
    .local v0, degree:I
    if-eqz p4, :cond_0

    .line 881
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/CameraManager;->startContinuousAutoFocus(Landroid/hardware/Camera$Parameters;)Z

    .line 883
    :cond_0
    if-eqz p3, :cond_1

    .line 884
    invoke-virtual {p0, v1}, Lco/vine/android/recorder/CameraManager;->changeFlashState(Z)V

    .line 886
    :cond_1
    const/16 v2, 0x5a

    if-eq v0, v2, :cond_2

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_3

    :cond_2
    :goto_0
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public fixOrientation(I)I
    .locals 6
    .parameter "rotation"

    .prologue
    .line 859
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v2

    .line 860
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v1, :cond_0

    .line 861
    iget v1, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    invoke-static {p1, v1}, Lco/vine/android/recorder/CameraManager;->getCameraDisplayOrientation(II)I

    move-result v1

    iput v1, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    .line 862
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    iget v3, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    invoke-virtual {v1, v3}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 863
    const-string v1, "Fixed orientation: {}"

    iget v3, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 864
    iget v1, p0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    if-eqz v1, :cond_0

    iget v1, p0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    if-eqz v1, :cond_0

    .line 865
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 866
    .local v0, matrix:Landroid/graphics/Matrix;
    iget-boolean v1, p0, Lco/vine/android/recorder/CameraManager;->mIsCurrentFront:Z

    iget v3, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    iget v4, p0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    iget v5, p0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    invoke-static {v0, v1, v3, v4, v5}, Lco/vine/android/util/MathUtil;->prepareMatrix(Landroid/graphics/Matrix;ZIII)V

    .line 871
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 874
    .end local v0           #matrix:Landroid/graphics/Matrix;
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 875
    iget v1, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    return v1

    .line 874
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getCamera()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method public getCameraInfo(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;Landroid/hardware/Camera$Parameters;I)Lco/vine/android/recorder/CameraSetting;
    .locals 21
    .parameter "config"
    .parameter "params"
    .parameter "rotation"

    .prologue
    .line 387
    const/4 v15, 0x0

    .line 389
    .local v15, previewFormats:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v15

    .line 393
    :goto_0
    const/16 v7, 0x11

    .line 394
    .local v7, selectedFormat:I
    if-eqz v15, :cond_3

    .line 395
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    .line 396
    .local v13, format:Ljava/lang/Integer;
    const-string v8, "Supported format: {}"

    invoke-static {v8, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 397
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/4 v9, 0x4

    if-ne v8, v9, :cond_0

    .line 398
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 402
    .end local v13           #format:Ljava/lang/Integer;
    :cond_1
    const/16 v8, 0x11

    if-ne v7, v8, :cond_3

    .line 403
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    .line 404
    .restart local v13       #format:Ljava/lang/Integer;
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const/16 v9, 0x100

    if-ne v8, v9, :cond_2

    .line 405
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 411
    .end local v13           #format:Ljava/lang/Integer;
    .end local v14           #i$:Ljava/util/Iterator;
    :cond_3
    const-string v8, "Selected format: {}."

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 412
    const/4 v8, 0x0

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v8, v1}, Lco/vine/android/recorder/CameraManager;->getFixedDegrees(ZI)I

    move-result v5

    .line 413
    .local v5, degree:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/CameraManager;->isCurrentFront()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 414
    neg-int v5, v5

    .line 419
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    iget v8, v0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    const/4 v9, 0x4

    invoke-static {v8, v9}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 420
    move-object/from16 v0, p0

    iget v8, v0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    const/4 v9, 0x4

    invoke-static {v8, v9}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v11

    .line 422
    .local v11, cp:Landroid/media/CamcorderProfile;
    const-string v8, "Use default profile"

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 426
    :goto_1
    const-string v8, "Preferred FrameRate: {}."

    iget v9, v11, Landroid/media/CamcorderProfile;->videoFrameRate:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    iget v8, v11, Landroid/media/CamcorderProfile;->videoFrameRate:I

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    if-lt v8, v9, :cond_5

    .line 428
    move-object/from16 v0, p1

    iget v8, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    iput v8, v11, Landroid/media/CamcorderProfile;->videoFrameRate:I

    .line 430
    :cond_5
    const-string v8, "Original Width * Height: {}/{}"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v0, v11, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x1

    iget v0, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    invoke-static {v8, v9}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 432
    move-object/from16 v0, p1

    iget v8, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    iput v8, v11, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 434
    iget v8, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    iget v9, v11, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    if-le v8, v9, :cond_6

    .line 435
    move-object/from16 v0, p1

    iget-boolean v8, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->highQuality:Z

    if-eqz v8, :cond_a

    const/16 v8, 0x1e0

    :goto_2
    iput v8, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 438
    :cond_6
    const-string v8, "Video: {}*{} codec: {} bitRate:{} frameRate:{}."

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v0, v11, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x1

    iget v0, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x2

    iget v0, v11, Landroid/media/CamcorderProfile;->videoCodec:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x3

    iget v0, v11, Landroid/media/CamcorderProfile;->videoBitRate:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x4

    iget v0, v11, Landroid/media/CamcorderProfile;->videoFrameRate:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 439
    const-string v8, "Audio: bitRate:{} channels: {} codec: {} sampleRate: {} "

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v0, v11, Landroid/media/CamcorderProfile;->audioBitRate:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x1

    iget v0, v11, Landroid/media/CamcorderProfile;->audioChannels:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x2

    iget v0, v11, Landroid/media/CamcorderProfile;->audioCodec:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x3

    iget v0, v11, Landroid/media/CamcorderProfile;->audioSampleRate:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 440
    iget v3, v11, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 441
    .local v3, videoFrameWidth:I
    iget v4, v11, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 442
    .local v4, videoFrameHeight:I
    iget v6, v11, Landroid/media/CamcorderProfile;->videoFrameRate:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 473
    .end local v11           #cp:Landroid/media/CamcorderProfile;
    .local v6, videoFrameRate:I
    :goto_3
    const-string v8, "FFC OR: {}."

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->frontFacingAspectRatioOverride:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 474
    const-string v8, "BFC OR: {}."

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->backFacingAspectRatioOverride:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 476
    const/16 v8, 0x280

    if-ne v3, v8, :cond_7

    const/16 v8, 0x1e0

    if-eq v4, v8, :cond_7

    .line 477
    const-string v8, "Force 480 with 480p."

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 478
    const/16 v4, 0x1e0

    .line 481
    :cond_7
    new-instance v2, Lco/vine/android/recorder/CameraSetting;

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lco/vine/android/recorder/CameraManager;->mIsCurrentFront:Z

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->frontFacingAspectRatioOverride:F

    move-object/from16 v0, p1

    iget v10, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->backFacingAspectRatioOverride:F

    invoke-direct/range {v2 .. v10}, Lco/vine/android/recorder/CameraSetting;-><init>(IIIIIZFF)V

    .line 483
    .local v2, cameraSetting:Lco/vine/android/recorder/CameraSetting;
    sget-boolean v8, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v8, :cond_12

    .line 484
    invoke-virtual/range {p2 .. p2}, Landroid/hardware/Camera$Parameters;->getPreferredPreviewSizeForVideo()Landroid/hardware/Camera$Size;

    move-result-object v17

    .line 485
    .local v17, size:Landroid/hardware/Camera$Size;
    if-eqz v17, :cond_8

    .line 486
    const-string v8, "Preferred Width * Height: {}/{}."

    move-object/from16 v0, v17

    iget v9, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v0, v17

    iget v10, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 488
    :cond_8
    invoke-virtual/range {p2 .. p2}, Landroid/hardware/Camera$Parameters;->getSupportedVideoSizes()Ljava/util/List;

    move-result-object v18

    .line 489
    .local v18, sizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    if-eqz v18, :cond_10

    .line 490
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_10

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/hardware/Camera$Size;

    .line 491
    .local v16, s:Landroid/hardware/Camera$Size;
    const-string v8, "Supported Video Width * Height: {}/{}."

    move-object/from16 v0, v16

    iget v9, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v0, v16

    iget v10, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    .line 390
    .end local v2           #cameraSetting:Lco/vine/android/recorder/CameraSetting;
    .end local v3           #videoFrameWidth:I
    .end local v4           #videoFrameHeight:I
    .end local v5           #degree:I
    .end local v6           #videoFrameRate:I
    .end local v7           #selectedFormat:I
    .end local v14           #i$:Ljava/util/Iterator;
    .end local v16           #s:Landroid/hardware/Camera$Size;
    .end local v17           #size:Landroid/hardware/Camera$Size;
    .end local v18           #sizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    :catch_0
    move-exception v12

    .line 391
    .local v12, e:Ljava/lang/NullPointerException;
    const-string v8, "This device sucks, it cannot return params properly."

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 424
    .end local v12           #e:Ljava/lang/NullPointerException;
    .restart local v5       #degree:I
    .restart local v7       #selectedFormat:I
    :cond_9
    :try_start_2
    move-object/from16 v0, p0

    iget v8, v0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    const/4 v9, 0x1

    invoke-static {v8, v9}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v11

    .restart local v11       #cp:Landroid/media/CamcorderProfile;
    goto/16 :goto_1

    .line 435
    :cond_a
    const/16 v8, 0xf0

    goto/16 :goto_2

    .line 443
    .end local v11           #cp:Landroid/media/CamcorderProfile;
    :catch_1
    move-exception v12

    .line 444
    .local v12, e:Ljava/lang/Exception;
    invoke-virtual/range {p2 .. p2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v18

    .line 445
    .restart local v18       #sizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    new-instance v19, Ljava/util/HashSet;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashSet;-><init>()V

    .line 446
    .local v19, supportedWidth:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v18, :cond_f

    .line 447
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14       #i$:Ljava/util/Iterator;
    :cond_b
    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/hardware/Camera$Size;

    .line 448
    .restart local v17       #size:Landroid/hardware/Camera$Size;
    const-string v8, "Supported width and height: {}, {}."

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x1

    move-object/from16 v0, v17

    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    invoke-static {v8, v9}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 449
    move-object/from16 v0, v17

    iget v8, v0, Landroid/hardware/Camera$Size;->height:I

    move-object/from16 v0, p1

    iget v9, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetSize:I

    if-ne v8, v9, :cond_b

    .line 450
    move-object/from16 v0, v17

    iget v8, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 453
    .end local v17           #size:Landroid/hardware/Camera$Size;
    :cond_c
    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_d

    .line 454
    const-string v8, "Edison: Target size is not supported."

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 455
    move-object/from16 v0, p1

    iget v4, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    .line 456
    .restart local v4       #videoFrameHeight:I
    move-object/from16 v0, p1

    iget v3, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    .line 471
    .end local v14           #i$:Ljava/util/Iterator;
    .restart local v3       #videoFrameWidth:I
    :goto_6
    move-object/from16 v0, p1

    iget v6, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    .restart local v6       #videoFrameRate:I
    goto/16 :goto_3

    .line 458
    .end local v3           #videoFrameWidth:I
    .end local v4           #videoFrameHeight:I
    .end local v6           #videoFrameRate:I
    .restart local v14       #i$:Ljava/util/Iterator;
    :cond_d
    move-object/from16 v0, p1

    iget v8, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 459
    move-object/from16 v0, p1

    iget v4, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    .line 460
    .restart local v4       #videoFrameHeight:I
    move-object/from16 v0, p1

    iget v3, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    .restart local v3       #videoFrameWidth:I
    goto :goto_6

    .line 462
    .end local v3           #videoFrameWidth:I
    .end local v4           #videoFrameHeight:I
    :cond_e
    const-string v8, "Edison: Target width is not supported."

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 463
    move-object/from16 v0, p1

    iget v4, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    .line 464
    .restart local v4       #videoFrameHeight:I
    move-object/from16 v0, p1

    iget v3, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    .restart local v3       #videoFrameWidth:I
    goto :goto_6

    .line 468
    .end local v3           #videoFrameWidth:I
    .end local v4           #videoFrameHeight:I
    .end local v14           #i$:Ljava/util/Iterator;
    :cond_f
    move-object/from16 v0, p1

    iget v4, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    .line 469
    .restart local v4       #videoFrameHeight:I
    move-object/from16 v0, p1

    iget v3, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    .restart local v3       #videoFrameWidth:I
    goto :goto_6

    .line 494
    .end local v12           #e:Ljava/lang/Exception;
    .end local v19           #supportedWidth:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v2       #cameraSetting:Lco/vine/android/recorder/CameraSetting;
    .restart local v6       #videoFrameRate:I
    .restart local v17       #size:Landroid/hardware/Camera$Size;
    :cond_10
    invoke-virtual/range {p2 .. p2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v18

    .line 495
    if-eqz v18, :cond_11

    .line 496
    invoke-interface/range {v18 .. v18}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14       #i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_11

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/hardware/Camera$Size;

    .line 497
    .restart local v16       #s:Landroid/hardware/Camera$Size;
    const-string v8, "Supported Preview Width * Height: {}/{}."

    move-object/from16 v0, v16

    iget v9, v0, Landroid/hardware/Camera$Size;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    move-object/from16 v0, v16

    iget v10, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_7

    .line 500
    .end local v14           #i$:Ljava/util/Iterator;
    .end local v16           #s:Landroid/hardware/Camera$Size;
    :cond_11
    const-string v8, "Camera w/h/f/p/d: {}/{}/{}/{}/{}"

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v0, v2, Lco/vine/android/recorder/CameraSetting;->originalW:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x1

    iget v0, v2, Lco/vine/android/recorder/CameraSetting;->originalH:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x2

    iget v0, v2, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/CameraManager;->getCurrentPreviewFormat(Landroid/hardware/Camera$Parameters;)I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    const/4 v10, 0x4

    iget v0, v2, Lco/vine/android/recorder/CameraSetting;->degrees:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v9, v10

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 503
    .end local v17           #size:Landroid/hardware/Camera$Size;
    .end local v18           #sizes:Ljava/util/List;,"Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    :cond_12
    return-object v2
.end method

.method public getCameraSetting()Lco/vine/android/recorder/CameraSetting;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    return-object v0
.end method

.method public getCurrentPreviewFormat(Landroid/hardware/Camera$Parameters;)I
    .locals 1
    .parameter "params"

    .prologue
    .line 366
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v0

    return v0
.end method

.method public getFixedDegrees(ZI)I
    .locals 1
    .parameter "cached"
    .parameter "rotation"

    .prologue
    .line 851
    if-eqz p1, :cond_0

    .line 852
    iget v0, p0, Lco/vine/android/recorder/CameraManager;->mFixedDegrees:I

    .line 854
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    invoke-static {p2, v0}, Lco/vine/android/recorder/CameraManager;->getCameraDisplayOrientation(II)I

    move-result v0

    goto :goto_0
.end method

.method public getParameters()Landroid/hardware/Camera$Parameters;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSharedByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mSharedByteBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getSupportedPreviewFormat(Landroid/hardware/Camera$Parameters;)Ljava/util/List;
    .locals 1
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/Camera$Parameters;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 362
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public isCameraReady()Z
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCurrentFront()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lco/vine/android/recorder/CameraManager;->mIsCurrentFront:Z

    return v0
.end method

.method public isFlashSupported()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 730
    iget-object v5, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v5}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v5

    invoke-virtual {v5}, Landroid/hardware/Camera$Parameters;->getSupportedFlashModes()Ljava/util/List;

    move-result-object v2

    .line 731
    .local v2, modes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_2

    :cond_0
    move v3, v4

    .line 741
    :cond_1
    :goto_0
    return v3

    .line 734
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 735
    .local v1, mode:Ljava/lang/String;
    const-string v5, "on"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 737
    const-string v5, "torch"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_0

    .end local v1           #mode:Ljava/lang/String;
    :cond_4
    move v3, v4

    .line 741
    goto :goto_0
.end method

.method public isPreviewing()Z
    .locals 1

    .prologue
    .line 583
    iget-boolean v0, p0, Lco/vine/android/recorder/CameraManager;->isPreviewing:Z

    return v0
.end method

.method protected lock()V
    .locals 1

    .prologue
    .line 587
    const-string v0, "5d. Lock Camera"

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 588
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->lock()V

    .line 589
    return-void
.end method

.method public modifyZoom(Z)I
    .locals 5
    .parameter "zoomIn"

    .prologue
    .line 921
    iget-object v3, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v3

    .line 922
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 924
    :try_start_1
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 925
    .local v1, params:Landroid/hardware/Camera$Parameters;
    if-eqz p1, :cond_1

    .line 926
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    iget v4, p0, Lco/vine/android/recorder/CameraManager;->mMaxZoom:I

    if-ge v2, v4, :cond_0

    .line 927
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    .line 928
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 929
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 943
    .end local v1           #params:Landroid/hardware/Camera$Parameters;
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 944
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    return v2

    .line 933
    .restart local v1       #params:Landroid/hardware/Camera$Parameters;
    :cond_1
    :try_start_3
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    const/4 v4, 0x2

    if-le v2, v4, :cond_0

    .line 934
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    .line 935
    iget v2, p0, Lco/vine/android/recorder/CameraManager;->mZoom:I

    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 936
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 939
    .end local v1           #params:Landroid/hardware/Camera$Parameters;
    :catch_0
    move-exception v0

    .line 940
    .local v0, e:Ljava/lang/Exception;
    :try_start_4
    const-string v2, "It just didn\'t work."

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 943
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2
.end method

.method public declared-synchronized openDefaultCamera(Landroid/app/Activity;Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)Lco/vine/android/recorder/CameraSetting;
    .locals 3
    .parameter "activity"
    .parameter "config"

    .prologue
    const/4 v0, 0x1

    .line 507
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    invoke-static {p1}, Lco/vine/android/recorder/CameraManager;->getCameraRotation(Landroid/app/Activity;)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {p0, p2, v0, v1, v2}, Lco/vine/android/recorder/CameraManager;->openDefaultCamera(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;ZIZ)Lco/vine/android/recorder/CameraSetting;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized openDefaultCamera(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;ZIZ)Lco/vine/android/recorder/CameraSetting;
    .locals 6
    .parameter "config"
    .parameter "frontFacing"
    .parameter "rotation"
    .parameter "reOpen"

    .prologue
    const/4 v3, -0x1

    .line 512
    monitor-enter p0

    if-eqz p2, :cond_2

    .line 513
    :try_start_0
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasFrontFacingCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lco/vine/android/recorder/CameraManager;->mFrontFacing:[Ljava/lang/Integer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 518
    .local v3, nextId:I
    :cond_0
    :goto_0
    iget v0, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    if-ne v3, v0, :cond_1

    if-eqz p4, :cond_1

    .line 519
    invoke-virtual {p0}, Lco/vine/android/recorder/CameraManager;->releaseCameraAndPreview()V

    :cond_1
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    .line 522
    invoke-direct/range {v0 .. v5}, Lco/vine/android/recorder/CameraManager;->safeCameraOpen(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;ZIIZ)Lco/vine/android/recorder/CameraSetting;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 515
    .end local v3           #nextId:I
    :cond_2
    :try_start_1
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lco/vine/android/recorder/CameraManager;->mBackFacing:[Ljava/lang/Integer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    .restart local v3       #nextId:I
    :cond_3
    goto :goto_0

    .line 512
    .end local v3           #nextId:I
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public releaseCameraAndPreview()V
    .locals 3

    .prologue
    .line 526
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v1

    .line 527
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    .line 528
    const-string v0, "6,7 RELEASE Camera and STOP Preview."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 529
    invoke-virtual {p0}, Lco/vine/android/recorder/CameraManager;->isPreviewing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 530
    invoke-virtual {p0}, Lco/vine/android/recorder/CameraManager;->stopPreview()V

    .line 532
    :cond_0
    const-string v0, "Camera was released."

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 533
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 535
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 536
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    .line 537
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCameraSetting:Lco/vine/android/recorder/CameraSetting;

    .line 538
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/recorder/CameraManager;->mCurrentCamera:I

    .line 540
    :cond_1
    monitor-exit v1

    .line 541
    return-void

    .line 540
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public releaseCameraResources()V
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mBufferArray:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->clear()V

    .line 299
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddedBufferArray:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 300
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 301
    return-void
.end method

.method public removeBufferFromAvailableQueue([B)V
    .locals 1
    .parameter "b"

    .prologue
    .line 135
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mAddedBufferArray:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 136
    return-void
.end method

.method public setFocusAreas(II)Z
    .locals 7
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 182
    :try_start_0
    invoke-direct {p0, p1, p2}, Lco/vine/android/recorder/CameraManager;->initializeFocusAreas(II)V

    .line 183
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 184
    .local v1, params:Landroid/hardware/Camera$Parameters;
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setFocusAreas(Ljava/util/List;)V

    .line 185
    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 189
    .end local v1           #params:Landroid/hardware/Camera$Parameters;
    :goto_0
    return v2

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, e:Ljava/lang/Exception;
    const-string v5, "Failed to set focus areas {}, {}."

    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mMatrix:Landroid/graphics/Matrix;

    aput-object v2, v6, v4

    iget-object v2, p0, Lco/vine/android/recorder/CameraManager;->mFocusArea:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/Camera$Area;

    iget-object v2, v2, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    aput-object v2, v6, v3

    invoke-static {v0, v5, v6}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v4

    .line 189
    goto :goto_0
.end method

.method public setFrameRate(I)I
    .locals 20
    .parameter "frameRate"

    .prologue
    .line 745
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    move-object/from16 v16, v0

    monitor-enter v16

    .line 746
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v15, :cond_9

    .line 750
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v10

    .line 751
    .local v10, parameters:Landroid/hardware/Camera$Parameters;
    move/from16 v0, p1

    mul-int/lit16 v15, v0, 0x3e8

    move/from16 v0, p1

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v10, v15, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 752
    const-string v15, "SET frameRate using fixed-range frameRate"

    invoke-static {v15}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 753
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 754
    :try_start_2
    monitor-exit v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move/from16 v15, p1

    .line 847
    .end local v10           #parameters:Landroid/hardware/Camera$Parameters;
    :goto_0
    return v15

    .line 755
    :catch_0
    move-exception v3

    .line 756
    .local v3, e:Ljava/lang/Exception;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v10

    .line 757
    .restart local v10       #parameters:Landroid/hardware/Camera$Parameters;
    move/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 758
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 759
    const-string v15, "SET frameRate using fixed frameRate"

    invoke-static {v15}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 760
    :try_start_4
    monitor-exit v16
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move/from16 v15, p1

    goto :goto_0

    .line 762
    .end local v10           #parameters:Landroid/hardware/Camera$Parameters;
    :catch_1
    move-exception v3

    .line 765
    :try_start_5
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-result-object v10

    .line 770
    .restart local v10       #parameters:Landroid/hardware/Camera$Parameters;
    :try_start_6
    invoke-virtual {v10}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v14

    .line 771
    .local v14, ss:Ljava/util/List;,"Ljava/util/List<[I>;"
    if-nez v14, :cond_0

    .line 772
    const-string v15, "Cannot set frame-rate"

    invoke-static {v15}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 773
    :try_start_7
    monitor-exit v16

    move/from16 v15, p1

    goto :goto_0

    .line 766
    .end local v10           #parameters:Landroid/hardware/Camera$Parameters;
    .end local v14           #ss:Ljava/util/List;,"Ljava/util/List<[I>;"
    :catch_2
    move-exception v4

    .line 768
    .local v4, e2:Ljava/lang/Exception;
    const/16 v15, 0x1e

    monitor-exit v16

    goto :goto_0

    .line 846
    .end local v3           #e:Ljava/lang/Exception;
    .end local v4           #e2:Ljava/lang/Exception;
    :catchall_0
    move-exception v15

    monitor-exit v16
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw v15

    .line 775
    .restart local v3       #e:Ljava/lang/Exception;
    .restart local v10       #parameters:Landroid/hardware/Camera$Parameters;
    .restart local v14       #ss:Ljava/util/List;,"Ljava/util/List<[I>;"
    :cond_0
    move/from16 v0, p1

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 p1, v0

    .line 776
    const/4 v13, 0x0

    .line 777
    .local v13, selected:[I
    const/4 v8, 0x0

    .local v8, lowest:I
    const/4 v6, 0x0

    .local v6, highest:I
    const/4 v11, -0x1

    .local v11, reachedIndex:I
    :try_start_8
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v15

    add-int/lit8 v9, v15, -0x1

    .line 778
    .local v9, otherIndex:I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_1
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v15

    if-ge v7, v15, :cond_1

    .line 779
    invoke-interface {v14, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [I

    .line 780
    .local v12, s:[I
    const-string v15, "Supported FPS: {}"

    invoke-static {v15, v12}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 781
    const/4 v15, 0x0

    aget v15, v12, v15

    move/from16 v0, p1

    if-ne v15, v0, :cond_3

    .line 782
    move-object v13, v12

    .line 804
    .end local v12           #s:[I
    :cond_1
    if-nez v13, :cond_2

    .line 805
    const/4 v15, -0x1

    if-eq v11, v15, :cond_7

    .line 806
    invoke-interface {v14, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13           #selected:[I
    check-cast v13, [I

    .line 812
    .restart local v13       #selected:[I
    :cond_2
    :goto_2
    const/4 v15, 0x1

    aget v15, v13, v15
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_5

    move/from16 v0, p1

    if-lt v15, v0, :cond_8

    .line 814
    :try_start_9
    const-string v15, "Try Using variable FPS: {}, {}."

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v15, v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 815
    move/from16 v0, p1

    invoke-virtual {v10, v8, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 816
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 817
    move/from16 v0, p1

    div-int/lit16 v15, v0, 0x3e8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    :try_start_a
    monitor-exit v16
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_0

    .line 785
    .restart local v12       #s:[I
    :cond_3
    const/4 v15, 0x1

    :try_start_b
    aget v15, v12, v15

    move/from16 v0, p1

    if-ne v15, v0, :cond_6

    .line 786
    const/4 v15, 0x0

    aget v15, v12, v15

    if-ge v8, v15, :cond_4

    .line 787
    const/4 v15, 0x0

    aget v8, v12, v15

    .line 788
    move v11, v7

    .line 790
    :cond_4
    const/4 v15, 0x1

    aget v15, v12, v15

    if-gt v6, v15, :cond_5

    .line 791
    const/4 v15, 0x1

    aget v6, v12, v15

    .line 778
    :cond_5
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 794
    :cond_6
    const/4 v15, 0x0

    aget v15, v12, v15

    if-gt v8, v15, :cond_5

    .line 795
    const/4 v15, 0x0

    aget v8, v12, v15

    .line 796
    const/4 v15, 0x1

    aget v15, v12, v15

    if-gt v6, v15, :cond_5

    .line 797
    const/4 v15, 0x1

    aget v6, v12, v15

    .line 798
    move v9, v7

    goto :goto_3

    .line 808
    .end local v12           #s:[I
    :cond_7
    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13           #selected:[I
    check-cast v13, [I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    .restart local v13       #selected:[I
    goto :goto_2

    .line 818
    :catch_3
    move-exception v4

    .line 820
    .restart local v4       #e2:Ljava/lang/Exception;
    :try_start_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v10

    .line 821
    const-string v15, "Try Using fixed framerate FPS: {}"

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v15, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 822
    move/from16 v0, p1

    div-int/lit16 v15, v0, 0x3e8

    invoke-virtual {v10, v15}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 823
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 824
    move/from16 v0, p1

    div-int/lit16 v15, v0, 0x3e8
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4

    :try_start_d
    monitor-exit v16
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_0

    .line 825
    :catch_4
    move-exception v5

    .line 826
    .local v5, e3:Ljava/lang/Exception;
    :try_start_e
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v10

    .line 827
    const-string v15, "Try Using selected framerate FPS: {}, {}, {}."

    const/16 v17, 0x0

    aget v17, v13, v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    const/16 v18, 0x1

    aget v18, v13, v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v15, v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 828
    const/4 v15, 0x0

    aget v15, v13, v15

    const/16 v17, 0x1

    aget v17, v13, v17

    move/from16 v0, v17

    invoke-virtual {v10, v15, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 829
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 830
    const/4 v15, 0x1

    aget v15, v13, v15

    div-int/lit16 v15, v15, 0x3e8
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5

    :try_start_f
    monitor-exit v16
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    goto/16 :goto_0

    .line 834
    .end local v4           #e2:Ljava/lang/Exception;
    .end local v5           #e3:Ljava/lang/Exception;
    :cond_8
    :try_start_10
    const-string v15, "Fall back, should never reach here."

    invoke-static {v15}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 835
    move/from16 v0, p1

    div-int/lit16 v0, v0, 0x3e8

    move/from16 p1, v0

    .line 836
    move/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 837
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v15, v10}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_5

    .line 838
    :try_start_11
    monitor-exit v16

    move/from16 v15, p1

    goto/16 :goto_0

    .line 842
    .end local v6           #highest:I
    .end local v7           #i:I
    .end local v8           #lowest:I
    .end local v9           #otherIndex:I
    .end local v11           #reachedIndex:I
    .end local v13           #selected:[I
    .end local v14           #ss:Ljava/util/List;,"Ljava/util/List<[I>;"
    :catch_5
    move-exception v3

    .line 843
    const/16 v15, 0x1e

    monitor-exit v16

    goto/16 :goto_0

    .line 846
    .end local v3           #e:Ljava/lang/Exception;
    .end local v10           #parameters:Landroid/hardware/Camera$Parameters;
    :cond_9
    monitor-exit v16
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 847
    const/16 v15, 0x1e

    goto/16 :goto_0
.end method

.method public setPreviewCallback(Lco/vine/android/recorder/RecordController;)V
    .locals 0
    .parameter "cb"

    .prologue
    .line 123
    iput-object p1, p0, Lco/vine/android/recorder/CameraManager;->mPreviewCallback:Lco/vine/android/recorder/RecordController;

    .line 124
    return-void
.end method

.method public setPreviewHeight(I)V
    .locals 0
    .parameter "previewHeight"

    .prologue
    .line 913
    iput p1, p0, Lco/vine/android/recorder/CameraManager;->mPreviewHeight:I

    .line 914
    return-void
.end method

.method public setPreviewWidth(I)V
    .locals 0
    .parameter "previewWidth"

    .prologue
    .line 917
    iput p1, p0, Lco/vine/android/recorder/CameraManager;->mPreviewWidth:I

    .line 918
    return-void
.end method

.method public startContinuousAutoFocus(Landroid/hardware/Camera$Parameters;)Z
    .locals 6
    .parameter "params"

    .prologue
    const/4 v3, 0x0

    .line 544
    const-string v2, ""

    .line 546
    .local v2, supportedMode:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v1

    .line 548
    .local v1, focusModes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_1

    .line 571
    :cond_0
    :goto_0
    return v3

    .line 552
    :cond_1
    sget-boolean v4, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->HAS_GALAXY_FOCUS_PROBLEM:Z

    if-eqz v4, :cond_3

    .line 553
    const-string v2, "auto"

    .line 554
    const-string v4, "Focus Mode: AUTO"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 563
    :cond_2
    :goto_1
    :try_start_0
    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 564
    invoke-virtual {p1, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 565
    iget-object v4, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v4, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 566
    const/4 v3, 0x1

    goto :goto_0

    .line 555
    :cond_3
    const-string v4, "continuous-video"

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 556
    const-string v2, "continuous-video"

    .line 557
    const-string v4, "Focus Mode: CONTINUOUS VIDEO"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_1

    .line 558
    :cond_4
    const-string v4, "infinity"

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 559
    const-string v2, "infinity"

    .line 560
    const-string v4, "Focus Mode: INFINITY"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_1

    .line 568
    :catch_0
    move-exception v0

    .line 569
    .local v0, e:Ljava/lang/Exception;
    const-string v4, "Continuous Auto Focus is not supported on this device."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v0, v4, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public startPreview(Landroid/graphics/SurfaceTexture;ZZIII)V
    .locals 8
    .parameter "texture"
    .parameter "flash"
    .parameter "autoFocus"
    .parameter "frameRate"
    .parameter "rotation"
    .parameter "currentDuration"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;
        }
    .end annotation

    .prologue
    .line 596
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;ZZIII)V

    .line 597
    return-void
.end method

.method public startPreview(Landroid/view/Surface;ZZIII)V
    .locals 8
    .parameter "surface"
    .parameter "flash"
    .parameter "autoFocus"
    .parameter "frameRate"
    .parameter "rotation"
    .parameter "currentDuration"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/CameraManager$InvalidPreviewSizeException;
        }
    .end annotation

    .prologue
    .line 592
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lco/vine/android/recorder/CameraManager;->startPreview(Landroid/view/Surface;Landroid/graphics/SurfaceTexture;ZZIII)V

    .line 593
    return-void
.end method

.method public stopPreview()V
    .locals 2

    .prologue
    .line 575
    iget-object v1, p0, Lco/vine/android/recorder/CameraManager;->mLOCK:[I

    monitor-enter v1

    .line 576
    :try_start_0
    const-string v0, "6. Stop Preview."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 577
    iget-object v0, p0, Lco/vine/android/recorder/CameraManager;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 578
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/CameraManager;->isPreviewing:Z

    .line 579
    monitor-exit v1

    .line 580
    return-void

    .line 579
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
