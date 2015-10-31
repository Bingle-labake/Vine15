.class public Lco/vine/android/player/StaticSizeVideoView;
.super Lco/vine/android/player/SdkVideoView;
.source "StaticSizeVideoView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation


# instance fields
.field private mHeight:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1}, Lco/vine/android/player/SdkVideoView;-><init>(Landroid/content/Context;)V

    .line 17
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mWidth:I

    .line 18
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mHeight:I

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, p2}, Lco/vine/android/player/SdkVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mWidth:I

    .line 18
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mHeight:I

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/player/SdkVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mWidth:I

    .line 18
    iput v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mHeight:I

    .line 30
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 39
    iget v0, p0, Lco/vine/android/player/StaticSizeVideoView;->mWidth:I

    iget v1, p0, Lco/vine/android/player/StaticSizeVideoView;->mHeight:I

    invoke-virtual {p0, v0, v1}, Lco/vine/android/player/StaticSizeVideoView;->setMeasuredDimension(II)V

    .line 40
    return-void
.end method

.method public setSize(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 33
    iput p1, p0, Lco/vine/android/player/StaticSizeVideoView;->mWidth:I

    .line 34
    iput p2, p0, Lco/vine/android/player/StaticSizeVideoView;->mHeight:I

    .line 35
    return-void
.end method
