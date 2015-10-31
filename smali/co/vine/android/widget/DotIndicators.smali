.class public Lco/vine/android/widget/DotIndicators;
.super Landroid/view/View;
.source "DotIndicators.java"


# instance fields
.field private mActivePos:I

.field private mCameraIconOff:Landroid/graphics/Bitmap;

.field private mCameraIconOn:Landroid/graphics/Bitmap;

.field private mCameraIconWidth:I

.field private mDotHeight:I

.field private mDotWidth:I

.field private mHeight:I

.field private mNum:I

.field private mOff:Landroid/graphics/Bitmap;

.field private mOn:Landroid/graphics/Bitmap;

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/DotIndicators;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/DotIndicators;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0201af

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/widget/DotIndicators;->mOff:Landroid/graphics/Bitmap;

    .line 43
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0201b0

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/widget/DotIndicators;->mOn:Landroid/graphics/Bitmap;

    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0201ae

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconOn:Landroid/graphics/Bitmap;

    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0201ad

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconOff:Landroid/graphics/Bitmap;

    .line 48
    iget-object v0, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconOff:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconWidth:I

    .line 49
    iget-object v0, p0, Lco/vine/android/widget/DotIndicators;->mOn:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/DotIndicators;->mDotWidth:I

    .line 50
    iget-object v0, p0, Lco/vine/android/widget/DotIndicators;->mOn:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/DotIndicators;->mDotHeight:I

    .line 51
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .parameter "canvas"

    .prologue
    const/4 v8, 0x0

    .line 55
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 57
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mHeight:I

    if-eqz v5, :cond_0

    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mWidth:I

    if-eqz v5, :cond_0

    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    if-nez v5, :cond_1

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    div-int/lit8 v5, v5, 0x2

    int-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v2, v5

    .line 62
    .local v2, numLeftDots:I
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mWidth:I

    div-int/lit8 v3, v5, 0x2

    .line 63
    .local v3, screenHalf:I
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mDotWidth:I

    mul-int/2addr v5, v2

    sub-int v5, v3, v5

    iget v6, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconWidth:I

    div-int/lit8 v6, v6, 0x2

    sub-int v1, v5, v6

    .line 64
    .local v1, left:I
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_2

    .line 65
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mDotWidth:I

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v1, v5

    .line 67
    :cond_2
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mHeight:I

    div-int/lit8 v5, v5, 0x2

    iget v6, p0, Lco/vine/android/widget/DotIndicators;->mDotHeight:I

    sub-int v4, v5, v6

    .line 69
    .local v4, top:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    if-ge v0, v5, :cond_4

    .line 70
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mActivePos:I

    if-ne v5, v0, :cond_3

    .line 71
    iget-object v5, p0, Lco/vine/android/widget/DotIndicators;->mOn:Landroid/graphics/Bitmap;

    int-to-float v6, v1

    int-to-float v7, v4

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 75
    :goto_2
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mDotWidth:I

    add-int/2addr v1, v5

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 73
    :cond_3
    iget-object v5, p0, Lco/vine/android/widget/DotIndicators;->mOff:Landroid/graphics/Bitmap;

    int-to-float v6, v1

    int-to-float v7, v4

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_2

    .line 79
    :cond_4
    iget v5, p0, Lco/vine/android/widget/DotIndicators;->mActivePos:I

    iget v6, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    if-ne v5, v6, :cond_5

    .line 80
    iget-object v5, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconOn:Landroid/graphics/Bitmap;

    int-to-float v6, v1

    int-to-float v7, v4

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 82
    :cond_5
    iget-object v5, p0, Lco/vine/android/widget/DotIndicators;->mCameraIconOff:Landroid/graphics/Bitmap;

    int-to-float v6, v1

    int-to-float v7, v4

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 88
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 89
    iput p1, p0, Lco/vine/android/widget/DotIndicators;->mWidth:I

    .line 90
    iput p2, p0, Lco/vine/android/widget/DotIndicators;->mHeight:I

    .line 91
    return-void
.end method

.method public setActiveDot(I)V
    .locals 0
    .parameter "active"

    .prologue
    .line 99
    iput p1, p0, Lco/vine/android/widget/DotIndicators;->mActivePos:I

    .line 100
    invoke-virtual {p0}, Lco/vine/android/widget/DotIndicators;->invalidate()V

    .line 101
    return-void
.end method

.method public setNumberOfDots(I)V
    .locals 0
    .parameter "num"

    .prologue
    .line 94
    iput p1, p0, Lco/vine/android/widget/DotIndicators;->mNum:I

    .line 95
    return-void
.end method
