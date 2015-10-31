.class public Lco/vine/android/service/VineUploadService;
.super Landroid/app/Service;
.source "VineUploadService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/service/VineUploadService$SessionChangedReceiver;,
        Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    }
.end annotation


# static fields
.field public static final ACTION_CLEAR_NOTIFICATIONS:Ljava/lang/String; = "clear_notifications"

.field public static final ACTION_DISCARD:Ljava/lang/String; = "discard"

.field public static final ACTION_DISCARD_ALL:Ljava/lang/String; = "discard_all"

.field public static final ACTION_NOTIFY_FAILED:Ljava/lang/String; = "cNotify"

.field public static final ACTION_POST:Ljava/lang/String; = "bPost"

.field public static final ACTION_SHOW_NOTIFICATIONS:Ljava/lang/String; = "show_notifications"

.field public static final ACTION_UPLOAD:Ljava/lang/String; = "aUpload"

.field public static final ACTION_UPLOAD_RESULT:Ljava/lang/String; = "co.vine.android.UPLOAD_RESULT"

.field public static final AG_CHANNEL_ID:Ljava/lang/String; = "channelId"

.field public static final AG_DESCRIPTION:Ljava/lang/String; = "description"

.field public static final AG_ENTITIES:Ljava/lang/String; = "entities"

.field public static final AG_HASH:Ljava/lang/String; = "hash"

.field public static final AG_MESSAGE:Ljava/lang/String; = "message"

.field public static final AG_PATH:Ljava/lang/String; = "path"

.field public static final AG_POST_TO_FACEBOOK:Ljava/lang/String; = "postToFacebook"

.field public static final AG_POST_TO_TWITTER:Ljava/lang/String; = "postToTwitter"

.field public static final AG_REFERENCE:Ljava/lang/String; = "reference"

.field public static final AG_THUMBNAIL:Ljava/lang/String; = "thumbnail"

.field public static final AG_TIMESTAMP:Ljava/lang/String; = "created"

.field public static final AG_UPLOAD_RESULT:Ljava/lang/String; = "upload_status"

.field public static final EXTRA_REACTIVATE:Ljava/lang/String; = "reactivate"

.field public static final EXTRA_SESSION_KEY:Ljava/lang/String; = "s_key"

.field private static final MAX_BITMAP_SIZE:I = 0xa

.field private static final NOTIFICATION_FAILED_ID:I = 0x0

.field private static final NOTIFICATION_PROGRESS_ID:I = 0x1

.field private static final NOTIFICATION_TAG:Ljava/lang/String; = "upload_notification"

.field private static final PARAM_PASSWORD:Ljava/lang/String; = "password"

.field private static final PARAM_TWITTER_SECRET:Ljava/lang/String; = "twitterOauthSecret"

.field private static final PARAM_TWITTER_TOKEN:Ljava/lang/String; = "twitterOauthToken"

.field private static final PARAM_USERNAME:Ljava/lang/String; = "username"

.field public static final RESULT_NEED_POST_INFO:I = 0x3

.field public static final RESULT_STATUS_FAILED:I = 0x1

.field public static final RESULT_STATUS_SUCCEEDED:I = 0x2

.field public static final RESULT_STATUS_UPLOADING:I = 0x0

.field private static final SMALL_ICON:I = 0x7f0201a2

.field private static sShowProgress:Z


# instance fields
.field private mBitmaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

.field private mDefaultNotificationIcon:Landroid/graphics/Bitmap;

.field private final mLock:[I

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private mNotificationPanelSize:I

.field private mPendingTasks:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Lco/vine/android/service/VineUploadService$ServiceAsyncTask;",
            ">;"
        }
    .end annotation
.end field

.field private mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRsm:Lco/vine/android/recorder/RecordSessionManager;

.field private mSessionChangedReceiver:Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

