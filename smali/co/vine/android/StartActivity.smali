.class public Lco/vine/android/StartActivity;
.super Lco/vine/android/BaseControllerActionBarActivity;
.source "StartActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/StartActivity$StartSessionListener;
    }
.end annotation


# static fields
.field public static final ACTION_NOTIFICATION_PRESSED:Ljava/lang/String; = "co.vine.android.NOTIFICATION_PRESSED"

.field public static final ACTION_RECORD:Ljava/lang/String; = "co.vine.android.RECORD"

.field public static final ACTION_VIEW_UPLOAD_LIST:Ljava/lang/String; = "co.vine.android.UPLOAD_LIST"

.field private static final DIALOG_ACTIVATE_ACCOUNT:I = 0x1

.field public static final EXTRA_LOGIN_REQUEST:Ljava/lang/String; = "login_request"

.field private static final PREF_LOG_STARTUP_FAIL:Ljava/lang/String; = "pref_log_startup_fail"

.field private static final REQUEST_CODE_TWITTER_SDK:I = 0x1

.field private static final STATE_AUTH_INTENT:Ljava/lang/String; = "auth_intent"

.field private static final STATE_STOP_POSITION:Ljava/lang/String; = "state_p"


# instance fields
.field private mAuthIntent:Landroid/content/Intent;

.field private mHandler:Landroid/os/Handler;

.field private mLoginRequest:Z

.field private mStopPosition:I

.field private mTwitter:Lcom/twitter/android/sdk/Twitter;

.field private mVideoView:Lco/vine/android/player/VideoViewInterface;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lco/vine/android/BaseControllerActionBarActivity;-><init>()V

    .line 72
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lco/vine/android/StartActivity;->mHandler:Landroid/os/Handler;

    .line 440
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/StartActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 43
    invoke-direct {p0}, Lco/vine/android/StartActivity;->openStartVideo()V

    return-void
.end method

.method static synthetic access$100(Lco/vine/android/StartActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lco/vine/android/StartActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/StartActivity;)Lco/vine/android/player/VideoViewInterface;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/StartActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-boolean v0, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    return v0
.end method

