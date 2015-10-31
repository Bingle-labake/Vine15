.class public Lco/vine/android/ViewOnlyNotifActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "ViewOnlyNotifActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 42
    :goto_0
    return-void

    .line 35
    :pswitch_0
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pref_gb_notif_dismissed"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 37
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lco/vine/android/ViewOnlyNotifActivity;->setResult(I)V

    .line 38
    invoke-virtual {p0}, Lco/vine/android/ViewOnlyNotifActivity;->finish()V

    goto :goto_0

    .line 33
    :pswitch_data_0
    .packed-switch 0x7f0a00b4
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 18
    const v2, 0x7f030042

    const/4 v3, 0x1

    invoke-super {p0, p1, v2, v3}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 20
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-gt v2, v3, :cond_0

    .line 21
    invoke-virtual {p0}, Lco/vine/android/ViewOnlyNotifActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 22
    .local v0, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 23
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 27
    .end local v0           #ab:Landroid/support/v7/app/ActionBar;
    :cond_0
    const v2, 0x7f0a00b4

    invoke-virtual {p0, v2}, Lco/vine/android/ViewOnlyNotifActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 28
    .local v1, b:Landroid/view/View;
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    return-void
.end method
