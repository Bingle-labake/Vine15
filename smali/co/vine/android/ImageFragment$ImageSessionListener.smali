.class Lco/vine/android/ImageFragment$ImageSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ImageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ImageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ImageFragment;


# direct methods
.method private constructor <init>(Lco/vine/android/ImageFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 107
    iput-object p1, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/ImageFragment;Lco/vine/android/ImageFragment$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 107
    invoke-direct {p0, p1}, Lco/vine/android/ImageFragment$ImageSessionListener;-><init>(Lco/vine/android/ImageFragment;)V

    return-void
.end method

.method private finishFailed()V
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    invoke-virtual {v0}, Lco/vine/android/ImageFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e00d6

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 126
    iget-object v0, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    invoke-virtual {v0}, Lco/vine/android/ImageFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 127
    return-void
.end method


# virtual methods
.method public onPhotoImageError(Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V
    .locals 1
    .parameter "key"
    .parameter "result"

    .prologue
    .line 119
    iget-object v0, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    #getter for: Lco/vine/android/ImageFragment;->mImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v0}, Lco/vine/android/ImageFragment;->access$100(Lco/vine/android/ImageFragment;)Lco/vine/android/util/image/ImageKey;

    move-result-object v0

    invoke-virtual {p1, v0}, Lco/vine/android/util/image/ImageKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    invoke-direct {p0}, Lco/vine/android/ImageFragment$ImageSessionListener;->finishFailed()V

    .line 122
    :cond_0
    return-void
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 110
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v1, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    #getter for: Lco/vine/android/ImageFragment;->mImageKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/ImageFragment;->access$100(Lco/vine/android/ImageFragment;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 111
    .local v0, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    iget-object v1, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    #getter for: Lco/vine/android/ImageFragment;->mProgress:Landroid/widget/ProgressBar;
    invoke-static {v1}, Lco/vine/android/ImageFragment;->access$200(Lco/vine/android/ImageFragment;)Landroid/widget/ProgressBar;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 113
    iget-object v1, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    #getter for: Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;
    invoke-static {v1}, Lco/vine/android/ImageFragment;->access$300(Lco/vine/android/ImageFragment;)Landroid/widget/ImageView;

    move-result-object v1

    new-instance v2, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v3, p0, Lco/vine/android/ImageFragment$ImageSessionListener;->this$0:Lco/vine/android/ImageFragment;

    #getter for: Lco/vine/android/ImageFragment;->mImageView:Landroid/widget/ImageView;
    invoke-static {v3}, Lco/vine/android/ImageFragment;->access$300(Lco/vine/android/ImageFragment;)Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v2, v3, v4}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 115
    :cond_0
    return-void
.end method