.method private static broadcastFinish(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 335
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 336
    .local v0, i:Landroid/content/Intent;
    const-string v1, "co.vine.android.FINISH"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 337
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 338
    return-void
.end method

.method public static getStartIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .parameter "context"

    .prologue
    .line 341
    const-string v0, "android.intent.action.VIEW"

    invoke-static {p0, v0}, Lco/vine/android/StartActivity;->getStartIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getStartIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "context"
    .parameter "action"

    .prologue
    .line 345
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/StartActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 346
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 347
    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 348
    return-object v0
.end method

.method private loginCheckTwitter(Landroid/content/Intent;Z)V
    .locals 8
    .parameter "data"
    .parameter "reactivate"

    .prologue
    .line 400
    if-nez p1, :cond_0

    .line 415
    :goto_0
    return-void

    .line 403
    :cond_0
    const-string v0, "screen_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 404
    .local v1, username:Ljava/lang/String;
    const-string v0, "tk"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 405
    .local v2, mToken:Ljava/lang/String;
    const-string v0, "ts"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 407
    .local v3, mSecret:Ljava/lang/String;
    new-instance v7, Landroid/app/ProgressDialog;

    const v0, 0x7f0f0028

    invoke-direct {v7, p0, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 408
    .local v7, dialog:Landroid/app/ProgressDialog;
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 409
    const v0, 0x7f0e01a1

    invoke-virtual {p0, v0}, Lco/vine/android/StartActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 410
    invoke-virtual {v7}, Landroid/app/ProgressDialog;->show()V

    .line 411
    iput-object v7, p0, Lco/vine/android/StartActivity;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 413
    iget-object v0, p0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    const-string v4, "user_id"

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v4, v5, v6}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;

    goto :goto_0
.end method

.method private openStartVideo()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 270
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0, v1}, Lco/vine/android/player/VideoViewInterface;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 271
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0, v1}, Lco/vine/android/player/VideoViewInterface;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 272
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    const v1, 0x7f060001

    invoke-static {p0, v1}, Lco/vine/android/util/SystemUtil;->getVideoUrlFromResource(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lco/vine/android/player/VideoViewInterface;->setVideoPathDirect(Ljava/lang/String;)V

    .line 273
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    iget v1, p0, Lco/vine/android/StartActivity;->mStopPosition:I

    invoke-interface {v0, v1}, Lco/vine/android/player/VideoViewInterface;->seekTo(I)V

    .line 274
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->start()V

    .line 275
    return-void
.end method

.method public static toStart(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 328
    invoke-static {p0}, Lco/vine/android/StartActivity;->getStartIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 329
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p0, Lco/vine/android/StartActivity;

    if-nez v0, :cond_0

    .line 330
    invoke-static {p0}, Lco/vine/android/StartActivity;->broadcastFinish(Landroid/content/Context;)V

    .line 332
    :cond_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 393
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 394
    const/4 v0, 0x0

    invoke-direct {p0, p3, v0}, Lco/vine/android/StartActivity;->loginCheckTwitter(Landroid/content/Intent;Z)V

    .line 395
    iput-object p3, p0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    .line 397
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    const/4 v3, 0x1

    .line 353
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 389
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 355
    :pswitch_1
    iget-boolean v2, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v2, :cond_1

    .line 356
    invoke-static {p0}, Lco/vine/android/LoginActivity;->getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 358
    :cond_1
    invoke-static {p0}, Lco/vine/android/LoginActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 363
    :pswitch_2
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/SignUpPagerActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 364
    .local v1, intent:Landroid/content/Intent;
    iget-boolean v2, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v2, :cond_2

    .line 365
    const-string v2, "finish"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 367
    :cond_2
    invoke-virtual {p0, v1}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 372
    .end local v1           #intent:Landroid/content/Intent;
    :pswitch_3
    :try_start_0
    iget-object v2, p0, Lco/vine/android/StartActivity;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v3}, Lcom/twitter/android/sdk/Twitter;->startAuthActivityForResult(Landroid/app/Activity;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 373
    iget-boolean v2, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v2, :cond_3

    .line 374
    invoke-static {p0}, Lco/vine/android/LoginTwitterActivity;->getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 379
    :catch_0
    move-exception v0

    .line 380
    .local v0, e:Ljava/lang/SecurityException;
    iget-boolean v2, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v2, :cond_4

    .line 381
    invoke-static {p0}, Lco/vine/android/LoginTwitterActivity;->getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 376
    .end local v0           #e:Ljava/lang/SecurityException;
    :cond_3
    :try_start_1
    invoke-static {p0}, Lco/vine/android/LoginTwitterActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 383
    .restart local v0       #e:Ljava/lang/SecurityException;
    :cond_4
    invoke-static {p0}, Lco/vine/android/LoginTwitterActivity;->getIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 353
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0179
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 27
    .parameter "savedInstanceState"

    .prologue
    .line 125
    const v22, 0x7f030067

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-super {v0, v1, v2, v3}, Lco/vine/android/BaseControllerActionBarActivity;->onCreate(Landroid/os/Bundle;IZ)V

    .line 127
    sget v22, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v23, 0xe

    move/from16 v0, v22

    move/from16 v1, v23

    if-gt v0, v1, :cond_0

    .line 128
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v4

    .line 129
    .local v4, ab:Landroid/support/v7/app/ActionBar;
    if-eqz v4, :cond_0

    .line 130
    invoke-virtual {v4}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 134
    .end local v4           #ab:Landroid/support/v7/app/ActionBar;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->getIntent()Landroid/content/Intent;

    move-result-object v16

    .line 137
    .local v16, originalIntent:Landroid/content/Intent;
    const/16 v22, 0x1

    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->setRequestedOrientation(I)V

    .line 138
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v6

    .line 141
    .local v6, appController:Lco/vine/android/client/AppController;
    if-eqz v16, :cond_2

    invoke-virtual/range {v16 .. v16}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 142
    .local v5, action:Ljava/lang/String;
    :goto_0
    const-string v22, "co.vine.android.RECORD"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    .line 144
    .local v18, record:Z
    if-eqz p1, :cond_1

    const-string v22, "auth_intent"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_1

    .line 145
    const-string v22, "auth_intent"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v22

    check-cast v22, Landroid/content/Intent;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    .line 146
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lco/vine/android/StartActivity;->loginCheckTwitter(Landroid/content/Intent;Z)V

    .line 149
    :cond_1
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v10

    .line 150
    .local v10, impl:Lco/vine/android/AppInterface;
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v10, v0, v6, v1}, Lco/vine/android/AppInterface;->updateClientProfile(Landroid/content/Context;Lco/vine/android/client/AppController;Z)V

    .line 151
    if-eqz v16, :cond_3

    .line 152
    const-string v22, "login_request"

    const/16 v23, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/StartActivity;->mLoginRequest:Z

    .line 157
    :goto_1
    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lco/vine/android/client/Session;->isLoggedIn()Z

    move-result v22

    if-eqz v22, :cond_9

    .line 158
    const/4 v11, 0x0

    .line 159
    .local v11, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    move/from16 v22, v0

    if-eqz v22, :cond_4

    .line 160
    const/16 v22, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->setResult(I)V

    .line 161
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->finish()V

    .line 267
    .end local v5           #action:Ljava/lang/String;
    .end local v6           #appController:Lco/vine/android/client/AppController;
    .end local v10           #impl:Lco/vine/android/AppInterface;
    .end local v11           #intent:Landroid/content/Intent;
    .end local v18           #record:Z
    :goto_2
    return-void

    .line 141
    .restart local v6       #appController:Lco/vine/android/client/AppController;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 154
    .restart local v5       #action:Ljava/lang/String;
    .restart local v10       #impl:Lco/vine/android/AppInterface;
    .restart local v18       #record:Z
    :cond_3
    const/16 v22, 0x0

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/StartActivity;->mLoginRequest:Z
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 256
    .end local v5           #action:Ljava/lang/String;
    .end local v6           #appController:Lco/vine/android/client/AppController;
    .end local v10           #impl:Lco/vine/android/AppInterface;
    .end local v18           #record:Z
    :catch_0
    move-exception v8

    .line 257
    .local v8, e:Landroid/database/sqlite/SQLiteException;
    invoke-static/range {p0 .. p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 258
    .local v17, prefs:Landroid/content/SharedPreferences;
    const-string v22, "pref_log_startup_fail: {}."

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "pref_log_startup_fail"

    const/16 v26, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move/from16 v2, v26

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v8, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 259
    const v22, 0x7f0e01ad

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;I)V

    .line 260
    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    const-string v23, "pref_log_startup_fail"

    const/16 v24, 0x1

    invoke-interface/range {v22 .. v24}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 261
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->finish()V

    goto :goto_2

    .line 163
    .end local v8           #e:Landroid/database/sqlite/SQLiteException;
    .end local v17           #prefs:Landroid/content/SharedPreferences;
    .restart local v5       #action:Ljava/lang/String;
    .restart local v6       #appController:Lco/vine/android/client/AppController;
    .restart local v10       #impl:Lco/vine/android/AppInterface;
    .restart local v11       #intent:Landroid/content/Intent;
    .restart local v18       #record:Z
    :cond_4
    if-nez v18, :cond_8

    .line 164
    :try_start_1
    new-instance v11, Landroid/content/Intent;

    .end local v11           #intent:Landroid/content/Intent;
    const-class v22, Lco/vine/android/HomeTabActivity;

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v11, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 165
    .restart local v11       #intent:Landroid/content/Intent;
    const/high16 v22, 0x1400

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 166
    invoke-virtual {v11, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 167
    const-string v22, "android.intent.action.VIEW"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 168
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->getIntent()Landroid/content/Intent;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 177
    :cond_5
    :goto_3
    if-eqz v11, :cond_6

    .line 178
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    .line 180
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->finish()V

    goto/16 :goto_2

    .line 169
    :cond_7
    const-string v22, "co.vine.android.NOTIFICATION_PRESSED"

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 170
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lco/vine/android/client/AppController;->clearPushNotifications()V

    .line 171
    const/high16 v22, 0x400

    move/from16 v0, v22

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_3

    .line 174
    :cond_8
    const/high16 v22, 0x2

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "StartActivity: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->getCallingActivity()Landroid/content/ComponentName;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v10, v0, v1, v2}, Lco/vine/android/AppInterface;->getRecordingIntent(Landroid/app/Activity;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v11

    goto :goto_3

    .line 182
    .end local v11           #intent:Landroid/content/Intent;
    :cond_9
    new-instance v7, Landroid/text/style/StyleSpan;

    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-direct {v7, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 183
    .local v7, boldSpan:Landroid/text/style/StyleSpan;
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v15, v0, [Landroid/text/style/StyleSpan;

    const/16 v22, 0x0

    aput-object v7, v15, v22

    .line 187
    .local v15, mStyleSpanBoldSingle:[Landroid/text/style/StyleSpan;
    const v22, 0x7f0a017b

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/Button;

    .line 188
    .local v13, mSignUpEmail:Landroid/widget/Button;
    const v22, 0x7f0e01ab

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x22

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v15, v0, v1}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 190
    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    const v22, 0x7f0a017c

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/Button;

    .line 193
    .local v14, mSignUpTwitter:Landroid/widget/Button;
    const v22, 0x7f0e01ac

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x22

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v15, v0, v1}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 195
    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    const v22, 0x7f0a0179

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 198
    .local v12, mSignIn:Landroid/widget/TextView;
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 200
    const v22, 0x7f0e01aa

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x22

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v15, v0, v1}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v20

    .line 202
    .local v20, spanned:Landroid/text/Spanned;
    move-object/from16 v0, v20

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    invoke-virtual {v12}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v19

    check-cast v19, Landroid/text/Spannable;

    .line 205
    .local v19, spannable:Landroid/text/Spannable;
    move-object/from16 v0, v20

    invoke-interface {v0, v7}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v21

    .line 206
    .local v21, start:I
    move-object/from16 v0, v20

    invoke-interface {v0, v7}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v9

    .line 208
    .local v9, end:I
    new-instance v22, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/StartActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v23

    const v24, 0x7f090066

    invoke-virtual/range {v23 .. v24}, Landroid/content/res/Resources;->getColor(I)I

    move-result v23

    invoke-direct/range {v22 .. v23}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/16 v23, 0x21

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    move/from16 v2, v21

    move/from16 v3, v23

    invoke-static {v0, v1, v2, v9, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 211
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 213
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lco/vine/android/client/AppController;->getTwitter()Lcom/twitter/android/sdk/Twitter;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/StartActivity;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    .line 215
    const v22, 0x7f0a0178

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/StartActivity;->findViewById(I)Landroid/view/View;

    move-result-object v22

    check-cast v22, Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lco/vine/android/player/VideoViewInterface;->setKeepScreenOn(Z)V

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    invoke-interface/range {v22 .. v23}, Lco/vine/android/player/VideoViewInterface;->setLooping(Z)V

    .line 219
    invoke-static/range {p0 .. p0}, Lco/vine/android/util/SystemUtil;->isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v22

    sget-object v23, Lco/vine/android/util/SystemUtil$PrefBooleanState;->UNKNOWN:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_b

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v22, v0

    const v23, 0x7f060002

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-static {v0, v1}, Lco/vine/android/util/SystemUtil;->getVideoUrlFromResource(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Lco/vine/android/player/VideoViewInterface;->setVideoPathDirect(Ljava/lang/String;)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v22, v0

    new-instance v23, Lco/vine/android/StartActivity$1;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/StartActivity$1;-><init>(Lco/vine/android/StartActivity;)V

    invoke-interface/range {v22 .. v23}, Lco/vine/android/player/VideoViewInterface;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    move-object/from16 v22, v0

    new-instance v23, Lco/vine/android/StartActivity$2;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/StartActivity$2;-><init>(Lco/vine/android/StartActivity;)V

    invoke-interface/range {v22 .. v23}, Lco/vine/android/player/VideoViewInterface;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 248
    :goto_4
    if-eqz p1, :cond_a

    const-string v22, "state_p"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_a

    .line 250
    const-string v22, "state_p"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v22

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/StartActivity;->mStopPosition:I

    .line 252
    :cond_a
    new-instance v22, Lco/vine/android/StartActivity$StartSessionListener;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/StartActivity$StartSessionListener;-><init>(Lco/vine/android/StartActivity;)V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/StartActivity;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 253
    move-object/from16 v0, p0

    iput-object v6, v0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    .line 254
    invoke-static/range {p0 .. p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    const-string v23, "pref_log_startup_fail"

    const/16 v24, 0x0

    invoke-interface/range {v22 .. v24}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_2

    .line 245
    :cond_b
    invoke-direct/range {p0 .. p0}, Lco/vine/android/StartActivity;->openStartVideo()V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 290
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onDestroy()V

    .line 291
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->suspend()V

    .line 294
    :cond_0
    return-void
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 2
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 419
    packed-switch p2, :pswitch_data_0

    .line 438
    :cond_0
    :goto_0
    return-void

    .line 421
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 423
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lco/vine/android/StartActivity;->loginCheckTwitter(Landroid/content/Intent;Z)V

    goto :goto_0

    .line 419
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 421
    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_1
    .end packed-switch
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 8
    .parameter "i"

    .prologue
    .line 82
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lco/vine/android/StartActivity;->setRequestedOrientation(I)V

    .line 83
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v1

    .line 85
    .local v1, appController:Lco/vine/android/client/AppController;
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, action:Ljava/lang/String;
    const-string v5, "co.vine.android.RECORD"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 88
    .local v4, record:Z
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v2

    .line 89
    .local v2, impl:Lco/vine/android/AppInterface;
    invoke-interface {v2, p0, v1, v4}, Lco/vine/android/AppInterface;->updateClientProfile(Landroid/content/Context;Lco/vine/android/client/AppController;Z)V

    .line 91
    const-string v5, "login_request"

    const/4 v6, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    .line 93
    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/client/Session;->isLoggedIn()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 94
    iget-boolean v5, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v5, :cond_1

    .line 95
    const/4 v5, -0x1

    invoke-virtual {p0, v5}, Lco/vine/android/StartActivity;->setResult(I)V

    .line 96
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->finish()V

    .line 121
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    if-nez v4, :cond_5

    .line 101
    new-instance v3, Landroid/content/Intent;

    const-class v5, Lco/vine/android/HomeTabActivity;

    invoke-direct {v3, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v3, intent:Landroid/content/Intent;
    const/high16 v5, 0x1400

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 103
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 104
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 105
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 115
    :cond_2
    :goto_1
    if-eqz v3, :cond_3

    .line 116
    invoke-virtual {p0, v3}, Lco/vine/android/StartActivity;->startActivity(Landroid/content/Intent;)V

    .line 118
    :cond_3
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->finish()V

    goto :goto_0

    .line 106
    :cond_4
    const-string v5, "co.vine.android.NOTIFICATION_PRESSED"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 107
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    iget-object v5, p0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->clearPushNotifications()V

    .line 109
    const/high16 v5, 0x400

    invoke-virtual {v3, v5}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_1

    .line 112
    .end local v3           #intent:Landroid/content/Intent;
    :cond_5
    const/high16 v5, 0x2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "StartActivity: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lco/vine/android/StartActivity;->getCallingActivity()Landroid/content/ComponentName;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, p0, v5, v6}, Lco/vine/android/AppInterface;->getRecordingIntent(Landroid/app/Activity;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    .restart local v3       #intent:Landroid/content/Intent;
    goto :goto_1
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 280
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onPause()V

    .line 281
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lco/vine/android/StartActivity;->mStopPosition:I

    .line 283
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->pause()V

    .line 285
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->dismissDialog()V

    .line 286
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 306
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onResume()V

    .line 307
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    iget v1, p0, Lco/vine/android/StartActivity;->mStopPosition:I

    invoke-interface {v0, v1}, Lco/vine/android/player/VideoViewInterface;->seekTo(I)V

    .line 309
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 310
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->resume()V

    .line 315
    :cond_0
    :goto_0
    iget-object v0, p0, Lco/vine/android/StartActivity;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lco/vine/android/StartActivity;->mLoginRequest:Z

    if-eqz v0, :cond_1

    .line 316
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lco/vine/android/StartActivity;->setResult(I)V

    .line 317
    invoke-virtual {p0}, Lco/vine/android/StartActivity;->finish()V

    .line 319
    :cond_1
    return-void

    .line 312
    :cond_2
    iget-object v0, p0, Lco/vine/android/StartActivity;->mVideoView:Lco/vine/android/player/VideoViewInterface;

    invoke-interface {v0}, Lco/vine/android/player/VideoViewInterface;->start()V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 298
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 299
    iget-object v0, p0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 300
    const-string v0, "auth_intent"

    iget-object v1, p0, Lco/vine/android/StartActivity;->mAuthIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 302
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 76
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackLockOutSessionCount()V

    .line 77
    invoke-super {p0}, Lco/vine/android/BaseControllerActionBarActivity;->onStop()V

    .line 78
    return-void
.end method
