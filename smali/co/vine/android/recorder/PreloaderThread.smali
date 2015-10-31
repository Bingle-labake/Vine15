.class public Lco/vine/android/recorder/PreloaderThread;
.super Ljava/lang/Thread;
.source "PreloaderThread.java"


# instance fields
.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 20
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/recorder/PreloaderThread;->mContext:Ljava/lang/ref/WeakReference;

    .line 21
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 25
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 26
    .local v2, start:J
    iget-object v4, p0, Lco/vine/android/recorder/PreloaderThread;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 27
    .local v0, context:Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 29
    :try_start_0
    invoke-static {v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tryLoad(Landroid/content/Context;)V

    .line 30
    const/16 v4, 0x1e0

    const/16 v5, 0x1e0

    const/16 v6, 0x8

    const/4 v7, 0x4

    invoke-static {v4, v5, v6, v7}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 31
    invoke-static {}, Lco/vine/android/recorder/EncoderManager;->tryLoad()V

    .line 33
    const/4 v4, 0x1

    invoke-static {v0, v4}, Lco/vine/android/recorder/RecordConfigUtils;->setLoadWasEverSuccessful(Landroid/content/Context;Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :cond_0
    :goto_0
    const-string v4, "Loading took {} ms."

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sub-long/2addr v5, v2

    const-wide/32 v7, 0xf4240

    div-long/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    return-void

    .line 34
    :catch_0
    move-exception v1

    .line 35
    .local v1, e:Ljava/lang/Throwable;
    const-string v4, "Failed to load"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v1, v4, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 36
    invoke-static {v0, v8}, Lco/vine/android/recorder/RecordConfigUtils;->setLoadWasEverSuccessful(Landroid/content/Context;Z)V

    goto :goto_0
.end method
