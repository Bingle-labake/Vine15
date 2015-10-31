.class public Lco/vine/android/widget/ExploreFeedViewHolder;
.super Lco/vine/android/widget/GenericFeedViewHolder;
.source "ExploreFeedViewHolder.java"


# instance fields
.field public videoImage:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lco/vine/android/widget/GenericFeedViewHolder;-><init>(Landroid/view/View;)V

    .line 17
    const v0, 0x7f0a00b6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    .line 18
    return-void
.end method


# virtual methods
.method public getViewForVideoImage()Landroid/view/View;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    return-object v0
.end method
