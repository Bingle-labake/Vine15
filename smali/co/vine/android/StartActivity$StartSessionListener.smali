.class Lco/vine/android/StartActivity$StartSessionListener;
.super Lco/vine/android/client/AppSessionListener;
.source "StartActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/StartActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StartSessionListener"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/StartActivity;


# direct methods
.method constructor <init>(Lco/vine/android/StartActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 440
    iput-object p1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

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
    .line 444
    if-eqz p5, :cond_1

    const/16 v1, 0xc8

    if-ne p2, v1, :cond_1

    .line 446
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    iget-object v1, v1, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    iget-object v2, v2, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

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

    .line 448
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    #getter for: Lco/vine/android/StartActivity;->mLoginRequest:Z
    invoke-static {v1}, Lco/vine/android/StartActivity;->access$300(Lco/vine/android/StartActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 449
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lco/vine/android/StartActivity;->setResult(I)V

    .line 450
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-virtual {v1}, Lco/vine/android/StartActivity;->finish()V

    .line 473
    :goto_0
    return-void

    .line 452
    :cond_0
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-static {v1}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto :goto_0

    .line 455
    :cond_1
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-virtual {v1}, Lco/vine/android/StartActivity;->dismissDialog()V

    .line 456
    const/16 v1, 0x190

    if-ne p2, v1, :cond_2

    .line 458
    new-instance v8, Landroid/content/Intent;

    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    const-class v2, Lco/vine/android/SignUpPagerActivity;

    invoke-direct {v8, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 459
    .local v8, intent:Landroid/content/Intent;
    const-string v1, "user"

    move-object/from16 v0, p7

    invoke-virtual {v8, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 460
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-virtual {v1, v8}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 461
    .end local v8           #intent:Landroid/content/Intent;
    :cond_2
    sget-object v1, Lco/vine/android/api/VineError$VineKnownErrors;->ACCOUNT_DEACTIVATED:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v1, v1, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    if-ne p4, v1, :cond_3

    .line 462
    const/4 v1, 0x1

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v9

    .line 464
    .local v9, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v1, 0x7f0e015c

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 465
    const v1, 0x7f0e015d

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 466
    const v1, 0x7f0e0052

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 467
    const v1, 0x7f0e015b

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 468
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-virtual {v1}, Lco/vine/android/StartActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v9, v1}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    goto :goto_0

    .line 470
    .end local v9           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_3
    iget-object v1, p0, Lco/vine/android/StartActivity$StartSessionListener;->this$0:Lco/vine/android/StartActivity;

    invoke-static {v1, p3}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method
