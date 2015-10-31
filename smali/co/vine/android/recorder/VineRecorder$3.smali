.class Lco/vine/android/recorder/VineRecorder$3;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 209
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    const/4 v4, 0x0

    .line 212
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$200(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$300(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder;->canSwitchCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 215
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;-><init>(Lco/vine/android/recorder/VineRecorder;Z)V

    #setter for: Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
    invoke-static {v0, v1}, Lco/vine/android/recorder/VineRecorder;->access$402(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;)Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    .line 216
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$3;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    move-result-object v0

    new-array v1, v4, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 218
    :cond_1
    new-instance v0, Lco/vine/android/VineException;

    const-string v1, "You can not switch camera after recording has started."

    invoke-direct {v0, v1}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    const-string v1, "Person trying to record and switch? not cool."

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method
