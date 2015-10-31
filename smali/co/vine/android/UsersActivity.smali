.class public Lco/vine/android/UsersActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "UsersActivity.java"


# static fields
.field public static final EXTRA_POST_ID:Ljava/lang/String; = "post_id"

.field public static final EXTRA_USERS_TYPE:Ljava/lang/String; = "u_type"

.field public static final EXTRA_USER_ID:Ljava/lang/String; = "p_id"


# instance fields
.field private mFragment:Lco/vine/android/UsersFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 64
    iget-object v0, p0, Lco/vine/android/UsersActivity;->mFragment:Lco/vine/android/UsersFragment;

    invoke-virtual {v0, p1, p2, p3}, Lco/vine/android/UsersFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 65
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 21
    const v4, 0x7f03006f

    invoke-super {p0, p1, v4, v8}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 23
    invoke-virtual {p0}, Lco/vine/android/UsersActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    .line 25
    .local v2, intent:Landroid/content/Intent;
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {p0, v4, v5, v6, v7}, Lco/vine/android/UsersActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 27
    invoke-virtual {p0}, Lco/vine/android/UsersActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 29
    .local v0, ab:Landroid/support/v7/app/ActionBar;
    const-string v4, "u_type"

    invoke-virtual {v2, v4, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 31
    .local v3, type:I
    packed-switch v3, :pswitch_data_0

    .line 50
    :goto_0
    :pswitch_0
    if-nez p1, :cond_0

    .line 51
    new-instance v4, Lco/vine/android/UsersFragment;

    invoke-direct {v4}, Lco/vine/android/UsersFragment;-><init>()V

    iput-object v4, p0, Lco/vine/android/UsersActivity;->mFragment:Lco/vine/android/UsersFragment;

    .line 52
    invoke-static {v2, v9}, Lco/vine/android/UsersFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v1

    .line 53
    .local v1, b:Landroid/os/Bundle;
    const-string v4, "refresh"

    invoke-virtual {v1, v4, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 54
    iget-object v4, p0, Lco/vine/android/UsersActivity;->mFragment:Lco/vine/android/UsersFragment;

    invoke-virtual {v4, v1}, Lco/vine/android/UsersFragment;->setArguments(Landroid/os/Bundle;)V

    .line 55
    invoke-virtual {p0}, Lco/vine/android/UsersActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    const v5, 0x7f0a00a1

    iget-object v6, p0, Lco/vine/android/UsersActivity;->mFragment:Lco/vine/android/UsersFragment;

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 60
    .end local v1           #b:Landroid/os/Bundle;
    :cond_0
    return-void

    .line 33
    :pswitch_1
    const v4, 0x7f0e01d9

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    goto :goto_0

    .line 37
    :pswitch_2
    const v4, 0x7f0e01d8

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    goto :goto_0

    .line 41
    :pswitch_3
    const v4, 0x7f0e01da

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    goto :goto_0

    .line 45
    :pswitch_4
    const v4, 0x7f0e0147

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    goto :goto_0

    .line 31
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method
