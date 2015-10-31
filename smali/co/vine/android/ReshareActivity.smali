.class public Lco/vine/android/ReshareActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "ReshareActivity.java"


# static fields
.field public static final EXTRA_NETWORK:Ljava/lang/String; = "network"

.field public static final NETWORK_FACEBOOK:Ljava/lang/String; = "facebook"

.field public static final NETWORK_TWITTER:Ljava/lang/String; = "twitter"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method

.method public static getReshareIntent(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 3
    .parameter "context"
    .parameter "network"
    .parameter "data"

    .prologue
    .line 41
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/ReshareActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 42
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 43
    const-string v1, "network"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    const-string v1, "twitter"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 45
    const-string v1, "title"

    const v2, 0x7f0e019c

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    :cond_0
    :goto_0
    return-object v0

    .line 46
    :cond_1
    const-string v1, "facebook"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    const-string v1, "title"

    const v2, 0x7f0e019b

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 54
    invoke-virtual {p0}, Lco/vine/android/ReshareActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "reshare"

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 55
    .local v0, fragment:Landroid/support/v4/app/Fragment;
    instance-of v1, v0, Lco/vine/android/ReshareFragment;

    if-eqz v1, :cond_0

    .line 56
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 60
    :goto_0
    return-void

    .line 58
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseControllerActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 22
    const v6, 0x7f030037

    invoke-super {p0, p1, v6, v3}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 23
    invoke-virtual {p0, v3}, Lco/vine/android/ReshareActivity;->setRequestedOrientation(I)V

    .line 25
    invoke-virtual {p0}, Lco/vine/android/ReshareActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 26
    .local v1, intent:Landroid/content/Intent;
    const-string v6, "title"

    invoke-virtual {v1, v6, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 28
    .local v2, titleResId:I
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    if-lez v2, :cond_1

    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    if-lez v2, :cond_2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_1
    invoke-virtual {p0, v6, v4, v3, v5}, Lco/vine/android/ReshareActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 30
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Lco/vine/android/ReshareFragment;

    invoke-direct {v0}, Lco/vine/android/ReshareFragment;-><init>()V

    .line 32
    .local v0, fragment:Lco/vine/android/ReshareFragment;
    invoke-static {v1}, Lco/vine/android/ReshareFragment;->prepareArguments(Landroid/content/Intent;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v3}, Lco/vine/android/ReshareFragment;->setArguments(Landroid/os/Bundle;)V

    .line 33
    invoke-virtual {p0}, Lco/vine/android/ReshareActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    const v4, 0x7f0a00a1

    const-string v5, "reshare"

    invoke-virtual {v3, v4, v0, v5}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 38
    .end local v0           #fragment:Lco/vine/android/ReshareFragment;
    :cond_0
    return-void

    :cond_1
    move v3, v4

    .line 28
    goto :goto_0

    :cond_2
    move-object v3, v5

    goto :goto_1
.end method
