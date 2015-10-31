.class Lco/vine/android/ReshareFragment$ReshareListener;
.super Lco/vine/android/client/AppSessionListener;
.source "ReshareFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/ReshareFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReshareListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/ReshareFragment;


# direct methods
.method constructor <init>(Lco/vine/android/ReshareFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 324
    iput-object p1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptchaRequired(Ljava/lang/String;Ljava/lang/String;Lco/vine/android/service/PendingAction;)V
    .locals 4
    .parameter "reqId"
    .parameter "captchaUrl"
    .parameter "action"

    .prologue
    .line 391
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    new-instance v1, Lco/vine/android/PendingCaptchaRequest;

    iget v2, p3, Lco/vine/android/service/PendingAction;->actionCode:I

    iget-object v3, p3, Lco/vine/android/service/PendingAction;->bundle:Landroid/os/Bundle;

    invoke-direct {v1, p1, v2, v3}, Lco/vine/android/PendingCaptchaRequest;-><init>(Ljava/lang/String;ILandroid/os/Bundle;)V

    #setter for: Lco/vine/android/ReshareFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;
    invoke-static {v0, v1}, Lco/vine/android/ReshareFragment;->access$502(Lco/vine/android/ReshareFragment;Lco/vine/android/PendingCaptchaRequest;)Lco/vine/android/PendingCaptchaRequest;

    .line 393
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0, p1, p2}, Lco/vine/android/ReshareFragment;->showCaptcha(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    return-void
.end method

.method public onConnectFacebookComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 348
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$200(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 349
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$200(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 352
    :cond_0
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_1

    .line 353
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e00a2

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 354
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 356
    :cond_1
    return-void
.end method

.method public onConnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "userId"

    .prologue
    .line 362
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$200(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 363
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$200(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 366
    :cond_0
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_2

    .line 367
    const-wide/16 v0, 0x0

    cmp-long v0, p7, v0

    if-lez v0, :cond_1

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 368
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    iget-object v1, v1, Lco/vine/android/ReshareFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v1

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-wide v5, p7

    invoke-static/range {v0 .. v6}, Lco/vine/android/client/VineAccountHelper;->saveTwitterInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 371
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 372
    .local v7, editor:Landroid/content/SharedPreferences$Editor;
    const-string v0, "settings_twitter_connected"

    const/4 v1, 0x1

    invoke-interface {v7, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 373
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 379
    .end local v7           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_1
    :goto_0
    return-void

    .line 376
    :cond_2
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 377
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0
.end method

.method public onPhotoImageLoaded(Ljava/util/HashMap;)V
    .locals 3
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
    .line 383
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mThumbnailKey:Lco/vine/android/util/image/ImageKey;
    invoke-static {v1}, Lco/vine/android/ReshareFragment;->access$300(Lco/vine/android/ReshareFragment;)Lco/vine/android/util/image/ImageKey;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/image/UrlImage;

    .line 384
    .local v0, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    iget-object v2, v0, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    #calls: Lco/vine/android/ReshareFragment;->setThumbnailImage(Landroid/graphics/Bitmap;)V
    invoke-static {v1, v2}, Lco/vine/android/ReshareFragment;->access$400(Lco/vine/android/ReshareFragment;Landroid/graphics/Bitmap;)V

    .line 387
    :cond_0
    return-void
.end method

.method public onSharePostComplete(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"

    .prologue
    .line 328
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$000(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mShareProgress:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/ReshareFragment;->access$000(Lco/vine/android/ReshareFragment;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 332
    :cond_0
    const/16 v0, 0xc8

    if-eq p2, v0, :cond_2

    .line 333
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 334
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    const v2, 0x7f0e00a4

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-virtual {v1, v2, v3}, Lco/vine/android/ReshareFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 344
    :cond_1
    :goto_0
    return-void

    .line 337
    :cond_2
    const-string v0, "facebook"

    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;
    invoke-static {v1}, Lco/vine/android/ReshareFragment;->access$100(Lco/vine/android/ReshareFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 338
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e0190

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 342
    :cond_3
    :goto_1
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 339
    :cond_4
    const-string v0, "twitter"

    iget-object v1, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    #getter for: Lco/vine/android/ReshareFragment;->mNetwork:Ljava/lang/String;
    invoke-static {v1}, Lco/vine/android/ReshareFragment;->access$100(Lco/vine/android/ReshareFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 340
    iget-object v0, p0, Lco/vine/android/ReshareFragment$ReshareListener;->this$0:Lco/vine/android/ReshareFragment;

    invoke-virtual {v0}, Lco/vine/android/ReshareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0e019e

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_1
.end method
