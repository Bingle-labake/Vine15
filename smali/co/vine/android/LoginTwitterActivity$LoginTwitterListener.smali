.class Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;
.super Lco/vine/android/client/AppSessionListener;
.source "LoginTwitterActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/LoginTwitterActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoginTwitterListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/LoginTwitterActivity;


# direct methods
.method constructor <init>(Lco/vine/android/LoginTwitterActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 239
    iput-object p1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckTwitterComplete(Ljava/lang/String;ILjava/lang/String;IZLco/vine/android/api/VineUser;Lco/vine/android/api/VineLogin;)V
    .locals 10
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "errorCode"
    .parameter "accountExists"
    .parameter "user"
    .parameter "login"

    .prologue
    .line 286
    if-eqz p5, :cond_1

    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 288
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    iget-object v1, v1, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    iget-object v2, v2, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    move-object/from16 v0, p6

    iget-object v4, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    const/4 v5, 0x0

    move-object/from16 v0, p6

    iget-object v7, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    move v3, p2

    move-object/from16 v6, p7

    invoke-virtual/range {v1 .. v7}, Lco/vine/android/client/AppController;->loginComplete(Lco/vine/android/client/Session;ILjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;)Lco/vine/android/api/VineLogin;

    .line 290
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    #getter for: Lco/vine/android/LoginTwitterActivity;->mFinish:Z
    invoke-static {v1}, Lco/vine/android/LoginTwitterActivity;->access$100(Lco/vine/android/LoginTwitterActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 291
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v1}, Lco/vine/android/LoginTwitterActivity;->finish()V

    .line 314
    :goto_0
    return-void

    .line 293
    :cond_0
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-static {v1}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto :goto_0

    .line 296
    :cond_1
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v1}, Lco/vine/android/LoginTwitterActivity;->dismissDialog()V

    .line 297
    const/16 v1, 0x190

    if-ne p2, v1, :cond_2

    .line 299
    new-instance v8, Landroid/content/Intent;

    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    const-class v2, Lco/vine/android/SignUpPagerActivity;

    invoke-direct {v8, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 300
    .local v8, intent:Landroid/content/Intent;
    const-string v1, "user"

    move-object/from16 v0, p7

    invoke-virtual {v8, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 301
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v1, v8}, Lco/vine/android/LoginTwitterActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 302
    .end local v8           #intent:Landroid/content/Intent;
    :cond_2
    sget-object v1, Lco/vine/android/api/VineError$VineKnownErrors;->ACCOUNT_DEACTIVATED:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v1, v1, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    if-ne p4, v1, :cond_3

    .line 303
    const/4 v1, 0x1

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v9

    .line 305
    .local v9, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e015c

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 306
    const v1, 0x7f0e015d

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 307
    const v1, 0x7f0e0052

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 308
    const v1, 0x7f0e015b

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 309
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v1}, Lco/vine/android/LoginTwitterActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 311
    .end local v9           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_3
    iget-object v1, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-static {v1, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onTwitterxAuthComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineLogin;)V
    .locals 8
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "login"

    .prologue
    const/16 v1, 0xc8

    const/4 v6, 0x0

    .line 243
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    #getter for: Lco/vine/android/LoginTwitterActivity;->mFinish:Z
    invoke-static {v0}, Lco/vine/android/LoginTwitterActivity;->access$100(Lco/vine/android/LoginTwitterActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 244
    if-ne p2, v1, :cond_1

    .line 248
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    iget-object v0, v0, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 249
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    iget-object v0, v0, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p4, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    iget-object v2, p4, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    iget-object v3, p4, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    iget-wide v4, p4, Lco/vine/android/api/VineLogin;->twitterUserId:J

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;

    .line 280
    :goto_0
    return-void

    .line 252
    :cond_0
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 253
    .local v7, i:Landroid/content/Intent;
    const-string v0, "token"

    iget-object v1, p4, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    const-string v0, "secret"

    iget-object v1, p4, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    const-string v0, "user_id"

    iget-wide v1, p4, Lco/vine/android/api/VineLogin;->twitterUserId:J

    invoke-virtual {v7, v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 256
    const-string v0, "screen_name"

    iget-object v1, p4, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 257
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v7}, Lco/vine/android/LoginTwitterActivity;->setResult(ILandroid/content/Intent;)V

    .line 258
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v0}, Lco/vine/android/LoginTwitterActivity;->finish()V

    goto :goto_0

    .line 261
    .end local v7           #i:Landroid/content/Intent;
    :cond_1
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v0}, Lco/vine/android/LoginTwitterActivity;->dismissDialog()V

    .line 262
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    const v1, 0x7f0e00c1

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0

    .line 267
    :cond_2
    if-ne p2, v1, :cond_3

    if-eqz p4, :cond_3

    .line 268
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    #setter for: Lco/vine/android/LoginTwitterActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v0, p4}, Lco/vine/android/LoginTwitterActivity;->access$202(Lco/vine/android/LoginTwitterActivity;Lco/vine/android/api/VineLogin;)Lco/vine/android/api/VineLogin;

    .line 269
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    iget-object v0, v0, Lco/vine/android/LoginTwitterActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p4, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    iget-object v2, p4, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    iget-object v3, p4, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    iget-wide v4, p4, Lco/vine/android/api/VineLogin;->twitterUserId:J

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;

    goto :goto_0

    .line 272
    :cond_3
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-virtual {v0}, Lco/vine/android/LoginTwitterActivity;->dismissDialog()V

    .line 273
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 274
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 276
    :cond_4
    iget-object v0, p0, Lco/vine/android/LoginTwitterActivity$LoginTwitterListener;->this$0:Lco/vine/android/LoginTwitterActivity;

    const v1, 0x7f0e00a8

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method
