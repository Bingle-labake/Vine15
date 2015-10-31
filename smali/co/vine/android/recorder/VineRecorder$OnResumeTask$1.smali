.class Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder$OnResumeTask;)V
    .locals 0
    .parameter

    .prologue
    .line 2495
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialogInterface"

    .prologue
    .line 2498
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->cancel(Z)Z

    .line 2499
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2500
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$OnResumeTask$1;->this$1:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 2502
    :cond_0
    return-void
.end method
