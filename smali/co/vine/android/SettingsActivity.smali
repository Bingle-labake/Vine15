.class public Lco/vine/android/SettingsActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "SettingsActivity.java"


# instance fields
.field private SETTINGS_TAG:Ljava/lang/String;

.field private mFrag:Lco/vine/android/SettingsFragment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 13
    const-string v0, "settings"

    iput-object v0, p0, Lco/vine/android/SettingsActivity;->SETTINGS_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 64
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseControllerActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 65
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-nez v0, :cond_0

    .line 66
    invoke-virtual {p0}, Lco/vine/android/SettingsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/SettingsActivity;->SETTINGS_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lco/vine/android/SettingsFragment;

    iput-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    .line 68
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-eqz v0, :cond_1

    .line 69
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0, p1, p2, p3}, Lco/vine/android/SettingsFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseControllerActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-nez v0, :cond_0

    .line 52
    invoke-virtual {p0}, Lco/vine/android/SettingsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/SettingsActivity;->SETTINGS_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lco/vine/android/SettingsFragment;

    iput-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    .line 55
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-eqz v0, :cond_1

    .line 56
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->onBackPressed()V

    .line 60
    :goto_0
    return-void

    .line 58
    :cond_1
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onBackPressed()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    .line 17
    const v0, 0x7f030037

    invoke-super {p0, p1, v0, v3}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 19
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const v2, 0x7f0e0155

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lco/vine/android/SettingsActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 21
    if-nez p1, :cond_0

    .line 22
    new-instance v0, Lco/vine/android/SettingsFragment;

    invoke-direct {v0}, Lco/vine/android/SettingsFragment;-><init>()V

    iput-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    .line 23
    invoke-virtual {p0}, Lco/vine/android/SettingsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f0a00a1

    iget-object v2, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    iget-object v3, p0, Lco/vine/android/SettingsActivity;->SETTINGS_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 28
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 32
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 44
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 34
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-nez v0, :cond_0

    .line 35
    invoke-virtual {p0}, Lco/vine/android/SettingsActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/SettingsActivity;->SETTINGS_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lco/vine/android/SettingsFragment;

    iput-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    .line 38
    :cond_0
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    if-eqz v0, :cond_1

    .line 39
    iget-object v0, p0, Lco/vine/android/SettingsActivity;->mFrag:Lco/vine/android/SettingsFragment;

    invoke-virtual {v0}, Lco/vine/android/SettingsFragment;->onBackPressed()V

    .line 41
    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    .line 32
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method
