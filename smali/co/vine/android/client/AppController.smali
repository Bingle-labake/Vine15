.class public Lco/vine/android/client/AppController;
.super Ljava/lang/Object;
.source "AppController.java"

# interfaces
.implements Lco/vine/android/util/image/PhotoImagesListener;
.implements Lco/vine/android/util/video/VideoListener;
.implements Lcom/facebook/Session$StatusCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/client/AppController$VineServiceConnection;,
        Lco/vine/android/client/AppController$LoopCountRunnable;,
        Lco/vine/android/client/AppController$ServerStatusRunnable;
    }
.end annotation


# static fields
.field private static final CLEANUP_INTERVAL:J = 0x36ee80L

.field private static final KEY_FACEBOOK_TOKEN:Ljava/lang/String; = "KEY_FACEBOOK_TOKEN"

.field private static final LOOP_COUNT_INTERVAL:J = 0x493e0L

.field private static final PREF_LAST_USER_ID:Ljava/lang/String; = "last_user_id"

.field public static final PUBLISH_ACTIONS:Ljava/lang/String; = "publish_actions"

.field public static final REQUEST_CODE_TWITTER_SDK:I = 0x1

.field public static final REQUEST_CODE_TWITTER_XAUTH:I = 0x2

.field private static final SERVER_REFRESH_INTERVAL:J = 0x36ee80L

.field public static final STATUS_CODE_CAPTCHA_FAIL:I = 0x1c7

.field private static final TYPEAHEAD_DEFAULT_FETCH_THRESHOLD:I = 0x2

.field private static final TYPEAHEAD_DEFAULT_MAX_COMPOSE:I = 0x32

.field private static final TYPEAHEAD_DEFAULT_THROTTLE:J = 0x12cL

.field private static final TYPEAHEAD_TAGS_FETCH_THRESHOLD:I = 0x3

.field private static sInstance:Lco/vine/android/client/AppController;


# instance fields
.field final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/client/AppSessionListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLoopCountRunnable:Lco/vine/android/client/AppController$LoopCountRunnable;

.field private final mPhotoImagesCache:Lco/vine/android/util/image/PhotoImagesCache;

.field private mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

.field private final mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

.field private final mServiceResponder:Lco/vine/android/service/VineServiceResponder;

.field private final mTwitter:Lcom/twitter/android/sdk/Twitter;

