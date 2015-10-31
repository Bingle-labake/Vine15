.class Lco/vine/android/widget/ExploreFeedAdapter$7;
.super Lco/vine/android/player/SensitiveImageClickListener;
.source "ExploreFeedAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/ExploreFeedAdapter;->createInsensitiveListener(Lco/vine/android/widget/ExploreFeedViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/widget/ExploreFeedAdapter;


# direct methods
.method constructor <init>(Lco/vine/android/widget/ExploreFeedAdapter;Ljava/util/HashSet;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 259
    .local p2, x0:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$7;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-direct {p0, p2}, Lco/vine/android/player/SensitiveImageClickListener;-><init>(Ljava/util/HashSet;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 262
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter$7;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget v3, p0, Lco/vine/android/widget/ExploreFeedAdapter$7;->mPosition:I

    invoke-virtual {v2, v3}, Lco/vine/android/widget/ExploreFeedAdapter;->getViewAtPosition(I)Landroid/view/View;

    move-result-object v1

    .line 263
    .local v1, view:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 264
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/ExploreFeedViewHolder;

    .line 265
    .local v0, holder:Lco/vine/android/widget/ExploreFeedViewHolder;
    if-eqz v0, :cond_0

    .line 266
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter$7;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    const/4 v3, 0x0

    #calls: Lco/vine/android/widget/ExploreFeedAdapter;->showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
    invoke-static {v2, v0, v3}, Lco/vine/android/widget/ExploreFeedAdapter;->access$700(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/widget/ExploreFeedViewHolder;Z)V

    .line 269
    .end local v0           #holder:Lco/vine/android/widget/ExploreFeedViewHolder;
    :cond_0
    return-void
.end method
