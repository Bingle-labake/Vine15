.class public Lco/vine/android/EditProfileCropActivity;
.super Lco/vine/android/CropActivity;
.source "EditProfileCropActivity.java"


# instance fields
.field private mSaveButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lco/vine/android/CropActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onBitmapProcessingDone(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "bmp"

    .prologue
    .line 27
    invoke-super {p0, p1}, Lco/vine/android/CropActivity;->onBitmapProcessingDone(Landroid/graphics/Bitmap;)V

    .line 28
    iget-object v0, p0, Lco/vine/android/EditProfileCropActivity;->mSaveButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 29
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x0

    .line 16
    const v0, 0x7f030025

    invoke-super {p0, p1, v0}, Lco/vine/android/CropActivity;->onCreate(Landroid/os/Bundle;I)V

    .line 17
    const v0, 0x7f0a0074

    invoke-virtual {p0, v0}, Lco/vine/android/EditProfileCropActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lco/vine/android/EditProfileCropActivity;->mSaveButton:Landroid/widget/Button;

    .line 18
    iget-object v0, p0, Lco/vine/android/EditProfileCropActivity;->mSaveButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 19
    iget-object v0, p0, Lco/vine/android/EditProfileCropActivity;->mView:Lco/vine/android/widget/CroppableImageView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lco/vine/android/widget/CroppableImageView;->setCropType(I)V

    .line 21
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const v1, 0x7f0e0084

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v0, v1, v2}, Lco/vine/android/EditProfileCropActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 23
    return-void
.end method
