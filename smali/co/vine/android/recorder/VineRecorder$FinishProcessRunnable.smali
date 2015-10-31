.class Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;
.super Ljava/lang/Object;
.source "VineRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FinishProcessRunnable"
.end annotation


# instance fields
.field private isResumed:Z

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method private constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 1254
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1254
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    return-void
.end method


# virtual methods
.method public reset()V
    .locals 1

    .prologue
    .line 1259
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->isResumed:Z

    .line 1260
    return-void
.end method

.method public declared-synchronized run(Ljava/lang/String;ZZ)V
    .locals 12
    .parameter "tag"
    .parameter "releasePreview"
    .parameter "saveSession"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1263
    monitor-enter p0

    :try_start_0
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v8

    invoke-virtual {v8}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v5

    .line 1264
    .local v5, wasRecordingStarted:Z
    const-string v8, "Stop recording in VineRecorder from {} : wasRecordingStarted {} releasePreview {} saveSession {} mDiscardChanges {} mDoNotDeleteSession {} mCurrentRecordingFile {}"

    const/4 v9, 0x7

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    const/4 v10, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x4

    iget-object v11, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-boolean v11, v11, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x5

    iget-object v11, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z
    invoke-static {v11}, Lco/vine/android/recorder/VineRecorder;->access$2900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x6

    iget-object v11, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v11}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1265
    if-eqz v5, :cond_0

    .line 1266
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->endRelativeTime()Z
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$2800(Lco/vine/android/recorder/VineRecorder;)Z

    .line 1267
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    new-instance v9, Lco/vine/android/recorder/RecordSegment;

    iget-object v10, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-wide v10, v10, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    invoke-direct {v9, v10, v11}, Lco/vine/android/recorder/RecordSegment;-><init>(J)V

    #setter for: Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v8, v9}, Lco/vine/android/recorder/VineRecorder;->access$3102(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;

    .line 1268
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v8

    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-boolean v9, v9, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    invoke-virtual {v8, v9, p2}, Lco/vine/android/recorder/RecordController;->stop(ZZ)V

    .line 1270
    :cond_0
    if-nez v5, :cond_1

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mInitiallyStartedWithEditMode:Z
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$3200(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 1271
    :cond_1
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v3

    .line 1272
    .local v3, recordingFile:Lco/vine/android/recorder/RecordingFile;
    if-nez v3, :cond_3

    .line 1273
    new-instance v6, Lco/vine/android/VineException;

    const-string v7, "Failed to stop recording."

    invoke-direct {v6, v7}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1335
    .end local v3           #recordingFile:Lco/vine/android/recorder/RecordingFile;
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 1276
    .restart local v3       #recordingFile:Lco/vine/android/recorder/RecordingFile;
    :cond_3
    :try_start_1
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v4

    .line 1277
    .local v4, session:Lco/vine/android/recorder/RecordSession;
    invoke-virtual {v4}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v8

    invoke-virtual {v4, v8}, Lco/vine/android/recorder/RecordSession;->setAudioDataCount(I)V

    .line 1278
    invoke-virtual {v4}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v8

    invoke-virtual {v4, v8}, Lco/vine/android/recorder/RecordSession;->setVideoDataCount(I)V

    .line 1279
    const/4 v2, 0x1

    .line 1280
    .local v2, isValidSession:Z
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-boolean v8, v8, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    if-nez v8, :cond_f

    .line 1281
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinished:Z
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$3300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordingFile;->hasData()Z

    move-result v8

    if-eqz v8, :cond_9

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v8}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v8

    if-nez v8, :cond_9

    move v1, v6

    .line 1282
    .local v1, isFinishing:Z
    :goto_1
    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    if-nez v1, :cond_4

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mInitiallyStartedWithEditMode:Z
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$3200(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v8

    if-eqz v8, :cond_a

    :cond_4
    move v8, v6

    :goto_2
    #setter for: Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z
    invoke-static {v9, v8}, Lco/vine/android/recorder/VineRecorder;->access$2902(Lco/vine/android/recorder/VineRecorder;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1284
    :try_start_2
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$1900(Lco/vine/android/recorder/VineRecorder;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_b

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordSession;->getVideoDataCount()I

    move-result v8

    if-lez v8, :cond_b

    move v2, v6

    .line 1285
    :goto_3
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$1900(Lco/vine/android/recorder/VineRecorder;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_5

    if-nez v2, :cond_5

    .line 1286
    new-instance v8, Lco/vine/android/VineException;

    const-string v9, "Invalid session found, not sure why this happened."

    invoke-direct {v8, v9}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 1288
    :cond_5
    if-eqz v2, :cond_c

    .line 1289
    invoke-static {v3, p3}, Lco/vine/android/recorder/RecordSessionManager;->writeRecordingFile(Lco/vine/android/recorder/RecordingFile;Z)V

    .line 1295
    :cond_6
    :goto_4
    if-eqz p3, :cond_8

    .line 1296
    iget-boolean v8, v3, Lco/vine/android/recorder/RecordingFile;->isLastSession:Z

    if-nez v8, :cond_7

    .line 1297
    const/4 v8, 0x1

    iput-boolean v8, v3, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z

    .line 1298
    const/4 v8, 0x0

    iput-boolean v8, v3, Lco/vine/android/recorder/RecordingFile;->isDirty:Z

    .line 1300
    :cond_7
    if-eqz v2, :cond_8

    .line 1301
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lco/vine/android/recorder/VineRecorder;->cleanThumbnails(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1313
    :cond_8
    :goto_5
    if-eqz v1, :cond_2

    .line 1314
    :try_start_3
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    if-nez v2, :cond_e

    :goto_6
    #calls: Lco/vine/android/recorder/VineRecorder;->startHashTask(Z)V
    invoke-static {v8, v6}, Lco/vine/android/recorder/VineRecorder;->access$3400(Lco/vine/android/recorder/VineRecorder;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 1263
    .end local v1           #isFinishing:Z
    .end local v2           #isValidSession:Z
    .end local v3           #recordingFile:Lco/vine/android/recorder/RecordingFile;
    .end local v4           #session:Lco/vine/android/recorder/RecordSession;
    .end local v5           #wasRecordingStarted:Z
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .restart local v2       #isValidSession:Z
    .restart local v3       #recordingFile:Lco/vine/android/recorder/RecordingFile;
    .restart local v4       #session:Lco/vine/android/recorder/RecordSession;
    .restart local v5       #wasRecordingStarted:Z
    :cond_9
    move v1, v7

    .line 1281
    goto :goto_1

    .restart local v1       #isFinishing:Z
    :cond_a
    move v8, v7

    .line 1282
    goto :goto_2

    :cond_b
    move v2, v7

    .line 1284
    goto :goto_3

    .line 1291
    :cond_c
    :try_start_4
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v8

    if-nez v8, :cond_6

    .line 1292
    iget-object v8, v3, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    const-string v9, "Invalid session."

    invoke-static {v8, v9}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_4

    .line 1306
    :catch_0
    move-exception v0

    .line 1307
    .local v0, e:Ljava/io/IOException;
    if-eqz p3, :cond_d

    .line 1308
    :try_start_5
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 1310
    :cond_d
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_5

    .end local v0           #e:Ljava/io/IOException;
    :cond_e
    move v6, v7

    .line 1314
    goto :goto_6

    .line 1317
    .end local v1           #isFinishing:Z
    :cond_f
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$2900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v6

    if-nez v6, :cond_10

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v6

    iget-boolean v6, v6, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-nez v6, :cond_10

    .line 1319
    :try_start_6
    const-string v6, "Session {} deleted."

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v9}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v9

    iget-object v9, v9, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1320
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v6

    iget-object v6, v6, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    const-string v7, "Discard Changes."

    invoke-static {v6, v7}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    .line 1325
    :cond_10
    :goto_7
    :try_start_7
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3500(Lco/vine/android/recorder/VineRecorder;)Ljava/util/HashSet;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/HashSet;->clear()V

    goto/16 :goto_0

    .line 1321
    :catch_1
    move-exception v0

    .line 1322
    .restart local v0       #e:Ljava/io/IOException;
    const-string v6, "Failed to delete session."

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0, v6, v7}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_7

    .line 1328
    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #isValidSession:Z
    .end local v3           #recordingFile:Lco/vine/android/recorder/RecordingFile;
    .end local v4           #session:Lco/vine/android/recorder/RecordSession;
    :cond_11
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinished:Z
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v6}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1329
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/ReusableHashAsyncTask;->isComplete()Z

    move-result v6

    if-nez v6, :cond_2

    iget-boolean v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->isResumed:Z

    if-nez v6, :cond_2

    .line 1330
    const/4 v6, 0x1

    iput-boolean v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->isResumed:Z

    .line 1331
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/ReusableHashAsyncTask;->resumeAll()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0
.end method
