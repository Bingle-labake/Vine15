.class Lco/vine/android/SignUpPagerActivity$SignUpListener;
.super Lco/vine/android/client/AppSessionListener;
.source "SignUpPagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/SignUpPagerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SignUpListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/SignUpPagerActivity;


# direct methods
.method constructor <init>(Lco/vine/android/SignUpPagerActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 241
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-direct {p0}, Lco/vine/android/client/AppSessionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckTwitterComplete(Ljava/lang/String;ILjava/lang/String;IZLco/vine/android/api/VineUser;Lco/vine/android/api/VineLogin;)V
    .locals 8
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "errorCode"
    .parameter "accountExists"
    .parameter "user"
    .parameter "login"

    .prologue
    .line 314
    if-eqz p5, :cond_1

    const/16 v0, 0xc8

    if-ne p2, v0, :cond_1

    .line 316
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v0, v0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v1, v1, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    iget-object v3, p6, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v6, p6, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    move v2, p2

    move-object v5, p7

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginComplete(Lco/vine/android/client/Session;ILjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;)Lco/vine/android/api/VineLogin;

    .line 318
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->dismissDialog()V

    .line 319
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mFinish:Z
    invoke-static {v0}, Lco/vine/android/SignUpPagerActivity;->access$300(Lco/vine/android/SignUpPagerActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setResult(I)V

    .line 321
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->finish()V

    .line 334
    :goto_0
    return-void

    .line 323
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto :goto_0

    .line 325
    :cond_1
    if-nez p5, :cond_2

    const/16 v0, 0x190

    if-ne p2, v0, :cond_2

    .line 327
    new-instance v7, Landroid/content/Intent;

    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const-class v1, Lco/vine/android/SignUpPagerActivity;

    invoke-direct {v7, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 329
    .local v7, intent:Landroid/content/Intent;
    const-string v0, "user"

    invoke-virtual {v7, v0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 330
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0, v7}, Lco/vine/android/SignUpPagerActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 332
    .end local v7           #intent:Landroid/content/Intent;
    :cond_2
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onLoginComplete(Lco/vine/android/client/Session;Ljava/lang/String;ILjava/lang/String;ILco/vine/android/api/VineLogin;)V
    .locals 3
    .parameter "session"
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "errorCode"
    .parameter "login"

    .prologue
    .line 291
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->dismissDialog()V

    .line 292
    const/16 v0, 0xc8

    if-ne p3, v0, :cond_1

    .line 293
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const v2, 0x7f0e00e4

    invoke-virtual {v1, v2}, Lco/vine/android/SignUpPagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mFinish:Z
    invoke-static {v0}, Lco/vine/android/SignUpPagerActivity;->access$300(Lco/vine/android/SignUpPagerActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 296
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setResult(I)V

    .line 297
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->finish()V

    .line 309
    :goto_0
    return-void

    .line 299
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    .line 300
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v0, v0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getEditions()V

    goto :goto_0

    .line 303
    :cond_1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 304
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0, p4}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 306
    :cond_2
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const v1, 0x7f0e00a5

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public onSignUpComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "reqId"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "vineLogin"
    .parameter "accountName"
    .parameter "password"
    .parameter "avatarUrl"

    .prologue
    .line 246
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_2

    if-eqz p4, :cond_2

    iget-wide v0, p4, Lco/vine/android/api/VineLogin;->userId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 247
    iget v0, p4, Lco/vine/android/api/VineLogin;->loginType:I

    packed-switch v0, :pswitch_data_0

    .line 286
    :goto_0
    return-void

    .line 249
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v0, v0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v1, v1, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    move v2, p2

    move-object v3, p5

    move-object v4, p6

    move-object v5, p4

    move-object v6, p7

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginComplete(Lco/vine/android/client/Session;ILjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;)Lco/vine/android/api/VineLogin;

    .line 251
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->dismissDialog()V

    .line 252
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mFinish:Z
    invoke-static {v0}, Lco/vine/android/SignUpPagerActivity;->access$300(Lco/vine/android/SignUpPagerActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 253
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->setResult(I)V

    .line 254
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->finish()V

    goto :goto_0

    .line 256
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto :goto_0

    .line 261
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v0}, Lco/vine/android/SignUpPagerActivity;->access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 262
    new-instance v7, Landroid/app/ProgressDialog;

    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const v1, 0x7f0f0028

    invoke-direct {v7, v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 264
    .local v7, dialog:Landroid/app/ProgressDialog;
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iput-object v7, v0, Lco/vine/android/SignUpPagerActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 265
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 266
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const v1, 0x7f0e01a5

    invoke-virtual {v0, v1}, Lco/vine/android/SignUpPagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 267
    invoke-virtual {v7}, Landroid/app/ProgressDialog;->show()V

    .line 268
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    iget-object v0, v0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v1}, Lco/vine/android/SignUpPagerActivity;->access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;

    move-result-object v1

    iget-object v1, v1, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v2}, Lco/vine/android/SignUpPagerActivity;->access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;

    move-result-object v2

    iget-object v2, v2, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    iget-object v3, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v3}, Lco/vine/android/SignUpPagerActivity;->access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;

    move-result-object v3

    iget-object v3, v3, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    iget-object v4, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    #getter for: Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;
    invoke-static {v4}, Lco/vine/android/SignUpPagerActivity;->access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;

    move-result-object v4

    iget-wide v4, v4, Lco/vine/android/api/VineLogin;->userId:J

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;

    goto/16 :goto_0

    .line 272
    .end local v7           #dialog:Landroid/app/ProgressDialog;
    :cond_1
    const/4 v0, 0x1

    new-instance v1, Lco/vine/android/api/VineError;

    const/4 v2, -0x1

    const-string v3, "mVineLogin is null."

    invoke-direct {v1, v2, v3}, Lco/vine/android/api/VineError;-><init>(ILjava/lang/String;)V

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils;->onSignupFailure(ZLco/vine/android/api/VineError;I)V

    .line 273
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->finish()V

    goto/16 :goto_0

    .line 279
    :cond_2
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-virtual {v0}, Lco/vine/android/SignUpPagerActivity;->dismissDialog()V

    .line 280
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 281
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    invoke-static {v0, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 283
    :cond_3
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity$SignUpListener;->this$0:Lco/vine/android/SignUpPagerActivity;

    const v1, 0x7f0e00a5

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 247
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
