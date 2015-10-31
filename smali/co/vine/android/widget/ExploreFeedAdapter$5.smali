.class Lco/vine/android/widget/ExploreFeedAdapter$5;
.super Ljava/lang/Object;
.source "ExploreFeedAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/ExploreFeedAdapter;->showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
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
    .line 224
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$5;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 227
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$5;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$800(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$5;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$800(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 229
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$5;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$5;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;
    invoke-static {v0}, Lco/vine/android/widget/ExploreFeedAdapter;->access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->onPrepared()V

    .line 233
    :cond_0
    return-void
.end method
