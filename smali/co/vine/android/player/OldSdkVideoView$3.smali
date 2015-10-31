.class Lco/vine/android/player/OldSdkVideoView$3;
.super Ljava/lang/Object;
.source "OldSdkVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/player/OldSdkVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/player/OldSdkVideoView;


# direct methods
.method constructor <init>(Lco/vine/android/player/OldSdkVideoView;)V
    .locals 0
    .parameter

    .prologue
    .line 327
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 6
    .parameter "mp"

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 329
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    const/4 v2, 0x2

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I
    invoke-static {v1, v2}, Lco/vine/android/player/OldSdkVideoView;->access$502(Lco/vine/android/player/OldSdkVideoView;I)I

    .line 331
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mCanSeekForward:Z
    invoke-static {v3, v4}, Lco/vine/android/player/OldSdkVideoView;->access$802(Lco/vine/android/player/OldSdkVideoView;Z)Z

    move-result v3

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mCanSeekBack:Z
    invoke-static {v2, v3}, Lco/vine/android/player/OldSdkVideoView;->access$702(Lco/vine/android/player/OldSdkVideoView;Z)Z

    move-result v2

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mCanPause:Z
    invoke-static {v1, v2}, Lco/vine/android/player/OldSdkVideoView;->access$602(Lco/vine/android/player/OldSdkVideoView;Z)Z

    .line 333
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$900(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 334
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$900(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v2}, Lco/vine/android/player/OldSdkVideoView;->access$1000(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 336
    :cond_0
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 337
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 339
    :cond_1
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v2

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v1, v2}, Lco/vine/android/player/OldSdkVideoView;->access$302(Lco/vine/android/player/OldSdkVideoView;I)I

    .line 340
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v2

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v1, v2}, Lco/vine/android/player/OldSdkVideoView;->access$402(Lco/vine/android/player/OldSdkVideoView;I)I

    .line 342
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1200(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v0

    .line 343
    .local v0, seekToPosition:I
    if-eqz v0, :cond_2

    .line 344
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1, v0}, Lco/vine/android/player/OldSdkVideoView;->seekTo(I)V

    .line 346
    :cond_2
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    if-eqz v1, :cond_6

    .line 348
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v2}, Lco/vine/android/player/OldSdkVideoView;->access$300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v2

    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v3}, Lco/vine/android/player/OldSdkVideoView;->access$400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 349
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mSurfaceWidth:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v2}, Lco/vine/android/player/OldSdkVideoView;->access$300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v2

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mSurfaceHeight:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v2}, Lco/vine/android/player/OldSdkVideoView;->access$400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 353
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mTargetState:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1500(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    if-ne v1, v5, :cond_4

    .line 354
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->start()V

    .line 355
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 356
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/MediaController;->show()V

    .line 373
    :cond_3
    :goto_0
    return-void

    .line 358
    :cond_4
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->isPlaying()Z

    move-result v1

    if-nez v1, :cond_3

    if-nez v0, :cond_5

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->getCurrentPosition()I

    move-result v1

    if-lez v1, :cond_3

    .line 360
    :cond_5
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 362
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->show(I)V

    goto :goto_0

    .line 369
    :cond_6
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mTargetState:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$1500(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    if-ne v1, v5, :cond_3

    .line 370
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$3;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->start()V

    goto :goto_0
.end method
