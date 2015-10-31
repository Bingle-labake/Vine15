.class Lco/vine/android/recorder/VineRecorder$OnResumeTask;
.super Landroid/os/AsyncTask;
.source "VineRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnResumeTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/CharSequence;",
        "Lco/vine/android/recorder/RecordingFile;",
        ">;"
    }
.end annotation


# instance fields
.field public isRunning:Z

.field private final mClicker:Landroid/view/View;

.field private final mTag:Ljava/lang/String;

.field public showDialogDelayed:Z

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/VineRecorder;Landroid/view/View;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "view"
    .parameter "tag"

    .prologue
    .line 2399
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2400
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mClicker:Landroid/view/View;

    .line 2401
    iput-object p3, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mTag:Ljava/lang/String;

    .line 2402
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lco/vine/android/recorder/RecordingFile;
    .locals 11
    .parameter "params"

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 2418
    const-string v6, "OnResume task started from {}."

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mTag:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2419
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v2

    .line 2420
    .local v2, controller:Lco/vine/android/recorder/RecordController;
    if-nez v2, :cond_1

    .line 2481
    :cond_0
    :goto_0
    return-object v5

    .line 2423
    :cond_1
    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->wasEncodingThreadRunning()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2424
    new-array v6, v10, [Ljava/lang/CharSequence;

    iget-object v7, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishLastSegmentString:Ljava/lang/CharSequence;
    invoke-static {v7}, Lco/vine/android/recorder/VineRecorder;->access$7000(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v6}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->publishProgress([Ljava/lang/Object;)V

    .line 2426
    :try_start_0
    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->finishLastIfNeeded()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2430
    :goto_1
    new-array v6, v10, [Ljava/lang/CharSequence;

    iget-object v7, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialogMessage:Ljava/lang/CharSequence;
    invoke-static {v7}, Lco/vine/android/recorder/VineRecorder;->access$7100(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v6}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->publishProgress([Ljava/lang/Object;)V

    .line 2432
    :cond_2
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->stopProgressTimer()V
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7200(Lco/vine/android/recorder/VineRecorder;)V

    .line 2433
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v6}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 2434
    const-string v6, "Async open camera"

    invoke-static {v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 2435
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v6

    invoke-virtual {v2, v6, v9}, Lco/vine/android/recorder/RecordController;->openDefaultCamera(ZZ)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2436
    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v3

    .line 2437
    .local v3, cs:Lco/vine/android/recorder/CameraSetting;
    if-eqz v3, :cond_3

    .line 2438
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget v7, v3, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    #setter for: Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I
    invoke-static {v6, v7}, Lco/vine/android/recorder/VineRecorder;->access$3702(Lco/vine/android/recorder/VineRecorder;I)I

    .line 2440
    :cond_3
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 2441
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/ReusableHashAsyncTask;->reset()V

    .line 2443
    :cond_4
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->startProgressTimer()V
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7300(Lco/vine/android/recorder/VineRecorder;)V

    .line 2444
    const-string v6, "Open camera successful: {} fps."

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I
    invoke-static {v8}, Lco/vine/android/recorder/VineRecorder;->access$3700(Lco/vine/android/recorder/VineRecorder;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2445
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 2448
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    .line 2450
    .local v1, config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    :goto_2
    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-wide v6, v6, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    iget v8, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isAudioReady()Z

    move-result v6

    if-nez v6, :cond_0

    .line 2452
    const-string v6, "Wait for audio to be ready."

    invoke-static {v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 2453
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isCancelled()Z

    move-result v6

    if-nez v6, :cond_0

    .line 2457
    const-wide/16 v6, 0x64

    :try_start_1
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2461
    :goto_3
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;

    move-result-object v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$7400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    .line 2462
    :goto_4
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v2

    goto :goto_2

    .line 2427
    .end local v1           #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .end local v3           #cs:Lco/vine/android/recorder/CameraSetting;
    :catch_0
    move-exception v4

    .line 2428
    .local v4, e:Ljava/lang/Exception;
    const-string v6, "Failed to finish last one."

    new-array v7, v9, [Ljava/lang/Object;

    invoke-static {v4, v6, v7}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    .end local v4           #e:Ljava/lang/Exception;
    .restart local v1       #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .restart local v3       #cs:Lco/vine/android/recorder/CameraSetting;
    :cond_5
    move-object v1, v5

    .line 2461
    goto :goto_4

    .line 2465
    .end local v1           #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .end local v3           #cs:Lco/vine/android/recorder/CameraSetting;
    :cond_6
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isCancelled()Z

    move-result v6

    if-nez v6, :cond_0

    .line 2466
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->showCameraFailedToast()V
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3800(Lco/vine/android/recorder/VineRecorder;)V

    goto/16 :goto_0

    .line 2470
    :cond_7
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    .line 2471
    .local v0, activity:Landroid/app/Activity;
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    if-eqz v6, :cond_8

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/ReusableHashAsyncTask;->isComplete()Z

    move-result v6

    if-eqz v6, :cond_8

    if-eqz v0, :cond_8

    .line 2472
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 2474
    :cond_8
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    if-eqz v6, :cond_9

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v6}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/recorder/ReusableHashAsyncTask;->getComputedFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v6

    if-eqz v6, :cond_9

    .line 2475
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/recorder/ReusableHashAsyncTask;->getComputedFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v5

    goto/16 :goto_0

    .line 2477
    :cond_9
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->startHashTask(Z)V
    invoke-static {v6, v9}, Lco/vine/android/recorder/VineRecorder;->access$3400(Lco/vine/android/recorder/VineRecorder;Z)V

    goto/16 :goto_0

    .line 2458
    .end local v0           #activity:Landroid/app/Activity;
    .restart local v1       #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .restart local v3       #cs:Lco/vine/android/recorder/CameraSetting;
    :catch_1
    move-exception v6

    goto :goto_3
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2390
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->doInBackground([Ljava/lang/Void;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lco/vine/android/recorder/RecordingFile;)V
    .locals 2
    .parameter "needHashTask"

    .prologue
    .line 2534
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isRunning:Z

    .line 2535
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mClicker:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 2536
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mClicker:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 2538
    :cond_0
    if-eqz p1, :cond_1

    .line 2539
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/ReusableHashAsyncTask;->resumeAll()V

    .line 2541
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2547
    :cond_2
    :goto_0
    return-void

    .line 2544
    :cond_3
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 2545
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 2390
    check-cast p1, Lco/vine/android/recorder/RecordingFile;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->onPostExecute(Lco/vine/android/recorder/RecordingFile;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 2486
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mClicker:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 2487
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->mClicker:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 2489
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2490
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2491
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 2492
    .local v0, dialog:Landroid/app/ProgressDialog;
    if-eqz v0, :cond_1

    .line 2493
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialogMessage:Ljava/lang/CharSequence;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$7100(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 2494
    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 2495
    new-instance v1, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;-><init>(Lco/vine/android/recorder/VineRecorder$OnResumeTask;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 2504
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2506
    :try_start_0
    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->showDialogDelayed:Z

    if-eqz v1, :cond_2

    .line 2507
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isRunning:Z

    .line 2508
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$1600(Lco/vine/android/recorder/VineRecorder;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;

    invoke-direct {v2, p0, v0}, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;-><init>(Lco/vine/android/recorder/VineRecorder$OnResumeTask;Landroid/app/ProgressDialog;)V

    const-wide/16 v3, 0x3e8

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2530
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :cond_1
    :goto_0
    return-void

    .line 2521
    .restart local v0       #dialog:Landroid/app/ProgressDialog;
    :cond_2
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2523
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method protected varargs onProgressUpdate([Ljava/lang/CharSequence;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 2406
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2407
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->showDialogDelayed:Z

    if-nez v0, :cond_0

    .line 2408
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2409
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 2412
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 2414
    :cond_1
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 2390
    check-cast p1, [Ljava/lang/CharSequence;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->onProgressUpdate([Ljava/lang/CharSequence;)V

    return-void
.end method
