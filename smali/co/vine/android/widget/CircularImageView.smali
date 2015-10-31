.class public Lco/vine/android/widget/CircularImageView;
.super Landroid/widget/ImageView;
.source "CircularImageView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 20
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    return-void
.end method

.method public static getCroppedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 10
    .parameter "bmp"
    .parameter "radius"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 57
    invoke-static {p0, p1, p1, v8}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 58
    .local v4, sbmp:Landroid/graphics/Bitmap;
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 60
    .local v1, output:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 62
    .local v0, canvas:Landroid/graphics/Canvas;
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 63
    .local v2, paint:Landroid/graphics/Paint;
    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v3, v8, v8, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 65
    .local v3, rect:Landroid/graphics/Rect;
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 66
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 67
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setDither(Z)V

    .line 68
    invoke-virtual {v0, v8, v8, v8, v8}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    .line 69
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-float v7, v7

    invoke-virtual {v0, v5, v6, v7, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 71
    new-instance v5, Landroid/graphics/PorterDuffXfermode;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v5, v6}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 72
    invoke-virtual {v0, v4, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 74
    return-object v1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v9, 0x0

    .line 33
    invoke-virtual {p0}, Lco/vine/android/widget/CircularImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 34
    .local v2, drawable:Landroid/graphics/drawable/Drawable;
    if-nez v2, :cond_1

    .line 54
    .end local v2           #drawable:Landroid/graphics/drawable/Drawable;
    :cond_0
    :goto_0
    return-void

    .line 37
    .restart local v2       #drawable:Landroid/graphics/drawable/Drawable;
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/widget/CircularImageView;->getWidth()I

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p0}, Lco/vine/android/widget/CircularImageView;->getHeight()I

    move-result v7

    if-eqz v7, :cond_0

    .line 40
    instance-of v7, v2, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v7, :cond_3

    .line 41
    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    .end local v2           #drawable:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 42
    .local v0, b:Landroid/graphics/Bitmap;
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v8, 0x1

    invoke-virtual {v0, v7, v8}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 44
    .local v1, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lco/vine/android/widget/CircularImageView;->getWidth()I

    move-result v6

    .line 45
    .local v6, w:I
    invoke-virtual {p0}, Lco/vine/android/widget/CircularImageView;->getHeight()I

    move-result v3

    .line 47
    .local v3, h:I
    if-ge v6, v3, :cond_2

    move v4, v6

    .line 49
    .local v4, r:I
    :goto_1
    invoke-static {v1, v4}, Lco/vine/android/widget/CircularImageView;->getCroppedBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 50
    .local v5, roundBitmap:Landroid/graphics/Bitmap;
    const/4 v7, 0x0

    invoke-virtual {p1, v5, v9, v9, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .end local v4           #r:I
    .end local v5           #roundBitmap:Landroid/graphics/Bitmap;
    :cond_2
    move v4, v3

    .line 47
    goto :goto_1

    .line 52
    .end local v0           #b:Landroid/graphics/Bitmap;
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #h:I
    .end local v6           #w:I
    .restart local v2       #drawable:Landroid/graphics/drawable/Drawable;
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method
