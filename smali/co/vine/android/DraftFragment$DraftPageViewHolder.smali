.class public Lco/vine/android/DraftFragment$DraftPageViewHolder;
.super Ljava/lang/Object;
.source "DraftFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/DraftFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DraftPageViewHolder"
.end annotation


# instance fields
.field public containerView:Landroid/view/ViewGroup;

.field public draftContainer:Landroid/widget/RelativeLayout;

.field public progressView:Lco/vine/android/recorder/ProgressView;

.field public thumb:Landroid/widget/ImageView;

.field public videoUrl:Ljava/lang/String;

.field public videoView:Lco/vine/android/player/SdkVideoView;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 1
    .parameter "v"
    .parameter "videoUrl"

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const v0, 0x7f0a0056

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/player/SdkVideoView;

    iput-object v0, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 73
    iput-object p2, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->videoUrl:Ljava/lang/String;

    .line 74
    const v0, 0x7f0a0081

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->containerView:Landroid/view/ViewGroup;

    .line 75
    const v0, 0x7f0a0084

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/ProgressView;

    iput-object v0, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    .line 76
    const v0, 0x7f0a0083

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    .line 77
    const v0, 0x7f0a0080

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->draftContainer:Landroid/widget/RelativeLayout;

    .line 78
    return-void
.end method
