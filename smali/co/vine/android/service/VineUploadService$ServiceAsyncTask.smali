.class public Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
.super Landroid/os/AsyncTask;
.source "VineUploadService.java"

# interfaces
.implements Lco/vine/android/util/VineProgressListener;
.implements Lco/vine/android/recorder/EncoderManager$EncoderBoss;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/service/VineUploadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ServiceAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lco/vine/android/service/PostResult;",
        ">;",
        "Lco/vine/android/util/VineProgressListener;",
        "Lco/vine/android/recorder/EncoderManager$EncoderBoss;"
    }
.end annotation


# instance fields
.field public final action:Ljava/lang/String;

.field private mCurrentSize:J

.field private mExecutionStatus:I

.field private mIsDiscarded:Z

.field private mIsRetry:Z

.field private mLastProgress:I

.field private final mReference:Ljava/io/File;

.field private mSize:J

.field private final mThumbnail:Ljava/lang/String;

.field private mUpload:Lco/vine/android/api/VineUpload;

.field public final path:Ljava/lang/String;

.field final synthetic this$0:Lco/vine/android/service/VineUploadService;


# direct methods
.method public constructor <init>(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V
    .locals 2
    .parameter
    .parameter "path"
    .parameter "action"
    .parameter "intent"

    .prologue
    .line 654
    iput-object p1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 649
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mLastProgress:I

    .line 655
    iput-object p2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    .line 656
    iput-object p3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    .line 657
    invoke-static {p2}, Lco/vine/android/recorder/RecordConfigUtils;->getThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    .line 658
    new-instance v0, Ljava/io/File;

    invoke-static {p2}, Lco/vine/android/recorder/RecordConfigUtils;->getFrameInfoPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mReference:Ljava/io/File;

    .line 659
    const-string v0, "is_retry"

    const/4 v1, 0x0

    invoke-virtual {p4, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsRetry:Z

    .line 660
    return-void
.end method

.method private onComplete()V
    .locals 4

    .prologue
    .line 793
    const-class v2, Lco/vine/android/service/VineUploadService;

    monitor-enter v2

    .line 794
    :try_start_0
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    const/4 v3, 0x1

    #calls: Lco/vine/android/service/VineUploadService;->clearNotification(I)V
    invoke-static {v1, v3}, Lco/vine/android/service/VineUploadService;->access$600(Lco/vine/android/service/VineUploadService;I)V

    .line 795
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    const/4 v3, 0x0

    #setter for: Lco/vine/android/service/VineUploadService;->mCurrentTask:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    invoke-static {v1, v3}, Lco/vine/android/service/VineUploadService;->access$702(Lco/vine/android/service/VineUploadService;Lco/vine/android/service/VineUploadService$ServiceAsyncTask;)Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 796
    new-instance v0, Landroid/content/Intent;

    const-string v1, "co.vine.android.UPLOAD_RESULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 797
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "upload_status"

    iget v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mExecutionStatus:I

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 798
    const-string v1, "path"

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 799
    const-string v1, "thumbnail"

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 800
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    invoke-virtual {v1, v0}, Lco/vine/android/service/VineUploadService;->sendBroadcast(Landroid/content/Intent;)V

    .line 801
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    #calls: Lco/vine/android/service/VineUploadService;->executeNext()V
    invoke-static {v1}, Lco/vine/android/service/VineUploadService;->access$800(Lco/vine/android/service/VineUploadService;)V

    .line 802
    monitor-exit v2

    .line 803
    return-void

    .line 802
    .end local v0           #intent:Landroid/content/Intent;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lco/vine/android/service/PostResult;
    .locals 29
    .parameter "params"

    .prologue
    .line 664
    const-class v24, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    monitor-enter v24

    .line 666
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    .line 667
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v23, v0

    if-eqz v23, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lco/vine/android/api/VineUpload;->status:I

    move/from16 v23, v0

    const/16 v25, -0x1

    move/from16 v0, v23

    move/from16 v1, v25

    if-ne v0, v1, :cond_1

    .line 668
    :cond_0
    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    monitor-exit v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 756
    :goto_0
    return-object v17

    .line 671
    :cond_1
    :try_start_2
    const-string v23, "bPost"

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_5

    .line 672
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsRetry:Z

    move/from16 v23, v0

    if-nez v23, :cond_2

    .line 673
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineUploadService;->updatePostProgress(Ljava/lang/String;)V

    .line 676
    :cond_2
    const-string v23, "Posting...."

    invoke-static/range {v23 .. v23}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lco/vine/android/api/VineUpload;->getPostInfo()Lco/vine/android/api/VineUpload$PostInfo;

    move-result-object v11

    .line 678
    .local v11, info:Lco/vine/android/api/VineUpload$PostInfo;
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    .line 679
    .local v4, context:Lco/vine/android/service/VineUploadService;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #getter for: Lco/vine/android/service/VineUploadService;->mUploadManager:Lco/vine/android/util/UploadManager;
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$100(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v4, v1, v11}, Lco/vine/android/util/UploadManager;->postShare(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;

    move-result-object v17

    .line 681
    .local v17, postResult:Lco/vine/android/service/PostResult;
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lco/vine/android/service/PostResult;->success:Z

    move/from16 v23, v0

    if-nez v23, :cond_3

    move-object/from16 v0, v17

    iget-boolean v0, v0, Lco/vine/android/service/PostResult;->shouldRefreshSessionKey:Z

    move/from16 v23, v0

    if-eqz v23, :cond_3

    .line 682
    invoke-static {v4}, Lco/vine/android/service/VineUploadService;->refreshSessionKey(Landroid/content/Context;)Z

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #getter for: Lco/vine/android/service/VineUploadService;->mUploadManager:Lco/vine/android/util/UploadManager;
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$100(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v4, v1, v11}, Lco/vine/android/util/UploadManager;->postShare(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;

    move-result-object v17

    .line 686
    :cond_3
    move-object/from16 v0, v17

    iget-boolean v0, v0, Lco/vine/android/service/PostResult;->success:Z

    move/from16 v23, v0

    if-eqz v23, :cond_4

    .line 687
    const-string v23, "Post successful."

    invoke-static/range {v23 .. v23}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #calls: Lco/vine/android/service/VineUploadService;->cancelFailedNofitication()V
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$200(Lco/vine/android/service/VineUploadService;)V

    .line 689
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v18

    .line 690
    .local v18, prefs:Landroid/content/SharedPreferences;
    invoke-interface/range {v18 .. v18}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 691
    .local v5, e:Landroid/content/SharedPreferences$Editor;
    const-string v23, "profile_post_count"

    const-string v25, "profile_post_count"

    const/16 v26, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v25

    move/from16 v2, v26

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v25

    add-int/lit8 v25, v25, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v25

    invoke-interface {v5, v0, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 693
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 695
    .end local v5           #e:Landroid/content/SharedPreferences$Editor;
    .end local v18           #prefs:Landroid/content/SharedPreferences;
    :cond_4
    :try_start_3
    monitor-exit v24

    goto/16 :goto_0

    .line 757
    .end local v4           #context:Lco/vine/android/service/VineUploadService;
    .end local v11           #info:Lco/vine/android/api/VineUpload$PostInfo;
    .end local v17           #postResult:Lco/vine/android/service/PostResult;
    :catchall_0
    move-exception v23

    monitor-exit v24
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v23

    .line 696
    :cond_5
    :try_start_4
    const-string v23, "aUpload"

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_d

    .line 697
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #getter for: Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$300(Lco/vine/android/service/VineUploadService;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 699
    .local v14, original:Ljava/io/File;
    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v25, ".mp4"

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 700
    .local v6, encoded:Ljava/lang/String;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v23

    if-eqz v23, :cond_8

    .line 701
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lco/vine/android/recorder/HashAsyncTask;->getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 702
    .local v10, hash:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v9, v0, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    .line 703
    .local v9, expected:Ljava/lang/String;
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_7

    .line 704
    if-eqz v9, :cond_6

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v23

    if-eqz v23, :cond_6

    .line 705
    const-string v23, "Invalid hash: actual {}, expected {}."

    move-object/from16 v0, v23

    invoke-static {v0, v10, v9}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 706
    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :try_start_5
    monitor-exit v24
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 708
    :cond_6
    :try_start_6
    new-instance v23, Lco/vine/android/VineException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Expected hash was invalid: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v23 .. v23}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 711
    :cond_7
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v15

    .line 712
    .local v15, originalSize:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    .line 713
    .local v19, start:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mReference:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v23

    if-eqz v23, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mReference:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Lco/vine/android/recorder/RecordSessionManager;->readFrameInfo(Ljava/io/File;)Ljava/util/ArrayList;

    move-result-object v23

    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v23

    invoke-static {v0, v1, v6, v2}, Lco/vine/android/recorder/EncoderManager;->transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 716
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 717
    .local v7, end:J
    new-instance v23, Ljava/io/File;

    move-object/from16 v0, v23

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->length()J

    move-result-wide v12

    .line 718
    .local v12, newSize:J
    const-string v23, "Re-encoding took {} ms, compressed from {} to {}."

    sub-long v25, v7, v19

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v27

    invoke-static {v0, v1, v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 720
    new-instance v23, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    .line 721
    const-string v23, "Encoded file path: {}."

    move-object/from16 v0, v23

    invoke-static {v0, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 722
    invoke-static {v6}, Lco/vine/android/recorder/HashAsyncTask;->getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 723
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v25, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-static {v0, v1, v10}, Lco/vine/android/util/UploadManager;->setHash(Landroid/content/Context;Lco/vine/android/api/VineUpload;Ljava/lang/String;)V

    .line 727
    .end local v7           #end:J
    .end local v9           #expected:Ljava/lang/String;
    .end local v10           #hash:Ljava/lang/String;
    .end local v12           #newSize:J
    .end local v15           #originalSize:J
    .end local v19           #start:J
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->isCancelled()Z

    move-result v23

    if-eqz v23, :cond_a

    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    :try_start_7
    monitor-exit v24
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0

    .line 713
    .restart local v9       #expected:Ljava/lang/String;
    .restart local v10       #hash:Ljava/lang/String;
    .restart local v15       #originalSize:J
    .restart local v19       #start:J
    :cond_9
    const/16 v23, 0x0

    goto :goto_1

    .line 729
    .end local v9           #expected:Ljava/lang/String;
    .end local v10           #hash:Ljava/lang/String;
    .end local v15           #originalSize:J
    .end local v19           #start:J
    :cond_a
    :try_start_8
    new-instance v21, Ljava/io/File;

    move-object/from16 v0, v21

    invoke-direct {v0, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 730
    .local v21, toUpload:Ljava/io/File;
    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->length()J

    move-result-wide v25

    new-instance v23, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    move-object/from16 v27, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->length()J

    move-result-wide v27

    add-long v25, v25, v27

    move-wide/from16 v0, v25

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mSize:J

    .line 731
    const-string v23, "File to Upload {}, Size {}."

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mSize:J

    move-wide/from16 v25, v0

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    move-object/from16 v2, v25

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 732
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #getter for: Lco/vine/android/service/VineUploadService;->mUploadManager:Lco/vine/android/util/UploadManager;
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$100(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v6, v2, v3}, Lco/vine/android/util/UploadManager;->upload(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v22

    .line 736
    .local v22, uris:[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->isCancelled()Z

    move-result v23

    if-eqz v23, :cond_b

    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    :try_start_9
    monitor-exit v24
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0

    .line 738
    :cond_b
    if-eqz v22, :cond_e

    .line 739
    :try_start_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    #getter for: Lco/vine/android/service/VineUploadService;->mLock:[I
    invoke-static/range {v23 .. v23}, Lco/vine/android/service/VineUploadService;->access$400(Lco/vine/android/service/VineUploadService;)[I

    move-result-object v25

    monitor-enter v25
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 740
    :try_start_b
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v26, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lco/vine/android/util/UploadManager;->setUploadTime(Landroid/content/Context;Lco/vine/android/api/VineUpload;)V

    .line 741
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v26, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lco/vine/android/util/UploadManager;->setUris(Landroid/content/Context;Lco/vine/android/api/VineUpload;[Ljava/lang/String;)V

    .line 742
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    move/from16 v2, v27

    invoke-static {v0, v1, v2}, Lco/vine/android/util/UploadManager;->setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;I)V

    .line 743
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v23

    if-nez v23, :cond_c

    .line 744
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    move-object/from16 v23, v0

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsRetry:Z

    move/from16 v28, v0

    invoke-static/range {v26 .. v28}, Lco/vine/android/service/VineUploadService;->getPostIntent(Landroid/content/Context;Lco/vine/android/api/VineUpload;Z)Landroid/content/Intent;

    move-result-object v26

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineUploadService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 746
    :cond_c
    monitor-exit v25
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 747
    :try_start_c
    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    :try_start_d
    monitor-exit v24
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_0

    .line 746
    :catchall_1
    move-exception v23

    :try_start_e
    monitor-exit v25
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    :try_start_f
    throw v23
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    .line 753
    .end local v6           #encoded:Ljava/lang/String;
    .end local v14           #original:Ljava/io/File;
    .end local v21           #toUpload:Ljava/io/File;
    .end local v22           #uris:[Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 754
    .local v5, e:Ljava/lang/Exception;
    :try_start_10
    const-string v23, "Failed to upload."

    move-object/from16 v0, v23

    invoke-static {v0, v5}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 756
    .end local v5           #e:Ljava/lang/Exception;
    :cond_d
    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V

    monitor-exit v24
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    goto/16 :goto_0

    .line 749
    .restart local v6       #encoded:Ljava/lang/String;
    .restart local v14       #original:Ljava/io/File;
    .restart local v21       #toUpload:Ljava/io/File;
    .restart local v22       #uris:[Ljava/lang/String;
    :cond_e
    :try_start_11
    const-string v23, "Current status: {}"

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lco/vine/android/api/VineUpload;->status:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 750
    new-instance v17, Lco/vine/android/service/PostResult;

    const/16 v23, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_0

    :try_start_12
    monitor-exit v24
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto/16 :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 639
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->doInBackground([Ljava/lang/Void;)Lco/vine/android/service/PostResult;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 834
    if-ne p0, p1, :cond_1

    .line 844
    :cond_0
    :goto_0
    return v1

    .line 835
    :cond_1
    instance-of v3, p1, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    if-nez v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 837
    check-cast v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;

    .line 839
    .local v0, that:Lco/vine/android/service/VineUploadService$ServiceAsyncTask;
    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    move v1, v2

    .line 840
    goto :goto_0

    .line 839
    :cond_4
    iget-object v3, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 841
    :cond_5
    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    iget-object v4, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 842
    goto :goto_0

    .line 841
    :cond_6
    iget-object v3, v0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 806
    iget-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 849
    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 850
    .local v0, result:I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 851
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v1

    .line 849
    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 3

    .prologue
    .line 785
    const-string v0, "Task cancelled. {}, {}."

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 786
    iget-boolean v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsDiscarded:Z

    if-nez v0, :cond_0

    .line 787
    iget-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    #calls: Lco/vine/android/service/VineUploadService;->discardUpload(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lco/vine/android/service/VineUploadService;->access$500(Lco/vine/android/service/VineUploadService;Ljava/lang/String;)V

    .line 789
    :cond_0
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->onComplete()V

    .line 790
    return-void
.end method

.method protected onPostExecute(Lco/vine/android/service/PostResult;)V
    .locals 5
    .parameter "result"

    .prologue
    const/4 v4, 0x2

    .line 762
    iget-boolean v0, p1, Lco/vine/android/service/PostResult;->success:Z

    .line 763
    .local v0, taskSuccessful:Z
    iget-boolean v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsDiscarded:Z

    if-nez v1, :cond_1

    .line 764
    if-eqz v0, :cond_3

    .line 765
    iput v4, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mExecutionStatus:I

    .line 766
    const-string v1, "aUpload"

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    iget-object v1, v1, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 767
    const/4 v1, 0x3

    iput v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mExecutionStatus:I

    .line 779
    :cond_0
    :goto_0
    invoke-direct {p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->onComplete()V

    .line 781
    :cond_1
    return-void

    .line 768
    :cond_2
    const-string v1, "bPost"

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->action:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 769
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    #calls: Lco/vine/android/service/VineUploadService;->discardUpload(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lco/vine/android/service/VineUploadService;->access$500(Lco/vine/android/service/VineUploadService;Ljava/lang/String;)V

    goto :goto_0

    .line 772
    :cond_3
    const/4 v1, 0x1

    iput v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mExecutionStatus:I

    .line 773
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    invoke-virtual {p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/service/VineUploadService;->getNotifyFailedIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/service/VineUploadService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 774
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    if-eqz v1, :cond_0

    .line 775
    invoke-virtual {p0}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mUpload:Lco/vine/android/api/VineUpload;

    iget-object v3, p1, Lco/vine/android/service/PostResult;->captchaUrl:Ljava/lang/String;

    invoke-static {v1, v2, v4, v3}, Lco/vine/android/util/UploadManager;->setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;ILjava/lang/String;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 639
    check-cast p1, Lco/vine/android/service/PostResult;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->onPostExecute(Lco/vine/android/service/PostResult;)V

    return-void
.end method

.method public progressChanged(Lco/vine/android/util/VineProgressEvent;)V
    .locals 5
    .parameter "progressEvent"

    .prologue
    .line 811
    iget-wide v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mCurrentSize:J

    invoke-virtual {p1}, Lco/vine/android/util/VineProgressEvent;->getBytesTransfered()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mCurrentSize:J

    .line 812
    iget-wide v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mCurrentSize:J

    const-wide/16 v3, 0x64

    mul-long/2addr v1, v3

    iget-wide v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mSize:J

    div-long/2addr v1, v3

    long-to-int v0, v1

    .line 813
    .local v0, p:I
    iget v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mLastProgress:I

    sub-int/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_0

    .line 814
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    #getter for: Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static {v1}, Lco/vine/android/service/VineUploadService;->access$300(Lco/vine/android/service/VineUploadService;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    iget-object v3, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    #calls: Lco/vine/android/service/VineUploadService;->updateUploadProgress(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v1, v2, v3}, Lco/vine/android/service/VineUploadService;->access$900(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    :cond_0
    return-void
.end method

.method public setIsDiscarded(Z)V
    .locals 0
    .parameter "isDiscarded"

    .prologue
    .line 855
    iput-boolean p1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mIsDiscarded:Z

    .line 856
    return-void
.end method

.method public updateLastProcess(I)V
    .locals 0
    .parameter "p"

    .prologue
    .line 829
    iput p1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mLastProgress:I

    .line 830
    return-void
.end method

.method public updateProgress(I)V
    .locals 3
    .parameter "p"

    .prologue
    .line 820
    iget v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mLastProgress:I

    sub-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_0

    .line 821
    iput p1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mLastProgress:I

    .line 822
    iget-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    #getter for: Lco/vine/android/service/VineUploadService;->mProgressMap:Ljava/util/concurrent/ConcurrentHashMap;
    invoke-static {v0}, Lco/vine/android/service/VineUploadService;->access$300(Lco/vine/android/service/VineUploadService;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    iget-object v0, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->this$0:Lco/vine/android/service/VineUploadService;

    iget-object v1, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->path:Ljava/lang/String;

    iget-object v2, p0, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->mThumbnail:Ljava/lang/String;

    #calls: Lco/vine/android/service/VineUploadService;->updateTranscodeProgress(Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2}, Lco/vine/android/service/VineUploadService;->access$1000(Lco/vine/android/service/VineUploadService;Ljava/lang/String;Ljava/lang/String;)V

    .line 825
    :cond_0
    return-void
.end method
