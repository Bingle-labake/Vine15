.class Lco/vine/android/recorder/VineRecorder$5$1;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/vine/android/recorder/VineRecorder$5;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder$5;)V
    .locals 0
    .parameter

    .prologue
    .line 488
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$5$1;->this$1:Lco/vine/android/recorder/VineRecorder$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 491
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$5$1;->this$1:Lco/vine/android/recorder/VineRecorder$5;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 492
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$5$1;->this$1:Lco/vine/android/recorder/VineRecorder$5;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$5$1;->this$1:Lco/vine/android/recorder/VineRecorder$5;

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mDeviceNotSupportedString:Ljava/lang/String;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$1500(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 493
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$5$1;->this$1:Lco/vine/android/recorder/VineRecorder$5;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 495
    :cond_0
    return-void
.end method
