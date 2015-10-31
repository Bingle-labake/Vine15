.class Lco/vine/android/player/SdkVideoView$4;
.super Ljava/lang/Object;
.source "SdkVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


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
    .line 404
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 6
    .parameter "mp"
    .parameter "framework_err"
    .parameter "impl_err"

    .prologue
    const/4 v5, -0x1

    const/4 v4, 0x1

    .line 406
    const-string v0, "Error: {}, {}, {}, {}."

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const/4 v2, 0x2

    iget-object v3, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;
    invoke-static {v3}, Lco/vine/android/player/SdkVideoView;->access$1100(Lco/vine/android/player/SdkVideoView;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 407
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V
    invoke-static {v0, v5}, Lco/vine/android/player/SdkVideoView;->access$100(Lco/vine/android/player/SdkVideoView;I)V

    .line 408
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #setter for: Lco/vine/android/player/SdkVideoView;->mTargetState:I
    invoke-static {v0, v5}, Lco/vine/android/player/SdkVideoView;->access$902(Lco/vine/android/player/SdkVideoView;I)I

    .line 409
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;
    invoke-static {v0, v1}, Lco/vine/android/player/SdkVideoView;->access$1102(Lco/vine/android/player/SdkVideoView;Ljava/lang/String;)Ljava/lang/String;

    .line 410
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$500(Lco/vine/android/player/SdkVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 411
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$500(Lco/vine/android/player/SdkVideoView;)Landroid/widget/MediaController;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 414
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$1200(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 415
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #getter for: Lco/vine/android/player/SdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;
    invoke-static {v0}, Lco/vine/android/player/SdkVideoView;->access$1200(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/player/SdkVideoView$4;->this$0:Lco/vine/android/player/SdkVideoView;

    #calls: Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;
    invoke-static {v1}, Lco/vine/android/player/SdkVideoView;->access$400(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 419
    :cond_1
    return v4
.end method
