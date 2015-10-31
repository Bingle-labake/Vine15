.class final Lco/vine/android/util/ViewUtil$1;
.super Landroid/view/animation/Animation;
.source "ViewUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;IILandroid/view/animation/Animation$AnimationListener;)Landroid/view/animation/Animation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$params:Landroid/view/ViewGroup$LayoutParams;

.field final synthetic val$targetSize:I

.field final synthetic val$typeWidth:Z

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(ZLandroid/view/ViewGroup$LayoutParams;ILandroid/view/View;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 64
    iput-boolean p1, p0, Lco/vine/android/util/ViewUtil$1;->val$typeWidth:Z

    iput-object p2, p0, Lco/vine/android/util/ViewUtil$1;->val$params:Landroid/view/ViewGroup$LayoutParams;

    iput p3, p0, Lco/vine/android/util/ViewUtil$1;->val$targetSize:I

    iput-object p4, p0, Lco/vine/android/util/ViewUtil$1;->val$v:Landroid/view/View;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 3
    .parameter "interpolatedTime"
    .parameter "t"

    .prologue
    const/high16 v2, 0x3f80

    .line 67
    iget-boolean v0, p0, Lco/vine/android/util/ViewUtil$1;->val$typeWidth:Z

    if-eqz v0, :cond_1

    .line 68
    iget-object v1, p0, Lco/vine/android/util/ViewUtil$1;->val$params:Landroid/view/ViewGroup$LayoutParams;

    cmpl-float v0, p1, v2

    if-nez v0, :cond_0

    iget v0, p0, Lco/vine/android/util/ViewUtil$1;->val$targetSize:I

    :goto_0
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 74
    :goto_1
    iget-object v0, p0, Lco/vine/android/util/ViewUtil$1;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 75
    return-void

    .line 68
    :cond_0
    iget v0, p0, Lco/vine/android/util/ViewUtil$1;->val$targetSize:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int v0, v0

    goto :goto_0

    .line 71
    :cond_1
    iget-object v1, p0, Lco/vine/android/util/ViewUtil$1;->val$params:Landroid/view/ViewGroup$LayoutParams;

    cmpl-float v0, p1, v2

    if-nez v0, :cond_2

    iget v0, p0, Lco/vine/android/util/ViewUtil$1;->val$targetSize:I

    :goto_2
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1

    :cond_2
    iget v0, p0, Lco/vine/android/util/ViewUtil$1;->val$targetSize:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int v0, v0

    goto :goto_2
.end method

.method public willChangeBounds()Z
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x1

    return v0
.end method
