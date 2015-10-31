.class public Lco/vine/android/player/VideoSensitiveImageClickListener;
.super Lco/vine/android/player/SensitiveImageClickListener;
.source "VideoSensitiveImageClickListener.java"


# instance fields
.field private mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;


# direct methods
.method public constructor <init>(Lco/vine/android/player/HasVideoPlayerAdapter;Ljava/util/HashSet;)V
    .locals 0
    .parameter "adapter"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/player/HasVideoPlayerAdapter;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p2, explicitDismissed:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Integer;>;"
    invoke-direct {p0, p2}, Lco/vine/android/player/SensitiveImageClickListener;-><init>(Ljava/util/HashSet;)V

    .line 21
    iput-object p1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    .line 22
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    .line 26
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    iget v2, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lco/vine/android/player/HasVideoPlayerAdapter;->getPlayer(IZ)Lco/vine/android/player/SdkVideoView;

    move-result-object v0

    .line 27
    .local v0, player:Lco/vine/android/player/SdkVideoView;
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    invoke-interface {v1}, Lco/vine/android/player/HasVideoPlayerAdapter;->getLastPlayer()Lco/vine/android/player/SdkVideoView;

    move-result-object v1

    if-eq v1, v0, :cond_0

    .line 28
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    invoke-interface {v1}, Lco/vine/android/player/HasVideoPlayerAdapter;->pauseCurrentPlayer()V

    .line 30
    :cond_0
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->hasStarted()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 31
    iget v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->getPlayingPosition()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 32
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isPaused()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 33
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->resume()V

    .line 45
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    goto :goto_0

    .line 38
    :cond_2
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mExplicitDismissed:Ljava/util/HashSet;

    iget v2, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 39
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    iget v2, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    invoke-interface {v1, v2}, Lco/vine/android/player/HasVideoPlayerAdapter;->playFile(I)V

    goto :goto_0

    .line 42
    :cond_3
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mExplicitDismissed:Ljava/util/HashSet;

    iget v2, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object v1, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mAdapter:Lco/vine/android/player/HasVideoPlayerAdapter;

    iget v2, p0, Lco/vine/android/player/VideoSensitiveImageClickListener;->mPosition:I

    invoke-interface {v1, v2}, Lco/vine/android/player/HasVideoPlayerAdapter;->play(I)V

    goto :goto_0
.end method
