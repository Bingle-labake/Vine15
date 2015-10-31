.class public Lco/vine/android/widget/ViewPagerScrollBar;
.super Landroid/view/View;
.source "ViewPagerScrollBar.java"


# instance fields
.field private mColorIds:[I

.field private mOffsetPixels:I

.field private final mPaint:Landroid/graphics/Paint;

.field private mPosition:I

.field private mRange:I

.field private final mTabBounds:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 35
    const/4 v0, 0x0

    const v1, 0x7f010046

    invoke-direct {p0, p1, v0, v1}, Lco/vine/android/widget/ViewPagerScrollBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 39
    const v0, 0x7f010046

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/ViewPagerScrollBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    iput v5, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    .line 44
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    .line 45
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mTabBounds:Landroid/graphics/RectF;

    .line 46
    sget-object v4, Lco/vine/android/R$styleable;->ViewPagerScrollBar:[I

    invoke-virtual {p1, p2, v4, p3, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 49
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 50
    .local v1, colorArrayRes:I
    if-lez v1, :cond_1

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 52
    .local v3, ta:Landroid/content/res/TypedArray;
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->length()I

    move-result v4

    new-array v4, v4, [I

    iput-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mColorIds:[I

    .line 53
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 54
    iget-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mColorIds:[I

    invoke-virtual {v3, v2, v6}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    aput v5, v4, v2

    .line 53
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 57
    iget-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    iget-object v5, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mColorIds:[I

    aget v5, v5, v6

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    .end local v2           #i:I
    .end local v3           #ta:Landroid/content/res/TypedArray;
    :goto_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    return-void

    .line 60
    :cond_1
    iget-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    const/4 v5, -0x1

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "canvas"

    .prologue
    .line 74
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 75
    iget-object v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mTabBounds:Landroid/graphics/RectF;

    iget-object v1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 76
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 68
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 69
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->updateBounds()V

    .line 70
    return-void
.end method

.method public scroll(II)V
    .locals 1
    .parameter "position"
    .parameter "pixels"

    .prologue
    .line 104
    iput p1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPosition:I

    .line 105
    iget v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    div-int v0, p2, v0

    int-to-float v0, v0

    invoke-static {v0}, Landroid/util/FloatMath;->ceil(F)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mOffsetPixels:I

    .line 106
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->updateBounds()V

    .line 107
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->invalidate()V

    .line 108
    return-void
.end method

.method public setLineColor(I)V
    .locals 1
    .parameter "color"

    .prologue
    .line 116
    iget-object v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    return-void
.end method

.method public setPageColor(I)V
    .locals 2
    .parameter "position"

    .prologue
    .line 112
    iget-object v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mColorIds:[I

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 113
    return-void
.end method

.method public setPosition(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 87
    iput p1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPosition:I

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mOffsetPixels:I

    .line 89
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->updateBounds()V

    .line 90
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->invalidate()V

    .line 91
    return-void
.end method

.method public setRange(I)V
    .locals 2
    .parameter "range"

    .prologue
    .line 94
    iput p1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    .line 95
    iget v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    if-nez v0, :cond_0

    .line 96
    const/4 v0, 0x1

    iput v0, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    .line 97
    new-instance v0, Lco/vine/android/VineException;

    const-string v1, "Someone is trying to set the range to be 0, defaulting back to 1."

    invoke-direct {v0, v1}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 99
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->requestLayout()V

    .line 100
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->invalidate()V

    .line 101
    return-void
.end method

.method public updateBounds()V
    .locals 8

    .prologue
    .line 79
    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->getWidth()I

    move-result v4

    iget v5, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mRange:I

    div-int/2addr v4, v5

    int-to-float v3, v4

    .line 80
    .local v3, width:F
    iget v1, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mOffsetPixels:I

    .line 81
    .local v1, v:I
    iget v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mPosition:I

    int-to-float v4, v4

    mul-float v2, v3, v4

    .line 82
    .local v2, w:F
    int-to-float v4, v1

    add-float v0, v4, v2

    .line 83
    .local v0, left:F
    iget-object v4, p0, Lco/vine/android/widget/ViewPagerScrollBar;->mTabBounds:Landroid/graphics/RectF;

    const/4 v5, 0x0

    add-float v6, v0, v3

    invoke-virtual {p0}, Lco/vine/android/widget/ViewPagerScrollBar;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v4, v0, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 84
    return-void
.end method
