.class public Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;
.super Ljava/lang/Object;
.source "RecordingFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/RecordingFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OnRecordingFinishRunnable"
.end annotation


# instance fields
.field private mFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/RecordingFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/RecordingFragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 655
    .local p1, fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/RecordingFragment;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 656
    iput-object p1, p0, Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;->mFragment:Ljava/lang/ref/WeakReference;

    .line 657
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 660
    iget-object v1, p0, Lco/vine/android/RecordingFragment$OnRecordingFinishRunnable;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/RecordingFragment;

    .line 661
    .local v0, fragment:Lco/vine/android/RecordingFragment;
    if-eqz v0, :cond_0

    .line 662
    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v1

    iget-object v1, v1, Lco/vine/android/recorder/VineRecorder;->finalFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v1, :cond_0

    .line 663
    const-string v1, "OnRecordingFinishRunnable"

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v2

    iget-boolean v2, v2, Lco/vine/android/recorder/VineRecorder;->detectedInvalidSession:Z

    #calls: Lco/vine/android/RecordingFragment;->notifyActivity(Ljava/lang/String;Z)V
    invoke-static {v0, v1, v2}, Lco/vine/android/RecordingFragment;->access$1000(Lco/vine/android/RecordingFragment;Ljava/lang/String;Z)V

    .line 666
    :cond_0
    return-void
.end method
