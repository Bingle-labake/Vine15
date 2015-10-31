.class public Lco/vine/android/util/FloatingViewUtils;
.super Ljava/lang/Object;
.source "FloatingViewUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "context"
    .parameter "source"
    .parameter "target"
    .parameter "oldWidth"
    .parameter "left"
    .parameter "top"

    .prologue
    const/4 v5, 0x1

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 18
    .local v2, res:Landroid/content/res/Resources;
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 19
    .local v0, oldHeight:I
    const/high16 v4, 0x10

    invoke-virtual {p1, v4}, Landroid/view/View;->setDrawingCacheQuality(I)V

    .line 20
    invoke-virtual {p1, v5}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 22
    invoke-virtual {p1, v5}, Landroid/view/View;->getDrawingCache(Z)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 23
    .local v3, sourceCached:Landroid/graphics/Bitmap;
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 24
    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v4, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-static {p2, v4}, Lco/vine/android/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 26
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 28
    .local v1, params:Landroid/widget/RelativeLayout$LayoutParams;
    iput p3, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 29
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 30
    iput p4, v1, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 31
    iput p5, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 33
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    return-object v3
.end method
