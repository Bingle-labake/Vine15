.class Lco/vine/android/widget/FeedAdapter$1;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/FeedAdapter;->initVideoView(ILco/vine/android/widget/FeedViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/widget/FeedAdapter;

.field final synthetic val$tag:Lco/vine/android/widget/FeedViewHolder;

.field final synthetic val$view:Lco/vine/android/player/SdkVideoView;


# direct methods
.method constructor <init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/player/SdkVideoView;Lco/vine/android/widget/FeedViewHolder;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 380
    iput-object p1, p0, Lco/vine/android/widget/FeedAdapter$1;->this$0:Lco/vine/android/widget/FeedAdapter;

    iput-object p2, p0, Lco/vine/android/widget/FeedAdapter$1;->val$view:Lco/vine/android/player/SdkVideoView;

    iput-object p3, p0, Lco/vine/android/widget/FeedAdapter$1;->val$tag:Lco/vine/android/widget/FeedViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .parameter "mp"

    .prologue
    .line 383
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter$1;->val$view:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->getPlayingPosition()I

    move-result v0

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$1;->this$0:Lco/vine/android/widget/FeedAdapter;

    #getter for: Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I
    invoke-static {v1}, Lco/vine/android/widget/FeedAdapter;->access$000(Lco/vine/android/widget/FeedAdapter;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 384
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 388
    :goto_0
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter$1;->this$0:Lco/vine/android/widget/FeedAdapter;

    invoke-virtual {v0}, Lco/vine/android/widget/FeedAdapter;->endLoadingTimeProfiling()V

    .line 390
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter$1;->val$tag:Lco/vine/android/widget/FeedViewHolder;

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 391
    return-void

    .line 386
    :cond_0
    const-string v0, "This video should not be played: {}, {}."

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter$1;->val$view:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/SdkVideoView;->getPlayingPosition()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/widget/FeedAdapter$1;->this$0:Lco/vine/android/widget/FeedAdapter;

    #getter for: Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I
    invoke-static {v2}, Lco/vine/android/widget/FeedAdapter;->access$000(Lco/vine/android/widget/FeedAdapter;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method
