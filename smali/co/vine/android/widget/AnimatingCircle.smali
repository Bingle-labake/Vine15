.class public Lco/vine/android/widget/AnimatingCircle;
.super Landroid/view/View;
.source "AnimatingCircle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/AnimatingCircle$AnimationRunnable;,
        Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field private static final COSINE_45_DEGREES:D = 0.0

.field private static final DEFAULT_DURATION:I = 0xfa

.field private static final FORTY_FIVE_DEGREES_IN_RADIANS:D = 0.8377580642700195

.field private static final STEP_LENGTH:I = 0x5


# instance fields
.field private mBackgroundColor:I

.field private final mClearPaint:Landroid/graphics/Paint;

.field private mHypoteneuse:F

.field private mIsAnimating:Z

.field private mListener:Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;

.field private mNewRadius:F

.field private final mPaint:Landroid/graphics/Paint;

.field private final mRadius:I

.field private mRunnable:Ljava/lang/Runnable;

.field private mStepDistance:F

.field private mXMargin:I

.field private final mXOffset:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    const-wide v0, 0x3feaceea00000000L

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    sput-wide v0, Lco/vine/android/widget/AnimatingCircle;->COSINE_45_DEGREES:D

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/AnimatingCircle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/AnimatingCircle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 17
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 84
    invoke-direct/range {p0 .. p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 85
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 87
    .local v10, res:Landroid/content/res/Resources;
    sget-object v14, Lco/vine/android/R$styleable;->AnimatingCircle:[I

    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v1, v14, v2, v15}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 89
    .local v3, a:Landroid/content/res/TypedArray;
    const/4 v14, 0x0

    const v15, 0x7f090035

    invoke-virtual {v10, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v15

    invoke-virtual {v3, v14, v15}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/widget/AnimatingCircle;->mBackgroundColor:I

    .line 91
    const/4 v14, 0x1

    const v15, 0x7f0b0045

    invoke-virtual {v10, v15}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v15

    invoke-virtual {v3, v14, v15}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/widget/AnimatingCircle;->mRadius:I

    .line 93
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mPaint:Landroid/graphics/Paint;

    .line 96
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    .line 97
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 98
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setDither(Z)V

    .line 99
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 100
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    new-instance v15, Landroid/graphics/PorterDuffXfermode;

    sget-object v16, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct/range {v15 .. v16}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 102
    const-string v14, "window"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/view/WindowManager;

    invoke-interface {v14}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 104
    .local v7, display:Landroid/view/Display;
    invoke-static {v7}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v12

    .line 105
    .local v12, size:Landroid/graphics/Point;
    iget v13, v12, Landroid/graphics/Point;->x:I

    .line 106
    .local v13, width:I
    iget v8, v12, Landroid/graphics/Point;->y:I

    .line 108
    .local v8, height:I
    invoke-static {v13, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 111
    .local v6, determiningLength:I
    div-int/lit8 v4, v6, 0x2

    .line 112
    .local v4, adjacent:I
    int-to-float v14, v4

    sget-wide v15, Lco/vine/android/widget/AnimatingCircle;->COSINE_45_DEGREES:D

    double-to-float v15, v15

    div-float v9, v14, v15

    .line 113
    .local v9, hypotenuse:F
    move-object/from16 v0, p0

    iget v14, v0, Lco/vine/android/widget/AnimatingCircle;->mRadius:I

    int-to-float v14, v14

    div-float v11, v9, v14

    .line 115
    .local v11, scale:F
    move-object/from16 v0, p0

    iput v9, v0, Lco/vine/android/widget/AnimatingCircle;->mHypoteneuse:F

    .line 117
    const v14, 0x7f0b0011

    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v14

    int-to-float v14, v14

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/widget/AnimatingCircle;->mXOffset:F

    .line 119
    const v14, 0x7f0b0021

    invoke-virtual {v10, v14}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/widget/AnimatingCircle;->mXMargin:I

    .line 120
    new-instance v14, Lco/vine/android/widget/AnimatingCircle$AnimationRunnable;

    move-object/from16 v0, p0

    invoke-direct {v14, v0}, Lco/vine/android/widget/AnimatingCircle$AnimationRunnable;-><init>(Lco/vine/android/widget/AnimatingCircle;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lco/vine/android/widget/AnimatingCircle;->mRunnable:Ljava/lang/Runnable;

    .line 122
    move-object/from16 v0, p0

    iget v14, v0, Lco/vine/android/widget/AnimatingCircle;->mHypoteneuse:F

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/widget/AnimatingCircle;->mRadius:I

    int-to-float v15, v15

    sub-float v5, v14, v15

    .line 123
    .local v5, animationDistance:F
    const/high16 v14, 0x437a

    div-float v14, v5, v14

    const/high16 v15, 0x40a0

    mul-float/2addr v14, v15

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/widget/AnimatingCircle;->mStepDistance:F

    .line 124
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lco/vine/android/widget/AnimatingCircle;->mIsAnimating:Z

    .line 127
    const/4 v14, 0x1

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lco/vine/android/widget/AnimatingCircle;->setLayerType(ILandroid/graphics/Paint;)V

    .line 128
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/widget/AnimatingCircle;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget v0, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    return v0
.end method

.method static synthetic access$002(Lco/vine/android/widget/AnimatingCircle;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 25
    iput p1, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    return p1
.end method

.method static synthetic access$100(Lco/vine/android/widget/AnimatingCircle;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    iget v0, p0, Lco/vine/android/widget/AnimatingCircle;->mStepDistance:F

    return v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .parameter "canvas"

    .prologue
    const/4 v1, 0x0

    .line 132
    iget v0, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 133
    iget v0, p0, Lco/vine/android/widget/AnimatingCircle;->mRadius:I

    int-to-float v0, v0

    iput v0, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    .line 135
    :cond_0
    iget-object v0, p0, Lco/vine/android/widget/AnimatingCircle;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lco/vine/android/widget/AnimatingCircle;->mBackgroundColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 136
    invoke-virtual {p0}, Lco/vine/android/widget/AnimatingCircle;->getMeasuredWidth()I

    move-result v0

    iget v2, p0, Lco/vine/android/widget/AnimatingCircle;->mXMargin:I

    sub-int/2addr v0, v2

    int-to-float v3, v0

    invoke-virtual {p0}, Lco/vine/android/widget/AnimatingCircle;->getMeasuredHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lco/vine/android/widget/AnimatingCircle;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 137
    invoke-virtual {p0}, Lco/vine/android/widget/AnimatingCircle;->getMeasuredWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Lco/vine/android/widget/AnimatingCircle;->mXOffset:F

    add-float/2addr v0, v1

    invoke-virtual {p0}, Lco/vine/android/widget/AnimatingCircle;->getMeasuredHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    iget-object v3, p0, Lco/vine/android/widget/AnimatingCircle;->mClearPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 139
    return-void
.end method

.method public resetAnimation()V
    .locals 1

    .prologue
    .line 161
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/widget/AnimatingCircle;->mIsAnimating:Z

    .line 163
    return-void
.end method

.method public setAnimationListener(Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 166
    iput-object p1, p0, Lco/vine/android/widget/AnimatingCircle;->mListener:Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;

    .line 167
    return-void
.end method

.method public startDefaultAnimation()V
    .locals 4

    .prologue
    .line 142
    iget-boolean v1, p0, Lco/vine/android/widget/AnimatingCircle;->mIsAnimating:Z

    if-nez v1, :cond_1

    .line 143
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/widget/AnimatingCircle;->mIsAnimating:Z

    .line 144
    iget-object v1, p0, Lco/vine/android/widget/AnimatingCircle;->mListener:Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;

    invoke-interface {v1}, Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;->onAnimationStart()V

    .line 148
    :goto_0
    iget v1, p0, Lco/vine/android/widget/AnimatingCircle;->mNewRadius:F

    iget v2, p0, Lco/vine/android/widget/AnimatingCircle;->mHypoteneuse:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 149
    invoke-virtual {p0}, Lco/vine/android/widget/AnimatingCircle;->getHandler()Landroid/os/Handler;

    move-result-object v0

    .line 150
    .local v0, handler:Landroid/os/Handler;
    if-eqz v0, :cond_0

    .line 151
    iget-object v1, p0, Lco/vine/android/widget/AnimatingCircle;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 152
    iget-object v1, p0, Lco/vine/android/widget/AnimatingCircle;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 158
    .end local v0           #handler:Landroid/os/Handler;
    :cond_0
    :goto_1
    return-void

    .line 146
    :cond_1
    iget-object v1, p0, Lco/vine/android/widget/AnimatingCircle;->mListener:Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;

    invoke-interface {v1}, Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;->onAnimationRepeat()V

    goto :goto_0

    .line 155
    :cond_2
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/vine/android/widget/AnimatingCircle;->mIsAnimating:Z

    .line 156
    iget-object v1, p0, Lco/vine/android/widget/AnimatingCircle;->mListener:Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;

    invoke-interface {v1}, Lco/vine/android/widget/AnimatingCircle$AnimatingCircleListener;->onAnimationEnd()V

    goto :goto_1
.end method
