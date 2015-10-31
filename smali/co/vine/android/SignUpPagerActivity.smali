.class public Lco/vine/android/SignUpPagerActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "SignUpPagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/SignUpPagerActivity$SignUpListener;,
        Lco/vine/android/SignUpPagerActivity$SignUpPagerAdapter;
    }
.end annotation


# static fields
.field public static final EXTRA_FINISH:Ljava/lang/String; = "finish"

.field public static final EXTRA_LOGIN:Ljava/lang/String; = "user"

.field public static final FLOW_STEP_DETAILS:I = 0x1

.field public static final FLOW_STEP_NAME_AVATAR:I = 0x0

.field private static final NUM_PAGES:I = 0x2

.field private static final STATE_LOGIN:Ljava/lang/String; = "s_login"

.field private static final STATE_NAME:Ljava/lang/String; = "s_name"

.field private static final STATE_PASSWORD:Ljava/lang/String; = "s_password"

.field private static final STATE_PHONE:Ljava/lang/String; = "s_phone"

.field private static final STATE_PROFILE:Ljava/lang/String; = "s_profile"


# instance fields
.field private mAvatarFrag:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private mDetailsFrag:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private mFinish:Z

.field private mLogin:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mPager:Lco/vine/android/widget/ConfigurableViewPager;

.field private mPassword:Ljava/lang/String;

.field private mPhone:Ljava/lang/String;

.field private mProfile:Landroid/net/Uri;

.field private mTwitterUser:Lco/vine/android/api/TwitterUser;

.field private mVineLogin:Lco/vine/android/api/VineLogin;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 241
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/SignUpPagerActivity;)Lco/vine/android/api/VineLogin;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    return-object v0
.end method

