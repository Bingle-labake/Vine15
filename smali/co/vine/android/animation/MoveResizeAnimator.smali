.class public Lco/vine/android/animation/MoveResizeAnimator;
.super Lco/vine/android/animation/SmoothAnimator;
.source "MoveResizeAnimator.java"


# instance fields
.field private final mDeltaHeight:I

.field private final mDeltaWidth:I

.field private final mDeltaX:F

.field private final mDeltaY:F

.field private mId:I

.field private mListener:Lco/vine/android/animation/SmoothAnimator$AnimationListener;

.field private final mOriginalHeight:I

.field private final mOriginalWidth:I

.field private final mOriginalX:I

.field private final mOriginalY:I

.field private final mParam:Landroid/widget/RelativeLayout$LayoutParams;

.field private mTag:Ljava/lang/Object;

.field private final mTarget:Landroid/view/View;

.field private final mTargetHeight:I

.field private final mTargetWidth:I


# direct methods
.method public constructor <init>(ILandroid/view/View;IDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V
    .locals 13
    .parameter "id"
    .parameter "target"
    .parameter "targetY"
    .parameter "targetZoomX"
    .parameter "targetZoomY"
    .parameter "duration"
    .parameter "listener"
    .parameter "tag"

    .prologue
    .line 31
    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p2

    move/from16 v5, p3

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    invoke-direct/range {v0 .. v12}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    .line 32
    return-void
.end method

.method public constructor <init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V
    .locals 3
    .parameter "id"
    .parameter "target"
    .parameter "measureUsingView"
    .parameter "targetX"
    .parameter "targetY"
    .parameter "targetZoomX"
    .parameter "targetZoomY"
    .parameter "duration"
    .parameter "listener"
    .parameter "tag"

    .prologue
    const/4 v2, 0x3

    .line 37
    const v0, 0x3d4ccccd

    invoke-direct {p0, p2, v0, p10}, Lco/vine/android/animation/SmoothAnimator;-><init>(Landroid/view/View;FI)V

    .line 38
    iput-object p2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTarget:Landroid/view/View;

    .line 39
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iput-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    .line 40
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    sub-int/2addr v0, p4

    int-to-float v0, v0

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaX:F

    .line 41
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    sub-int/2addr v0, p5

    int-to-float v0, v0

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaY:F

    .line 42
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalX:I

    .line 43
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalY:I

    .line 44
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    if-ge v0, v2, :cond_0

    .line 45
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 47
    :cond_0
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-ge v0, v2, :cond_1

    .line 48
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 50
    :cond_1
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    int-to-double v0, v0

    mul-double/2addr v0, p6

    double-to-int v0, v0

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetWidth:I

    .line 51
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    int-to-double v0, v0

    mul-double/2addr v0, p8

    double-to-int v0, v0

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetHeight:I

    .line 52
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalWidth:I

    .line 53
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalHeight:I

    .line 54
    iget v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetWidth:I

    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    sub-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaWidth:I

    .line 55
    iget v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetHeight:I

    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    sub-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaHeight:I

    .line 56
    iput-object p11, p0, Lco/vine/android/animation/MoveResizeAnimator;->mListener:Lco/vine/android/animation/SmoothAnimator$AnimationListener;

    .line 57
    iput-object p12, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTag:Ljava/lang/Object;

    .line 58
    iput p1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mId:I

    .line 59
    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 3

    .prologue
    .line 80
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mListener:Lco/vine/android/animation/SmoothAnimator$AnimationListener;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lco/vine/android/animation/MoveResizeAnimator;->mListener:Lco/vine/android/animation/SmoothAnimator$AnimationListener;

    iget v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mId:I

    iget-object v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTag:Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lco/vine/android/animation/SmoothAnimator$AnimationListener;->onAnimationFinish(ILjava/lang/Object;)V

    .line 83
    :cond_0
    return-void
.end method

.method public onUpdate(FF)V
    .locals 5
    .parameter "frac"
    .parameter "smoothFrac"

    .prologue
    .line 63
    const/high16 v1, 0x3f80

    sub-float v0, v1, p2

    .line 64
    .local v0, f:F
    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalX:I

    iget v3, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaX:F

    mul-float/2addr v3, p2

    float-to-int v3, v3

    sub-int/2addr v2, v3

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 65
    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalY:I

    iget v3, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaY:F

    mul-float/2addr v3, p2

    float-to-int v3, v3

    sub-int/2addr v2, v3

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 66
    iget v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetWidth:I

    iget-object v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, v2, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    if-eq v1, v2, :cond_0

    .line 67
    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalWidth:I

    int-to-float v2, v2

    iget v3, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaWidth:I

    int-to-float v3, v3

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 69
    :cond_0
    iget v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTargetHeight:I

    iget-object v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, v2, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    if-eq v1, v2, :cond_1

    .line 70
    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mOriginalHeight:I

    int-to-float v2, v2

    iget v3, p0, Lco/vine/android/animation/MoveResizeAnimator;->mDeltaHeight:I

    int-to-float v3, v3

    mul-float/2addr v3, p2

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 72
    :cond_1
    const-string v1, "Modifying {}: {} {} {} {}"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTarget:Landroid/view/View;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v4, v4, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v4, v4, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v4, v4, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-object v4, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    iget v4, v4, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    iget-object v1, p0, Lco/vine/android/animation/MoveResizeAnimator;->mTarget:Landroid/view/View;

    iget-object v2, p0, Lco/vine/android/animation/MoveResizeAnimator;->mParam:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    return-void
.end method
