.class public Lco/vine/android/util/ViewUtil;
.super Ljava/lang/Object;
.source "ViewUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/ViewUtil$ResizeAnimationType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;
    .locals 2
    .parameter "type"
    .parameter "v"
    .parameter "targetSize"

    .prologue
    .line 40
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;IILandroid/view/animation/Animation$AnimationListener;)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method public static makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;II)Landroid/view/animation/Animation;
    .locals 1
    .parameter "type"
    .parameter "v"
    .parameter "targetSize"
    .parameter "duration"

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;IILandroid/view/animation/Animation$AnimationListener;)Landroid/view/animation/Animation;

    move-result-object v0

    return-object v0
.end method

.method public static makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;IILandroid/view/animation/Animation$AnimationListener;)Landroid/view/animation/Animation;
    .locals 8
    .parameter "type"
    .parameter "v"
    .parameter "targetSize"
    .parameter "duration"
    .parameter "listener"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 53
    .local v2, params:Landroid/view/ViewGroup$LayoutParams;
    sget-object v7, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    if-eq p0, v7, :cond_0

    sget-object v7, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->COLLAPSE_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    if-ne p0, v7, :cond_3

    :cond_0
    move v4, v6

    .line 55
    .local v4, typeWidth:Z
    :goto_0
    sget-object v7, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    if-eq p0, v7, :cond_1

    sget-object v7, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_HEIGHT:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    if-ne p0, v7, :cond_4

    :cond_1
    move v3, v6

    .line 57
    .local v3, typeExpand:Z
    :goto_1
    if-eqz v3, :cond_6

    .line 58
    if-eqz v4, :cond_5

    .line 59
    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 63
    :goto_2
    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 64
    new-instance v0, Lco/vine/android/util/ViewUtil$1;

    invoke-direct {v0, v4, v2, p2, p1}, Lco/vine/android/util/ViewUtil$1;-><init>(ZLandroid/view/ViewGroup$LayoutParams;ILandroid/view/View;)V

    .line 106
    .local v0, animation:Landroid/view/animation/Animation;
    :goto_3
    if-lez p3, :cond_2

    .line 107
    int-to-long v5, p3

    invoke-virtual {v0, v5, v6}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 109
    :cond_2
    invoke-virtual {v0, p4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 110
    return-object v0

    .end local v0           #animation:Landroid/view/animation/Animation;
    .end local v3           #typeExpand:Z
    .end local v4           #typeWidth:Z
    :cond_3
    move v4, v5

    .line 53
    goto :goto_0

    .restart local v4       #typeWidth:Z
    :cond_4
    move v3, v5

    .line 55
    goto :goto_1

    .line 61
    .restart local v3       #typeExpand:Z
    :cond_5
    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_2

    .line 83
    :cond_6
    if-eqz v4, :cond_7

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    .line 84
    .local v1, initialSize:I
    :goto_4
    new-instance v0, Lco/vine/android/util/ViewUtil$2;

    invoke-direct {v0, p1, v4, v2, v1}, Lco/vine/android/util/ViewUtil$2;-><init>(Landroid/view/View;ZLandroid/view/ViewGroup$LayoutParams;I)V

    .restart local v0       #animation:Landroid/view/animation/Animation;
    goto :goto_3

    .line 83
    .end local v0           #animation:Landroid/view/animation/Animation;
    .end local v1           #initialSize:I
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    goto :goto_4
.end method

.method public static setBackground(Landroid/content/res/Resources;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "res"
    .parameter "view"
    .parameter "bitmap"

    .prologue
    .line 27
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p0, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 28
    .local v0, d:Landroid/graphics/drawable/BitmapDrawable;
    invoke-static {p1, v0}, Lco/vine/android/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 29
    return-void
.end method

.method public static setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .parameter "view"
    .parameter "drawable"

    .prologue
    .line 19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    :goto_0
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method
