.class public Lco/vine/android/service/CameraService;
.super Landroid/app/Service;
.source "CameraService.java"


# static fields
.field public static IS_RUNNING:Z


# instance fields
.field private mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x0

    sput-boolean v0, Lco/vine/android/service/CameraService;->IS_RUNNING:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 24
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    .line 43
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 44
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/service/CameraService;->IS_RUNNING:Z

    .line 45
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 29
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 30
    const/4 v1, 0x0

    sput-boolean v1, Lco/vine/android/service/CameraService;->IS_RUNNING:Z

    .line 31
    iget-object v1, p0, Lco/vine/android/service/CameraService;->mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    if-eqz v1, :cond_0

    .line 33
    :try_start_0
    iget-object v1, p0, Lco/vine/android/service/CameraService;->mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 34
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/service/CameraService;->mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :cond_0
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    .local v0, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v1, "Failed to release vine recorder."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 5
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    const/4 v4, 0x1

    .line 49
    const-string v1, "****Loading camera service.******"

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 50
    invoke-static {p0}, Lco/vine/android/recorder/RecordConfigUtils;->loadWasEverSuccessful(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    iget-object v1, p0, Lco/vine/android/service/CameraService;->mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    if-nez v1, :cond_0

    .line 53
    :try_start_0
    new-instance v1, Lco/vine/android/recorder/PreloaderThread;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/PreloaderThread;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lco/vine/android/recorder/PreloaderThread;->run()V

    .line 54
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    const-string v2, ""

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lco/vine/android/service/CameraService;->mVineRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :cond_0
    :goto_0
    return v4

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, throwable:Ljava/lang/Throwable;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 60
    .end local v0           #throwable:Ljava/lang/Throwable;
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/service/CameraService;->stopSelf()V

    goto :goto_0
.end method
