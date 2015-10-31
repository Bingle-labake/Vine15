.class public Lco/vine/android/widget/UserViewHolder;
.super Ljava/lang/Object;
.source "UserViewHolder.java"


# instance fields
.field public avatarUrl:Lco/vine/android/util/image/ImageKey;

.field public bio:Landroid/widget/TextView;

.field public followButton:Landroid/widget/ImageButton;

.field public image:Landroid/widget/ImageView;

.field public location:Landroid/widget/TextView;

.field public userId:J

.field public username:Landroid/widget/TextView;

.field public verified:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const v0, 0x7f0a00aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->username:Landroid/widget/TextView;

    .line 26
    const v0, 0x7f0a0184

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->bio:Landroid/widget/TextView;

    .line 27
    const v0, 0x7f0a0185

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->location:Landroid/widget/TextView;

    .line 28
    const v0, 0x7f0a0181

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->followButton:Landroid/widget/ImageButton;

    .line 29
    const v0, 0x7f0a0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->image:Landroid/widget/ImageView;

    .line 30
    const v0, 0x7f0a0183

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/UserViewHolder;->verified:Landroid/widget/ImageView;

    .line 31
    return-void
.end method
