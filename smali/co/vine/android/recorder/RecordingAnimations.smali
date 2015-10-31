.class public Lco/vine/android/recorder/RecordingAnimations;
.super Ljava/lang/Object;
.source "RecordingAnimations.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFocusAnimationSet(Landroid/view/animation/AlphaAnimation;Landroid/widget/ImageView;)Landroid/view/animation/AnimationSet;
    .locals 13
    .parameter "focusDismissAnimation"
    .parameter "focusIndicator"

    .prologue
    const v2, 0x3f59999a

    const/high16 v12, 0x3f00

    const/4 v11, 0x1

    const/high16 v1, 0x3f80

    .line 51
    invoke-virtual {p1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/RelativeLayout$LayoutParams;

    .line 52
    .local v10, indicatorParams:Landroid/widget/RelativeLayout$LayoutParams;
    if-nez v10, :cond_0

    .line 53
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "XML is missing layout params for focus indicator. Wrong view?"

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    :cond_0
    new-instance v0, Landroid/view/animation/ScaleAnimation;

    iget v3, v10, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v5, v3

    iget v3, v10, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v6, v3

    move v3, v1

    move v4, v2

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 56
    .local v0, focusResizeAnimation:Landroid/view/animation/ScaleAnimation;
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/view/animation/ScaleAnimation;->setRepeatMode(I)V

    .line 57
    invoke-virtual {v0, v11}, Landroid/view/animation/ScaleAnimation;->setRepeatCount(I)V

    .line 58
    const-wide/16 v3, 0x50

    invoke-virtual {v0, v3, v4}, Landroid/view/animation/ScaleAnimation;->setDuration(J)V

    .line 59
    invoke-virtual {v0, v11}, Landroid/view/animation/ScaleAnimation;->setFillAfter(Z)V

    .line 60
    new-instance v3, Lco/vine/android/recorder/RecordingAnimations$2;

    invoke-direct {v3, p1, p0}, Lco/vine/android/recorder/RecordingAnimations$2;-><init>(Landroid/widget/ImageView;Landroid/view/animation/AlphaAnimation;)V

    invoke-virtual {v0, v3}, Landroid/view/animation/ScaleAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 69
    new-instance v9, Landroid/view/animation/AnimationSet;

    invoke-direct {v9, v11}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 70
    .local v9, focusAnimationSet:Landroid/view/animation/AnimationSet;
    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 71
    .local v2, animation:Landroid/view/animation/Animation;
    invoke-virtual {v9, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 72
    new-instance v2, Landroid/view/animation/ScaleAnimation;

    .end local v2           #animation:Landroid/view/animation/Animation;
    iget v3, v10, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v7, v3

    iget v3, v10, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v8, v3

    move v3, v12

    move v4, v1

    move v5, v12

    move v6, v1

    invoke-direct/range {v2 .. v8}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFFF)V

    .line 73
    .restart local v2       #animation:Landroid/view/animation/Animation;
    invoke-virtual {v9, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 74
    invoke-virtual {v9, v11}, Landroid/view/animation/AnimationSet;->setFillAfter(Z)V

    .line 75
    const-wide/16 v3, 0x12c

    invoke-virtual {v9, v3, v4}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 76
    new-instance v1, Lco/vine/android/recorder/RecordingAnimations$3;

    invoke-direct {v1, p1, v0}, Lco/vine/android/recorder/RecordingAnimations$3;-><init>(Landroid/widget/ImageView;Landroid/view/animation/ScaleAnimation;)V

    invoke-virtual {v9, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 84
    return-object v9
.end method

.method public static getFocusDismissAnimation(Landroid/widget/ImageView;)Landroid/view/animation/AlphaAnimation;
    .locals 3
    .parameter "focusIndicator"

    .prologue
    .line 19
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f80

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 20
    .local v0, focusDismissAnimation:Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 21
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 22
    new-instance v1, Lco/vine/android/recorder/RecordingAnimations$1;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/RecordingAnimations$1;-><init>(Landroid/widget/ImageView;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 31
    return-object v0
.end method

.method public static getGridDimissAnimation(Lco/vine/android/animation/SimpleAnimationListener;)Landroid/view/animation/AlphaAnimation;
    .locals 3
    .parameter "listener"

    .prologue
    .line 35
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f80

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 36
    .local v0, dismissGridAnimation:Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 37
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 38
    invoke-virtual {v0, p0}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 39
    return-object v0
.end method

.method public static getShowGridAinimation(Lco/vine/android/animation/SimpleAnimationListener;)Landroid/view/animation/AlphaAnimation;
    .locals 3
    .parameter "listener"

    .prologue
    .line 43
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f80

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 44
    .local v0, showGridAnimation:Landroid/view/animation/AlphaAnimation;
    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 45
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 46
    invoke-virtual {v0, p0}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 47
    return-object v0
.end method