.method static synthetic access$102(Lco/vine/android/SignUpPagerActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mAvatarFrag:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic access$202(Lco/vine/android/SignUpPagerActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mDetailsFrag:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic access$300(Lco/vine/android/SignUpPagerActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lco/vine/android/SignUpPagerActivity;->mFinish:Z

    return v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 185
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    invoke-virtual {v1}, Lco/vine/android/widget/ConfigurableViewPager;->getCurrentItem()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 205
    :cond_0
    :goto_0
    return-void

    .line 187
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mAvatarFrag:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mAvatarFrag:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 189
    .local v0, frag:Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 196
    .end local v0           #frag:Landroid/support/v4/app/Fragment;
    :pswitch_1
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mDetailsFrag:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 197
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mDetailsFrag:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 198
    .restart local v0       #frag:Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 185
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 97
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    invoke-virtual {v0}, Lco/vine/android/widget/ConfigurableViewPager;->getCurrentItem()I

    move-result v0

    if-nez v0, :cond_0

    .line 98
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onBackPressed()V

    .line 102
    :goto_0
    return-void

    .line 100
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    invoke-virtual {v1}, Lco/vine/android/widget/ConfigurableViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/ConfigurableViewPager;->setCurrentItem(I)V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 59
    const v1, 0x7f030062

    invoke-super {p0, p1, v1, v2}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 61
    invoke-virtual {p0}, Lco/vine/android/SignUpPagerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 62
    .local v0, i:Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 63
    const-string v1, "finish"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/SignUpPagerActivity;->mFinish:Z

    .line 66
    :cond_0
    const v1, 0x7f0a0086

    invoke-virtual {p0, v1}, Lco/vine/android/SignUpPagerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/ConfigurableViewPager;

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    .line 67
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    invoke-virtual {v1, v2}, Lco/vine/android/widget/ConfigurableViewPager;->setSwipingEnabled(Z)V

    .line 68
    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    new-instance v2, Lco/vine/android/SignUpPagerActivity$SignUpPagerAdapter;

    invoke-virtual {p0}, Lco/vine/android/SignUpPagerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lco/vine/android/SignUpPagerActivity$SignUpPagerAdapter;-><init>(Lco/vine/android/SignUpPagerActivity;Landroid/support/v4/app/FragmentManager;)V

    invoke-virtual {v1, v2}, Lco/vine/android/widget/ConfigurableViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 70
    new-instance v1, Lco/vine/android/SignUpPagerActivity$SignUpListener;

    invoke-direct {v1, p0}, Lco/vine/android/SignUpPagerActivity$SignUpListener;-><init>(Lco/vine/android/SignUpPagerActivity;)V

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 71
    invoke-virtual {p0}, Lco/vine/android/SignUpPagerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "user"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VineLogin;

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    .line 73
    if-eqz p1, :cond_1

    .line 74
    const-string v1, "s_login"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mLogin:Ljava/lang/String;

    .line 75
    const-string v1, "s_name"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mName:Ljava/lang/String;

    .line 76
    const-string v1, "s_password"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPassword:Ljava/lang/String;

    .line 77
    const-string v1, "s_phone"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPhone:Ljava/lang/String;

    .line 78
    const-string v1, "s_profile"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mProfile:Landroid/net/Uri;

    .line 81
    :cond_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0, v1, v2, v3, v4}, Lco/vine/android/SignUpPagerActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 83
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 106
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 112
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 108
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/SignUpPagerActivity;->onBackPressed()V

    .line 109
    const/4 v0, 0x1

    goto :goto_0

    .line 106
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 87
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 88
    const-string v0, "s_login"

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mLogin:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    const-string v0, "s_password"

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPassword:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const-string v0, "s_name"

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    const-string v0, "s_phone"

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mPhone:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    const-string v0, "s_profile"

    iget-object v1, p0, Lco/vine/android/SignUpPagerActivity;->mProfile:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 93
    return-void
.end method

.method protected setBarTitle(I)V
    .locals 3
    .parameter "resId"

    .prologue
    const/4 v2, 0x0

    .line 156
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v2, v0, v1, v2}, Lco/vine/android/SignUpPagerActivity;->setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    .line 157
    return-void
.end method

.method public setLogin(Ljava/lang/String;)V
    .locals 0
    .parameter "login"

    .prologue
    .line 160
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mLogin:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .parameter "name"

    .prologue
    .line 172
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mName:Ljava/lang/String;

    .line 173
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .parameter "password"

    .prologue
    .line 164
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mPassword:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public setPhone(Ljava/lang/String;)V
    .locals 0
    .parameter "phone"

    .prologue
    .line 168
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mPhone:Ljava/lang/String;

    .line 169
    return-void
.end method

.method public setProfile(Landroid/net/Uri;)V
    .locals 0
    .parameter "uri"

    .prologue
    .line 176
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mProfile:Landroid/net/Uri;

    .line 177
    return-void
.end method

.method public setTwitterUser(Lco/vine/android/api/TwitterUser;)V
    .locals 0
    .parameter "tUser"

    .prologue
    .line 180
    iput-object p1, p0, Lco/vine/android/SignUpPagerActivity;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    .line 181
    return-void
.end method

.method protected toNextStep()V
    .locals 11

    .prologue
    const v3, 0x7f0f0028

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 118
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    invoke-virtual {v0}, Lco/vine/android/widget/ConfigurableViewPager;->getCurrentItem()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 153
    :goto_0
    return-void

    .line 120
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    if-eqz v0, :cond_0

    .line 121
    new-instance v10, Landroid/app/ProgressDialog;

    invoke-direct {v10, p0, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 123
    .local v10, dialog:Landroid/app/ProgressDialog;
    const v0, 0x7f0e00e7

    invoke-virtual {p0, v0}, Lco/vine/android/SignUpPagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 124
    invoke-virtual {v10, v2}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 126
    :try_start_0
    invoke-virtual {v10}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :goto_1
    iput-object v10, p0, Lco/vine/android/SignUpPagerActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 131
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/SignUpPagerActivity;->mName:Ljava/lang/String;

    iget-object v4, p0, Lco/vine/android/SignUpPagerActivity;->mPhone:Ljava/lang/String;

    iget-object v5, p0, Lco/vine/android/SignUpPagerActivity;->mProfile:Landroid/net/Uri;

    iget-object v6, p0, Lco/vine/android/SignUpPagerActivity;->mTwitterUser:Lco/vine/android/api/TwitterUser;

    iget-object v7, p0, Lco/vine/android/SignUpPagerActivity;->mVineLogin:Lco/vine/android/api/VineLogin;

    move-object v2, v1

    invoke-virtual/range {v0 .. v7}, Lco/vine/android/client/AppController;->signUp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lco/vine/android/api/TwitterUser;Lco/vine/android/api/VineLogin;)Ljava/lang/String;

    goto :goto_0

    .line 134
    .end local v10           #dialog:Landroid/app/ProgressDialog;
    :cond_0
    iget-object v0, p0, Lco/vine/android/SignUpPagerActivity;->mPager:Lco/vine/android/widget/ConfigurableViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/ConfigurableViewPager;->setCurrentItem(I)V

    goto :goto_0

    .line 139
    :pswitch_1
    new-instance v10, Landroid/app/ProgressDialog;

    invoke-direct {v10, p0, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 141
    .restart local v10       #dialog:Landroid/app/ProgressDialog;
    iput-object v10, p0, Lco/vine/android/SignUpPagerActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 142
    invoke-virtual {v10, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 143
    const v0, 0x7f0e01a5

    invoke-virtual {p0, v0}, Lco/vine/android/SignUpPagerActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 145
    :try_start_1
    invoke-virtual {v10}, Landroid/app/ProgressDialog;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 149
    :goto_2
    iget-object v2, p0, Lco/vine/android/SignUpPagerActivity;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/SignUpPagerActivity;->mLogin:Ljava/lang/String;

    iget-object v4, p0, Lco/vine/android/SignUpPagerActivity;->mPassword:Ljava/lang/String;

    iget-object v5, p0, Lco/vine/android/SignUpPagerActivity;->mName:Ljava/lang/String;

    iget-object v6, p0, Lco/vine/android/SignUpPagerActivity;->mPhone:Ljava/lang/String;

    iget-object v7, p0, Lco/vine/android/SignUpPagerActivity;->mProfile:Landroid/net/Uri;

    move-object v8, v1

    move-object v9, v1

    invoke-virtual/range {v2 .. v9}, Lco/vine/android/client/AppController;->signUp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lco/vine/android/api/TwitterUser;Lco/vine/android/api/VineLogin;)Ljava/lang/String;

    goto :goto_0

    .line 127
    :catch_0
    move-exception v0

    goto :goto_1

    .line 146
    :catch_1
    move-exception v0

    goto :goto_2

    .line 118
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
