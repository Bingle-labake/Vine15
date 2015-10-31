.class Lco/vine/android/widget/ExploreFeedAdapter$2;
.super Ljava/lang/Object;
.source "ExploreFeedAdapter.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/ExploreFeedAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/widget/ExploreFeedAdapter;


# direct methods
.method constructor <init>(Lco/vine/android/widget/ExploreFeedAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 136
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 5
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    const/4 v4, 0x1

    .line 139
    const-string v1, "Video error."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    .line 140
    const-string v1, "Tags: {} {}."

    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mShouldBePlayingHolder:Lco/vine/android/widget/ExploreFeedViewHolder;
    invoke-static {v2}, Lco/vine/android/widget/ExploreFeedAdapter;->access$500(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/widget/ExploreFeedViewHolder;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v3}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/player/OldSdkVideoView;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 141
    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v1}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/ExploreFeedViewHolder;

    .line 142
    .local v0, holder:Lco/vine/android/widget/ExploreFeedViewHolder;
    if-eqz v0, :cond_0

    .line 143
    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v1}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/player/OldSdkVideoView;->isReportErrorOn()Z

    move-result v1

    if-nez v1, :cond_1

    .line 144
    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v1, v1, Lco/vine/android/widget/ExploreFeedAdapter;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lco/vine/android/util/SystemUtil;->setNormalVideoPlayable(Landroid/content/Context;Z)V

    .line 145
    const-string v1, "Replay video using videoLowUrl."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    .line 146
    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v1}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v1

    invoke-virtual {v1, v4}, Lco/vine/android/player/OldSdkVideoView;->setReportOpenVideoError(Z)V

    .line 147
    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$2;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #calls: Lco/vine/android/widget/ExploreFeedAdapter;->showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
    invoke-static {v1, v0, v4}, Lco/vine/android/widget/ExploreFeedAdapter;->access$700(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/widget/ExploreFeedViewHolder;Z)V

    .line 152
    :cond_0
    :goto_0
    return v4

    .line 149
    :cond_1
    const-string v1, "Error still detected."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
