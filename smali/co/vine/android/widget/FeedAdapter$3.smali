.class Lco/vine/android/widget/FeedAdapter$3;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


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


# direct methods
.method constructor <init>(Lco/vine/android/widget/FeedAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 417
    iput-object p1, p0, Lco/vine/android/widget/FeedAdapter$3;->this$0:Lco/vine/android/widget/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 5
    .parameter "mp"

    .prologue
    .line 420
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 421
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 422
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter$3;->this$0:Lco/vine/android/widget/FeedAdapter;

    #getter for: Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;
    invoke-static {v3}, Lco/vine/android/widget/FeedAdapter;->access$500(Lco/vine/android/widget/FeedAdapter;)Landroid/util/SparseArray;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/widget/FeedAdapter$3;->this$0:Lco/vine/android/widget/FeedAdapter;

    #getter for: Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I
    invoke-static {v4}, Lco/vine/android/widget/FeedAdapter;->access$000(Lco/vine/android/widget/FeedAdapter;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/api/VinePost;

    .line 423
    .local v0, post:Lco/vine/android/api/VinePost;
    if-eqz v0, :cond_0

    .line 424
    iget-wide v1, v0, Lco/vine/android/api/VinePost;->postId:J

    .line 425
    .local v1, postId:J
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter$3;->this$0:Lco/vine/android/widget/FeedAdapter;

    iget-object v3, v3, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lco/vine/android/util/LoopManager;->get(Landroid/content/Context;)Lco/vine/android/util/LoopManager;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lco/vine/android/util/LoopManager;->increment(J)V

    .line 427
    .end local v1           #postId:J
    :cond_0
    return-void
.end method
