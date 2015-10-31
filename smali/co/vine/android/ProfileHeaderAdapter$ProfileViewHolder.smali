.class Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;
.super Ljava/lang/Object;
.source "ProfileHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ProfileHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProfileViewHolder"
.end annotation


# instance fields
.field public description:Landroid/widget/TextView;

.field public dot:Landroid/widget/TextView;

.field public followStateButton:Lco/vine/android/widget/FollowStateButton;

.field public followers:Landroid/widget/TextView;

.field public following:Landroid/widget/TextView;

.field public imageFrame:Landroid/widget/ImageView;

.field public imageView:Landroid/widget/ImageView;

.field public likes:Lco/vine/android/widget/TabButton;

.field public location:Landroid/widget/TextView;

.field public posts:Lco/vine/android/widget/TabButton;

.field public profileTabArrow:Landroid/view/ViewGroup;

.field public progress:Landroid/widget/ProgressBar;

.field public userId:J

.field public userImageKey:Lco/vine/android/util/image/ImageKey;

.field public username:Landroid/widget/TextView;

.field public verified:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 378
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 379
    const v0, 0x7f0a0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageView:Landroid/widget/ImageView;

    .line 380
    const v0, 0x7f0a0106

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/FollowStateButton;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followStateButton:Lco/vine/android/widget/FollowStateButton;

    .line 381
    const v0, 0x7f0a00aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->username:Landroid/widget/TextView;

    .line 382
    const v0, 0x7f0a0101

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->description:Landroid/widget/TextView;

    .line 383
    const v0, 0x7f0a00c6

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->location:Landroid/widget/TextView;

    .line 384
    const v0, 0x7f0a0103

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->followers:Landroid/widget/TextView;

    .line 385
    const v0, 0x7f0a0105

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->following:Landroid/widget/TextView;

    .line 386
    const v0, 0x7f0a0108

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/TabButton;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->posts:Lco/vine/android/widget/TabButton;

    .line 387
    const v0, 0x7f0a010a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/TabButton;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->likes:Lco/vine/android/widget/TabButton;

    .line 388
    const v0, 0x7f0a0104

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->dot:Landroid/widget/TextView;

    .line 389
    const v0, 0x7f0a010b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->progress:Landroid/widget/ProgressBar;

    .line 390
    const v0, 0x7f0a0150

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->imageFrame:Landroid/widget/ImageView;

    .line 391
    const v0, 0x7f0a0100

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->verified:Landroid/widget/ImageView;

    .line 392
    const v0, 0x7f0a0109

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lco/vine/android/ProfileHeaderAdapter$ProfileViewHolder;->profileTabArrow:Landroid/view/ViewGroup;

    .line 393
    return-void
.end method
