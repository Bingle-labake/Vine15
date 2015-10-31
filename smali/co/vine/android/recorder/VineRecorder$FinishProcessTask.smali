.class public Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
.super Landroid/os/AsyncTask;
.source "VineRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FinishProcessTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mCurrentMessage:I

.field private mWaitStartTime:J

.field public final onComplete:Ljava/lang/Runnable;

.field public final releasePreview:Z

.field public final saveSession:Z

.field private final tag:Ljava/lang/String;

.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;Ljava/lang/Runnable;ZZ)V
    .locals 0
    .parameter
    .parameter "tag"
    .parameter "onComplete"
    .parameter "releasePreview"
    .parameter "saveSession"

    .prologue
    .line 1873
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1874
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->tag:Ljava/lang/String;

    .line 1875
    iput-object p3, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->onComplete:Ljava/lang/Runnable;

    .line 1876
    iput-boolean p4, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->releasePreview:Z

    .line 1877
    iput-boolean p5, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->saveSession:Z

    .line 1878
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1864
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .parameter "params"

    .prologue
    .line 1921
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$5400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->tag:Ljava/lang/String;

    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->releasePreview:Z

    iget-boolean v3, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->saveSession:Z

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->run(Ljava/lang/String;ZZ)V

    .line 1922
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1864
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 6
    .parameter "aVoid"

    .prologue
    .line 1908
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 1909
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$5200(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 1910
    .local v0, dialog:Landroid/app/ProgressDialog;
    if-eqz v0, :cond_0

    .line 1911
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 1913
    :cond_0
    const-string v1, "Waited for {} ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mWaitStartTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1914
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->onComplete:Ljava/lang/Runnable;

    if-eqz v1, :cond_1

    .line 1915
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->onComplete:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 1917
    :cond_1
    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 1882
    const/4 v0, 0x1

    iput v0, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    .line 1883
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mWaitStartTime:J

    .line 1884
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 5
    .parameter "values"

    .prologue
    const/4 v4, 0x0

    .line 1888
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$5200(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 1889
    .local v0, dialog:Landroid/app/ProgressDialog;
    if-eqz v0, :cond_2

    .line 1890
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;

    move-result-object v1

    array-length v1, v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_1

    .line 1891
    aget-object v1, p1, v4

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x64

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;
    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;

    move-result-object v3

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    div-int/2addr v2, v3

    iget v3, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    mul-int/2addr v2, v3

    if-lt v1, v2, :cond_1

    .line 1892
    iget v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;
    invoke-static {v2}, Lco/vine/android/recorder/VineRecorder;->access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 1893
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;

    move-result-object v1

    iget v2, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1895
    :cond_0
    iget v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->mCurrentMessage:I

    .line 1898
    :cond_1
    aget-object v1, p1, v4

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1900
    :cond_2
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 1864
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public publish(I)V
    .locals 3
    .parameter "value"

    .prologue
    .line 1903
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publishProgress([Ljava/lang/Object;)V

    .line 1904
    return-void
.end method