.field private mStartIds:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mUploadManager:Lco/vine/android/util/UploadManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 76
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 126
    const/4 v0, 0x0

    new-array v0, v0, [I

    iput-object v0, p0, Lco/vine/android/service/VineUploadService;->mLock:[I

    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/service/VineUploadService;->mNotificationPanelSize:I

    .line 864
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/service/VineUploadService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->stopIfNoTaskLeft()V

    return-void
.end method

.method static synthetic access$100(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mUploadManager:Lco/vine/android/util/UploadManager;

    return-object v0
.end method

.method static synthetic access$1000(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lco/vine/android/service/VineUploadService;->updateTranscodeProgress(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lco/vine/android/service/VineUploadService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->cancelFailedNofitication()V

    return-void
.end method

.method static synthetic access$300(Lco/vine/android/service/VineUploadService;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/service/VineUploadService;)[I
    .locals 1
    .parameter "x0"

    .prologue
    .line 76
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mLock:[I

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/service/VineUploadService;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lco/vine/android/service/VineUploadService;->discardUpload(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lco/vine/android/service/VineUploadService;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lco/vine/android/service/VineUploadService;->clearNotification(I)V

    return-void
.end method

.method static synthetic access$702(Lco/vine/android/service/VineUploadService;Lco/vine/android/service/VineUploadService$ServiceAsyncTask;)Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 76
    iput-object p1, p0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    return-object p1
.end method

.method static synthetic access$800(Lco/vine/android/service/VineUploadService;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 76
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->executeNext()V

    return-void
.end method

.method static synthetic access$900(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lco/vine/android/service/VineUploadService;->updateUploadProgress(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized cancelFailedNofitication()V
    .locals 1

    .prologue
    .line 319
    monitor-enter p0

    :try_start_0
    invoke-static {p0}, Lco/vine/android/util/UploadManager;->uploadListIsEmpty(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/service/VineUploadService;->clearNotification(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    :cond_0
    monitor-exit p0

    return-void

    .line 319
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized clearNotification(I)V
    .locals 2
    .parameter "id"

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mNotificationManager:Landroid/app/NotificationManager;

    const-string v1, "upload_notification"

    invoke-virtual {v0, v1, p1}, Landroid/app/NotificationManager;->cancel(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    monitor-exit p0

    return-void

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private discardTask(Ljava/lang/String;)V
    .locals 6
    .parameter "path"

    .prologue
    const/4 v5, 0x1

    .line 544
    const-string v4, "Discard task for path={}"

    invoke-static {v4, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 545
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 546
    .local v0, currentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    if-eqz v0, :cond_0

    iget-object v4, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 547
    invoke-virtual {v0, v5}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->setIsDiscarded(Z)V

    .line 548
    invoke-virtual {v0, v5}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->cancel(Z)Z

    .line 549
    const-string v4, "In-progress task has been cancelled, path={}"

    invoke-static {v4, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 552
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 553
    .local v3, tasks:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/service/VineUploadService$ServiceAsyncTask;>;"
    iget-object v4, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 554
    .local v2, task:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    if-eqz v2, :cond_1

    iget-object v4, v2, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 555
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 558
    .end local v2           #task:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 559
    const-string v4, "Queued task(s) will be cancelled."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 560
    iget-object v4, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashSet;->removeAll(Ljava/util/Collection;)Z

    .line 562
    :cond_3
    invoke-direct {p0, p1}, Lco/vine/android/service/VineUploadService;->discardUpload(Ljava/lang/String;)V

    .line 563
    return-void
.end method

.method private discardUpload(Ljava/lang/String;)V
    .locals 3
    .parameter "path"

    .prologue
    .line 566
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 567
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 568
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lco/vine/android/recorder/RecordConfigUtils;->getThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 569
    invoke-static {p0, p1}, Lco/vine/android/util/UploadManager;->deleteUploadRecord(Landroid/content/Context;Ljava/lang/String;)V

    .line 570
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->cancelFailedNofitication()V

    .line 571
    return-void
.end method

.method private executeNext()V
    .locals 6

    .prologue
    .line 463
    const-string v2, "pending tasks: {}"

    iget-object v3, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-static {v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 464
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    if-eqz v2, :cond_0

    .line 465
    const-string v2, "mCurrentTask is not null, will not execute next"

    invoke-static {v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 489
    :goto_0
    return-void

    .line 469
    :cond_0
    iget-object v3, p0, Lco/vine/android/service/VineUploadService;->mLock:[I

    monitor-enter v3

    .line 470
    :try_start_0
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 471
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 472
    .local v1, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lco/vine/android/service/VineUploadService$ServiceAsyncTask;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 473
    .local v0, currentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    invoke-direct {p0, v0}, Lco/vine/android/service/VineUploadService;->isRunning(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 474
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v2}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 475
    const-string v2, "started executing task: action={}, path={}"

    iget-object v4, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    iget-object v5, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-static {v2, v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 478
    :cond_1
    iput-object v0, p0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 479
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 488
    .end local v0           #currentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    .end local v1           #iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Lco/vine/android/service/VineUploadService$ServiceAsyncTask;>;"
    :goto_1
    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 481
    :cond_2
    :try_start_1
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v4, Lco/vine/android/service/VineUploadService$1;

    invoke-direct {v4, p0}, Lco/vine/android/service/VineUploadService$1;-><init>(Lco/vine/android/service/VineUploadService;)V

    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public static getClearNotificationsIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 168
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 169
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "clear_notifications"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    return-object v0
.end method

.method public static getDiscardAllIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 162
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 163
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "discard_all"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 164
    return-object v0
.end method

.method public static getDiscardIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "context"
    .parameter "path"

    .prologue
    .line 155
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 156
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "discard"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 157
    const-string v1, "path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 158
    return-object v0
.end method

.method public static getNotifyFailedIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 13
    .parameter "context"

    .prologue
    const/4 v12, 0x1

    .line 209
    const/4 v10, 0x0

    .line 210
    .local v10, path:Ljava/lang/String;
    const-string v11, "status=?"

    .line 211
    .local v11, selection:Ljava/lang/String;
    new-array v4, v12, [Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v0

    .line 212
    .local v4, selArgs:[Ljava/lang/String;
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v8

    .line 213
    .local v8, ownerId:J
    sget-object v0, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 214
    .local v1, contentUri:Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "status=?"

    const-string v5, "_id ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 216
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 217
    invoke-interface {v6}, Landroid/database/Cursor;->moveToLast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    invoke-interface {v6, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 220
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 223
    :cond_1
    new-instance v7, Landroid/content/Intent;

    const-class v0, Lco/vine/android/service/VineUploadService;

    invoke-direct {v7, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 224
    .local v7, intent:Landroid/content/Intent;
    const-string v0, "cNotify"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 225
    const-string v0, "path"

    invoke-virtual {v7, v0, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 226
    return-object v7
.end method

.method public static getPostIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;Z)Landroid/content/Intent;
    .locals 11
    .parameter "context"
    .parameter "upload"
    .parameter "isRetry"

    .prologue
    .line 180
    iget-object v0, p1, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p1, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v0}, Lco/vine/android/api/VineUpload$PostInfo;->fromJsonString(Ljava/lang/String;)Lco/vine/android/api/VineUpload$PostInfo;

    move-result-object v10

    .line 182
    .local v10, postInfo:Lco/vine/android/api/VineUpload$PostInfo;
    iget-object v1, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    iget-object v2, v10, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    iget-boolean v3, v10, Lco/vine/android/api/VineUpload$PostInfo;->postToTwitter:Z

    iget-boolean v4, v10, Lco/vine/android/api/VineUpload$PostInfo;->postToFacebook:Z

    iget-wide v5, v10, Lco/vine/android/api/VineUpload$PostInfo;->channelId:J

    iget-object v8, v10, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    iget-object v9, v10, Lco/vine/android/api/VineUpload$PostInfo;->message:Ljava/lang/String;

    move-object v0, p0

    move v7, p2

    invoke-static/range {v0 .. v9}, Lco/vine/android/service/VineUploadService;->getPostIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZJZLjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 186
    .end local v10           #postInfo:Lco/vine/android/api/VineUpload$PostInfo;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getPostIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZJZLjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;
    .locals 4
    .parameter "context"
    .parameter "path"
    .parameter "caption"
    .parameter "postToTwitter"
    .parameter "postToFacebook"
    .parameter "channelId"
    .parameter "isRetry"
    .parameter
    .parameter "message"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZJZ",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 194
    .local p8, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 195
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "bPost"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 196
    const-string v1, "is_retry"

    invoke-virtual {v0, v1, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 197
    const-string v1, "path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    const-string v1, "description"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 199
    const-string v1, "postToTwitter"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 200
    const-string v1, "postToFacebook"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 201
    const-string v1, "channelId"

    invoke-virtual {v0, v1, p5, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 202
    const-string v1, "entities"

    invoke-virtual {v0, v1, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 203
    const-string v1, "message"

    invoke-virtual {v0, v1, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 204
    const-string v1, "created"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 205
    return-object v0
.end method

.method public static getShowProgressIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2
    .parameter "context"

    .prologue
    .line 174
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 175
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "show_notifications"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 176
    return-object v0
.end method

.method public static getUploadIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;)Landroid/content/Intent;
    .locals 4
    .parameter "context"
    .parameter "upload"

    .prologue
    .line 138
    iget-object v0, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    iget-object v1, p1, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    iget-object v2, p1, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->reference:Ljava/lang/String;

    invoke-static {p0, v0, v1, v2, v3}, Lco/vine/android/service/VineUploadService;->getUploadIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getUploadIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "context"
    .parameter "path"
    .parameter "hash"
    .parameter "thumbnail"
    .parameter "reference"

    .prologue
    .line 144
    const/4 v1, 0x0

    sput-boolean v1, Lco/vine/android/service/VineUploadService;->sShowProgress:Z

    .line 145
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/service/VineUploadService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 146
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "aUpload"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    const-string v1, "path"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 148
    const-string v1, "hash"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 149
    const-string v1, "thumbnail"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    const-string v1, "reference"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 151
    return-object v0
.end method

.method private isRunning(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;)Z
    .locals 2
    .parameter "task"

    .prologue
    .line 331
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask$Status;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private processCommand(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 24
    .parameter "path"
    .parameter "action"
    .parameter "intent"

    .prologue
    .line 382
    const-string v21, "Process command for action={}, path={}"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 383
    new-instance v16, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;-><init>(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    .line 384
    .local v16, newTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    const-string v21, "aUpload"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_2

    .line 386
    const-string v21, "hash"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 387
    .local v15, hash:Ljava/lang/String;
    const-string v21, "reference"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 389
    .local v17, reference:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mRsm:Lco/vine/android/recorder/RecordSessionManager;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    move-object/from16 v3, v21

    invoke-static {v0, v1, v15, v2, v3}, Lco/vine/android/util/UploadManager;->addOrUpdateUpload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lco/vine/android/recorder/RecordSessionManager;)V

    .line 390
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 391
    const-string v21, "Upload task added for path={}"

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 459
    .end local v15           #hash:Ljava/lang/String;
    .end local v17           #reference:Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-direct/range {p0 .. p0}, Lco/vine/android/service/VineUploadService;->executeNext()V

    .line 460
    :cond_1
    :goto_1
    return-void

    .line 394
    :cond_2
    const-string v21, "Upload task is already in queue for path={}"

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 396
    :cond_3
    const-string v21, "bPost"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 397
    const-string v21, "description"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 398
    .local v6, caption:Ljava/lang/String;
    const-string v21, "postToTwitter"

    const/16 v22, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    .line 399
    .local v7, postToTwitter:Z
    const-string v21, "postToFacebook"

    const/16 v22, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    .line 400
    .local v8, postToFacebook:Z
    const-string v21, "channelId"

    const-wide/16 v22, -0x1

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    move-wide/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v9

    .line 401
    .local v9, channelId:J
    const-string v21, "entities"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 402
    .local v11, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    const-string v21, "message"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 403
    .local v12, message:Ljava/lang/String;
    const-string v21, "created"

    const-wide/16 v22, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    move-wide/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v13

    .line 405
    .local v13, created:J
    new-instance v5, Lco/vine/android/api/VineUpload$PostInfo;

    invoke-direct/range {v5 .. v14}, Lco/vine/android/api/VineUpload$PostInfo;-><init>(Ljava/lang/String;ZZJLjava/util/ArrayList;Ljava/lang/String;J)V

    .line 407
    .local v5, info:Lco/vine/android/api/VineUpload$PostInfo;
    invoke-static/range {p0 .. p1}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v19

    .line 408
    .local v19, upload:Lco/vine/android/api/VineUpload;
    if-eqz v19, :cond_1

    .line 409
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Lco/vine/android/util/UploadManager;->setPostInfo(Landroid/content/Context;Lco/vine/android/api/VineUpload;Lco/vine/android/api/VineUpload$PostInfo;)V

    .line 411
    move-object/from16 v0, v19

    iget v0, v0, Lco/vine/android/api/VineUpload;->status:I

    move/from16 v18, v0

    .line 412
    .local v18, status:I
    packed-switch v18, :pswitch_data_0

    .line 444
    const-string v21, "Invalid state={} for path={}"

    move-object/from16 v0, v19

    iget v0, v0, Lco/vine/android/api/VineUpload;->status:I

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 414
    :pswitch_0
    new-instance v20, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    const-string v21, "aUpload"

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, v21

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;-><init>(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    .line 416
    .local v20, uploadTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_4

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_4

    .line 418
    const-string v21, "Upload task added for path={}"

    move-object/from16 v0, v20

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 421
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 422
    const-string v21, "Post task added for path={}"

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 430
    .end local v20           #uploadTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    :pswitch_1
    invoke-virtual/range {v19 .. v19}, Lco/vine/android/api/VineUpload;->isExpired()Z

    move-result v21

    if-eqz v21, :cond_5

    .line 431
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lco/vine/android/util/UploadManager;->setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;I)V

    .line 432
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v21

    invoke-static {v0, v1, v2}, Lco/vine/android/service/VineUploadService;->getPostIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;Z)Landroid/content/Intent;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineUploadService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_1

    .line 436
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 438
    const-string v21, "Post task added for path={}"

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 448
    .end local v5           #info:Lco/vine/android/api/VineUpload$PostInfo;
    .end local v6           #caption:Ljava/lang/String;
    .end local v7           #postToTwitter:Z
    .end local v8           #postToFacebook:Z
    .end local v9           #channelId:J
    .end local v11           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    .end local v12           #message:Ljava/lang/String;
    .end local v13           #created:J
    .end local v18           #status:I
    .end local v19           #upload:Lco/vine/android/api/VineUpload;
    :cond_6
    const-string v21, "cNotify"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 449
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 451
    const/16 v21, 0x1

    sput-boolean v21, Lco/vine/android/service/VineUploadService;->sShowProgress:Z

    .line 452
    const-string v21, "Notify failed upload for path={}."

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 453
    invoke-direct/range {p0 .. p1}, Lco/vine/android/service/VineUploadService;->showFailedNotification(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 455
    :cond_7
    const-string v21, "discard"

    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 456
    invoke-direct/range {p0 .. p1}, Lco/vine/android/service/VineUploadService;->discardTask(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 412
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static refreshSessionKey(Landroid/content/Context;)Z
    .locals 18
    .parameter "context"

    .prologue
    .line 574
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/VineAccountHelper;->getActiveAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    .line 575
    .local v0, account:Landroid/accounts/Account;
    invoke-static/range {p0 .. p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 576
    .local v1, am:Landroid/accounts/AccountManager;
    invoke-static {v1, v0}, Lco/vine/android/client/VineAccountHelper;->getLoginType(Landroid/accounts/AccountManager;Landroid/accounts/Account;)I

    move-result v4

    .line 579
    .local v4, loginType:I
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v2

    .line 580
    .local v2, api:Lco/vine/android/client/VineAPI;
    packed-switch v4, :pswitch_data_0

    .line 635
    :cond_0
    const/4 v14, 0x0

    :goto_0
    return v14

    .line 582
    :pswitch_0
    iget-object v3, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 583
    .local v3, email:Ljava/lang/String;
    invoke-static {v1, v0}, Lco/vine/android/client/VineAccountHelper;->getPassword(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v7

    .line 584
    .local v7, password:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/api/VineParserReader;->createLoginReader()Lco/vine/android/api/VineParserReader;

    move-result-object v13

    .line 586
    .local v13, vp:Lco/vine/android/api/VineParserReader;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 589
    .local v6, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string v15, "username"

    invoke-direct {v14, v15, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 590
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string v15, "password"

    invoke-direct {v14, v15, v7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 592
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v15, "/users/authenticate"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 595
    .local v11, url:Ljava/lang/StringBuilder;
    invoke-static/range {p0 .. p0}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v14

    invoke-static {v14, v11, v6, v13, v2}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v14

    invoke-virtual {v14}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v5

    .line 599
    .local v5, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v5}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 600
    invoke-virtual {v13}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lco/vine/android/api/VineLogin;

    .line 601
    .local v12, vl:Lco/vine/android/api/VineLogin;
    iget-object v14, v12, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-static {v1, v0, v14}, Lco/vine/android/client/VineAccountHelper;->setSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;Ljava/lang/String;)V

    .line 602
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v14

    iget-object v15, v12, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {v14, v15}, Lco/vine/android/client/AppController;->setSessionKey(Ljava/lang/String;)V

    .line 603
    const/4 v14, 0x1

    goto :goto_0

    .line 608
    .end local v3           #email:Ljava/lang/String;
    .end local v5           #op:Lco/vine/android/network/HttpOperation;
    .end local v6           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v7           #password:Ljava/lang/String;
    .end local v11           #url:Ljava/lang/StringBuilder;
    .end local v12           #vl:Lco/vine/android/api/VineLogin;
    .end local v13           #vp:Lco/vine/android/api/VineParserReader;
    :pswitch_1
    invoke-static {v1, v0}, Lco/vine/android/client/VineAccountHelper;->getTwitterToken(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v10

    .line 609
    .local v10, token:Ljava/lang/String;
    invoke-static {v1, v0}, Lco/vine/android/client/VineAccountHelper;->getTwitterSecret(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v9

    .line 610
    .local v9, secret:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/api/VineParserReader;->createLoginReader()Lco/vine/android/api/VineParserReader;

    move-result-object v13

    .line 612
    .restart local v13       #vp:Lco/vine/android/api/VineParserReader;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 615
    .restart local v6       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string v15, "twitterOauthToken"

    invoke-direct {v14, v15, v10}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    new-instance v14, Lorg/apache/http/message/BasicNameValuePair;

    const-string v15, "twitterOauthSecret"

    invoke-direct {v14, v15, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 618
    const-string v8, "authenticate"

    .line 619
    .local v8, pathSegment:Ljava/lang/String;
    invoke-virtual {v2}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "users"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    const-string v17, "authenticate"

    aput-object v17, v15, v16

    const/16 v16, 0x2

    const-string v17, "twitter"

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 622
    .restart local v11       #url:Ljava/lang/StringBuilder;
    invoke-static/range {p0 .. p0}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v14

    invoke-static {v14, v11, v6, v13, v2}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v14

    invoke-virtual {v14}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v5

    .line 626
    .restart local v5       #op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v5}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v14

    if-eqz v14, :cond_0

    .line 627
    invoke-virtual {v13}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lco/vine/android/api/VineLogin;

    .line 628
    .restart local v12       #vl:Lco/vine/android/api/VineLogin;
    iget-object v14, v12, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-static {v1, v0, v14}, Lco/vine/android/client/VineAccountHelper;->setSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;Ljava/lang/String;)V

    .line 629
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v14

    iget-object v15, v12, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {v14, v15}, Lco/vine/android/client/AppController;->setSessionKey(Ljava/lang/String;)V

    .line 630
    const/4 v14, 0x1

    goto/16 :goto_0

    .line 580
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private setScaledNotificationIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "thumbnailPath"

    .prologue
    .line 515
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 516
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 517
    .local v0, bm:Landroid/graphics/Bitmap;
    if-nez v0, :cond_2

    .line 518
    iget v2, p0, Lco/vine/android/service/VineUploadService;->mNotificationPanelSize:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 519
    invoke-virtual {p0}, Lco/vine/android/service/VineUploadService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b003e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lco/vine/android/service/VineUploadService;->mNotificationPanelSize:I

    .line 521
    :cond_0
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 522
    .local v1, thumbnailBitmap:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_3

    .line 523
    iget v2, p0, Lco/vine/android/service/VineUploadService;->mNotificationPanelSize:I

    iget v3, p0, Lco/vine/android/service/VineUploadService;->mNotificationPanelSize:I

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 524
    if-eqz v0, :cond_3

    .line 525
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    const/16 v3, 0xa

    if-lt v2, v3, :cond_1

    .line 526
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 528
    :cond_1
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    .end local v0           #bm:Landroid/graphics/Bitmap;
    .end local v1           #thumbnailBitmap:Landroid/graphics/Bitmap;
    :cond_2
    :goto_0
    return-object v0

    .line 536
    :cond_3
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mDefaultNotificationIcon:Landroid/graphics/Bitmap;

    if-nez v2, :cond_4

    .line 537
    invoke-virtual {p0}, Lco/vine/android/service/VineUploadService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020151

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/service/VineUploadService;->mDefaultNotificationIcon:Landroid/graphics/Bitmap;

    .line 539
    :cond_4
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    iget-object v3, p0, Lco/vine/android/service/VineUploadService;->mDefaultNotificationIcon:Landroid/graphics/Bitmap;

    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mDefaultNotificationIcon:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method private showFailedNotification(Ljava/lang/String;)V
    .locals 7
    .parameter "path"

    .prologue
    const/4 v6, 0x0

    .line 492
    invoke-static {p0, p1}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v3

    .line 493
    .local v3, upload:Lco/vine/android/api/VineUpload;
    if-nez v3, :cond_0

    .line 509
    :goto_0
    return-void

    .line 495
    :cond_0
    const-string v4, "Show failed notification for {}, upload expired? {}."

    invoke-virtual {v3}, Lco/vine/android/api/VineUpload;->isExpired()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v4, p1, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 496
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v1, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 497
    .local v1, nb:Landroid/support/v4/app/NotificationCompat$Builder;
    const v4, 0x7f0201a2

    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 499
    iget-object v4, v3, Lco/vine/android/api/VineUpload;->thumbnailPath:Ljava/lang/String;

    invoke-direct {p0, v4}, Lco/vine/android/service/VineUploadService;->setScaledNotificationIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 501
    const-string v4, "co.vine.android.UPLOAD_LIST"

    invoke-static {p0, v4}, Lco/vine/android/StartActivity;->getStartIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 502
    .local v0, intent:Landroid/content/Intent;
    invoke-static {p0, v6, v0, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 503
    .local v2, pendingIntent:Landroid/app/PendingIntent;
    invoke-virtual {v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 505
    const v4, 0x7f0e011c

    invoke-virtual {p0, v4}, Lco/vine/android/service/VineUploadService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 506
    const v4, 0x7f0e01bd

    invoke-virtual {p0, v4}, Lco/vine/android/service/VineUploadService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 507
    invoke-virtual {v1, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 508
    invoke-direct {p0, v1, v6}, Lco/vine/android/service/VineUploadService;->showNotification(Landroid/support/v4/app/NotificationCompat$Builder;I)V

    goto :goto_0
.end method

.method private declared-synchronized showNotification(Landroid/support/v4/app/NotificationCompat$Builder;I)V
    .locals 4
    .parameter "nb"
    .parameter "id"

    .prologue
    .line 303
    monitor-enter p0

    :try_start_0
    sget-boolean v1, Lco/vine/android/service/VineUploadService;->sShowProgress:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 306
    :try_start_1
    iget-object v1, p0, Lco/vine/android/service/VineUploadService;->mNotificationManager:Landroid/app/NotificationManager;

    const-string v2, "upload_notification"

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, p2, v3}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 312
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 307
    :catch_0
    move-exception v0

    .line 308
    .local v0, e:Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    :try_start_2
    invoke-virtual {p1, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 309
    iget-object v1, p0, Lco/vine/android/service/VineUploadService;->mNotificationManager:Landroid/app/NotificationManager;

    const-string v2, "upload_notification"

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, p2, v3}, Landroid/app/NotificationManager;->notify(Ljava/lang/String;ILandroid/app/Notification;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 303
    .end local v0           #e:Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private stopIfNoTaskLeft()V
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    invoke-direct {p0, v0}, Lco/vine/android/service/VineUploadService;->isRunning(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 326
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->stopService()V

    .line 328
    :cond_0
    return-void
.end method

.method private stopService()V
    .locals 4

    .prologue
    .line 335
    iget-object v3, p0, Lco/vine/android/service/VineUploadService;->mLock:[I

    monitor-enter v3

    .line 336
    :try_start_0
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mStartIds:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 337
    .local v1, key:Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v2}, Lco/vine/android/service/VineUploadService;->stopSelf(I)V

    goto :goto_0

    .line 340
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #key:Ljava/lang/Integer;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 339
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lco/vine/android/service/VineUploadService;->mStartIds:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 340
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 341
    return-void
.end method

.method private updateProgressNotification(Ljava/lang/String;IIZI)V
    .locals 6
    .parameter "thumbnail"
    .parameter "title"
    .parameter "text"
    .parameter "showProgress"
    .parameter "progress"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 282
    const-string v1, "Update notification: {}, {}."

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 283
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v0, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 284
    .local v0, nb:Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-direct {p0, p1}, Lco/vine/android/service/VineUploadService;->setScaledNotificationIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 285
    const v1, 0x7f0201a2

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 286
    invoke-virtual {p0, p2}, Lco/vine/android/service/VineUploadService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 287
    invoke-virtual {p0, p3}, Lco/vine/android/service/VineUploadService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 288
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 289
    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 290
    if-eqz p4, :cond_1

    .line 291
    if-lez p5, :cond_0

    .line 292
    const/16 v1, 0x64

    invoke-virtual {v0, v1, p5, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 299
    :goto_0
    invoke-direct {p0, v0, v5}, Lco/vine/android/service/VineUploadService;->showNotification(Landroid/support/v4/app/NotificationCompat$Builder;I)V

    .line 300
    return-void

    .line 294
    :cond_0
    invoke-virtual {v0, v4, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0

    .line 297
    :cond_1
    invoke-virtual {v0, v4, v4, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_0
.end method

.method private updateTranscodeProgress(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "path"
    .parameter "thumbnail"

    .prologue
    .line 274
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 275
    .local v6, progress:Ljava/lang/Integer;
    if-nez v6, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 276
    :cond_0
    const v2, 0x7f0e0125

    const v3, 0x7f0e0126

    const/4 v4, 0x1

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object v0, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lco/vine/android/service/VineUploadService;->updateProgressNotification(Ljava/lang/String;IIZI)V

    .line 278
    return-void
.end method

.method private updateUploadProgress(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "path"
    .parameter "thumbnail"

    .prologue
    .line 267
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 268
    .local v6, progress:Ljava/lang/Integer;
    if-nez v6, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 269
    :cond_0
    const v2, 0x7f0e01d4

    const v3, 0x7f0e01d5

    const/4 v4, 0x1

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object v0, p0

    move-object v1, p2

    invoke-direct/range {v0 .. v5}, Lco/vine/android/service/VineUploadService;->updateProgressNotification(Ljava/lang/String;IIZI)V

    .line 271
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 861
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 231
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 232
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v1

    if-nez v1, :cond_0

    .line 233
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->start(Landroid/content/Context;)V

    .line 236
    :cond_0
    :try_start_0
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mRsm:Lco/vine/android/recorder/RecordSessionManager;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    :goto_0
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mPendingTasks:Ljava/util/LinkedHashSet;

    .line 241
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 242
    new-instance v1, Lco/vine/android/util/UploadManager;

    invoke-direct {v1, p0}, Lco/vine/android/util/UploadManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mUploadManager:Lco/vine/android/util/UploadManager;

    .line 243
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mStartIds:Ljava/util/LinkedList;

    .line 244
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lco/vine/android/service/VineUploadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mNotificationManager:Landroid/app/NotificationManager;

    .line 245
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->resetActiveSession()V

    .line 246
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 247
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "co.vine.android.session.logout"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 248
    const-string v1, "co.vine.android.session.login"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 249
    new-instance v1, Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

    invoke-direct {v1, p0}, Lco/vine/android/service/VineUploadService$SessionChangedReceiver;-><init>(Lco/vine/android/service/VineUploadService;)V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mSessionChangedReceiver:Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

    .line 250
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lco/vine/android/service/VineUploadService;->mBitmaps:Ljava/util/HashMap;

    .line 251
    iget-object v1, p0, Lco/vine/android/service/VineUploadService;->mSessionChangedReceiver:Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

    invoke-virtual {p0, v1, v0}, Lco/vine/android/service/VineUploadService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 252
    return-void

    .line 237
    .end local v0           #filter:Landroid/content/IntentFilter;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 256
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 257
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mSessionChangedReceiver:Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lco/vine/android/service/VineUploadService;->mSessionChangedReceiver:Lco/vine/android/service/VineUploadService$SessionChangedReceiver;

    invoke-virtual {p0, v0}, Lco/vine/android/service/VineUploadService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 260
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 9
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    const/4 v8, 0x1

    .line 345
    const-string v4, "onStartCommand, intent={}"

    invoke-static {v4, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 346
    iget-object v5, p0, Lco/vine/android/service/VineUploadService;->mLock:[I

    monitor-enter v5

    .line 347
    :try_start_0
    iget-object v4, p0, Lco/vine/android/service/VineUploadService;->mStartIds:Ljava/util/LinkedList;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 348
    if-nez p1, :cond_0

    .line 349
    monitor-exit v5

    .line 377
    :goto_0
    return v8

    .line 352
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 353
    .local v0, action:Ljava/lang/String;
    if-nez v0, :cond_1

    .line 354
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v6, "VineUploadService must be started with an explicit action."

    invoke-direct {v4, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 376
    .end local v0           #action:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 356
    .restart local v0       #action:Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v4, "discard_all"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 357
    invoke-static {p0}, Lco/vine/android/util/UploadManager;->getAllPaths(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v3

    .line 358
    .local v3, paths:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 359
    .local v2, path:Ljava/lang/String;
    invoke-direct {p0, v2}, Lco/vine/android/service/VineUploadService;->discardTask(Ljava/lang/String;)V

    goto :goto_1

    .line 361
    .end local v2           #path:Ljava/lang/String;
    :cond_2
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService;->cancelFailedNofitication()V

    .line 376
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #paths:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    :goto_2
    monitor-exit v5

    goto :goto_0

    .line 362
    :cond_3
    const-string v4, "show_notifications"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 363
    const/4 v4, 0x1

    sput-boolean v4, Lco/vine/android/service/VineUploadService;->sShowProgress:Z

    goto :goto_2

    .line 364
    :cond_4
    const-string v4, "clear_notifications"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 365
    const/4 v4, 0x0

    sput-boolean v4, Lco/vine/android/service/VineUploadService;->sShowProgress:Z

    .line 366
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lco/vine/android/service/VineUploadService;->clearNotification(I)V

    .line 367
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lco/vine/android/service/VineUploadService;->clearNotification(I)V

    goto :goto_2

    .line 369
    :cond_5
    const-string v4, "path"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 370
    .restart local v2       #path:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 371
    invoke-direct {p0, v2, v0, p1}, Lco/vine/android/service/VineUploadService;->processCommand(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    goto :goto_2

    .line 373
    :cond_6
    const-string v4, "path or hash is null, action={}, intent={}"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    invoke-static {v4, v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method updatePostProgress(Ljava/lang/String;)V
    .locals 6
    .parameter "thumbnail"

    .prologue
    .line 263
    const v2, 0x7f0e0124

    const v3, 0x7f0e0043

    const/4 v4, 0x1

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lco/vine/android/service/VineUploadService;->updateProgressNotification(Ljava/lang/String;IIZI)V

    .line 264
    return-void
.end method
