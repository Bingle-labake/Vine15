.class Lco/vine/android/player/OldSdkVideoView$1;
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
    .line 38
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView$1;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1
    .parameter "mp"

    .prologue
    .line 41
    const-string v0, "Videoview prepared."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 42
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$1;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mAutoPlay:Z
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$000(Lco/vine/android/player/OldSdkVideoView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 45
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$1;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mLooping:Z
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$100(Lco/vine/android/player/OldSdkVideoView;)Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 46
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$1;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mCustomOnPreParedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$200(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 47
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$1;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mCustomOnPreParedListener:Landroid/media/MediaPlayer$OnPreparedListener;
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$200(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 49
    :cond_1
    return-void
.end method
