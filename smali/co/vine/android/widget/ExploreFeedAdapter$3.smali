.class Lco/vine/android/widget/ExploreFeedAdapter$3;
.super Ljava/lang/Object;
.source "ExploreFeedAdapter.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


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
    .line 156
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$3;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 1
    .parameter "mp"

    .prologue
    .line 159
    const-string v0, "Video Prepared."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$3;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$800(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 161
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 162
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$3;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #calls: Lco/vine/android/widget/ExploreFeedAdapter;->onVideoStarted()V
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$900(Lco/vine/android/widget/ExploreFeedAdapter;)V

    .line 164
    :cond_0
    return-void
.end method
