.class public Lco/vine/android/player/OnSingleVideoClickedListener;
.super Ljava/lang/Object;
.source "OnSingleVideoClickedListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mState:I

.field private final mViewPlayer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/player/VideoViewInterface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lco/vine/android/player/VideoViewInterface;)V
    .locals 1
    .parameter "videoPlayer"

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/player/OnSingleVideoClickedListener;->mViewPlayer:Ljava/lang/ref/WeakReference;

    .line 20
    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 2

    .prologue
    .line 23
    iget-object v1, p0, Lco/vine/android/player/OnSingleVideoClickedListener;->mViewPlayer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/player/VideoViewInterface;

    .line 24
    .local v0, player:Lco/vine/android/player/VideoViewInterface;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->hasStarted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 25
    const-string v1, "Change player state."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 26
    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->isPaused()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 27
    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->resume()V

    .line 28
    const/4 v1, 0x1

    iput v1, p0, Lco/vine/android/player/OnSingleVideoClickedListener;->mState:I

    .line 37
    :goto_0
    return-void

    .line 30
    :cond_0
    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->pause()V

    .line 31
    const/4 v1, 0x0

    iput v1, p0, Lco/vine/android/player/OnSingleVideoClickedListener;->mState:I

    goto :goto_0

    .line 34
    :cond_1
    const-string v1, "Ignore because it is not in playing state."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 35
    const/4 v1, -0x1

    iput v1, p0, Lco/vine/android/player/OnSingleVideoClickedListener;->mState:I

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 41
    invoke-virtual {p0}, Lco/vine/android/player/OnSingleVideoClickedListener;->onClick()V

    .line 42
    return-void
.end method
