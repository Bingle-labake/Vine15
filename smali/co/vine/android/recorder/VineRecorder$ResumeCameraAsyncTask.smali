.class Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
.super Landroid/os/AsyncTask;
.source "VineRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResumeCameraAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mSwitchCamera:Z

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter
    .parameter "switchCamera"

    .prologue
    .line 1420
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1421
    iput-boolean p2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->mSwitchCamera:Z

    .line 1422
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1416
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 6
    .parameter "params"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1426
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->canSwitchCamera()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v4}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->isRecording()Z

    move-result v4

    if-nez v4, :cond_3

    iget-boolean v4, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->mSwitchCamera:Z

    if-nez v4, :cond_3

    .line 1428
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 1429
    iget-boolean v4, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->mSwitchCamera:Z

    if-eqz v4, :cond_1

    .line 1430
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z
    invoke-static {v5}, Lco/vine/android/recorder/VineRecorder;->access$900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v5

    if-nez v5, :cond_4

    :goto_0
    #setter for: Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z
    invoke-static {v4, v2}, Lco/vine/android/recorder/VineRecorder;->access$902(Lco/vine/android/recorder/VineRecorder;Z)Z

    .line 1432
    :cond_1
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lco/vine/android/recorder/RecordController;->openDefaultCamera(ZZ)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1433
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v1

    .line 1434
    .local v1, setting:Lco/vine/android/recorder/CameraSetting;
    if-eqz v1, :cond_2

    .line 1435
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    iget v3, v1, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    #setter for: Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I
    invoke-static {v2, v3}, Lco/vine/android/recorder/VineRecorder;->access$3702(Lco/vine/android/recorder/VineRecorder;I)I

    .line 1437
    :cond_2
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    const-string v3, "Switch camera"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lco/vine/android/recorder/VineRecorder;->start(Ljava/lang/String;Z)V

    .line 1446
    .end local v1           #setting:Lco/vine/android/recorder/CameraSetting;
    :cond_3
    :goto_1
    const/4 v2, 0x0

    return-object v2

    :cond_4
    move v2, v3

    .line 1430
    goto :goto_0

    .line 1439
    :cond_5
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #calls: Lco/vine/android/recorder/VineRecorder;->showCameraFailedToast()V
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$3800(Lco/vine/android/recorder/VineRecorder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1441
    :catch_0
    move-exception v0

    .line 1443
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "Error on cancel camera switching."

    invoke-static {v2, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1416
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2
    .parameter "aVoid"

    .prologue
    .line 1460
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 1461
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$202(Lco/vine/android/recorder/VineRecorder;Z)Z

    .line 1462
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$3900(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1463
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$3900(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1465
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$402(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;)Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    .line 1466
    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 1451
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 1452
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$202(Lco/vine/android/recorder/VineRecorder;Z)Z

    .line 1453
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$3900(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1454
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$3900(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 1456
    :cond_0
    return-void
.end method
