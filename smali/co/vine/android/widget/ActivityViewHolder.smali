.class public Lco/vine/android/widget/ActivityViewHolder;
.super Ljava/lang/Object;
.source "ActivityViewHolder.java"


# instance fields
.field public byline:Landroid/widget/TextView;

.field public contentLine:Landroid/widget/TextView;

.field public isLocked:Z

.field public postId:J

.field public targetImageKey:Lco/vine/android/util/image/ImageKey;

.field public targetUserImage:Landroid/widget/ImageView;

.field public type:I

.field public userId:J

.field public userImage:Landroid/widget/ImageView;

.field public userImageKey:Lco/vine/android/util/image/ImageKey;

.field public userImageOverlay:Landroid/widget/ImageView;

.field public username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const v0, 0x7f0a0051

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ActivityViewHolder;->userImage:Landroid/widget/ImageView;

    .line 29
    const v0, 0x7f0a0053

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ActivityViewHolder;->userImageOverlay:Landroid/widget/ImageView;

    .line 30
    const v0, 0x7f0a004e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/ActivityViewHolder;->contentLine:Landroid/widget/TextView;

    .line 31
    const v0, 0x7f0a004f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lco/vine/android/widget/ActivityViewHolder;->byline:Landroid/widget/TextView;

    .line 32
    const v0, 0x7f0a0052

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/widget/ActivityViewHolder;->targetUserImage:Landroid/widget/ImageView;

    .line 33
    return-void
.end method
