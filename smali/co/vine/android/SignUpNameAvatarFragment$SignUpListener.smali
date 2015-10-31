.class Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;
.super Lco/vine/android/client/AppSessionListener;
.source "SignUpNameAvatarFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/SignUpNameAvatarFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SignUpListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/SignUpNameAvatarFragment;


# direct methods
.method constructor <init>(Lco/vine/android/SignUpNameAvatarFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 406
    iput-object p1, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetTwitterUserComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/TwitterUser;Lco/vine/android/api/VineLogin;)V
    .locals 6
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "user"
    .parameter "login"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 411
    const/16 v2, 0xc8

    if-eq p2, v2, :cond_4

    if-eqz p4, :cond_4

    .line 412
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mName:Landroid/widget/EditText;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$000(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/EditText;

    move-result-object v2

    iget-object v3, p4, Lco/vine/android/api/TwitterUser;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 413
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mPhoneNumberContainer:Landroid/widget/RelativeLayout;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$300(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/RelativeLayout;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 414
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #setter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileUri:Landroid/net/Uri;
    invoke-static {v2, v5}, Lco/vine/android/SignUpNameAvatarFragment;->access$402(Lco/vine/android/SignUpNameAvatarFragment;Landroid/net/Uri;)Landroid/net/Uri;

    .line 415
    iget-boolean v2, p4, Lco/vine/android/api/TwitterUser;->defaultProfileImage:Z

    if-nez v2, :cond_3

    .line 416
    new-instance v1, Lco/vine/android/util/image/ImageKey;

    iget-object v2, p4, Lco/vine/android/api/TwitterUser;->profileUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 417
    .local v1, key:Lco/vine/android/util/image/ImageKey;
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    iget-object v2, v2, Lco/vine/android/SignUpNameAvatarFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2, v1}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 419
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_2

    .line 420
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    const v3, 0x7f020076

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 421
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 422
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #setter for: Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z
    invoke-static {v2, v4}, Lco/vine/android/SignUpNameAvatarFragment;->access$602(Lco/vine/android/SignUpNameAvatarFragment;Z)Z

    .line 438
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v1           #key:Lco/vine/android/util/image/ImageKey;
    :cond_0
    :goto_0
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #setter for: Lco/vine/android/SignUpNameAvatarFragment;->mTwitterUser:Lco/vine/android/api/TwitterUser;
    invoke-static {v2, p4}, Lco/vine/android/SignUpNameAvatarFragment;->access$902(Lco/vine/android/SignUpNameAvatarFragment;Lco/vine/android/api/TwitterUser;)Lco/vine/android/api/TwitterUser;

    .line 444
    :cond_1
    :goto_1
    return-void

    .line 424
    .restart local v0       #bm:Landroid/graphics/Bitmap;
    .restart local v1       #key:Lco/vine/android/util/image/ImageKey;
    :cond_2
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    new-instance v3, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v4, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v4}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 425
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 426
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    const/4 v3, 0x1

    #setter for: Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z
    invoke-static {v2, v3}, Lco/vine/android/SignUpNameAvatarFragment;->access$602(Lco/vine/android/SignUpNameAvatarFragment;Z)Z

    .line 427
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$700(Lco/vine/android/SignUpNameAvatarFragment;)Lco/vine/android/ImagePicker;

    move-result-object v2

    invoke-virtual {v2, v0}, Lco/vine/android/ImagePicker;->saveProfileImage(Landroid/graphics/Bitmap;)V

    .line 428
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 429
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    goto :goto_0

    .line 433
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v1           #key:Lco/vine/android/util/image/ImageKey;
    :cond_3
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 434
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    goto :goto_0

    .line 440
    :cond_4
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 441
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    goto :goto_1
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 6
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
    .line 448
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/util/image/ImageKey;

    .line 449
    .local v1, key:Lco/vine/android/util/image/ImageKey;
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 450
    .local v0, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 451
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v2

    new-instance v3, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v4, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProfileImage:Landroid/widget/ImageView;
    invoke-static {v4}, Lco/vine/android/SignUpNameAvatarFragment;->access$500(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-object v5, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4, v5}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 452
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    const/4 v3, 0x1

    #setter for: Lco/vine/android/SignUpNameAvatarFragment;->mPhotoAttached:Z
    invoke-static {v2, v3}, Lco/vine/android/SignUpNameAvatarFragment;->access$602(Lco/vine/android/SignUpNameAvatarFragment;Z)Z

    .line 453
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mImagePicker:Lco/vine/android/ImagePicker;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$700(Lco/vine/android/SignUpNameAvatarFragment;)Lco/vine/android/ImagePicker;

    move-result-object v2

    iget-object v3, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3}, Lco/vine/android/ImagePicker;->saveProfileImage(Landroid/graphics/Bitmap;)V

    .line 454
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 455
    iget-object v2, p0, Lco/vine/android/SignUpNameAvatarFragment$SignUpListener;->this$0:Lco/vine/android/SignUpNameAvatarFragment;

    #getter for: Lco/vine/android/SignUpNameAvatarFragment;->mProgress:Landroid/app/Dialog;
    invoke-static {v2}, Lco/vine/android/SignUpNameAvatarFragment;->access$800(Lco/vine/android/SignUpNameAvatarFragment;)Landroid/app/Dialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 458
    :cond_0
    return-void
.end method
