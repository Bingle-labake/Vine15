.class public Lco/vine/android/SetThumbnailTask;
.super Landroid/os/AsyncTask;
.source "SetThumbnailTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/SetThumbnailTask$SetThumbnailListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final mFragmentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private final mSupportFragmentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1
    .parameter "f"

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 34
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/support/v4/app/Fragment;)V
    .locals 1
    .parameter "fragment"

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    .line 31
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 9
    .parameter "params"

    .prologue
    const/4 v5, 0x0

    const/4 v8, 0x0

    .line 57
    const/4 v0, 0x0

    .line 58
    .local v0, context:Landroid/content/Context;
    iget-object v6, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    if-eqz v6, :cond_2

    .line 59
    invoke-virtual {p0}, Lco/vine/android/SetThumbnailTask;->getSupportFragmentActivity()Landroid/app/Activity;

    move-result-object v0

    .line 63
    :cond_0
    :goto_0
    if-nez v0, :cond_3

    .line 75
    :cond_1
    :goto_1
    return-object v5

    .line 60
    :cond_2
    iget-object v6, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    if-eqz v6, :cond_0

    .line 61
    invoke-virtual {p0}, Lco/vine/android/SetThumbnailTask;->getFragmentActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0

    .line 67
    :cond_3
    aget-object v1, p1, v8

    .line 68
    .local v1, photoUri:Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 69
    .local v3, resources:Landroid/content/res/Resources;
    const v6, 0x7f0b005b

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->density:F

    mul-float v4, v6, v7

    .line 71
    .local v4, size:F
    invoke-static {v0, v1, v4, v4, v8}, Lco/vine/android/util/image/ImageUtils;->resizeBitmap(Landroid/content/Context;Landroid/net/Uri;FFI)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 72
    .local v2, resizedBitmap:Landroid/graphics/Bitmap;
    if-eqz v2, :cond_1

    .line 73
    invoke-static {v0, v1, v2}, Lco/vine/android/util/image/ImageUtils;->adjustRotation(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v5

    goto :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 19
    check-cast p1, [Landroid/net/Uri;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/SetThumbnailTask;->doInBackground([Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected getFragmentActivity()Landroid/app/Activity;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 40
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 41
    .local v0, f:Landroid/app/Fragment;
    if-nez v0, :cond_0

    .line 42
    const/4 v1, 0x0

    .line 44
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    goto :goto_0
.end method

.method protected getSupportFragmentActivity()Landroid/app/Activity;
    .locals 2

    .prologue
    .line 48
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 49
    .local v0, f:Landroid/support/v4/app/Fragment;
    if-nez v0, :cond_0

    .line 50
    const/4 v1, 0x0

    .line 52
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    goto :goto_0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "bitmap"

    .prologue
    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, fragment:Ljava/lang/Object;
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_2

    .line 83
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mSupportFragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 88
    .end local v0           #fragment:Ljava/lang/Object;
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 89
    check-cast v0, Lco/vine/android/SetThumbnailTask$SetThumbnailListener;

    invoke-interface {v0, p1}, Lco/vine/android/SetThumbnailTask$SetThumbnailListener;->setThumbnailImage(Landroid/graphics/Bitmap;)V

    .line 91
    :cond_1
    return-void

    .line 84
    .restart local v0       #fragment:Ljava/lang/Object;
    :cond_2
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lco/vine/android/SetThumbnailTask;->mFragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 19
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/SetThumbnailTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
