.class Lco/vine/android/recorder/VineRecorder$5;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->onDeviceNotSupported(Ljava/lang/Throwable;)V
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
    .line 485
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 488
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$5;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1600(Lco/vine/android/recorder/VineRecorder;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/VineRecorder$5$1;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$5$1;-><init>(Lco/vine/android/recorder/VineRecorder$5;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 497
    return-void
.end method
