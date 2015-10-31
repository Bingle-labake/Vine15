.class Lco/vine/android/player/OldSdkVideoView$2;
.super Ljava/lang/Object;
.source "OldSdkVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


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
    .line 316
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 3
    .parameter "mp"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 318
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v1

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v0, v1}, Lco/vine/android/player/OldSdkVideoView;->access$302(Lco/vine/android/player/OldSdkVideoView;I)I

    .line 319
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v1

    #setter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v0, v1}, Lco/vine/android/player/OldSdkVideoView;->access$402(Lco/vine/android/player/OldSdkVideoView;I)I

    .line 320
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I
    invoke-static {v1}, Lco/vine/android/player/OldSdkVideoView;->access$300(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v1

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I
    invoke-static {v2}, Lco/vine/android/player/OldSdkVideoView;->access$400(Lco/vine/android/player/OldSdkVideoView;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 322
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$2;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->requestLayout()V

    .line 324
    :cond_0
    return-void
.end method
