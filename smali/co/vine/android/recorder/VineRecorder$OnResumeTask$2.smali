.class Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder$OnResumeTask;->onPreExecute()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

.field final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder$OnResumeTask;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 2508
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;->val$dialog:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2511
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    iget-boolean v0, v0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isRunning:Z

    if-eqz v0, :cond_0

    .line 2513
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$2;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2518
    :cond_0
    :goto_0
    return-void

    .line 2514
    :catch_0
    move-exception v0

    goto :goto_0
.end method
