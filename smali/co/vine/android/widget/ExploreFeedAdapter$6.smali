.class Lco/vine/android/widget/ExploreFeedAdapter$6;
.super Lco/vine/android/player/SensitiveImageClickListener;
.source "ExploreFeedAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/ExploreFeedAdapter;->createSensitiveLisenter(Lco/vine/android/widget/ExploreFeedViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/widget/ExploreFeedAdapter;

.field final synthetic val$h:Lco/vine/android/widget/ExploreFeedViewHolder;


# direct methods
.method constructor <init>(Lco/vine/android/widget/ExploreFeedAdapter;Ljava/util/HashSet;Lco/vine/android/widget/ExploreFeedViewHolder;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 241
    .local p2, x0:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iput-object p3, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->val$h:Lco/vine/android/widget/ExploreFeedViewHolder;

    invoke-direct {p0, p2}, Lco/vine/android/player/SensitiveImageClickListener;-><init>(Ljava/util/HashSet;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 244
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    iget v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->mPosition:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 245
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->val$h:Lco/vine/android/widget/ExploreFeedViewHolder;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/ExploreFeedAdapter;->bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 246
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter$6;->val$h:Lco/vine/android/widget/ExploreFeedViewHolder;

    const/4 v2, 0x0

    #calls: Lco/vine/android/widget/ExploreFeedAdapter;->showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
    invoke-static {v0, v1, v2}, Lco/vine/android/widget/ExploreFeedAdapter;->access$700(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/widget/ExploreFeedViewHolder;Z)V

    .line 247
    return-void
.end method
