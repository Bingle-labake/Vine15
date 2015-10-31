.class public Lco/vine/android/widget/FeedViewHolder;
.super Lco/vine/android/widget/GenericFeedViewHolder;
.source "FeedViewHolder.java"


# instance fields
.field public listener:Lco/vine/android/player/OnListVideoClickListener;

.field public videoImage:Landroid/widget/ImageView;

.field public videoView:Lco/vine/android/player/SdkVideoView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lco/vine/android/widget/GenericFeedViewHolder;-><init>(Landroid/view/View;)V

    .line 27
    const v0, 0x7f0a00b6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/FeedViewHolder;->videoImage:Landroid/widget/ImageView;

    .line 28
    return-void
.end method


# virtual methods
.method public getViewForVideoImage()Landroid/view/View;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lco/vine/android/widget/FeedViewHolder;->videoImage:Landroid/widget/ImageView;

    return-object v0
.end method
