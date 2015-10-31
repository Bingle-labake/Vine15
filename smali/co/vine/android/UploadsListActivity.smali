.class public Lco/vine/android/UploadsListActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "UploadsListActivity.java"


# instance fields
.field private mFragment:Landroid/support/v4/app/Fragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method

.method public static start(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 40
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/UploadsListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .local v0, intent:Landroid/content/Intent;
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 42
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 46
    iget-object v0, p0, Lco/vine/android/UploadsListActivity;->mFragment:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lco/vine/android/UploadsListActivity;->mFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 49
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 18
    const v1, 0x7f030037

    invoke-super {p0, p1, v1, v5}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 20
    invoke-virtual {p0, v5}, Lco/vine/android/UploadsListActivity;->setRequestedOrientation(I)V

    .line 22
    invoke-virtual {p0}, Lco/vine/android/UploadsListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 24
    .local v0, intent:Landroid/content/Intent;
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const v3, 0x7f0e01d0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lco/vine/android/UploadsListActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 26
    if-nez p1, :cond_0

    .line 27
    new-instance v1, Lco/vine/android/UploadsListFragment;

    invoke-direct {v1}, Lco/vine/android/UploadsListFragment;-><init>()V

    iput-object v1, p0, Lco/vine/android/UploadsListActivity;->mFragment:Landroid/support/v4/app/Fragment;

    .line 28
    const-string v1, "take_focus"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 29
    const-string v1, "refresh"

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 30
    const-string v1, "empty_desc"

    const v2, 0x7f0e00fb

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 31
    iget-object v1, p0, Lco/vine/android/UploadsListActivity;->mFragment:Landroid/support/v4/app/Fragment;

    invoke-static {v0, v6}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lco/vine/android/UploadsListActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f0a00a1

    iget-object v3, p0, Lco/vine/android/UploadsListActivity;->mFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 37
    :cond_0
    return-void
.end method
