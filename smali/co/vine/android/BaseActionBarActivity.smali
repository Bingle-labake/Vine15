.class public Lco/vine/android/BaseActionBarActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "BaseActionBarActivity.java"


# static fields
.field public static final FINISH_BROADCAST_ACTION:Ljava/lang/String; = "co.vine.android.FINISH"

.field private static FINISH_INTENT_FILTER:Landroid/content/IntentFilter;


# instance fields
.field private final mFinishReceiver:Landroid/content/BroadcastReceiver;

.field protected mMenu:Landroid/view/Menu;

.field protected mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 40
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    sput-object v0, Lco/vine/android/BaseActionBarActivity;->FINISH_INTENT_FILTER:Landroid/content/IntentFilter;

    .line 42
    sget-object v0, Lco/vine/android/BaseActionBarActivity;->FINISH_INTENT_FILTER:Landroid/content/IntentFilter;

    const-string v1, "co.vine.android.FINISH"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 45
    new-instance v0, Lco/vine/android/BaseActionBarActivity$1;

    invoke-direct {v0, p0}, Lco/vine/android/BaseActionBarActivity$1;-><init>(Lco/vine/android/BaseActionBarActivity;)V

    iput-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method


# virtual methods
.method protected dismissDialog()V
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 220
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 222
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 163
    :try_start_0
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onBackPressed()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    :goto_0
    return-void

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, e:Ljava/lang/IllegalStateException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "If extending BaseActivity, please use multiple parameter version of this method."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate(Landroid/os/Bundle;IZZ)V
    .locals 5
    .parameter "savedInstanceState"
    .parameter "layout"
    .parameter "loginRequired"
    .parameter "readOnly"

    .prologue
    .line 77
    :try_start_0
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/util/AndroidRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/BaseActionBarActivity;->preSetContentView()V

    .line 82
    invoke-virtual {p0, p2}, Lco/vine/android/BaseActionBarActivity;->setContentView(I)V

    .line 83
    invoke-virtual {p0}, Lco/vine/android/BaseActionBarActivity;->getParent()Landroid/app/Activity;

    move-result-object v2

    .line 85
    .local v2, parent:Landroid/app/Activity;
    if-eqz p3, :cond_2

    invoke-static {p0, p4}, Lco/vine/android/client/VineAccountHelper;->isLoggedIn(Landroid/content/Context;Z)Z

    move-result v3

    if-nez v3, :cond_2

    const/4 v1, 0x1

    .line 87
    .local v1, needsToLogin:Z
    :goto_1
    if-eqz v1, :cond_0

    if-nez v2, :cond_0

    .line 88
    invoke-static {p0}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    .line 91
    :cond_0
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->isViewServerEnabled(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 92
    invoke-static {p0}, Lcom/android/debug/hv/ViewServer;->get(Landroid/content/Context;)Lcom/android/debug/hv/ViewServer;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/android/debug/hv/ViewServer;->addWindow(Landroid/app/Activity;)V

    .line 94
    :cond_1
    iget-object v3, p0, Lco/vine/android/BaseActionBarActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    sget-object v4, Lco/vine/android/BaseActionBarActivity;->FINISH_INTENT_FILTER:Landroid/content/IntentFilter;

    invoke-virtual {p0, v3, v4}, Lco/vine/android/BaseActionBarActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 95
    return-void

    .line 78
    .end local v1           #needsToLogin:Z
    .end local v2           #parent:Landroid/app/Activity;
    :catch_0
    move-exception v0

    .line 79
    .local v0, e:Landroid/util/AndroidRuntimeException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    .end local v0           #e:Landroid/util/AndroidRuntimeException;
    .restart local v2       #parent:Landroid/app/Activity;
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 99
    const v0, 0x7f0a018e

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/BaseActionBarActivity;->updateMuteActionState(Landroid/view/MenuItem;)V

    .line 100
    iput-object p1, p0, Lco/vine/android/BaseActionBarActivity;->mMenu:Landroid/view/Menu;

    .line 101
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 128
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onDestroy()V

    .line 129
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->isViewServerEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-static {p0}, Lcom/android/debug/hv/ViewServer;->get(Landroid/content/Context;)Lcom/android/debug/hv/ViewServer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/debug/hv/ViewServer;->removeWindow(Landroid/app/Activity;)V

    .line 132
    :cond_0
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lco/vine/android/BaseActionBarActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 133
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 193
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 212
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 196
    :sswitch_0
    :try_start_0
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onBackPressed()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 197
    :catch_0
    move-exception v0

    goto :goto_0

    .line 203
    :sswitch_1
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v0

    invoke-virtual {v0, p0}, Lco/vine/android/AppImpl;->startCapture(Landroid/app/Activity;)V

    goto :goto_0

    .line 207
    :sswitch_2
    invoke-static {p0}, Lco/vine/android/util/MuteUtil;->isMuted(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_1
    invoke-static {p0, v0}, Lco/vine/android/util/MuteUtil;->setMuted(Landroid/content/Context;Z)V

    .line 208
    invoke-virtual {p0, p1}, Lco/vine/android/BaseActionBarActivity;->updateMuteActionState(Landroid/view/MenuItem;)V

    goto :goto_0

    .line 207
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 193
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f0a018e -> :sswitch_2
        0x7f0a0191 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 122
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onPause()V

    .line 123
    invoke-virtual {p0}, Lco/vine/android/BaseActionBarActivity;->dismissDialog()V

    .line 124
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 106
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onResume()V

    .line 107
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_2

    .line 108
    const-string v0, "Activity"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/crashlytics/android/Crashlytics;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_0
    :goto_0
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mMenu:Landroid/view/Menu;

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mMenu:Landroid/view/Menu;

    const v1, 0x7f0a018e

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/BaseActionBarActivity;->updateMuteActionState(Landroid/view/MenuItem;)V

    .line 117
    :cond_1
    iget-object v0, p0, Lco/vine/android/BaseActionBarActivity;->mFinishReceiver:Landroid/content/BroadcastReceiver;

    sget-object v1, Lco/vine/android/BaseActionBarActivity;->FINISH_INTENT_FILTER:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lco/vine/android/BaseActionBarActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 118
    return-void

    .line 110
    :cond_2
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->isViewServerEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-static {p0}, Lcom/android/debug/hv/ViewServer;->get(Landroid/content/Context;)Lcom/android/debug/hv/ViewServer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/debug/hv/ViewServer;->setFocusedWindow(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 56
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStart()V

    .line 57
    invoke-static {p0}, Lco/vine/android/util/FlurryUtils;->start(Landroid/content/Context;)V

    .line 58
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 62
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStop()V

    .line 63
    invoke-static {p0}, Lco/vine/android/util/FlurryUtils;->stop(Landroid/content/Context;)V

    .line 64
    return-void
.end method

.method public preSetContentView()V
    .locals 0

    .prologue
    .line 73
    return-void
.end method

.method protected setupActionBar(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;)V
    .locals 3
    .parameter "setHomeButtonEnabled"
    .parameter "setDisplayShowTitleEnabled"
    .parameter "setTitle"
    .parameter "setDisplayHomeAsUpEnabled"

    .prologue
    .line 170
    invoke-virtual {p0}, Lco/vine/android/BaseActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 171
    .local v0, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_3

    .line 172
    if-eqz p1, :cond_0

    .line 173
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 175
    :cond_0
    if-eqz p2, :cond_1

    .line 176
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 178
    :cond_1
    if-eqz p4, :cond_2

    .line 179
    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 181
    :cond_2
    if-eqz p3, :cond_3

    .line 182
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setTitle(I)V

    .line 186
    :cond_3
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_4

    .line 187
    invoke-virtual {p0, p1, p2, p4}, Lco/vine/android/BaseActionBarActivity;->setupActionBarJBOnly(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    .line 189
    :cond_4
    return-void
.end method

.method protected setupActionBarJBOnly(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 2
    .parameter "setHomeButtonEnabled"
    .parameter "setDisplayShowTitleEnabled"
    .parameter "setDisplayHomeAsUpEnabled"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p0}, Lco/vine/android/BaseActionBarActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 147
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_2

    .line 148
    if-eqz p1, :cond_0

    .line 149
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 151
    :cond_0
    if-eqz p2, :cond_1

    .line 152
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 154
    :cond_1
    if-eqz p3, :cond_2

    .line 155
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 158
    :cond_2
    return-void
.end method

.method public updateMuteActionState(Landroid/view/MenuItem;)V
    .locals 3
    .parameter "menu"

    .prologue
    .line 136
    if-eqz p1, :cond_0

    .line 137
    invoke-static {p0}, Lco/vine/android/util/MuteUtil;->isMuted(Landroid/content/Context;)Z

    move-result v0

    .line 138
    .local v0, isMuted:Z
    const-string v1, "Is muted? {}"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    if-eqz v0, :cond_1

    const v1, 0x7f0e01ca

    :goto_0
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 141
    .end local v0           #isMuted:Z
    :cond_0
    return-void

    .line 139
    .restart local v0       #isMuted:Z
    :cond_1
    const v1, 0x7f0e00f4

    goto :goto_0
.end method
