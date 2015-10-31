.class Lco/vine/android/player/OldSdkVideoView$5;
.super Ljava/lang/Object;
.source "OldSdkVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


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
    .line 391
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView$5;->this$0:Lco/vine/android/player/OldSdkVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .parameter "mp"
    .parameter "arg1"
    .parameter "arg2"

    .prologue
    .line 393
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$5;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$1700(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnInfoListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView$5;->this$0:Lco/vine/android/player/OldSdkVideoView;

    #getter for: Lco/vine/android/player/OldSdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;
    invoke-static {v0}, Lco/vine/android/player/OldSdkVideoView;->access$1700(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnInfoListener;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Landroid/media/MediaPlayer$OnInfoListener;->onInfo(Landroid/media/MediaPlayer;II)Z

    .line 396
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
