.class public Lco/vine/android/BaseControllerFragment;
.super Lco/vine/android/BaseFragment;
.source "BaseControllerFragment.java"


# static fields
.field public static final REQUEST_CODE_CAPTCHA:I = 0xb

.field protected static final STATE_PENDING_CAPTCHA_REQUEST:Ljava/lang/String; = "state_pending_captcha_request"


# instance fields
.field protected mAppController:Lco/vine/android/client/AppController;

.field protected mAppSessionListener:Lco/vine/android/client/AppSessionListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppController()Lco/vine/android/client/AppController;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lco/vine/android/BaseControllerFragment;->mAppController:Lco/vine/android/client/AppController;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 22
    invoke-super {p0, p1}, Lco/vine/android/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    .line 23
    invoke-virtual {p0}, Lco/vine/android/BaseControllerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/BaseControllerFragment;->mAppController:Lco/vine/android/client/AppController;

    .line 24
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 36
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onPause()V

    .line 37
    iget-object v0, p0, Lco/vine/android/BaseControllerFragment;->mAppController:Lco/vine/android/client/AppController;

    .line 38
    .local v0, appController:Lco/vine/android/client/AppController;
    if-eqz v0, :cond_0

    .line 39
    iget-object v1, p0, Lco/vine/android/BaseControllerFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v1, :cond_0

    .line 40
    iget-object v1, p0, Lco/vine/android/BaseControllerFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->removeListener(Lco/vine/android/client/AppSessionListener;)V

    .line 43
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 28
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onResume()V

    .line 29
    iget-object v0, p0, Lco/vine/android/BaseControllerFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    if-eqz v0, :cond_0

    .line 30
    iget-object v0, p0, Lco/vine/android/BaseControllerFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/BaseControllerFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->addListener(Lco/vine/android/client/AppSessionListener;)V

    .line 32
    :cond_0
    return-void
.end method

.method public showCaptcha(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "reqId"
    .parameter "url"

    .prologue
    .line 50
    invoke-virtual {p0}, Lco/vine/android/BaseControllerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p2, p1}, Lco/vine/android/CaptchaActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 51
    .local v0, i:Landroid/content/Intent;
    invoke-virtual {p0}, Lco/vine/android/BaseControllerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/16 v2, 0xb

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 52
    return-void
.end method
