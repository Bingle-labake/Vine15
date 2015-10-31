.class public Lco/vine/android/BaseFragment;
.super Landroid/support/v4/app/Fragment;
.source "BaseFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static prepareArguments(Landroid/content/Intent;)Landroid/os/Bundle;
    .locals 1
    .parameter "intent"

    .prologue
    .line 22
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 23
    .local v0, args:Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 24
    new-instance v0, Landroid/os/Bundle;

    .end local v0           #args:Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 26
    .restart local v0       #args:Landroid/os/Bundle;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public onResume()V
    .locals 2

    .prologue
    .line 31
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 32
    const-string v0, "Fragment"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    invoke-static {}, Lcom/flurry/android/FlurryAgent;->onPageView()V

    .line 34
    return-void
.end method
