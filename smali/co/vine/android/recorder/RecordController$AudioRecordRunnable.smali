.class public Lco/vine/android/recorder/RecordController$AudioRecordRunnable;
.super Ljava/lang/Object;
.source "RecordController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/RecordController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioRecordRunnable"
.end annotation


# instance fields
.field public forceQuit:Z

.field public volatile isInitialized:Z

.field private final mAudioDataBuffer:[S

.field private final mAudioRecord:Landroid/media/AudioRecord;

.field private mCount:I

.field private final mOutput:Ljava/lang/String;

.field final synthetic this$0:Lco/vine/android/recorder/RecordController;


# direct methods
.method private constructor <init>(Lco/vine/android/recorder/RecordController;Ljava/lang/String;I)V
    .locals 6
    .parameter
    .parameter "file"
    .parameter "initialCount"

    .prologue
    .line 830
    iput-object p1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 820
    sget v0, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_RUNNABLE_SAMPLE_SIZE:I

    new-array v0, v0, [S

    iput-object v0, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    .line 821
    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    const v2, 0xac44

    const/16 v3, 0x10

    const/4 v4, 0x2

    sget v5, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_RUNNABLE_SAMPLE_SIZE:I

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object v0, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    .line 831
    iput p3, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    .line 832
    iput-object p2, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mOutput:Ljava/lang/String;

    .line 833
    const-string v0, "Buffer size {}."

    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    array-length v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 834
    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/recorder/RecordController;Ljava/lang/String;ILco/vine/android/recorder/RecordController$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 818
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;-><init>(Lco/vine/android/recorder/RecordController;Ljava/lang/String;I)V

    return-void
.end method

.method private record(Lco/vine/android/recorder/RecordSegment;Ljava/nio/ShortBuffer;)V
    .locals 3
    .parameter "segment"
    .parameter "buffer"

    .prologue
    .line 847
    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->limit()I

    move-result v0

    .line 848
    .local v0, count:I
    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioDataBufferMax:[S
    invoke-static {v1}, Lco/vine/android/recorder/RecordController;->access$500(Lco/vine/android/recorder/RecordController;)[S

    move-result-object v1

    iget v2, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    invoke-virtual {p2, v1, v2, v0}, Ljava/nio/ShortBuffer;->get([SII)Ljava/nio/ShortBuffer;

    .line 849
    new-instance v1, Lco/vine/android/recorder/AudioData;

    iget v2, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    invoke-direct {v1, v2, v0}, Lco/vine/android/recorder/AudioData;-><init>(II)V

    invoke-virtual {p1, v1}, Lco/vine/android/recorder/RecordSegment;->addAudioData(Lco/vine/android/recorder/AudioData;)V

    .line 850
    iget v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    add-int/2addr v1, v0

    iput v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    .line 851
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 855
    const/16 v4, -0x13

    invoke-static {v4}, Landroid/os/Process;->setThreadPriority(I)V

    .line 856
    const-string v4, "mAudioRecord.startRecording()"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 857
    iput-boolean v8, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    .line 858
    :goto_0
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v4}, Landroid/media/AudioRecord;->getState()I

    move-result v4

    if-nez v4, :cond_0

    .line 860
    const-wide/16 v4, 0x64

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 861
    :catch_0
    move-exception v4

    goto :goto_0

    .line 865
    :cond_0
    iput-boolean v9, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    .line 866
    const-string v4, "mAudioRecord.isInitialized: {}."

    new-array v5, v9, [Ljava/lang/Object;

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mOutput:Ljava/lang/String;

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 867
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v4}, Landroid/media/AudioRecord;->startRecording()V

    .line 872
    :cond_1
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mRunAudioThread:Z
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$600(Lco/vine/android/recorder/RecordController;)Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$700(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v4

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v6}, Lco/vine/android/recorder/RecordController;->access$300(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_3

    :cond_2
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mIsRecordingEnded:Z
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$800(Lco/vine/android/recorder/RecordController;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 873
    iget-boolean v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->forceQuit:Z

    if-eqz v4, :cond_4

    .line 910
    :cond_3
    :goto_1
    const-string v4, "AudioThread Finished, release mAudioRecord"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 911
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v4}, Landroid/media/AudioRecord;->stop()V

    .line 912
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v4}, Landroid/media/AudioRecord;->release()V

    .line 913
    iput-boolean v8, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->isInitialized:Z

    .line 914
    const-string v4, "mAudioRecord released: {}."

    new-array v5, v9, [Ljava/lang/Object;

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mOutput:Ljava/lang/String;

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 915
    return-void

    .line 876
    :cond_4
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->updateTimestamp()V

    .line 877
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioRecord:Landroid/media/AudioRecord;

    iget-object v5, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    array-length v6, v6

    invoke-virtual {v4, v5, v8, v6}, Landroid/media/AudioRecord;->read([SII)I

    move-result v0

    .line 878
    .local v0, bufferReadResult:I
    if-lez v0, :cond_1

    .line 879
    move v3, v0

    .line 881
    .local v3, shouldPut:I
    if-lez v3, :cond_1

    .line 882
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$900(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;

    move-result-object v2

    .line 883
    .local v2, segment:Lco/vine/android/recorder/RecordSegment;
    if-eqz v2, :cond_6

    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->recordingAudio:Z
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$1000(Lco/vine/android/recorder/RecordController;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 884
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    invoke-static {v4, v8, v3}, Ljava/nio/ShortBuffer;->wrap([SII)Ljava/nio/ShortBuffer;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->record(Lco/vine/android/recorder/RecordSegment;Ljava/nio/ShortBuffer;)V

    .line 885
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #setter for: Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v4, v2}, Lco/vine/android/recorder/RecordController;->access$1102(Lco/vine/android/recorder/RecordController;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;

    .line 899
    :cond_5
    :goto_2
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    iget-object v4, v4, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    if-eqz v4, :cond_3

    .line 902
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    iget-object v4, v4, Lco/vine/android/recorder/RecordController;->mParent:Lco/vine/android/recorder/VineRecorder;

    invoke-virtual {v4}, Lco/vine/android/recorder/VineRecorder;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    .line 903
    .local v1, config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    if-eqz v1, :cond_3

    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$300(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v4

    iget v6, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    goto :goto_1

    .line 887
    .end local v1           #config:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    :cond_6
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mLastAudioRecordingSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$1100(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;

    move-result-object v2

    .line 888
    if-nez v2, :cond_7

    .line 889
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mLastVideoSegment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$1200(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/RecordSegment;

    move-result-object v2

    .line 891
    :cond_7
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J
    invoke-static {v4}, Lco/vine/android/recorder/RecordController;->access$700(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v4

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v6}, Lco/vine/android/recorder/RecordController;->access$300(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_5

    .line 892
    if-nez v2, :cond_8

    .line 893
    const-string v4, "Recording have not started yet? {} vs {}."

    iget-object v5, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mVideoTimestamp:J
    invoke-static {v5}, Lco/vine/android/recorder/RecordController;->access$700(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    iget-object v6, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v6}, Lco/vine/android/recorder/RecordController;->access$300(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    .line 895
    :cond_8
    iget-object v4, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mAudioDataBuffer:[S

    invoke-static {v4, v8, v3}, Ljava/nio/ShortBuffer;->wrap([SII)Ljava/nio/ShortBuffer;

    move-result-object v4

    invoke-direct {p0, v2, v4}, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->record(Lco/vine/android/recorder/RecordSegment;Ljava/nio/ShortBuffer;)V

    goto :goto_2
.end method

.method public updateTimestamp()V
    .locals 5

    .prologue
    .line 837
    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    invoke-static {v1}, Lco/vine/android/recorder/RecordController;->access$200(Lco/vine/android/recorder/RecordController;)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 838
    iget v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->mCount:I

    invoke-static {v1}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v0

    .line 839
    .local v0, newStamp:I
    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    #getter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v1}, Lco/vine/android/recorder/RecordController;->access$300(Lco/vine/android/recorder/RecordController;)J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 840
    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    int-to-long v2, v0

    #setter for: Lco/vine/android/recorder/RecordController;->mAudioTimestamp:J
    invoke-static {v1, v2, v3}, Lco/vine/android/recorder/RecordController;->access$302(Lco/vine/android/recorder/RecordController;J)J

    .line 841
    iget-object v1, p0, Lco/vine/android/recorder/RecordController$AudioRecordRunnable;->this$0:Lco/vine/android/recorder/RecordController;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    #setter for: Lco/vine/android/recorder/RecordController;->mAudioTimeRecorded:J
    invoke-static {v1, v2, v3}, Lco/vine/android/recorder/RecordController;->access$402(Lco/vine/android/recorder/RecordController;J)J

    .line 844
    .end local v0           #newStamp:I
    :cond_0
    return-void
.end method
