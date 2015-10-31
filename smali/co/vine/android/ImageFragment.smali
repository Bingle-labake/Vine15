.class public Lco/vine/android/ImageFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "ImageFragment.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ImageFragment$1;,
        Lco/vine/android/ImageFragment$ImageSessionListener;
    }
.end annotation


# static fields
.field public static final ARG_IMAGE_URL:Ljava/lang/String; = "image_url"

.field public static final STATE_IMAGE_BITMAP:Ljava/lang/String; = "state_image_bitmap"


# instance fields
.field private mFirstTouch:J

.field private mImageBitmap:Landroid/graphics/Bitmap;

.field private mImageKey:Lco/vine/android/util/image/ImageKey;

.field private mImageView:Landroid/widget/ImageView;

.field private mProgress:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 107
    return-void
.end method

.method static synthetic access$100(Lco/vine/android/ImageFragment;)Lco/vine/android/util/image/ImageKey;
    .locals 1
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lco/vine/android/ImageFragment;->mImageKey:Lco/vine/android/util/image/ImageKey;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/ImageFragment;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lco/vine/android/ImageFragment;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/ImageFragment;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 55
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 57
    if-nez p1, :cond_2

    .line 58
    invoke-virtual {p0}, Lco/vine/android/ImageFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 59
    .local v0, args:Landroid/os/Bundle;
    const-string v3, "image_url"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, imageUrl:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 62
    new-instance v3, Lco/vine/android/util/image/ImageKey;

    invoke-direct {v3, v2}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lco/vine/android/ImageFragment;->mImageKey:Lco/vine/android/util/image/ImageKey;

    .line 63
    iget-object v3, p0, Lco/vine/android/ImageFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v4, p0, Lco/vine/android/ImageFragment;->mImageKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {v3, v4}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 65
    .local v1, imageBitmap:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_1

    .line 66
    iput-object v1, p0, Lco/vine/android/ImageFragment;->mImageBitmap:Landroid/graphics/Bitmap;

    .line 71
    .end local v1           #imageBitmap:Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    iget-object v3, p0, Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v3, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 75
    .end local v0           #args:Landroid/os/Bundle;
    .end local v2           #imageUrl:Ljava/lang/String;
    :goto_1
    return-void

    .line 68
    .restart local v0       #args:Landroid/os/Bundle;
    .restart local v1       #imageBitmap:Landroid/graphics/Bitmap;
    .restart local v2       #imageUrl:Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lco/vine/android/ImageFragment;->mProgress:Landroid/widget/ProgressBar;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 73
    .end local v0           #args:Landroid/os/Bundle;
    .end local v1           #imageBitmap:Landroid/graphics/Bitmap;
    .end local v2           #imageUrl:Ljava/lang/String;
    :cond_2
    const-string v3, "state_image_bitmap"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/graphics/Bitmap;

    iput-object v3, p0, Lco/vine/android/ImageFragment;->mImageBitmap:Landroid/graphics/Bitmap;

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 41
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 42
    new-instance v0, Lco/vine/android/ImageFragment$ImageSessionListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lco/vine/android/ImageFragment$ImageSessionListener;-><init>(Lco/vine/android/ImageFragment;Lco/vine/android/ImageFragment$1;)V

    iput-object v0, p0, Lco/vine/android/ImageFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 43
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 47
    const v1, 0x7f030039

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 48
    .local v0, v:Landroid/view/View;
    const v1, 0x7f0a0030

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;

    .line 49
    const v1, 0x7f0a001d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lco/vine/android/ImageFragment;->mProgress:Landroid/widget/ProgressBar;

    .line 50
    return-object v0
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 79
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onResume()V

    .line 80
    iget-object v0, p0, Lco/vine/android/ImageFragment;->mImageBitmap:Landroid/graphics/Bitmap;

    .line 81
    .local v0, imageBitmap:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 82
    iget-object v1, p0, Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;

    new-instance v2, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    invoke-virtual {p0}, Lco/vine/android/ImageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 84
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 101
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 102
    iget-object v0, p0, Lco/vine/android/ImageFragment;->mImageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 103
    const-string v0, "state_image_bitmap"

    iget-object v1, p0, Lco/vine/android/ImageFragment;->mImageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 105
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 7
    .parameter "view"
    .parameter "motionEvent"

    .prologue
    const/4 v2, 0x1

    .line 88
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-eq v3, v2, :cond_0

    const/4 v2, 0x0

    .line 96
    :goto_0
    return v2

    .line 90
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 91
    .local v0, now:J
    iget-wide v3, p0, Lco/vine/android/ImageFragment;->mFirstTouch:J

    sub-long v3, v0, v3

    const-wide/16 v5, 0x190

    cmp-long v3, v3, v5

    if-gez v3, :cond_1

    .line 92
    invoke-virtual {p0}, Lco/vine/android/ImageFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 94
    :cond_1
    iput-wide v0, p0, Lco/vine/android/ImageFragment;->mFirstTouch:J

    goto :goto_0
.end method
