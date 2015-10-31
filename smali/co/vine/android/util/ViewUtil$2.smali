.class final Lco/vine/android/util/ViewUtil$2;
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
.field final synthetic val$initialSize:I

.field final synthetic val$params:Landroid/view/ViewGroup$LayoutParams;

.field final synthetic val$typeWidth:Z

.field final synthetic val$v:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;ZLandroid/view/ViewGroup$LayoutParams;I)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 84
    iput-object p1, p0, Lco/vine/android/util/ViewUtil$2;->val$v:Landroid/view/View;

    iput-boolean p2, p0, Lco/vine/android/util/ViewUtil$2;->val$typeWidth:Z

    iput-object p3, p0, Lco/vine/android/util/ViewUtil$2;->val$params:Landroid/view/ViewGroup$LayoutParams;

    iput p4, p0, Lco/vine/android/util/ViewUtil$2;->val$initialSize:I

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 3
    .parameter "interpolatedTime"
    .parameter "t"

    .prologue
    .line 87
    const/high16 v0, 0x3f80

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 88
    iget-object v0, p0, Lco/vine/android/util/ViewUtil$2;->val$v:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 97
    :goto_0
    return-void

    .line 90
    :cond_0
    iget-boolean v0, p0, Lco/vine/android/util/ViewUtil$2;->val$typeWidth:Z

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lco/vine/android/util/ViewUtil$2;->val$params:Landroid/view/ViewGroup$LayoutParams;

    iget v1, p0, Lco/vine/android/util/ViewUtil$2;->val$initialSize:I

    iget v2, p0, Lco/vine/android/util/ViewUtil$2;->val$initialSize:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 95
    :goto_1
    iget-object v0, p0, Lco/vine/android/util/ViewUtil$2;->val$v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    goto :goto_0

    .line 93
    :cond_1
    iget-object v0, p0, Lco/vine/android/util/ViewUtil$2;->val$params:Landroid/view/ViewGroup$LayoutParams;

    iget v1, p0, Lco/vine/android/util/ViewUtil$2;->val$initialSize:I

    iget v2, p0, Lco/vine/android/util/ViewUtil$2;->val$initialSize:I

    int-to-float v2, v2

    mul-float/2addr v2, p1

    float-to-int v2, v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1
.end method

.method public willChangeBounds()Z
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x1

    return v0
.end method