.field private final mVideoCache:Lco/vine/android/util/video/VideoCache;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 114
    sget-boolean v4, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v4, :cond_1

    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v4

    if-nez v4, :cond_1

    .line 115
    const-string v4, "Start changing value."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 117
    :try_start_0
    const-class v4, Landroid/database/CursorWindow;

    const-string v5, "sCursorWindowSize"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 118
    .local v1, field:Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 119
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 120
    .local v2, original:Ljava/lang/Object;
    const-string v4, "Original value: {}."

    invoke-static {v4, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    const v3, 0x989680

    .line 122
    .local v3, target:I
    check-cast v2, Ljava/lang/Integer;

    .end local v2           #original:Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ge v4, v3, :cond_0

    .line 123
    const/4 v4, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    :cond_0
    const-string v4, "Sucessfully updated sCursorWindowSize."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .end local v3           #target:I
    :goto_0
    :try_start_1
    const-class v4, Landroid/database/CursorWindow;

    const-string v5, "sCursorWindowSize"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 131
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 132
    const-string v4, "Verify value: {}."

    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 136
    :goto_1
    const-string v4, "End changing value."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 138
    :cond_1
    return-void

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, e:Ljava/lang/Exception;
    const-string v4, "You are too evil."

    invoke-static {v4, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 133
    .end local v0           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 134
    .restart local v0       #e:Ljava/lang/Exception;
    const-string v4, "You are too evil."

    invoke-static {v4, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v3, Lco/vine/android/client/AppController$VineServiceConnection;

    invoke-direct {v3}, Lco/vine/android/client/AppController$VineServiceConnection;-><init>()V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    .line 154
    iput-object p1, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    .line 155
    new-instance v3, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    .line 156
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 158
    const-string v3, "window"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowManager;

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 160
    .local v0, display:Landroid/view/Display;
    invoke-static {v0}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v2

    .line 161
    .local v2, p:Landroid/graphics/Point;
    iget v3, v2, Landroid/graphics/Point;->x:I

    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 162
    .local v1, maxImageSize:I
    new-instance v3, Lco/vine/android/util/image/PhotoImagesCache;

    const/high16 v4, 0x1e0

    invoke-direct {v3, p1, v1, v4}, Lco/vine/android/util/image/PhotoImagesCache;-><init>(Landroid/content/Context;II)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mPhotoImagesCache:Lco/vine/android/util/image/PhotoImagesCache;

    .line 163
    iget-object v3, p0, Lco/vine/android/client/AppController;->mPhotoImagesCache:Lco/vine/android/util/image/PhotoImagesCache;

    invoke-virtual {v3, p0}, Lco/vine/android/util/image/PhotoImagesCache;->addListener(Lco/vine/android/util/image/PhotoImagesListener;)V

    .line 164
    new-instance v3, Lco/vine/android/util/video/VideoCache;

    const/4 v4, 0x0

    invoke-direct {v3, p1, v4}, Lco/vine/android/util/video/VideoCache;-><init>(Landroid/content/Context;I)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mVideoCache:Lco/vine/android/util/video/VideoCache;

    .line 165
    iget-object v3, p0, Lco/vine/android/client/AppController;->mVideoCache:Lco/vine/android/util/video/VideoCache;

    invoke-virtual {v3, p0}, Lco/vine/android/util/video/VideoCache;->addListener(Lco/vine/android/util/video/VideoListener;)V

    .line 166
    new-instance v3, Lcom/twitter/android/sdk/Twitter;

    sget-object v4, Lco/vine/android/client/TwitterVineApp;->API_KEY:Ljava/lang/String;

    sget-object v5, Lco/vine/android/client/TwitterVineApp;->API_SECRET:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lcom/twitter/android/sdk/Twitter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    .line 168
    new-instance v3, Lco/vine/android/client/AppController$1;

    invoke-direct {v3, p0}, Lco/vine/android/client/AppController$1;-><init>(Lco/vine/android/client/AppController;)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mServiceResponder:Lco/vine/android/service/VineServiceResponder;

    .line 176
    new-instance v3, Lco/vine/android/client/AppController$ServerStatusRunnable;

    invoke-direct {v3, p0}, Lco/vine/android/client/AppController$ServerStatusRunnable;-><init>(Lco/vine/android/client/AppController;)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

    .line 177
    new-instance v3, Lco/vine/android/client/AppController$LoopCountRunnable;

    invoke-direct {v3, p0}, Lco/vine/android/client/AppController$LoopCountRunnable;-><init>(Lco/vine/android/client/AppController;)V

    iput-object v3, p0, Lco/vine/android/client/AppController;->mLoopCountRunnable:Lco/vine/android/client/AppController$LoopCountRunnable;

    .line 178
    const-string v3, "App Controller pid: {}"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lco/vine/android/service/VineService;

    invoke-direct {v3, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v4, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    const/4 v5, 0x1

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 181
    return-void
.end method

.method public static clearFileCache(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 1672
    invoke-static {p0}, Lco/vine/android/util/Util;->removeCache(Landroid/content/Context;)V

    .line 1673
    invoke-static {p0}, Lco/vine/android/util/image/ImageUtils;->removeFiles(Landroid/content/Context;)V

    .line 1674
    return-void
.end method

.method private createServiceBundle()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 1741
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method private createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;
    .locals 2
    .parameter "session"

    .prologue
    .line 1753
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1754
    .local v0, bundle:Landroid/os/Bundle;
    invoke-direct {p0, v0, p1}, Lco/vine/android/client/AppController;->injectServiceBundle(Landroid/os/Bundle;Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v1

    return-object v1
.end method

.method private executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;
    .locals 2
    .parameter "actionCode"
    .parameter "bundle"

    .prologue
    .line 1736
    const-string v0, "Last Service Action Code"

    invoke-static {v0, p1}, Lcom/crashlytics/android/Crashlytics;->setInt(Ljava/lang/String;I)V

    .line 1737
    iget-object v0, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    iget-object v1, p0, Lco/vine/android/client/AppController;->mServiceResponder:Lco/vine/android/service/VineServiceResponder;

    invoke-virtual {v0, p1, p2, v1}, Lco/vine/android/client/AppController$VineServiceConnection;->queueAndExecute(ILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getActiveSession(Z)Lco/vine/android/client/Session;
    .locals 1
    .parameter "readOnly"

    .prologue
    .line 1177
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lco/vine/android/client/VineAccountHelper;->getActiveSession(Landroid/content/Context;Z)Lco/vine/android/client/Session;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;
    .locals 3
    .parameter "context"

    .prologue
    .line 147
    const-class v1, Lco/vine/android/client/AppController;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lco/vine/android/client/AppController;->sInstance:Lco/vine/android/client/AppController;

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Lco/vine/android/client/AppController;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lco/vine/android/client/AppController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/client/AppController;->sInstance:Lco/vine/android/client/AppController;

    .line 150
    :cond_0
    sget-object v0, Lco/vine/android/client/AppController;->sInstance:Lco/vine/android/client/AppController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 147
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private injectServiceBundle(Landroid/os/Bundle;Lco/vine/android/client/Session;)Landroid/os/Bundle;
    .locals 3
    .parameter "bundle"
    .parameter "session"

    .prologue
    .line 1745
    const-string v0, "s_key"

    invoke-virtual {p2}, Lco/vine/android/client/Session;->getSessionKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1746
    const-string v0, "s_owner_id"

    invoke-virtual {p2}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1747
    const-string v0, "a_name"

    invoke-virtual {p2}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1748
    const-string v0, "email"

    invoke-virtual {p2}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1749
    return-object p1
.end method

.method private onLogout()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 274
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getLoginStatus()Lco/vine/android/client/Session$LoginStatus;

    move-result-object v4

    sget-object v5, Lco/vine/android/client/Session$LoginStatus;->LOGGED_OUT:Lco/vine/android/client/Session$LoginStatus;

    invoke-virtual {v4, v5}, Lco/vine/android/client/Session$LoginStatus;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 309
    :goto_0
    return-void

    .line 277
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/client/Session;->getSessionKey()Ljava/lang/String;

    move-result-object v1

    .line 280
    .local v1, cachedKey:Ljava/lang/String;
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 281
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->clearDbAll()Ljava/lang/String;

    .line 282
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->clearFileCache()V

    .line 285
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v6

    invoke-static {v5, v6, v7, v1}, Lco/vine/android/service/GCMRegistrationService;->getUnregisterIntent(Landroid/content/Context;JLjava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 289
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "last_user_id"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v6

    invoke-interface {v4, v5, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 292
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    const-wide/16 v5, 0x0

    invoke-static {v4, v8, v8, v5, v6}, Lco/vine/android/provider/SettingsManager;->setCurrentAccount(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    .line 293
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    .line 294
    .local v0, activeSession:Lco/vine/android/client/Session;
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lco/vine/android/client/VineAccountHelper;->removeAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/AccountManagerFuture;

    .line 295
    if-eqz v0, :cond_1

    .line 296
    invoke-virtual {v0}, Lco/vine/android/client/Session;->logout()V

    .line 300
    :cond_1
    new-instance v3, Landroid/content/Intent;

    const-string v4, "co.vine.android.session.logout"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 301
    .local v3, logoutIntent:Landroid/content/Intent;
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 302
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lco/vine/android/AppImpl;->getClearNotificationsIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    .line 303
    .local v2, i:Landroid/content/Intent;
    if-eqz v2, :cond_2

    .line 304
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 308
    :cond_2
    iget-object v4, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/StartActivity;->toStart(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method private performCleanup(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "timeAnchor"

    .prologue
    .line 1621
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1622
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "time"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1623
    const/16 v1, 0x1d

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static setPendingFacebookToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "token"

    .prologue
    .line 1359
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "KEY_FACEBOOK_TOKEN"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1360
    return-void
.end method

.method public static startTwitterAuthWithFinish(Lcom/twitter/android/sdk/Twitter;Landroid/app/Activity;)V
    .locals 4
    .parameter "twitter"
    .parameter "activity"

    .prologue
    const/4 v3, 0x2

    .line 1381
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p0, p1, v1}, Lcom/twitter/android/sdk/Twitter;->startAuthActivityForResult(Landroid/app/Activity;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1383
    invoke-static {p1}, Lco/vine/android/LoginTwitterActivity;->getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p1, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1390
    :cond_0
    :goto_0
    return-void

    .line 1386
    :catch_0
    move-exception v0

    .line 1387
    .local v0, e:Ljava/lang/SecurityException;
    invoke-static {p1}, Lco/vine/android/LoginTwitterActivity;->getIntentWithFinish(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p1, v1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method


# virtual methods
.method public acceptFollowRequest(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 3
    .parameter "session"
    .parameter "userId"

    .prologue
    .line 1473
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1474
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1475
    const-string v1, "accept"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1476
    const/16 v1, 0x32

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public acceptRejectRequest(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 3
    .parameter "session"
    .parameter "userId"

    .prologue
    .line 1481
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1482
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1483
    const-string v1, "accept"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1484
    const/16 v1, 0x32

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public addListener(Lco/vine/android/client/AppSessionListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 1651
    iget-object v0, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1655
    :goto_0
    return-void

    .line 1654
    :cond_0
    iget-object v0, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public attemptCancelVideoFetchRequest(Lco/vine/android/util/video/VideoKey;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 928
    iget-object v0, p0, Lco/vine/android/client/AppController;->mVideoCache:Lco/vine/android/util/video/VideoCache;

    invoke-virtual {v0, p1}, Lco/vine/android/util/video/VideoCache;->cancel(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public blockUser(J)Ljava/lang/String;
    .locals 4
    .parameter "userToBlock"

    .prologue
    .line 1841
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1842
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1843
    const-string v1, "block_user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1844
    const/16 v1, 0x2f

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public call(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V
    .locals 4
    .parameter "session"
    .parameter "state"
    .parameter "exception"

    .prologue
    .line 266
    const-string v2, "Session state has changed: {}."

    invoke-virtual {p1}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/SessionState;->name()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 267
    iget-object v1, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 268
    .local v1, listeners:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/client/AppSessionListener;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 269
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v2, p1, p2, p3}, Lco/vine/android/client/AppSessionListener;->onFacebookSessionChanged(Lcom/facebook/Session;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 268
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 271
    :cond_0
    return-void
.end method

.method public clearDbAll()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1702
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1703
    .local v0, bundle:Landroid/os/Bundle;
    const/16 v1, 0x3b

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public clearDbCache(Z)Ljava/lang/String;
    .locals 2
    .parameter "notify"

    .prologue
    .line 1688
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1689
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "notify"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1690
    const/16 v1, 0x3a

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public clearFacebookToken()V
    .locals 2

    .prologue
    .line 1363
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 1364
    .local v0, fbSession:Lcom/facebook/Session;
    if-nez v0, :cond_0

    .line 1365
    iget-object v1, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/Session;->openActiveSessionFromCache(Landroid/content/Context;)Lcom/facebook/Session;

    move-result-object v0

    .line 1367
    :cond_0
    if-eqz v0, :cond_1

    .line 1368
    invoke-virtual {v0}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 1370
    :cond_1
    return-void
.end method

.method public clearFileCache()V
    .locals 1

    .prologue
    .line 1680
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/client/AppController;->clearFileCache(Landroid/content/Context;)V

    .line 1681
    return-void
.end method

.method public clearGcmRegId(Ljava/lang/String;JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "regId"
    .parameter "userId"
    .parameter "key"

    .prologue
    .line 1342
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1343
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "gcmRegId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1344
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1345
    const-string v1, "s_key"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1346
    const/16 v1, 0x3d

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public clearPushNotifications()V
    .locals 2

    .prologue
    .line 1350
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1351
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x3e

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 1352
    return-void
.end method

.method public connectToFacebookInitialize(Landroid/support/v4/app/Fragment;)V
    .locals 6
    .parameter "fragment"

    .prologue
    .line 234
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    .line 235
    .local v0, context:Landroid/content/Context;
    new-instance v4, Lcom/facebook/Session$Builder;

    invoke-direct {v4, v0}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0e00ae

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v4

    new-instance v5, Lcom/facebook/SharedPreferencesTokenCachingStrategy;

    invoke-direct {v5, v0}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setTokenCachingStrategy(Lcom/facebook/TokenCachingStrategy;)Lcom/facebook/Session$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v3

    .line 237
    .local v3, session:Lcom/facebook/Session;
    invoke-static {v3}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 238
    invoke-virtual {v3}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-nez v4, :cond_0

    .line 239
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .local v2, permissions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v4, "basic_info"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    new-instance v1, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v1, p1}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    .line 242
    .local v1, openRequest:Lcom/facebook/Session$OpenRequest;
    invoke-virtual {v1, v2}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    .line 243
    sget-object v4, Lcom/facebook/SessionLoginBehavior;->SSO_WITH_FALLBACK:Lcom/facebook/SessionLoginBehavior;

    invoke-virtual {v1, v4}, Lcom/facebook/Session$OpenRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$OpenRequest;

    .line 244
    invoke-virtual {v3, v1}, Lcom/facebook/Session;->openForRead(Lcom/facebook/Session$OpenRequest;)V

    .line 246
    .end local v1           #openRequest:Lcom/facebook/Session$OpenRequest;
    .end local v2           #permissions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public connectToFacebookPublish(Landroid/support/v4/app/Fragment;)V
    .locals 6
    .parameter "fragment"

    .prologue
    .line 249
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    .line 250
    .local v0, context:Landroid/content/Context;
    new-instance v4, Lcom/facebook/Session$Builder;

    invoke-direct {v4, v0}, Lcom/facebook/Session$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0e00ae

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setApplicationId(Ljava/lang/String;)Lcom/facebook/Session$Builder;

    move-result-object v4

    new-instance v5, Lcom/facebook/SharedPreferencesTokenCachingStrategy;

    invoke-direct {v5, v0}, Lcom/facebook/SharedPreferencesTokenCachingStrategy;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v5}, Lcom/facebook/Session$Builder;->setTokenCachingStrategy(Lcom/facebook/TokenCachingStrategy;)Lcom/facebook/Session$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/Session$Builder;->build()Lcom/facebook/Session;

    move-result-object v3

    .line 252
    .local v3, session:Lcom/facebook/Session;
    invoke-static {v3}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 253
    invoke-virtual {v3}, Lcom/facebook/Session;->isOpened()Z

    move-result v4

    if-nez v4, :cond_0

    .line 254
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 255
    .local v2, permissions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v4, "publish_actions"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    new-instance v1, Lcom/facebook/Session$OpenRequest;

    invoke-direct {v1, p1}, Lcom/facebook/Session$OpenRequest;-><init>(Landroid/support/v4/app/Fragment;)V

    .line 257
    .local v1, openRequest:Lcom/facebook/Session$OpenRequest;
    sget-object v4, Lcom/facebook/SessionDefaultAudience;->FRIENDS:Lcom/facebook/SessionDefaultAudience;

    invoke-virtual {v1, v4}, Lcom/facebook/Session$OpenRequest;->setDefaultAudience(Lcom/facebook/SessionDefaultAudience;)Lcom/facebook/Session$OpenRequest;

    .line 258
    invoke-virtual {v1, v2}, Lcom/facebook/Session$OpenRequest;->setPermissions(Ljava/util/List;)Lcom/facebook/Session$OpenRequest;

    .line 259
    sget-object v4, Lcom/facebook/SessionLoginBehavior;->SSO_WITH_FALLBACK:Lcom/facebook/SessionLoginBehavior;

    invoke-virtual {v1, v4}, Lcom/facebook/Session$OpenRequest;->setLoginBehavior(Lcom/facebook/SessionLoginBehavior;)Lcom/facebook/Session$OpenRequest;

    .line 260
    invoke-virtual {v3, v1}, Lcom/facebook/Session;->openForPublish(Lcom/facebook/Session$OpenRequest;)V

    .line 262
    .end local v1           #openRequest:Lcom/facebook/Session$OpenRequest;
    .end local v2           #permissions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public connectTwitter(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "userId"

    .prologue
    .line 1444
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1445
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "username"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1446
    const-string v1, "key"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    const-string v1, "secret"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1448
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1449
    const/16 v1, 0x20

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public deactivateAccount()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1715
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1716
    .local v0, bundle:Landroid/os/Bundle;
    const/16 v1, 0x43

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public deleteComment(JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "postId"
    .parameter "commentId"

    .prologue
    .line 1310
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1311
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1312
    const-string v1, "comment_id"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1313
    const/16 v1, 0x1e

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public deletePost(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "postId"

    .prologue
    .line 1323
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1324
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1325
    const/16 v1, 0x1f

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public deleteSession(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 1373
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1374
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "s_key"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1375
    const/16 v1, 0x40

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public determineCleanup(Lco/vine/android/client/Session;)V
    .locals 11
    .parameter "session"

    .prologue
    const-wide/16 v9, 0x0

    .line 1595
    iget-object v7, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    const-string v8, "last_cleanup"

    invoke-static {v7, v8}, Lco/vine/android/util/Util;->getSharedPrefs(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 1596
    .local v6, prefs:Landroid/content/SharedPreferences;
    const-string v7, "last_cleanup"

    invoke-interface {v6, v7, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 1597
    .local v4, lastCleanupTime:J
    cmp-long v7, v4, v9

    if-lez v7, :cond_1

    .line 1598
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v4

    const-wide/32 v9, 0x36ee80

    cmp-long v7, v7, v9

    if-lez v7, :cond_0

    .line 1599
    new-instance v3, Landroid/os/Handler;

    iget-object v7, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v7

    invoke-direct {v3, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1600
    .local v3, h:Landroid/os/Handler;
    invoke-direct {p0, p1, v4, v5}, Lco/vine/android/client/AppController;->performCleanup(Lco/vine/android/client/Session;J)Ljava/lang/String;

    .line 1610
    .end local v3           #h:Landroid/os/Handler;
    :cond_0
    :goto_0
    return-void

    .line 1605
    :cond_1
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1606
    .local v2, editor:Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1607
    .local v0, cleanupTime:J
    const-string v7, "last_cleanup"

    invoke-interface {v2, v7, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1608
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public determineServerStatus()V
    .locals 13

    .prologue
    const-wide/32 v7, 0x36ee80

    const-wide/16 v11, 0x0

    .line 1510
    iget-object v9, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 1511
    .local v4, prefs:Landroid/content/SharedPreferences;
    const-string v9, "server_upload_last_refresh"

    invoke-interface {v4, v9, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 1512
    .local v2, lastRefresh:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v0, v9, v2

    .line 1513
    .local v0, elapsedTime:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long v5, v9, v0

    .line 1514
    .local v5, remainingTime:J
    cmp-long v9, v2, v11

    if-lez v9, :cond_0

    cmp-long v9, v0, v7

    if-lez v9, :cond_2

    .line 1515
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->fetchServerStatus()Ljava/lang/String;

    .line 1516
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "server_upload_last_refresh"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-interface {v9, v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1518
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    if-eqz v9, :cond_1

    .line 1519
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lco/vine/android/client/AppController;->mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1520
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lco/vine/android/client/AppController;->mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

    invoke-virtual {v9, v10, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1529
    .end local v5           #remainingTime:J
    :cond_1
    :goto_0
    return-void

    .line 1523
    .restart local v5       #remainingTime:J
    :cond_2
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    if-eqz v9, :cond_1

    .line 1524
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lco/vine/android/client/AppController;->mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1525
    iget-object v9, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lco/vine/android/client/AppController;->mServerStatusRunnable:Lco/vine/android/client/AppController$ServerStatusRunnable;

    cmp-long v11, v5, v11

    if-lez v11, :cond_3

    .end local v5           #remainingTime:J
    :goto_1
    invoke-virtual {v9, v10, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .restart local v5       #remainingTime:J
    :cond_3
    move-wide v5, v7

    goto :goto_1
.end method

.method public disableReposts(J)Ljava/lang/String;
    .locals 2
    .parameter "userId"

    .prologue
    .line 1867
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1868
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1869
    const/16 v1, 0x45

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public disconnectTwitter(Lco/vine/android/client/Session;)Ljava/lang/String;
    .locals 2
    .parameter "session"

    .prologue
    .line 1468
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1469
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x21

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public enableReposts(J)Ljava/lang/String;
    .locals 2
    .parameter "userId"

    .prologue
    .line 1861
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1862
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1863
    const/16 v1, 0x44

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public expireTimeline(ZILjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "fetchPosts"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 1707
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1708
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "also_fetch_posts"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1709
    const-string v1, "type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1710
    const-string v1, "tag_name"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1711
    const/16 v1, 0x2d

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public failRequest(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 6
    .parameter "requestId"
    .parameter "actionCode"
    .parameter "b"

    .prologue
    .line 1893
    const-string v0, "rid"

    invoke-virtual {p3, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1894
    const/16 v3, 0x1c7

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/client/AppController;->notifyListeners(Ljava/lang/String;IILjava/lang/String;Landroid/os/Bundle;)V

    .line 1895
    return-void
.end method

.method public fetchActivity(Lco/vine/android/client/Session;IZZ)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "pageType"
    .parameter "followRequests"
    .parameter "clearPendingCount"

    .prologue
    .line 1070
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1071
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1072
    const-string v1, "follow_reqs"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1073
    const-string v1, "clear"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1074
    const/16 v1, 0x14

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchAddressFriends(Lco/vine/android/client/Session;)Ljava/lang/String;
    .locals 2
    .parameter "session"

    .prologue
    .line 1432
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1433
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x10

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchChannels(I)Ljava/lang/String;
    .locals 2
    .parameter "pageType"

    .prologue
    .line 1720
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1721
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1722
    const/16 v1, 0x35

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchComments(JII)Ljava/lang/String;
    .locals 2
    .parameter "postId"
    .parameter "pageType"
    .parameter "size"

    .prologue
    .line 1285
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1286
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1287
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1288
    const-string v1, "size"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1289
    const/16 v1, 0xc

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchFollowers(JI)Ljava/lang/String;
    .locals 2
    .parameter "userId"
    .parameter "pageType"

    .prologue
    .line 1028
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1029
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "profile_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1030
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1031
    const/16 v1, 0x16

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchFollowing(JI)Ljava/lang/String;
    .locals 2
    .parameter "userId"
    .parameter "pageType"

    .prologue
    .line 1035
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1036
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "profile_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1037
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1038
    const/16 v1, 0x17

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchFriends(J)Ljava/lang/String;
    .locals 2
    .parameter "userId"

    .prologue
    const/4 v1, 0x1

    .line 1042
    const/4 v0, 0x1

    .line 1043
    .local v0, pageType:I
    invoke-virtual {p0, p1, p2, v1}, Lco/vine/android/client/AppController;->fetchFollowers(JI)Ljava/lang/String;

    .line 1044
    invoke-virtual {p0, p1, p2, v1}, Lco/vine/android/client/AppController;->fetchFollowing(JI)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchPendingNotificationCount(Lco/vine/android/client/Session;)Ljava/lang/String;
    .locals 2
    .parameter "session"

    .prologue
    .line 1873
    const/16 v0, 0x41

    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public fetchPost(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "postId"

    .prologue
    .line 1273
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1274
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1275
    const/16 v1, 0x1c

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchPostId(Lco/vine/android/client/Session;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "shareId"

    .prologue
    .line 1279
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1280
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_share_id"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1281
    const/16 v1, 0x24

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchPostLikers(Lco/vine/android/client/Session;JI)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "postId"
    .parameter "pageType"

    .prologue
    .line 1055
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1056
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1057
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1058
    const/16 v1, 0xb

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "size"
    .parameter "userId"
    .parameter "type"
    .parameter "pageType"
    .parameter "userInitiated"
    .parameter "tag"
    .parameter "sort"
    .parameter "data"

    .prologue
    .line 1260
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1261
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "size"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1262
    const-string v1, "type"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1263
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1264
    const-string v1, "profile_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1265
    const-string v1, "user_init"

    invoke-virtual {v0, v1, p7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1266
    if-eqz p8, :cond_0

    const-string v1, "tag_name"

    invoke-virtual {v0, v1, p8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1267
    :cond_0
    if-eqz p9, :cond_1

    const-string v1, "sort"

    invoke-virtual {v0, v1, p9}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1268
    :cond_1
    const-string v1, "data"

    invoke-virtual {v0, v1, p10}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1269
    const/16 v1, 0xd

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchReviners(Lco/vine/android/client/Session;JI)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "postId"
    .parameter "pageType"

    .prologue
    .line 1062
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1063
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1064
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1065
    const/16 v1, 0x38

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchServerStatus()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1145
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1146
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x26

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchTagTypeahead(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "query"

    .prologue
    .line 1815
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1816
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "q"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1817
    const/16 v1, 0x28

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchTwitterFriends(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "key"
    .parameter "secret"

    .prologue
    .line 1425
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1426
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "key"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1427
    const-string v1, "secret"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1428
    const/16 v1, 0xf

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchTwitterUser(Lco/vine/android/api/VineLogin;)Ljava/lang/String;
    .locals 2
    .parameter "mLogin"

    .prologue
    .line 1243
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1244
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "login"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1245
    const/4 v1, 0x7

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchUser(J)Ljava/lang/String;
    .locals 2
    .parameter "userId"

    .prologue
    .line 1022
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1023
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1024
    const/16 v1, 0x15

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchUserId(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1883
    .local p1, vanityUrlSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1884
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "vanity_url"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1885
    const/16 v1, 0x4b

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchUserTypeahead(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "query"

    .prologue
    .line 1809
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1810
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "q"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1811
    const/16 v1, 0x27

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public fetchUsersMe(J)Ljava/lang/String;
    .locals 2
    .parameter "userId"

    .prologue
    .line 1002
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1003
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "s_owner_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1004
    const/16 v1, 0xa

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public followEditorsPicks(Z)V
    .locals 4
    .parameter "shouldFollow"

    .prologue
    .line 1398
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    .line 1399
    .local v2, session:Lco/vine/android/client/Session;
    invoke-direct {p0, v2}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1400
    .local v0, bundle:Landroid/os/Bundle;
    if-eqz p1, :cond_0

    const/4 v1, 0x1

    .line 1401
    .local v1, follow:I
    :goto_0
    const-string v3, "should_follow_editors_picks"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1402
    const/16 v3, 0x2c

    invoke-direct {p0, v3, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 1403
    return-void

    .line 1400
    .end local v1           #follow:I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public followUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "userIdToFollow"
    .parameter "notify"

    .prologue
    .line 1078
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1079
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "follow_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1080
    const-string v1, "notify"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1081
    const/16 v1, 0x12

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public generateReqIdForCanceledCaptcha()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1889
    iget-object v0, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    invoke-virtual {v0}, Lco/vine/android/client/AppController$VineServiceConnection;->generateRequestId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getActiveId()J
    .locals 2

    .prologue
    .line 1158
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getActiveSession()Lco/vine/android/client/Session;
    .locals 1

    .prologue
    .line 1150
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/client/AppController;->getActiveSession(Z)Lco/vine/android/client/Session;

    move-result-object v0

    return-object v0
.end method

.method public getActiveSessionReadOnly()Lco/vine/android/client/Session;
    .locals 1

    .prologue
    .line 1154
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/client/AppController;->getActiveSession(Z)Lco/vine/android/client/Session;

    move-result-object v0

    return-object v0
.end method

.method public getBlockedUsers()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1835
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1836
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1837
    const/16 v1, 0x2e

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEditions()V
    .locals 2

    .prologue
    .line 1559
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1560
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x46

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 1561
    return-void
.end method

.method public getLoginStatus()Lco/vine/android/client/Session$LoginStatus;
    .locals 1

    .prologue
    .line 1633
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getLoginStatus()Lco/vine/android/client/Session$LoginStatus;

    move-result-object v0

    return-object v0
.end method

.method public getPendingFacebookToken()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1355
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "KEY_FACEBOOK_TOKEN"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "key"

    .prologue
    .line 908
    iget-object v0, p0, Lco/vine/android/client/AppController;->mPhotoImagesCache:Lco/vine/android/util/image/PhotoImagesCache;

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2, p1}, Lco/vine/android/util/image/PhotoImagesCache;->getBitmap(JLco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getSession(Ljava/lang/String;)Lco/vine/android/client/Session;
    .locals 1
    .parameter "accountName"

    .prologue
    .line 1173
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lco/vine/android/client/VineAccountHelper;->getSession(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/client/Session;

    move-result-object v0

    return-object v0
.end method

.method public getTwitter()Lcom/twitter/android/sdk/Twitter;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lco/vine/android/client/AppController;->mTwitter:Lcom/twitter/android/sdk/Twitter;

    return-object v0
.end method

.method public getTwitterAuth(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "callback"
    .parameter "key"
    .parameter "secret"

    .prologue
    .line 1229
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1230
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "uri"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1231
    const-string v1, "key"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1232
    const-string v1, "secret"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1233
    const/4 v1, 0x5

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getTypeaheadFetchThreshold(Ljava/lang/String;)I
    .locals 1
    .parameter "type"

    .prologue
    .line 1801
    const-string v0, "tag"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1802
    const/4 v0, 0x3

    .line 1804
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public getTypeaheadMaxCompose()I
    .locals 1

    .prologue
    .line 1797
    const/16 v0, 0x32

    return v0
.end method

.method public getTypeaheadThrottle()J
    .locals 2

    .prologue
    .line 1793
    const-wide/16 v0, 0x12c

    return-wide v0
.end method

.method public getValidFacebookSession(Landroid/app/Activity;Z)Lcom/facebook/Session;
    .locals 6
    .parameter "activity"
    .parameter "closeAfterwards"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 199
    invoke-static {}, Lcom/facebook/Session;->getActiveSession()Lcom/facebook/Session;

    move-result-object v0

    .line 200
    .local v0, session:Lcom/facebook/Session;
    if-eqz v0, :cond_3

    const/4 v2, 0x1

    .line 201
    .local v2, wasOpen:Z
    :goto_0
    if-nez v2, :cond_0

    .line 202
    invoke-static {p1, v4, p0}, Lcom/facebook/Session;->openActiveSession(Landroid/app/Activity;ZLcom/facebook/Session$StatusCallback;)Lcom/facebook/Session;

    move-result-object v0

    .line 204
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/facebook/SessionState;->isClosed()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 205
    :cond_1
    const-string v4, "There were no Facebook session."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    move-object v0, v3

    .line 228
    .end local v0           #session:Lcom/facebook/Session;
    :cond_2
    :goto_1
    return-object v0

    .end local v2           #wasOpen:Z
    .restart local v0       #session:Lcom/facebook/Session;
    :cond_3
    move v2, v4

    .line 200
    goto :goto_0

    .line 208
    .restart local v2       #wasOpen:Z
    :cond_4
    invoke-static {v0}, Lcom/facebook/Session;->setActiveSession(Lcom/facebook/Session;)V

    .line 209
    invoke-virtual {v0}, Lcom/facebook/Session;->getState()Lcom/facebook/SessionState;

    move-result-object v1

    .line 210
    .local v1, state:Lcom/facebook/SessionState;
    const-string v4, "Old Facebook Session state : {}"

    invoke-static {v4, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    sget-object v4, Lcom/facebook/SessionState;->CREATED_TOKEN_LOADED:Lcom/facebook/SessionState;

    if-eq v1, v4, :cond_5

    invoke-virtual {v1}, Lcom/facebook/SessionState;->isOpened()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 213
    :cond_5
    const-string v4, "State is created or opened."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 214
    invoke-virtual {v0}, Lcom/facebook/Session;->getPermissions()Ljava/util/List;

    move-result-object v4

    const-string v5, "publish_actions"

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 215
    const-string v3, "Permission is good."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 216
    if-nez v2, :cond_2

    if-eqz p2, :cond_2

    .line 217
    invoke-virtual {v0}, Lcom/facebook/Session;->close()V

    goto :goto_1

    .line 221
    :cond_6
    invoke-virtual {v0}, Lcom/facebook/Session;->closeAndClearTokenInformation()V

    .line 222
    const-string v4, "Permission missing."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    move-object v0, v3

    .line 223
    goto :goto_1

    .line 226
    :cond_7
    invoke-virtual {v0}, Lcom/facebook/Session;->close()V

    .line 227
    const-string v4, "Session state is invalid."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    move-object v0, v3

    .line 228
    goto :goto_1
.end method

.method public getVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;
    .locals 4
    .parameter "key"

    .prologue
    .line 912
    iget-object v0, p0, Lco/vine/android/client/AppController;->mVideoCache:Lco/vine/android/util/video/VideoCache;

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, p1, v3}, Lco/vine/android/util/video/VideoCache;->getFile(JLco/vine/android/util/video/VideoKey;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method handleServiceResponse(IILjava/lang/String;Landroid/os/Bundle;)V
    .locals 10
    .parameter "actionCode"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "b"

    .prologue
    .line 882
    const-string v0, "rid"

    invoke-virtual {p4, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 884
    .local v1, reqId:Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController$VineServiceConnection;->remove(Ljava/lang/String;)Lco/vine/android/service/PendingAction;

    move-result-object v6

    .line 886
    .local v6, action:Lco/vine/android/service/PendingAction;
    const-string v0, "logged_out"

    invoke-virtual {p4, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 887
    invoke-direct {p0}, Lco/vine/android/client/AppController;->onLogout()V

    .line 905
    :cond_0
    :goto_0
    return-void

    .line 891
    :cond_1
    const-string v0, "refresh_session"

    const/4 v2, 0x0

    invoke-virtual {p4, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 892
    const-string v0, "s_key"

    invoke-virtual {p4, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/client/AppController;->refreshSessionKey(Ljava/lang/String;)V

    .line 895
    :cond_2
    const-string v0, "captcha_url"

    invoke-virtual {p4, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 896
    .local v7, captchaUrl:Ljava/lang/String;
    const-string v0, "captcha_url"

    invoke-virtual {p4, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 897
    if-eqz v7, :cond_3

    .line 898
    iget-object v0, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/vine/android/client/AppSessionListener;

    .line 899
    .local v9, listener:Lco/vine/android/client/AppSessionListener;
    invoke-virtual {v9, v1, v7, v6}, Lco/vine/android/client/AppSessionListener;->onCaptchaRequired(Ljava/lang/String;Ljava/lang/String;Lco/vine/android/service/PendingAction;)V

    goto :goto_1

    .end local v8           #i$:Ljava/util/Iterator;
    .end local v9           #listener:Lco/vine/android/client/AppSessionListener;
    :cond_3
    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 904
    invoke-virtual/range {v0 .. v5}, Lco/vine/android/client/AppController;->notifyListeners(Ljava/lang/String;IILjava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public isConnectedToFacebook(Landroid/app/Activity;)Z
    .locals 2
    .parameter "activity"

    .prologue
    const/4 v0, 0x1

    .line 195
    invoke-virtual {p0, p1, v0}, Lco/vine/android/client/AppController;->getValidFacebookSession(Landroid/app/Activity;Z)Lcom/facebook/Session;

    move-result-object v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoggedIn()Z
    .locals 2

    .prologue
    .line 1643
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->isLoggedIn(Landroid/content/Context;Z)Z

    move-result v0

    return v0
.end method

.method public isLoggedInReadOnly()Z
    .locals 2

    .prologue
    .line 1647
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->isLoggedIn(Landroid/content/Context;Z)Z

    move-result v0

    return v0
.end method

.method public isPendingRequest(Ljava/lang/String;)Z
    .locals 1
    .parameter "reqId"

    .prologue
    .line 1168
    iget-object v0, p0, Lco/vine/android/client/AppController;->mServiceConnection:Lco/vine/android/client/AppController$VineServiceConnection;

    invoke-virtual {v0, p1}, Lco/vine/android/client/AppController$VineServiceConnection;->isPending(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public likePost(Ljava/lang/String;Lco/vine/android/client/Session;JJLjava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .parameter "source"
    .parameter "session"
    .parameter "postToLike"
    .parameter "meUserId"
    .parameter "meUsername"
    .parameter "notify"

    .prologue
    .line 1100
    invoke-direct {p0, p2}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1101
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1102
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1103
    const-string v1, "username"

    invoke-virtual {v0, v1, p7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1104
    const-string v1, "notify"

    invoke-virtual {v0, v1, p8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1105
    invoke-static {p3, p4, p1}, Lco/vine/android/util/FlurryUtils;->trackLikePost(JLjava/lang/String;)V

    .line 1106
    const/16 v1, 0x18

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public login(Lco/vine/android/client/Session;Lco/vine/android/api/VineLogin;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "login"
    .parameter "password"
    .parameter "reactivate"

    .prologue
    .line 1187
    sget-object v1, Lco/vine/android/client/Session$LoginStatus;->LOGGING_IN:Lco/vine/android/client/Session$LoginStatus;

    invoke-virtual {p1, v1}, Lco/vine/android/client/Session;->setLoginStatus(Lco/vine/android/client/Session$LoginStatus;)V

    .line 1188
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1189
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "login"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1190
    const-string v1, "pass"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1191
    const-string v1, "reactivate"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1192
    const/4 v1, 0x2

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public loginCheckTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JZ)Ljava/lang/String;
    .locals 2
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "twitterUserId"
    .parameter "reactivate"

    .prologue
    .line 1415
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1416
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "username"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1417
    const-string v1, "key"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1418
    const-string v1, "secret"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1419
    const-string v1, "t_id"

    invoke-virtual {v0, v1, p4, p5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1420
    const-string v1, "reactivate"

    invoke-virtual {v0, v1, p6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1421
    const/4 v1, 0x6

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public loginComplete(Lco/vine/android/client/Session;ILandroid/os/Bundle;)Lco/vine/android/api/VineLogin;
    .locals 8
    .parameter "session"
    .parameter "responseCode"
    .parameter "b"

    .prologue
    .line 989
    const-string v0, "login"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lco/vine/android/api/VineLogin;

    .line 990
    .local v7, vl:Lco/vine/android/api/VineLogin;
    if-eqz v7, :cond_0

    .line 991
    const-string v0, "a_name"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "pass"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "login"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lco/vine/android/api/VineLogin;

    const-string v0, "avatar_url"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->loginComplete(Lco/vine/android/client/Session;ILjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;)Lco/vine/android/api/VineLogin;

    move-result-object v0

    .line 997
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loginComplete(Lco/vine/android/client/Session;ILjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;)Lco/vine/android/api/VineLogin;
    .locals 7
    .parameter "session"
    .parameter "responseCode"
    .parameter "accountName"
    .parameter "password"
    .parameter "login"
    .parameter "avatarUrl"

    .prologue
    .line 933
    const/16 v0, 0xc8

    if-ne p2, v0, :cond_2

    .line 934
    sget-object v0, Lco/vine/android/client/Session$LoginStatus;->LOGGED_IN:Lco/vine/android/client/Session$LoginStatus;

    invoke-virtual {p1, v0}, Lco/vine/android/client/Session;->setLoginStatus(Lco/vine/android/client/Session$LoginStatus;)V

    .line 938
    iget v0, p5, Lco/vine/android/api/VineLogin;->loginType:I

    packed-switch v0, :pswitch_data_0

    .line 948
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v2, "Unsupported login type."

    invoke-direct {v0, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 940
    :pswitch_0
    move-object v1, p3

    .line 952
    .local v1, uniqueLogin:Ljava/lang/String;
    :goto_0
    iget-wide v2, p5, Lco/vine/android/api/VineLogin;->userId:J

    invoke-virtual {p1, v2, v3}, Lco/vine/android/client/Session;->setUserId(J)V

    .line 953
    invoke-virtual {p1, p3}, Lco/vine/android/client/Session;->setName(Ljava/lang/String;)V

    .line 954
    iget-object v0, p5, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lco/vine/android/client/Session;->setSessionKey(Ljava/lang/String;)V

    .line 955
    invoke-virtual {p1, v1}, Lco/vine/android/client/Session;->setLoginEmail(Ljava/lang/String;)V

    .line 956
    invoke-virtual {p1, p6}, Lco/vine/android/client/Session;->setAvatarUrl(Ljava/lang/String;)V

    .line 958
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    move-object v2, p5

    move-object v3, p4

    move-object v4, p6

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lco/vine/android/client/VineAccountHelper;->createAccount(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/accounts/Account;

    .line 960
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    iget-wide v2, p5, Lco/vine/android/api/VineLogin;->userId:J

    invoke-static {v0, v1, p3, v2, v3}, Lco/vine/android/provider/SettingsManager;->setCurrentAccount(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    .line 964
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "last_user_id"

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iget-wide v4, p5, Lco/vine/android/api/VineLogin;->userId:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_0

    .line 965
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->clearFacebookToken()V

    .line 966
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v0

    iget-object v2, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lco/vine/android/AppImpl;->getDiscardAllIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v6

    .line 967
    .local v6, i:Landroid/content/Intent;
    if-eqz v6, :cond_0

    .line 968
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v6}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 972
    .end local v6           #i:Landroid/content/Intent;
    :cond_0
    iget-object v0, p5, Lco/vine/android/api/VineLogin;->edition:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 973
    iget-object v0, p0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "settings_edition"

    iget-object v3, p5, Lco/vine/android/api/VineLogin;->edition:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 978
    :cond_1
    iget-wide v2, p5, Lco/vine/android/api/VineLogin;->userId:J

    invoke-virtual {p0, v2, v3}, Lco/vine/android/client/AppController;->fetchFriends(J)Ljava/lang/String;

    .line 984
    .end local v1           #uniqueLogin:Ljava/lang/String;
    .end local p5
    :goto_1
    return-object p5

    .line 944
    .restart local p5
    :pswitch_1
    iget-object v1, p5, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    .line 945
    .restart local v1       #uniqueLogin:Ljava/lang/String;
    goto :goto_0

    .line 984
    .end local v1           #uniqueLogin:Ljava/lang/String;
    :cond_2
    const/4 p5, 0x0

    goto :goto_1

    .line 938
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public loginWithxAuth(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "username"
    .parameter "password"

    .prologue
    .line 1249
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1250
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "username"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1251
    const-string v1, "pass"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1252
    const/16 v1, 0x8

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public logout(Lco/vine/android/client/Session;)Ljava/lang/String;
    .locals 2
    .parameter "session"

    .prologue
    .line 1202
    invoke-virtual {p1}, Lco/vine/android/client/Session;->getLoginStatus()Lco/vine/android/client/Session$LoginStatus;

    move-result-object v0

    sget-object v1, Lco/vine/android/client/Session$LoginStatus;->LOGGED_IN:Lco/vine/android/client/Session$LoginStatus;

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lco/vine/android/client/Session;->getLoginStatus()Lco/vine/android/client/Session$LoginStatus;

    move-result-object v0

    sget-object v1, Lco/vine/android/client/Session$LoginStatus;->LOGGING_IN:Lco/vine/android/client/Session$LoginStatus;

    if-ne v0, v1, :cond_1

    .line 1204
    :cond_0
    sget-object v0, Lco/vine/android/client/Session$LoginStatus;->LOGGING_OUT:Lco/vine/android/client/Session$LoginStatus;

    invoke-virtual {p1, v0}, Lco/vine/android/client/Session;->setLoginStatus(Lco/vine/android/client/Session$LoginStatus;)V

    .line 1205
    const/4 v0, 0x3

    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    .line 1208
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public mergeSinglePost(Landroid/os/Bundle;)V
    .locals 2
    .parameter "bundle"

    .prologue
    .line 1545
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->isLoggedInReadOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1546
    const/16 v0, 0x39

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lco/vine/android/client/AppController;->injectServiceBundle(Landroid/os/Bundle;Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 1548
    :cond_0
    return-void
.end method

.method notifyListeners(Ljava/lang/String;IILjava/lang/String;Landroid/os/Bundle;)V
    .locals 119
    .parameter "reqId"
    .parameter "actionCode"
    .parameter "statusCode"
    .parameter "reasonPhrase"
    .parameter "b"

    .prologue
    .line 313
    packed-switch p2, :pswitch_data_0

    .line 879
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 315
    :pswitch_1
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    move-object/from16 v0, p0

    move/from16 v1, p3

    move-object/from16 v2, p5

    invoke-virtual {v0, v5, v1, v2}, Lco/vine/android/client/AppController;->loginComplete(Lco/vine/android/client/Session;ILandroid/os/Bundle;)Lco/vine/android/api/VineLogin;

    move-result-object v10

    .line 316
    .local v10, vl:Lco/vine/android/api/VineLogin;
    const-string v5, "error_code"

    const/4 v6, -0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v9

    .line 318
    .local v9, errorCode:I
    new-instance v109, Landroid/content/Intent;

    const-string v5, "co.vine.android.session.login"

    move-object/from16 v0, v109

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 319
    .local v109, loginIntent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    move-object/from16 v0, v109

    invoke-virtual {v5, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 321
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .local v106, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 322
    .local v4, listener:Lco/vine/android/client/AppSessionListener;
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    move-object/from16 v6, p1

    move/from16 v7, p3

    move-object/from16 v8, p4

    invoke-virtual/range {v4 .. v10}, Lco/vine/android/client/AppSessionListener;->onLoginComplete(Lco/vine/android/client/Session;Ljava/lang/String;ILjava/lang/String;ILco/vine/android/api/VineLogin;)V

    goto :goto_1

    .line 328
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v9           #errorCode:I
    .end local v10           #vl:Lco/vine/android/api/VineLogin;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v109           #loginIntent:Landroid/content/Intent;
    :pswitch_2
    invoke-direct/range {p0 .. p0}, Lco/vine/android/client/AppController;->onLogout()V

    goto :goto_0

    .line 332
    :pswitch_3
    const-string v5, "login"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v15

    check-cast v15, Lco/vine/android/api/VineLogin;

    .line 333
    .local v15, login:Lco/vine/android/api/VineLogin;
    const-string v5, "pass"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 334
    .local v17, password:Ljava/lang/String;
    const-string v5, "a_name"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 335
    .local v16, accountName:Ljava/lang/String;
    const-string v5, "avatar_url"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 336
    .local v18, avatarUrl:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object v11, v4

    move-object/from16 v12, p1

    move/from16 v13, p3

    move-object/from16 v14, p4

    .line 337
    invoke-virtual/range {v11 .. v18}, Lco/vine/android/client/AppSessionListener;->onSignUpComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 340
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    :cond_1
    new-instance v109, Landroid/content/Intent;

    const-string v5, "co.vine.android.session.login"

    move-object/from16 v0, v109

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 341
    .restart local v109       #loginIntent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    move-object/from16 v0, v109

    invoke-virtual {v5, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 345
    .end local v15           #login:Lco/vine/android/api/VineLogin;
    .end local v16           #accountName:Ljava/lang/String;
    .end local v17           #password:Ljava/lang/String;
    .end local v18           #avatarUrl:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v109           #loginIntent:Landroid/content/Intent;
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 346
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    const-string v5, "load_url"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v5}, Lco/vine/android/client/AppSessionListener;->onGetTwitterAuthUrlComplete(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 352
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 353
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    const-string v5, "error_code"

    const/4 v6, -0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v23

    const-string v5, "a_exists"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v24

    const-string v5, "user"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v25

    check-cast v25, Lco/vine/android/api/VineUser;

    const-string v5, "login"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v26

    check-cast v26, Lco/vine/android/api/VineLogin;

    move-object/from16 v19, v4

    move-object/from16 v20, p1

    move/from16 v21, p3

    move-object/from16 v22, p4

    invoke-virtual/range {v19 .. v26}, Lco/vine/android/client/AppSessionListener;->onCheckTwitterComplete(Ljava/lang/String;ILjava/lang/String;IZLco/vine/android/api/VineUser;Lco/vine/android/api/VineLogin;)V

    goto :goto_4

    .line 360
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    :cond_2
    new-instance v109, Landroid/content/Intent;

    const-string v5, "co.vine.android.session.login"

    move-object/from16 v0, v109

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 361
    .restart local v109       #loginIntent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    move-object/from16 v0, v109

    invoke-virtual {v5, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 365
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v109           #loginIntent:Landroid/content/Intent;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_5
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 366
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    const-string v5, "t_user"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v23

    check-cast v23, Lco/vine/android/api/TwitterUser;

    const-string v5, "login"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v24

    check-cast v24, Lco/vine/android/api/VineLogin;

    move-object/from16 v19, v4

    move-object/from16 v20, p1

    move/from16 v21, p3

    move-object/from16 v22, p4

    invoke-virtual/range {v19 .. v24}, Lco/vine/android/client/AppSessionListener;->onGetTwitterUserComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/TwitterUser;Lco/vine/android/api/VineLogin;)V

    goto :goto_5

    .line 373
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_7
    const-string v5, "login"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Lco/vine/android/api/VineLogin;

    .line 374
    .restart local v10       #vl:Lco/vine/android/api/VineLogin;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 375
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2, v10}, Lco/vine/android/client/AppSessionListener;->onTwitterxAuthComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineLogin;)V

    goto :goto_6

    .line 380
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v10           #vl:Lco/vine/android/api/VineLogin;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 381
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onResetPasswordComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_7

    .line 388
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_9
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 389
    .local v24, count:I
    const-string v5, "next_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v26

    .line 390
    .local v26, nextPage:I
    const-string v5, "previous_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v27

    .line 391
    .local v27, previousPage:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_8
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 392
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v20

    const/16 v25, 0x0

    move-object/from16 v19, v4

    move-object/from16 v21, p1

    move/from16 v22, p3

    move-object/from16 v23, p4

    invoke-virtual/range {v19 .. v27}, Lco/vine/android/client/AppSessionListener;->onGetUsersComplete(Lco/vine/android/client/Session;Ljava/lang/String;ILjava/lang/String;ILjava/util/ArrayList;II)V

    goto :goto_8

    .line 398
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v26           #nextPage:I
    .end local v27           #previousPage:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_a
    const-string v5, "type"

    const/4 v6, -0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v32

    .line 399
    .local v32, type:I
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 400
    .restart local v24       #count:I
    const-string v5, "size"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v43

    .line 401
    .local v43, size:I
    const-string v5, "tag_name"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 402
    .local v36, tag:Ljava/lang/String;
    const-string v5, "page_type"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v37

    .line 403
    .local v37, pageType:I
    const-string v5, "next_page"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v38

    .line 404
    .local v38, next:I
    const-string v5, "previous_page"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v39

    .line 405
    .local v39, previous:I
    const-string v5, "time"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v40

    .line 406
    .local v40, anchor:J
    const-string v5, "title"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    .line 407
    .local v44, title:Ljava/lang/String;
    const-string v5, "user_init"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v42

    .line 408
    .local v42, userInitiated:Z
    const-string v5, "in_memory"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v34

    .line 410
    .local v34, memory:Z
    if-eqz v34, :cond_3

    .line 411
    const-string v5, "posts"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v35

    .line 415
    .local v35, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    :goto_9
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_a
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v28, v4

    move-object/from16 v29, p1

    move/from16 v30, p3

    move-object/from16 v31, p4

    move/from16 v33, v24

    .line 416
    invoke-virtual/range {v28 .. v44}, Lco/vine/android/client/AppSessionListener;->onGetTimeLineComplete(Ljava/lang/String;ILjava/lang/String;IIZLjava/util/ArrayList;Ljava/lang/String;IIIJZILjava/lang/String;)V

    goto :goto_a

    .line 413
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v35           #posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v106           #i$:Ljava/util/Iterator;
    :cond_3
    const/16 v35, 0x0

    .restart local v35       #posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    goto :goto_9

    .line 420
    .restart local v106       #i$:Ljava/util/Iterator;
    :cond_4
    const/16 v5, 0xc8

    move/from16 v0, p3

    if-ne v0, v5, :cond_0

    .line 421
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/client/AppController;->determineCleanup(Lco/vine/android/client/Session;)V

    goto/16 :goto_0

    .line 426
    .end local v24           #count:I
    .end local v32           #type:I
    .end local v34           #memory:Z
    .end local v35           #posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v36           #tag:Ljava/lang/String;
    .end local v37           #pageType:I
    .end local v38           #next:I
    .end local v39           #previous:I
    .end local v40           #anchor:J
    .end local v42           #userInitiated:Z
    .end local v43           #size:I
    .end local v44           #title:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_b
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_b
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 427
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v49

    const-string v5, "resp_code"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v51

    move-object/from16 v45, v4

    move-object/from16 v46, p1

    move/from16 v47, p3

    move-object/from16 v48, p4

    invoke-virtual/range {v45 .. v51}, Lco/vine/android/client/AppSessionListener;->onGetCommentsComplete(Ljava/lang/String;ILjava/lang/String;JI)V

    goto :goto_b

    .line 433
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_c
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v49

    .line 434
    .local v49, id:J
    const-string v5, "comment"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    .line 435
    .local v51, comment:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_c
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v45, v4

    move-object/from16 v46, p1

    move/from16 v47, p3

    move-object/from16 v48, p4

    .line 436
    invoke-virtual/range {v45 .. v51}, Lco/vine/android/client/AppSessionListener;->onPostCommentComplete(Ljava/lang/String;ILjava/lang/String;JLjava/lang/String;)V

    goto :goto_c

    .line 441
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v49           #id:J
    .end local v51           #comment:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_d
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 442
    .local v56, postId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_d
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 443
    invoke-virtual/range {v52 .. v57}, Lco/vine/android/client/AppSessionListener;->onReportPostComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_d

    .line 448
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v56           #postId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 449
    .local v111, prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 450
    .local v102, e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "profile_post_count"

    const/4 v6, 0x0

    move-object/from16 v0, v111

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v110

    .line 451
    .local v110, oldCount:I
    const-string v6, "profile_post_count"

    if-lez v110, :cond_5

    add-int/lit8 v5, v110, -0x1

    :goto_e
    move-object/from16 v0, v102

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 452
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 454
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_f
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 455
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onDeletePostComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_f

    .line 451
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :cond_5
    const/4 v5, 0x0

    goto :goto_e

    .line 460
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v110           #oldCount:I
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_f
    const-string v5, "user"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v64

    check-cast v64, Lco/vine/android/api/VineUser;

    .line 461
    .local v64, meUser:Lco/vine/android/api/VineUser;
    const-string v5, "s_owner_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v62

    .line 462
    .local v62, ownerId:J
    if-eqz v64, :cond_7

    .line 463
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 464
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 465
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "settings_profile_name"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 466
    const-string v5, "settings_profile_description"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 467
    const-string v5, "settings_profile_location"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 468
    const-string v5, "settings_profile_phone"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 469
    const-string v5, "settings_profile_email"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 470
    const-string v5, "settings_profile_avatar_url"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 471
    const-string v5, "profile_follow_count"

    move-object/from16 v0, v64

    iget v6, v0, Lco/vine/android/api/VineUser;->followingCount:I

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 472
    const-string v5, "profile_follower_count"

    move-object/from16 v0, v64

    iget v6, v0, Lco/vine/android/api/VineUser;->followerCount:I

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 473
    const-string v5, "profile_authored_post_count"

    move-object/from16 v0, v64

    iget v6, v0, Lco/vine/android/api/VineUser;->authoredPostCount:I

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 474
    const-string v5, "profile_post_count"

    move-object/from16 v0, v64

    iget v6, v0, Lco/vine/android/api/VineUser;->postCount:I

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 475
    const-string v5, "profile_like_count"

    move-object/from16 v0, v64

    iget v6, v0, Lco/vine/android/api/VineUser;->likeCount:I

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 476
    const-string v6, "settings_twitter_connected"

    move-object/from16 v0, v64

    iget v5, v0, Lco/vine/android/api/VineUser;->twitterConnected:I

    const/4 v7, 0x1

    if-ne v5, v7, :cond_8

    const/4 v5, 0x1

    :goto_10
    move-object/from16 v0, v102

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 477
    const-string v6, "settings_follow_editors_picks"

    move-object/from16 v0, v64

    iget v5, v0, Lco/vine/android/api/VineUser;->includePromoted:I

    const/4 v7, 0x1

    if-ne v5, v7, :cond_9

    const/4 v5, 0x1

    :goto_11
    move-object/from16 v0, v102

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 478
    const-string v5, "settings_private"

    invoke-virtual/range {v64 .. v64}, Lco/vine/android/api/VineUser;->isPrivate()Z

    move-result v6

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 479
    move-object/from16 v0, v64

    iget-object v5, v0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    if-eqz v5, :cond_6

    .line 480
    const-string v5, "settings_edition"

    move-object/from16 v0, v64

    iget-object v6, v0, Lco/vine/android/api/VineUser;->edition:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 482
    :cond_6
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 484
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :cond_7
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v58, v4

    move-object/from16 v59, p1

    move/from16 v60, p3

    move-object/from16 v61, p4

    .line 485
    invoke-virtual/range {v58 .. v64}, Lco/vine/android/client/AppSessionListener;->onGetUsersMeComplete(Ljava/lang/String;ILjava/lang/String;JLco/vine/android/api/VineUser;)V

    goto :goto_12

    .line 476
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    :cond_8
    const/4 v5, 0x0

    goto :goto_10

    .line 477
    :cond_9
    const/4 v5, 0x0

    goto :goto_11

    .line 490
    .end local v62           #ownerId:J
    .end local v64           #meUser:Lco/vine/android/api/VineUser;
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_10
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 491
    .restart local v24       #count:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_13
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 492
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v24

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onGetTwitterFriendsComplete(Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_13

    .line 497
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_11
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 498
    .restart local v24       #count:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_14
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 499
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v24

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onGetAddressFriendsComplete(Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_14

    .line 504
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_12
    const-string v5, "follow_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 506
    .local v68, userId:J
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v66

    const/16 v67, 0xa

    const/16 v70, 0x1

    const/16 v71, 0x1

    const/16 v72, 0x0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v73

    const/16 v74, 0x0

    const/16 v75, 0x0

    move-object/from16 v65, p0

    invoke-virtual/range {v65 .. v75}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    .line 511
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 512
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 513
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "profile_follow_count"

    const-string v6, "profile_follow_count"

    const/4 v7, 0x0

    move-object/from16 v0, v111

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 515
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 517
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_15
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v70, v4

    move-object/from16 v71, p1

    move/from16 v72, p3

    move-object/from16 v73, p4

    move-wide/from16 v74, v68

    .line 518
    invoke-virtual/range {v70 .. v75}, Lco/vine/android/client/AppSessionListener;->onFollowComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_15

    .line 523
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v68           #userId:J
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_13
    const-string v5, "follow_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 524
    .restart local v68       #userId:J
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v5

    move-object/from16 v0, p0

    move-wide/from16 v1, v68

    invoke-virtual {v0, v5, v1, v2}, Lco/vine/android/client/AppController;->removeFollowPosts(Lco/vine/android/client/Session;J)Ljava/lang/String;

    .line 527
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 528
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 529
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "profile_follow_count"

    const/4 v6, 0x0

    move-object/from16 v0, v111

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v110

    .line 530
    .restart local v110       #oldCount:I
    const-string v6, "profile_follow_count"

    if-lez v110, :cond_a

    add-int/lit8 v5, v110, -0x1

    :goto_16
    move-object/from16 v0, v102

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 532
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 534
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_17
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v70, v4

    move-object/from16 v71, p1

    move/from16 v72, p3

    move-object/from16 v73, p4

    move-wide/from16 v74, v68

    .line 535
    invoke-virtual/range {v70 .. v75}, Lco/vine/android/client/AppSessionListener;->onUnFollowComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_17

    .line 530
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :cond_a
    const/4 v5, 0x0

    goto :goto_16

    .line 540
    .end local v68           #userId:J
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v110           #oldCount:I
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_14
    const-string v5, "should_follow_editors_picks"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v113

    .line 541
    .local v113, shouldFollow:Z
    if-nez v113, :cond_b

    .line 543
    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v7

    invoke-virtual {v7}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6, v7}, Lco/vine/android/client/AppController;->expireTimeline(ZILjava/lang/String;)Ljava/lang/String;

    .line 550
    :goto_18
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_19
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 551
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v113

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onUpdateFollowEditorsPicksComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_19

    .line 546
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v71

    const/16 v72, 0xa

    const-wide/16 v73, 0x0

    const/16 v75, 0x1

    const/16 v76, 0x1

    const/16 v77, 0x1

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v78

    const/16 v79, 0x0

    const/16 v80, 0x0

    move-object/from16 v70, p0

    invoke-virtual/range {v70 .. v80}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    goto :goto_18

    .line 557
    .end local v113           #shouldFollow:Z
    :pswitch_15
    const-string v5, "count"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 558
    .restart local v24       #count:I
    const-string v5, "follow_reqs_c"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v25

    .line 559
    .local v25, followRequestCount:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1a
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v20, v4

    move-object/from16 v21, p1

    move/from16 v22, p3

    move-object/from16 v23, p4

    .line 560
    invoke-virtual/range {v20 .. v25}, Lco/vine/android/client/AppSessionListener;->onGetActivityComplete(Ljava/lang/String;ILjava/lang/String;II)V

    goto :goto_1a

    .line 566
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v25           #followRequestCount:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_16
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1b
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 567
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lco/vine/android/client/AppSessionListener;->onRemoveUsersComplete(Ljava/lang/String;)V

    goto :goto_1b

    .line 572
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_17
    const-string v5, "user"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v116

    check-cast v116, Lco/vine/android/api/VineUser;

    .line 573
    .local v116, user:Lco/vine/android/api/VineUser;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1c
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 574
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v116

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onGetUserComplete(Ljava/lang/String;ILjava/lang/String;Lco/vine/android/api/VineUser;)V

    goto :goto_1c

    .line 579
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v116           #user:Lco/vine/android/api/VineUser;
    :pswitch_18
    const-string v5, "avatar_url"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 580
    .restart local v18       #avatarUrl:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1d
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 581
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v18

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onUpdateProfileComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 586
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v18           #avatarUrl:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_19
    const-string v5, "edition"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v103

    .line 587
    .local v103, edition:Ljava/lang/String;
    const-string v5, "Edition update success. New edition is {}"

    move-object/from16 v0, v103

    invoke-static {v5, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 588
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1e
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 589
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onUpdateEditionComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_1e

    .line 594
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v103           #edition:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_1a
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    const-string v6, "last_cleanup"

    invoke-static {v5, v6}, Lco/vine/android/util/Util;->getSharedPrefs(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 596
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v104

    .line 597
    .local v104, editor:Landroid/content/SharedPreferences$Editor;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v107

    .line 598
    .local v107, lastCleanupTime:J
    const-string v5, "last_cleanup"

    move-object/from16 v0, v104

    move-wide/from16 v1, v107

    invoke-interface {v0, v5, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 599
    invoke-interface/range {v104 .. v104}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 603
    .end local v104           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v107           #lastCleanupTime:J
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_1b
    const-string v5, "username"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v74

    .line 604
    .local v74, username:Ljava/lang/String;
    const-string v5, "key"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v75

    .line 605
    .local v75, token:Ljava/lang/String;
    const-string v5, "secret"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v76

    .line 606
    .local v76, secret:Ljava/lang/String;
    const-string v5, "user_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 607
    .restart local v68       #userId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_1f
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v70, v4

    move-object/from16 v71, p1

    move/from16 v72, p3

    move-object/from16 v73, p4

    move-wide/from16 v77, v68

    .line 608
    invoke-virtual/range {v70 .. v78}, Lco/vine/android/client/AppSessionListener;->onConnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    goto :goto_1f

    .line 614
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v68           #userId:J
    .end local v74           #username:Ljava/lang/String;
    .end local v75           #token:Ljava/lang/String;
    .end local v76           #secret:Ljava/lang/String;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_1c
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_20
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 615
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onDisconnectTwitterComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_20

    .line 620
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_1d
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 622
    .restart local v56       #postId:J
    const/16 v5, 0xc8

    move/from16 v0, p3

    if-ne v0, v5, :cond_c

    .line 624
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 625
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 626
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "profile_like_count"

    const-string v6, "profile_like_count"

    const/4 v7, 0x0

    move-object/from16 v0, v111

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 627
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 630
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :cond_c
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_21
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 631
    invoke-virtual/range {v52 .. v57}, Lco/vine/android/client/AppSessionListener;->onLikePost(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_21

    .line 636
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v56           #postId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_1e
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 638
    .restart local v56       #postId:J
    const/16 v5, 0xc8

    move/from16 v0, p3

    if-ne v0, v5, :cond_d

    .line 640
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 641
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 642
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "profile_like_count"

    const/4 v6, 0x0

    move-object/from16 v0, v111

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v110

    .line 643
    .restart local v110       #oldCount:I
    const-string v6, "profile_like_count"

    if-lez v110, :cond_e

    add-int/lit8 v5, v110, -0x1

    :goto_22
    move-object/from16 v0, v102

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 644
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 647
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v110           #oldCount:I
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :cond_d
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_23
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 648
    invoke-virtual/range {v52 .. v57}, Lco/vine/android/client/AppSessionListener;->onUnlikePost(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_23

    .line 643
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    .restart local v110       #oldCount:I
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    :cond_e
    const/4 v5, 0x0

    goto :goto_22

    .line 653
    .end local v56           #postId:J
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v110           #oldCount:I
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    :pswitch_1f
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 654
    .restart local v56       #postId:J
    const-string v5, "repost"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v58

    check-cast v58, Lco/vine/android/api/VineRepost;

    .line 656
    .local v58, repost:Lco/vine/android/api/VineRepost;
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_24
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 657
    invoke-virtual/range {v52 .. v58}, Lco/vine/android/client/AppSessionListener;->onRevine(Ljava/lang/String;ILjava/lang/String;JLco/vine/android/api/VineRepost;)V

    goto :goto_24

    .line 662
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v56           #postId:J
    .end local v58           #repost:Lco/vine/android/api/VineRepost;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_20
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 663
    .restart local v56       #postId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_25
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 664
    invoke-virtual/range {v52 .. v57}, Lco/vine/android/client/AppSessionListener;->onUnrevine(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_25

    .line 669
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v56           #postId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_21
    const-string v5, "post_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v56

    .line 670
    .restart local v56       #postId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_26
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v52, v4

    move-object/from16 v53, p1

    move/from16 v54, p3

    move-object/from16 v55, p4

    .line 671
    invoke-virtual/range {v52 .. v57}, Lco/vine/android/client/AppSessionListener;->onGetPostIdComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_26

    .line 676
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v56           #postId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_22
    const-string v5, "user_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 677
    .restart local v68       #userId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_27
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v77, v4

    move-object/from16 v78, p1

    move/from16 v79, p3

    move-object/from16 v80, p4

    move-wide/from16 v81, v68

    .line 678
    invoke-virtual/range {v77 .. v82}, Lco/vine/android/client/AppSessionListener;->onGetUserIdComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_27

    .line 683
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v68           #userId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_23
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_28
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 684
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onGetSinglePostComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_28

    .line 689
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_24
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_29
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 690
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onConnectFacebookComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_29

    .line 695
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_25
    const-string v5, "user_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 696
    .restart local v68       #userId:J
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2a
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v77, v4

    move-object/from16 v78, p1

    move/from16 v79, p3

    move-object/from16 v80, p4

    move-wide/from16 v81, v68

    .line 697
    invoke-virtual/range {v77 .. v82}, Lco/vine/android/client/AppSessionListener;->onGcmRegistrationComplete(Ljava/lang/String;ILjava/lang/String;J)V

    goto :goto_2a

    .line 703
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v68           #userId:J
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_26
    const-string v5, "s_key"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/client/AppController;->deleteSession(Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0

    .line 707
    :pswitch_27
    const-string v5, "server_status"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v114

    check-cast v114, Lco/vine/android/api/ServerStatus;

    .line 708
    .local v114, ss:Lco/vine/android/api/ServerStatus;
    const/16 v5, 0xc8

    move/from16 v0, p3

    if-ne v0, v5, :cond_0

    if-eqz v114, :cond_0

    move-object/from16 v0, v114

    iget-object v5, v0, Lco/vine/android/api/ServerStatus;->uploadType:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 709
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v111

    .line 710
    .restart local v111       #prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v111 .. v111}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v102

    .line 711
    .restart local v102       #e:Landroid/content/SharedPreferences$Editor;
    const-string v5, "server_upload_type"

    move-object/from16 v0, v114

    iget-object v6, v0, Lco/vine/android/api/ServerStatus;->uploadType:Ljava/lang/String;

    move-object/from16 v0, v102

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 712
    invoke-interface/range {v102 .. v102}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_0

    .line 717
    .end local v102           #e:Landroid/content/SharedPreferences$Editor;
    .end local v111           #prefs:Landroid/content/SharedPreferences;
    .end local v114           #ss:Lco/vine/android/api/ServerStatus;
    :pswitch_28
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 718
    .restart local v24       #count:I
    const-string v5, "next_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v26

    .line 719
    .restart local v26       #nextPage:I
    const-string v5, "previous_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v27

    .line 721
    .restart local v27       #previousPage:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2b
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v77, v4

    move-object/from16 v78, p1

    move/from16 v79, p3

    move-object/from16 v80, p4

    move/from16 v81, v24

    move/from16 v82, v26

    move/from16 v83, v27

    .line 722
    invoke-virtual/range {v77 .. v83}, Lco/vine/android/client/AppSessionListener;->onUserSearchComplete(Ljava/lang/String;ILjava/lang/String;III)V

    goto :goto_2b

    .line 728
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v26           #nextPage:I
    .end local v27           #previousPage:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_29
    const-string v5, "q"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v81

    .line 729
    .local v81, query:Ljava/lang/String;
    const-string v5, "users"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v82

    .line 730
    .local v82, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2c
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v77, v4

    move-object/from16 v78, p1

    move/from16 v79, p3

    move-object/from16 v80, p4

    .line 731
    invoke-virtual/range {v77 .. v82}, Lco/vine/android/client/AppSessionListener;->onGetUserTypeAheadComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2c

    .line 736
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v81           #query:Ljava/lang/String;
    .end local v82           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_2a
    const-string v5, "q"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v81

    .line 737
    .restart local v81       #query:Ljava/lang/String;
    const-string v5, "tags"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v88

    .line 738
    .local v88, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2d
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v83, v4

    move-object/from16 v84, p1

    move/from16 v85, p3

    move-object/from16 v86, p4

    move-object/from16 v87, v81

    .line 739
    invoke-virtual/range {v83 .. v88}, Lco/vine/android/client/AppSessionListener;->onGetTagTypeAheadComplete(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_2d

    .line 744
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v81           #query:Ljava/lang/String;
    .end local v88           #tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_2b
    const-string v5, "count"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v24

    .line 745
    .restart local v24       #count:I
    const-string v5, "next_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v26

    .line 746
    .restart local v26       #nextPage:I
    const-string v5, "previous_page"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v27

    .line 748
    .restart local v27       #previousPage:I
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2e
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v89, v4

    move-object/from16 v90, p1

    move/from16 v91, p3

    move-object/from16 v92, p4

    move/from16 v93, v24

    move/from16 v94, v26

    move/from16 v95, v27

    .line 749
    invoke-virtual/range {v89 .. v95}, Lco/vine/android/client/AppSessionListener;->onTagSearchComplete(Ljava/lang/String;ILjava/lang/String;III)V

    goto :goto_2e

    .line 755
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v26           #nextPage:I
    .end local v27           #previousPage:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_2c
    const-string v5, "type"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v32

    .line 756
    .restart local v32       #type:I
    const-string v5, "tag_name"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 757
    .restart local v36       #tag:Ljava/lang/String;
    const-string v5, "also_fetch_posts"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v100

    .line 759
    .local v100, alsoFetchPosts:Z
    if-eqz v100, :cond_0

    .line 760
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v90

    const/16 v91, 0xa

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v92

    const/16 v95, 0x1

    const/16 v96, 0x1

    const/16 v98, 0x0

    const/16 v99, 0x0

    move-object/from16 v89, p0

    move/from16 v94, v32

    move-object/from16 v97, v36

    invoke-virtual/range {v89 .. v99}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    goto/16 :goto_0

    .line 766
    .end local v32           #type:I
    .end local v36           #tag:Ljava/lang/String;
    .end local v100           #alsoFetchPosts:Z
    :pswitch_2d
    const-string v5, "response_success"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v115

    .line 767
    .local v115, success:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_2f
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 768
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v115

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onDeactivateAccountComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_2f

    .line 773
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v115           #success:Z
    :pswitch_2e
    const-string v5, "blocked_users"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v101

    .line 775
    .local v101, blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_30
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 776
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v101

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onGetBlockedUsersComplete(Ljava/lang/String;ILjava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_30

    .line 781
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v101           #blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_2f
    const-string v5, "response_success"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v117

    .line 782
    .local v117, userBlocked:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_31
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 783
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v117

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onBlockUserComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_31

    .line 788
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v117           #userBlocked:Z
    :pswitch_30
    const-string v5, "response_success"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v118

    .line 789
    .local v118, userUnblocked:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_32
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 790
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v118

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onUnblockUserComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_32

    .line 795
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v118           #userUnblocked:Z
    :pswitch_31
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_33
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 796
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onReportUserComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_33

    .line 801
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_32
    const-string v5, "response_success"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v115

    .line 802
    .restart local v115       #success:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_34
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 803
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v115

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onEnableUserRepostsComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_34

    .line 808
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v115           #success:Z
    :pswitch_33
    const-string v5, "response_success"

    const/4 v6, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v115

    .line 809
    .restart local v115       #success:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_35
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 810
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v115

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onDisableUserRepostsComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_35

    .line 815
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v115           #success:Z
    :pswitch_34
    const-string v5, "user_id"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v68

    .line 816
    .restart local v68       #userId:J
    const-string v5, "accept"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v93

    .line 817
    .local v93, accept:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_36
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v89, v4

    move-object/from16 v90, p1

    move/from16 v91, p3

    move-object/from16 v92, p4

    move-wide/from16 v94, v68

    .line 818
    invoke-virtual/range {v89 .. v95}, Lco/vine/android/client/AppSessionListener;->onRespondFollowRequestComplete(Ljava/lang/String;ILjava/lang/String;ZJ)V

    goto :goto_36

    .line 824
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v68           #userId:J
    .end local v93           #accept:Z
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_35
    const-string v5, "explicit"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v105

    .line 825
    .local v105, explicit:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_37
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 826
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v105

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onUpdateExplicitComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_37

    .line 831
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v105           #explicit:Z
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_36
    const-string v5, "priv"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v112

    .line 832
    .local v112, priv:Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_38
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 833
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v112

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onUpdatePrivateComplete(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_38

    .line 837
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    .end local v112           #priv:Z
    :cond_f
    :pswitch_37
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_39
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 838
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onGetChannelsComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_39

    .line 843
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_38
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_3a
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 844
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onSharePostComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_3a

    .line 849
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_39
    const-string v5, "count"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v24

    .line 850
    .restart local v24       #count:I
    const/16 v5, 0xc8

    move/from16 v0, p3

    if-ne v0, v5, :cond_10

    .line 851
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v6, "unread_notification_count"

    move/from16 v0, v24

    invoke-interface {v5, v6, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 854
    :cond_10
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_3b
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 855
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v3, v24

    invoke-virtual {v4, v0, v1, v2, v3}, Lco/vine/android/client/AppSessionListener;->onGetPendingNotificationCountComplete(Ljava/lang/String;ILjava/lang/String;I)V

    goto :goto_3b

    .line 861
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v24           #count:I
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_3a
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/client/AppController;->clearFileCache()V

    .line 862
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_3c
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 863
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lco/vine/android/client/AppSessionListener;->onClearCacheComplete(Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_3c

    .line 868
    .end local v4           #listener:Lco/vine/android/client/AppSessionListener;
    .end local v106           #i$:Ljava/util/Iterator;
    :pswitch_3b
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v106

    .restart local v106       #i$:Ljava/util/Iterator;
    :goto_3d
    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface/range {v106 .. v106}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/client/AppSessionListener;

    .line 869
    .restart local v4       #listener:Lco/vine/android/client/AppSessionListener;
    const-string v5, "editions"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    move/from16 v0, p3

    invoke-virtual {v4, v0, v5}, Lco/vine/android/client/AppSessionListener;->onGetEditionsComplete(ILjava/util/ArrayList;)V

    goto :goto_3d

    .line 313
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_f
        :pswitch_9
        :pswitch_b
        :pswitch_a
        :pswitch_c
        :pswitch_10
        :pswitch_11
        :pswitch_16
        :pswitch_12
        :pswitch_13
        :pswitch_15
        :pswitch_17
        :pswitch_9
        :pswitch_9
        :pswitch_1d
        :pswitch_1e
        :pswitch_18
        :pswitch_d
        :pswitch_23
        :pswitch_1a
        :pswitch_0
        :pswitch_e
        :pswitch_1b
        :pswitch_1c
        :pswitch_0
        :pswitch_0
        :pswitch_21
        :pswitch_24
        :pswitch_27
        :pswitch_29
        :pswitch_2a
        :pswitch_28
        :pswitch_2b
        :pswitch_0
        :pswitch_14
        :pswitch_2c
        :pswitch_2e
        :pswitch_2f
        :pswitch_30
        :pswitch_31
        :pswitch_34
        :pswitch_35
        :pswitch_36
        :pswitch_37
        :pswitch_1f
        :pswitch_20
        :pswitch_0
        :pswitch_0
        :pswitch_3a
        :pswitch_0
        :pswitch_25
        :pswitch_26
        :pswitch_0
        :pswitch_38
        :pswitch_0
        :pswitch_39
        :pswitch_0
        :pswitch_2d
        :pswitch_32
        :pswitch_33
        :pswitch_3b
        :pswitch_19
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_22
    .end packed-switch
.end method

.method public onLowMemory()V
    .locals 3

    .prologue
    .line 1564
    iget-object v2, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/client/AppSessionListener;

    .line 1565
    .local v1, listener:Lco/vine/android/client/AppSessionListener;
    invoke-virtual {v1}, Lco/vine/android/client/AppSessionListener;->onLowMemory()V

    goto :goto_0

    .line 1567
    .end local v1           #listener:Lco/vine/android/client/AppSessionListener;
    :cond_0
    return-void
.end method

.method public onPhotoImageError(Lco/vine/android/util/image/PhotoImagesCache;Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V
    .locals 3
    .parameter "cache"
    .parameter "key"
    .parameter "result"

    .prologue
    .line 1769
    iget-object v1, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 1770
    .local v1, listeners:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/client/AppSessionListener;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 1771
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v2, p2, p3}, Lco/vine/android/client/AppSessionListener;->onPhotoImageError(Lco/vine/android/util/image/ImageKey;Lco/vine/android/network/HttpResult;)V

    .line 1770
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1773
    :cond_0
    return-void
.end method

.method public onPhotoImageLoaded(Lco/vine/android/util/image/PhotoImagesCache;Ljava/util/HashMap;)V
    .locals 3
    .parameter "cache"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/util/image/PhotoImagesCache;",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1760
    .local p2, image:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    const-string v2, "Image has loaded."

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 1761
    iget-object v1, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 1762
    .local v1, listeners:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/client/AppSessionListener;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 1763
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v2, p2}, Lco/vine/android/client/AppSessionListener;->onPhotoImageLoaded(Ljava/util/HashMap;)V

    .line 1762
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1765
    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .parameter "level"

    .prologue
    .line 1570
    iget-object v2, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/client/AppSessionListener;

    .line 1571
    .local v1, listener:Lco/vine/android/client/AppSessionListener;
    invoke-virtual {v1, p1}, Lco/vine/android/client/AppSessionListener;->onTrimMemory(I)V

    goto :goto_0

    .line 1573
    .end local v1           #listener:Lco/vine/android/client/AppSessionListener;
    :cond_0
    return-void
.end method

.method public onVideoPathError(Lco/vine/android/util/video/VideoCache;Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V
    .locals 3
    .parameter "cache"
    .parameter "key"
    .parameter "result"

    .prologue
    .line 1786
    iget-object v1, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 1787
    .local v1, listeners:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/client/AppSessionListener;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 1788
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v2, p2, p3}, Lco/vine/android/client/AppSessionListener;->onVideoPathError(Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V

    .line 1787
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1790
    :cond_0
    return-void
.end method

.method public onVideoPathObtained(Lco/vine/android/util/video/VideoCache;Ljava/util/HashMap;)V
    .locals 3
    .parameter "cache"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/util/video/VideoCache;",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Lco/vine/android/util/video/UrlVideo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1778
    .local p2, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    iget-object v1, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    .line 1779
    .local v1, listeners:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/client/AppSessionListener;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 1780
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/client/AppSessionListener;

    invoke-virtual {v2, p2}, Lco/vine/android/client/AppSessionListener;->onVideoPathObtained(Ljava/util/HashMap;)V

    .line 1779
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1782
    :cond_0
    return-void
.end method

.method public peekVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;
    .locals 4
    .parameter "key"

    .prologue
    .line 916
    iget-object v0, p0, Lco/vine/android/client/AppController;->mVideoCache:Lco/vine/android/util/video/VideoCache;

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, p1, v3}, Lco/vine/android/util/video/VideoCache;->getFile(JLco/vine/android/util/video/VideoKey;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public postComment(JLco/vine/android/client/Session;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 4
    .parameter "postId"
    .parameter "session"
    .parameter "comment"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lco/vine/android/client/Session;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1299
    .local p5, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1300
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1301
    const-string v1, "user_id"

    invoke-virtual {p3}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1302
    const-string v1, "username"

    invoke-virtual {p3}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1303
    const-string v1, "comment"

    invoke-static {p4}, Lco/vine/android/util/Util;->cleanse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1304
    const-string v1, "avatar_url"

    invoke-virtual {p3}, Lco/vine/android/client/Session;->getAvatarUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1305
    const-string v1, "entities"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1306
    const/16 v1, 0xe

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public refreshSessionKey(Ljava/lang/String;)V
    .locals 1
    .parameter "newSessionKey"

    .prologue
    .line 1662
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    .line 1663
    .local v0, activeSession:Lco/vine/android/client/Session;
    if-eqz v0, :cond_0

    .line 1664
    invoke-virtual {v0, p1}, Lco/vine/android/client/Session;->setSessionKey(Ljava/lang/String;)V

    .line 1666
    :cond_0
    return-void
.end method

.method public removeFollowPosts(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "userId"

    .prologue
    .line 1139
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1140
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1141
    const/16 v1, 0x22

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public removeListener(Lco/vine/android/client/AppSessionListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 1658
    iget-object v0, p0, Lco/vine/android/client/AppController;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1659
    return-void
.end method

.method public removeUsers(Lco/vine/android/client/Session;I)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "type"

    .prologue
    .line 1437
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1438
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1439
    const/16 v1, 0x11

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public reportPerson(J)Ljava/lang/String;
    .locals 2
    .parameter "userToReport"

    .prologue
    .line 1855
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1856
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1857
    const/16 v1, 0x31

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public reportPost(Lco/vine/android/client/Session;J)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "postId"

    .prologue
    .line 1317
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1318
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1319
    const/16 v1, 0x1b

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public resetPassword(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "email"

    .prologue
    .line 1237
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1238
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "login"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1239
    const/16 v1, 0x9

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public retryRequest(ILandroid/os/Bundle;)Ljava/lang/String;
    .locals 1
    .parameter "actionCode"
    .parameter "b"

    .prologue
    .line 1878
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lco/vine/android/client/AppController;->injectServiceBundle(Landroid/os/Bundle;Lco/vine/android/client/Session;)Landroid/os/Bundle;

    .line 1879
    invoke-direct {p0, p1, p2}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public revine(Ljava/lang/String;Lco/vine/android/client/Session;JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "source"
    .parameter "session"
    .parameter "postToRevine"
    .parameter "meUsername"

    .prologue
    .line 1118
    invoke-direct {p0, p2}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1119
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1120
    const-string v1, "username"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1121
    invoke-static {p3, p4, p1}, Lco/vine/android/util/FlurryUtils;->trackRevine(JLjava/lang/String;)V

    .line 1122
    const/16 v1, 0x36

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public saveLoadedPosts(Ljava/util/ArrayList;ILjava/lang/String;IIIJZ)Ljava/lang/String;
    .locals 2
    .parameter
    .parameter "groupType"
    .parameter "tag"
    .parameter "pageType"
    .parameter "next"
    .parameter "previous"
    .parameter "anchor"
    .parameter "userInitiated"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;I",
            "Ljava/lang/String;",
            "IIIJZ)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1455
    .local p1, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1456
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "posts"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1457
    const-string v1, "type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1458
    const-string v1, "tag_name"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1459
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1460
    const-string v1, "next_page"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1461
    const-string v1, "previous_page"

    invoke-virtual {v0, v1, p6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1462
    const-string v1, "time"

    invoke-virtual {v0, v1, p7, p8}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1463
    const-string v1, "user_init"

    invoke-virtual {v0, v1, p9}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1464
    const/16 v1, 0x2b

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public scheduleLoopCounts()V
    .locals 4

    .prologue
    .line 1532
    iget-object v0, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 1533
    iget-object v0, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/client/AppController;->mLoopCountRunnable:Lco/vine/android/client/AppController$LoopCountRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1534
    iget-object v0, p0, Lco/vine/android/client/AppController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/client/AppController;->mLoopCountRunnable:Lco/vine/android/client/AppController$LoopCountRunnable;

    const-wide/32 v2, 0x493e0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1536
    :cond_0
    return-void
.end method

.method public searchTags(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .parameter "query"
    .parameter "pageType"

    .prologue
    .line 1828
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1829
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "q"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1830
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1831
    const/16 v1, 0x2a

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public searchUsers(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .parameter "query"
    .parameter "pageType"

    .prologue
    .line 1821
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1822
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "q"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1823
    const-string v1, "page_type"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1824
    const/16 v1, 0x29

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public sendFacebookToken()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1329
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1330
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "facebook_token"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getPendingFacebookToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1331
    const/16 v1, 0x25

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public sendGcmRegId(Ljava/lang/String;J)Ljava/lang/String;
    .locals 2
    .parameter "regId"
    .parameter "userId"

    .prologue
    .line 1335
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1336
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "gcmRegId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1337
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1338
    const/16 v1, 0x3c

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public sendLoopCounts()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1539
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->scheduleLoopCounts()V

    .line 1540
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1541
    .local v0, b:Landroid/os/Bundle;
    const/16 v1, 0x42

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public setHideProfileReposts(JZ)Ljava/lang/String;
    .locals 2
    .parameter "userId"
    .parameter "block"

    .prologue
    .line 1898
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1899
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1900
    const-string v1, "block_profile_reposts"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1901
    const/16 v1, 0x49

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public setSessionKey(Ljava/lang/String;)V
    .locals 1
    .parameter "key"

    .prologue
    .line 184
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->getCachedActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    .line 185
    .local v0, activeSession:Lco/vine/android/client/Session;
    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0, p1}, Lco/vine/android/client/Session;->setSessionKey(Ljava/lang/String;)V

    .line 188
    :cond_0
    return-void
.end method

.method public sharePost(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .parameter "network"
    .parameter "message"
    .parameter "postId"

    .prologue
    .line 1551
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1552
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "network"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1553
    const-string v1, "message"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1554
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1555
    const/16 v1, 0x3f

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    .line 1556
    return-void
.end method

.method public signUp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Lco/vine/android/api/TwitterUser;Lco/vine/android/api/VineLogin;)Ljava/lang/String;
    .locals 3
    .parameter "login"
    .parameter "password"
    .parameter "username"
    .parameter "phoneNumber"
    .parameter "profileUri"
    .parameter "twitterUser"
    .parameter "vl"

    .prologue
    .line 1214
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1215
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "login"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1216
    const-string v1, "pass"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1217
    const-string v1, "a_name"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1218
    const-string v1, "phone"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1219
    const-string v1, "uri"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1220
    const-string v1, "t_user"

    invoke-virtual {v0, v1, p6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1221
    if-eqz p7, :cond_0

    .line 1222
    const-string v1, "key"

    iget-object v2, p7, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1223
    const-string v1, "secret"

    iget-object v2, p7, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1225
    :cond_0
    const/4 v1, 0x4

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unRevine(Ljava/lang/String;Lco/vine/android/client/Session;JJZJZ)Ljava/lang/String;
    .locals 2
    .parameter "source"
    .parameter "session"
    .parameter "postToUnrevine"
    .parameter "repostId"
    .parameter "following"
    .parameter "userId"
    .parameter "notify"

    .prologue
    .line 1128
    invoke-direct {p0, p2}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1129
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1130
    const-string v1, "repost_id"

    invoke-virtual {v0, v1, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1131
    const-string v1, "notify"

    invoke-virtual {v0, v1, p10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1132
    const-string v1, "following"

    invoke-virtual {v0, v1, p7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1133
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackUnRevine(Ljava/lang/String;)V

    .line 1135
    const/16 v1, 0x37

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unblockUser(J)Ljava/lang/String;
    .locals 4
    .parameter "userToUnblock"

    .prologue
    .line 1848
    invoke-direct {p0}, Lco/vine/android/client/AppController;->createServiceBundle()Landroid/os/Bundle;

    move-result-object v0

    .line 1849
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "user_id"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1850
    const-string v1, "block_user_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1851
    const/16 v1, 0x30

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unfollowUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;
    .locals 7
    .parameter "session"
    .parameter "userIdToUnfollow"
    .parameter "notify"

    .prologue
    .line 1085
    const-wide/16 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lco/vine/android/client/AppController;->unfollowUser(Lco/vine/android/client/Session;JZJ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unfollowUser(Lco/vine/android/client/Session;JZJ)Ljava/lang/String;
    .locals 4
    .parameter "session"
    .parameter "userIdToUnfollow"
    .parameter "notify"
    .parameter "currentProfileId"

    .prologue
    .line 1090
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1091
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "follow_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1092
    const-string v1, "profile_id"

    invoke-virtual {v0, v1, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1093
    const-string v1, "user_id"

    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1094
    const-string v1, "notify"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1095
    const/16 v1, 0x13

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public unlikePost(Ljava/lang/String;Lco/vine/android/client/Session;JZ)Ljava/lang/String;
    .locals 2
    .parameter "source"
    .parameter "session"
    .parameter "postToUnlike"
    .parameter "notify"

    .prologue
    .line 1110
    invoke-direct {p0, p2}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1111
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "post_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1112
    const-string v1, "notify"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1113
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackUnLikePost(Ljava/lang/String;)V

    .line 1114
    const/16 v1, 0x19

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updateClientProfile()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1293
    const-string v0, "Update Client Profile."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 1294
    const/16 v0, 0x23

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-direct {p0, v0, v1}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateCredentials(Ljava/lang/String;)V
    .locals 1
    .parameter "key"

    .prologue
    .line 1732
    invoke-virtual {p0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0, p1}, Lco/vine/android/client/Session;->setSessionKey(Ljava/lang/String;)V

    .line 1733
    return-void
.end method

.method public updateEdition(Lco/vine/android/client/Session;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "editionCode"

    .prologue
    .line 1500
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1501
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "edition"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1502
    const-string v1, "Updating edition code to {}"

    invoke-static {v1, p2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1503
    const/16 v1, 0x47

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updateExplicit(Lco/vine/android/client/Session;Z)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "explicit"

    .prologue
    .line 1494
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1495
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "explicit"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1496
    const/16 v1, 0x33

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updatePrivate(Lco/vine/android/client/Session;Z)Ljava/lang/String;
    .locals 2
    .parameter "session"
    .parameter "priv"

    .prologue
    .line 1488
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1489
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "priv"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1490
    const/16 v1, 0x34

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updateProfile(Lco/vine/android/client/Session;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "session"
    .parameter "name"
    .parameter "description"
    .parameter "location"
    .parameter "email"
    .parameter "phone"
    .parameter "avatar"

    .prologue
    .line 1009
    invoke-direct {p0, p1}, Lco/vine/android/client/AppController;->createServiceBundle(Lco/vine/android/client/Session;)Landroid/os/Bundle;

    move-result-object v0

    .line 1010
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "a_name"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1011
    const-string v1, "desc"

    invoke-static {p3}, Lco/vine/android/util/Util;->cleanse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1012
    const-string v1, "location"

    invoke-static {p4}, Lco/vine/android/util/Util;->cleanse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    const-string v1, "email"

    invoke-virtual {v0, v1, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1014
    const-string v1, "phone"

    invoke-virtual {v0, v1, p6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1015
    if-eqz p7, :cond_0

    .line 1016
    const-string v1, "uri"

    invoke-virtual {v0, v1, p7}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1018
    :cond_0
    const/16 v1, 0x1a

    invoke-direct {p0, v1, v0}, Lco/vine/android/client/AppController;->executeServiceAction(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
