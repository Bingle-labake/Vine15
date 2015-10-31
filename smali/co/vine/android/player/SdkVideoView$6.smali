.class Lco/vine/android/player/SdkVideoView$6;
.super Ljava/lang/Object;
.source "SdkVideoView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/player/SdkVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/player/SdkVideoView;


# direct methods
.method constructor <init>(Lco/vine/android/player/SdkVideoView;)V
    .locals 0
    .parameter

    .prologue
    .line 495
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 498
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    #setter for: Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;
    invoke-static {v0, v1}, Lco/vine/android/player/SdkVideoView;->access$1402(Lco/vine/android/player/SdkVideoView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 499
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSurfaceReadyListener:Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$1500(Lco/vine/android/player/SdkVideoView;)Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 500
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->openVideo()V
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$1600(Lco/vine/android/player/SdkVideoView;)V

    .line 504
    :goto_0
    return-void

    .line 502
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSurfaceReadyListener:Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$1500(Lco/vine/android/player/SdkVideoView;)Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    invoke-interface {v0, v1}, Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;->onSurfaceTextureAvailable(Lco/vine/android/player/SdkVideoView;)V

    goto :goto_0
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 3
    .parameter "surface"

    .prologue
    const/4 v2, 0x1

    .line 523
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;
    invoke-static {v0, v1}, Lco/vine/android/player/SdkVideoView;->access$1402(Lco/vine/android/player/SdkVideoView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 524
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$500(Lco/vine/android/player/SdkVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$500(Lco/vine/android/player/SdkVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 525
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->release(Z)V
    invoke-static {v0, v2}, Lco/vine/android/player/SdkVideoView;->access$1700(Lco/vine/android/player/SdkVideoView;Z)V

    .line 526
    return v2
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 6
    .parameter "surface"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 508
    iget-object v4, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #setter for: Lco/vine/android/player/SdkVideoView;->mSurfaceWidth:I
    invoke-static {v4, p2}, Lco/vine/android/player/SdkVideoView;->access$702(Lco/vine/android/player/SdkVideoView;I)I

    .line 509
    iget-object v4, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #setter for: Lco/vine/android/player/SdkVideoView;->mSurfaceHeight:I
    invoke-static {v4, p3}, Lco/vine/android/player/SdkVideoView;->access$802(Lco/vine/android/player/SdkVideoView;I)I

    .line 510
    iget-object v4, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mTargetState:I
    invoke-static {v4}, Lco/vine/android/player/SdkVideoView;->access$900(Lco/vine/android/player/SdkVideoView;)I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_2

    move v1, v2

    .line 511
    .local v1, isValidState:Z
    :goto_0
    iget-object v4, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    iget v4, v4, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    if-ne v4, p2, :cond_3

    iget-object v4, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    iget v4, v4, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    if-ne v4, p3, :cond_3

    move v0, v2

    .line 512
    .local v0, hasValidSize:Z
    :goto_1
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;
    invoke-static {v2}, Lco/vine/android/player/SdkVideoView;->access$400(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 513
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I
    invoke-static {v2}, Lco/vine/android/player/SdkVideoView;->access$600(Lco/vine/android/player/SdkVideoView;)I

    move-result v2

    if-eqz v2, :cond_0

    .line 514
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    iget-object v3, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I
    invoke-static {v3}, Lco/vine/android/player/SdkVideoView;->access$600(Lco/vine/android/player/SdkVideoView;)I

    move-result v3

    invoke-virtual {v2, v3}, Lco/vine/android/player/SdkVideoView;->seekTo(I)V

    .line 516
    :cond_0
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 518
    :cond_1
    return-void

    .end local v0           #hasValidSize:Z
    .end local v1           #isValidState:Z
    :cond_2
    move v1, v3

    .line 510
    goto :goto_0

    .restart local v1       #isValidState:Z
    :cond_3
    move v0, v3

    .line 511
    goto :goto_1
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .parameter "surface"

    .prologue
    .line 531
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    #setter for: Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;
    invoke-static {v0, v1}, Lco/vine/android/player/SdkVideoView;->access$1402(Lco/vine/android/player/SdkVideoView;Landroid/view/Surface;)Landroid/view/Surface;

    .line 532
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$400(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mTargetState:I
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$900(Lco/vine/android/player/SdkVideoView;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 533
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$600(Lco/vine/android/player/SdkVideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    iget-object v1, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I
    invoke-static {v1}, Lco/vine/android/player/SdkVideoView;->access$600(Lco/vine/android/player/SdkVideoView;)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->seekTo(I)V

    .line 536
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$6;->this$0:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 538
    :cond_1
    return-void
.end method
