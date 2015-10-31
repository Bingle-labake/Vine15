.class public Lco/vine/android/recorder/CombingRunnable;
.super Ljava/lang/Object;
.source "CombingRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private errorCount:I

.field private hasLoggedException:Z

.field private final mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

.field private final mAudioArray:[S

.field private mBitmap:Landroid/graphics/Bitmap;

.field private final mFolder:Ljava/io/File;

.field private final mFrameNumbers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mLastFrameOnlyModePath:Ljava/lang/String;

.field private mSegments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mSingleSegment:Z

.field private mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

.field private mThumbnailPath:Ljava/lang/String;

.field private mTimeOffset:J

.field private final mVideoArray:[B

.field private mVideoPath:Ljava/lang/String;

.field private final mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/RecordingFile;Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Z)V
    .locals 9
    .parameter "file"
    .parameter "segment"
    .parameter "videoRecorder"
    .parameter "task"
    .parameter "bitmap"
    .parameter "tempFrame"
    .parameter "onlyGrabLastSegmentMode"

    .prologue
    .line 59
    const/4 v2, 0x1

    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v3

    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lco/vine/android/recorder/CombingRunnable;-><init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mSegments:Ljava/util/ArrayList;

    .line 61
    iget-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mSegments:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/recorder/CombingRunnable;->mSingleSegment:Z

    .line 63
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getSegmentVideoPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    .line 64
    iget-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    iput-object v0, p2, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    .line 65
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getSegmentThumbnailPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    .line 66
    if-eqz p7, :cond_0

    .line 67
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getPreviewThumbnailPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mLastFrameOnlyModePath:Ljava/lang/String;

    .line 69
    :cond_0
    return-void
.end method

.method private constructor <init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V
    .locals 2
    .parameter "file"
    .parameter "isPreview"
    .parameter "audioArray"
    .parameter "videoArray"
    .parameter "videoRecorder"
    .parameter "task"
    .parameter "bitmap"
    .parameter "tempFrame"

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/recorder/CombingRunnable;->errorCount:I

    .line 44
    iput-object v1, p0, Lco/vine/android/recorder/CombingRunnable;->mLastFrameOnlyModePath:Ljava/lang/String;

    .line 74
    iput-object p3, p0, Lco/vine/android/recorder/CombingRunnable;->mAudioArray:[S

    .line 75
    iput-object p4, p0, Lco/vine/android/recorder/CombingRunnable;->mVideoArray:[B

    .line 76
    iput-object p7, p0, Lco/vine/android/recorder/CombingRunnable;->mBitmap:Landroid/graphics/Bitmap;

    .line 77
    iput-object p8, p0, Lco/vine/android/recorder/CombingRunnable;->mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 78
    iget-object v0, p1, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mFolder:Ljava/io/File;

    .line 79
    if-nez p2, :cond_0

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    .line 84
    :goto_0
    iput-object p5, p0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    .line 85
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lco/vine/android/recorder/CombingRunnable;->mTimeOffset:J

    .line 86
    iput-object p6, p0, Lco/vine/android/recorder/CombingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    .line 87
    return-void

    .line 82
    :cond_0
    iput-object v1, p0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method public constructor <init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLjava/util/ArrayList;Lco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V
    .locals 9
    .parameter "file"
    .parameter "isPreview"
    .parameter "audioArray"
    .parameter "videoArray"
    .parameter
    .parameter "videoRecorder"
    .parameter "task"
    .parameter "bitmap"
    .parameter "tempFrame"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/RecordingFile;",
            "Z[S[B",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;",
            "Lco/vine/android/recorder/VineFFmpegFrameRecorder;",
            "Lco/vine/android/recorder/VineRecorder$FinishProcessTask;",
            "Landroid/graphics/Bitmap;",
            "Lcom/googlecode/javacv/cpp/opencv_core$IplImage;",
            ")V"
        }
    .end annotation

    .prologue
    .line 50
    .local p5, segments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    invoke-direct/range {v0 .. v8}, Lco/vine/android/recorder/CombingRunnable;-><init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    .line 51
    iput-object p5, p0, Lco/vine/android/recorder/CombingRunnable;->mSegments:Ljava/util/ArrayList;

    .line 52
    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getPreviewVideoPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    .line 53
    if-eqz p2, :cond_1

    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getPreviewThumbnailPath()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    .line 54
    return-void

    .line 52
    :cond_0
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method


# virtual methods
.method public run()V
    .locals 52

    .prologue
    .line 91
    const/16 v46, -0x8

    invoke-static/range {v46 .. v46}, Landroid/os/Process;->setThreadPriority(I)V

    .line 92
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mSegments:Ljava/util/ArrayList;

    move-object/from16 v33, v0

    .line 93
    .local v33, segments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->size()I

    move-result v34

    .line 94
    .local v34, size:I
    const-wide/16 v44, 0x0

    .line 95
    .local v44, videoTotal:J
    const-wide/16 v9, 0x0

    .line 96
    .local v9, audioTotal:J
    const/16 v35, 0x0

    .line 97
    .local v35, videoCount:I
    const-string v46, "Processing started: {}."

    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    const-wide/16 v39, 0x0

    .line 99
    .local v39, videoDuration:J
    const-wide/16 v5, 0x0

    .line 100
    .local v5, audioDuration:J
    if-lez v34, :cond_12

    .line 101
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/CombingRunnable;->mAudioArray:[S

    .line 102
    .local v4, audioArray:[S
    const/16 v24, 0x0

    .local v24, i:I
    :goto_0
    move/from16 v0, v24

    move/from16 v1, v34

    if-ge v0, v1, :cond_c

    .line 103
    move-object/from16 v0, v33

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/vine/android/recorder/RecordSegment;

    .line 104
    .local v32, segment:Lco/vine/android/recorder/RecordSegment;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 105
    .local v7, audioTime:J
    invoke-virtual/range {v32 .. v32}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v15

    .line 107
    .local v15, combined:Lco/vine/android/recorder/AudioData;
    :try_start_0
    iget v0, v15, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v46, v0

    if-lez v46, :cond_0

    .line 109
    iget v0, v15, Lco/vine/android/recorder/AudioData;->start:I

    move/from16 v46, v0

    iget v0, v15, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v47, v0

    move/from16 v0, v46

    move/from16 v1, v47

    invoke-static {v4, v0, v1}, Ljava/nio/ShortBuffer;->wrap([SII)Ljava/nio/ShortBuffer;

    move-result-object v12

    .line 110
    .local v12, bft:Ljava/nio/ShortBuffer;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/recorder/CombingRunnable;->mSingleSegment:Z

    move/from16 v46, v0

    if-eqz v46, :cond_4

    .line 111
    iget v0, v15, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v46, v0

    move/from16 v0, v46

    new-array v14, v0, [S

    .line 112
    .local v14, buffer:[S
    invoke-virtual {v12, v14}, Ljava/nio/ShortBuffer;->get([S)Ljava/nio/ShortBuffer;

    .line 113
    invoke-static {v14}, Ljava/nio/ShortBuffer;->wrap([S)Ljava/nio/ShortBuffer;

    move-result-object v11

    .line 118
    .end local v14           #buffer:[S
    .local v11, bf:Ljava/nio/ShortBuffer;
    :goto_1
    const-string v46, "Recording segment audio: {}, {}."

    iget v0, v15, Lco/vine/android/recorder/AudioData;->start:I

    move/from16 v47, v0

    invoke-static/range {v47 .. v47}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    iget v0, v15, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v48, v0

    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v48

    invoke-static/range {v46 .. v48}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/nio/Buffer;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    aput-object v11, v47, v48

    invoke-virtual/range {v46 .. v47}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record([Ljava/nio/Buffer;)Z
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v11           #bf:Ljava/nio/ShortBuffer;
    .end local v12           #bft:Ljava/nio/ShortBuffer;
    :cond_0
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v46

    sub-long v46, v46, v7

    add-long v9, v9, v46

    .line 128
    invoke-virtual/range {v32 .. v32}, Lco/vine/android/recorder/RecordSegment;->getVideoData()Ljava/util/ArrayList;

    move-result-object v36

    .line 129
    .local v36, videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoArray:[B

    move-object/from16 v37, v0

    .line 130
    .local v37, videoDataArray:[B
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v42

    .line 131
    .local v42, videoTime:J
    invoke-virtual/range {v32 .. v32}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v46

    move-object/from16 v0, v46

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    move/from16 v22, v0

    .line 132
    .local v22, frameRate:I
    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->size()I

    move-result v38

    .line 134
    .local v38, videoDataSize:I
    const-wide/16 v30, 0x0

    .line 136
    .local v30, offset:J
    const/16 v26, 0x0

    .local v26, k:I
    :goto_3
    move/from16 v0, v26

    move/from16 v1, v38

    if-ge v0, v1, :cond_9

    .line 138
    move-object/from16 v0, v36

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lco/vine/android/recorder/VideoData;

    .line 140
    .local v41, videoPiece:Lco/vine/android/recorder/VideoData;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/recorder/CombingRunnable;->mSingleSegment:Z

    move/from16 v46, v0

    if-eqz v46, :cond_2

    .line 141
    if-nez v26, :cond_1

    .line 142
    move-object/from16 v0, v41

    iget-wide v0, v0, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v30, v0

    .line 144
    :cond_1
    move-object/from16 v0, v41

    iget-wide v0, v0, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v46, v0

    sub-long v46, v46, v30

    move-wide/from16 v0, v46

    move-object/from16 v2, v41

    iput-wide v0, v2, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 147
    :cond_2
    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v46, v0

    if-gez v46, :cond_6

    .line 136
    :cond_3
    :goto_4
    add-int/lit8 v26, v26, 0x1

    goto :goto_3

    .line 115
    .end local v22           #frameRate:I
    .end local v26           #k:I
    .end local v30           #offset:J
    .end local v36           #videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .end local v37           #videoDataArray:[B
    .end local v38           #videoDataSize:I
    .end local v41           #videoPiece:Lco/vine/android/recorder/VideoData;
    .end local v42           #videoTime:J
    .restart local v12       #bft:Ljava/nio/ShortBuffer;
    :cond_4
    move-object v11, v12

    .restart local v11       #bf:Ljava/nio/ShortBuffer;
    goto/16 :goto_1

    .line 121
    .end local v11           #bf:Ljava/nio/ShortBuffer;
    .end local v12           #bft:Ljava/nio/ShortBuffer;
    :catch_0
    move-exception v18

    .line 122
    .local v18, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/recorder/CombingRunnable;->hasLoggedException:Z

    move/from16 v46, v0

    if-eqz v46, :cond_5

    sget-boolean v46, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v46, :cond_0

    .line 123
    :cond_5
    const/16 v46, 0x1

    move/from16 v0, v46

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/recorder/CombingRunnable;->hasLoggedException:Z

    .line 124
    invoke-static/range {v18 .. v18}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 151
    .end local v18           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .restart local v22       #frameRate:I
    .restart local v26       #k:I
    .restart local v30       #offset:J
    .restart local v36       #videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .restart local v37       #videoDataArray:[B
    .restart local v38       #videoDataSize:I
    .restart local v41       #videoPiece:Lco/vine/android/recorder/VideoData;
    .restart local v42       #videoTime:J
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v47, v0

    invoke-virtual/range {v46 .. v48}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameRate(D)V

    .line 153
    move-object/from16 v0, v41

    iget-wide v0, v0, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v46, v0

    const-wide/16 v48, 0x0

    cmp-long v46, v46, v48

    if-nez v46, :cond_7

    .line 154
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getTimestamp()J

    move-result-wide v46

    move-wide/from16 v0, v46

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/vine/android/recorder/CombingRunnable;->mTimeOffset:J

    .line 158
    :cond_7
    move-object/from16 v0, v41

    iget-wide v0, v0, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v46, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/CombingRunnable;->mTimeOffset:J

    move-wide/from16 v48, v0

    add-long v16, v46, v48

    .line 160
    .local v16, determinedTimestamp:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFrameNumber()I

    move-result v27

    .line 161
    .local v27, nextFrameNumber:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getTimestamp()J

    move-result-wide v28

    .line 166
    .local v28, nextTimestamp:J
    sub-long v46, v16, v28

    const v48, 0xf4240

    div-int v48, v48, v22

    move/from16 v0, v48

    int-to-long v0, v0

    move-wide/from16 v48, v0

    cmp-long v46, v46, v48

    if-lez v46, :cond_8

    .line 167
    const-string v46, "*******Skipped frame*******"

    invoke-static/range {v46 .. v46}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setTimestampAndGetFrameNumber(J)I

    move-result v27

    .line 174
    :goto_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->start:I

    move/from16 v47, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v48, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v37

    move/from16 v2, v47

    move/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->writeEncodedImage([BII)V

    .line 175
    add-int/lit8 v35, v35, 0x1

    .line 176
    const-string v46, "Successfully did video frame at {}, #{}."

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v48

    invoke-static/range {v46 .. v48}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 200
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    if-eqz v46, :cond_3

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 170
    :cond_8
    move-wide/from16 v16, v28

    goto :goto_5

    .line 177
    :catch_1
    move-exception v18

    .line 178
    .restart local v18       #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v46, "Failed to record video frame at {}. #{}."

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v48

    invoke-static/range {v46 .. v48}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 180
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->start:I

    move/from16 v47, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v48, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v37

    move/from16 v2, v47

    move/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->writeEncodedImage([BII)V

    .line 181
    add-int/lit8 v35, v35, 0x1

    .line 182
    const-string v46, "Retry successful #{}."

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_6

    .line 183
    :catch_2
    move-exception v19

    .line 184
    .local v19, e2:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v46, "Retry again: #{}."

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;)V

    .line 185
    const-wide/16 v46, 0x3e8

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v48, v0

    div-long v46, v46, v48

    add-long v16, v16, v46

    .line 186
    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v46, v0

    mul-long v46, v46, v16

    const-wide/16 v48, 0x3e8

    div-long v46, v46, v48

    move-wide/from16 v0, v46

    long-to-float v0, v0

    move/from16 v46, v0

    invoke-static/range {v46 .. v46}, Ljava/lang/Math;->round(F)I

    move-result v27

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move-object/from16 v0, v46

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setTimestamp(J)V

    .line 188
    move-wide/from16 v0, v16

    move-object/from16 v2, v41

    iput-wide v0, v2, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 190
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->start:I

    move/from16 v47, v0

    move-object/from16 v0, v41

    iget v0, v0, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v48, v0

    move-object/from16 v0, v46

    move-object/from16 v1, v37

    move/from16 v2, v47

    move/from16 v3, v48

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->writeEncodedImage([BII)V

    .line 191
    add-int/lit8 v35, v35, 0x1

    .line 192
    const-string v46, "Retry Retry successful #{}."

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_6

    .line 193
    :catch_3
    move-exception v20

    .line 194
    .local v20, e3:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CombingRunnable;->errorCount:I

    move/from16 v46, v0

    add-int/lit8 v46, v46, 0x1

    move/from16 v0, v46

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/CombingRunnable;->errorCount:I

    .line 195
    const-string v46, "Retry failed: {}."

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CombingRunnable;->errorCount:I

    move/from16 v47, v0

    invoke-static/range {v47 .. v47}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 204
    .end local v16           #determinedTimestamp:J
    .end local v18           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .end local v19           #e2:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .end local v20           #e3:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .end local v27           #nextFrameNumber:I
    .end local v28           #nextTimestamp:J
    .end local v41           #videoPiece:Lco/vine/android/recorder/VideoData;
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v46

    sub-long v46, v46, v42

    add-long v44, v44, v46

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    move-object/from16 v46, v0

    if-eqz v46, :cond_a

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    move-object/from16 v46, v0

    mul-int/lit8 v47, v24, 0xa

    div-int v47, v47, v34

    add-int/lit8 v47, v47, 0x5a

    invoke-virtual/range {v46 .. v47}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publish(I)V

    .line 208
    :cond_a
    sget-boolean v46, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v46, :cond_b

    .line 209
    invoke-virtual {v15}, Lco/vine/android/recorder/AudioData;->getDurationNs()J

    move-result-wide v46

    const-wide/16 v48, 0x3e8

    div-long v46, v46, v48

    add-long v5, v5, v46

    .line 210
    const/16 v46, 0x3e8

    div-int v46, v46, v22

    mul-int v46, v46, v38

    move/from16 v0, v46

    int-to-long v0, v0

    move-wide/from16 v46, v0

    add-long v39, v39, v46

    .line 211
    const-string v46, "Recorded segment with time: audio: {}, video: {}."

    invoke-virtual {v15}, Lco/vine/android/recorder/AudioData;->getDurationNs()J

    move-result-wide v47

    const-wide/16 v49, 0x3e8

    div-long v47, v47, v49

    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    const/16 v48, 0x3e8

    div-int v48, v48, v22

    mul-int v48, v48, v38

    invoke-static/range {v48 .. v48}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v48

    invoke-static/range {v46 .. v48}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 102
    :cond_b
    add-int/lit8 v24, v24, 0x1

    goto/16 :goto_0

    .line 214
    .end local v7           #audioTime:J
    .end local v15           #combined:Lco/vine/android/recorder/AudioData;
    .end local v22           #frameRate:I
    .end local v26           #k:I
    .end local v30           #offset:J
    .end local v32           #segment:Lco/vine/android/recorder/RecordSegment;
    .end local v36           #videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .end local v37           #videoDataArray:[B
    .end local v38           #videoDataSize:I
    .end local v42           #videoTime:J
    :cond_c
    const-string v46, "Done with all segments. total time: audio: {}, video: {}."

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    invoke-static/range {v39 .. v40}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v48

    invoke-static/range {v46 .. v48}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 216
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->stop()V

    .line 217
    new-instance v46, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v47, v0

    invoke-virtual/range {v47 .. v47}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFilename()Ljava/lang/String;

    move-result-object v47

    invoke-direct/range {v46 .. v47}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v47, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    move-object/from16 v48, v0

    invoke-direct/range {v47 .. v48}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v46 .. v47}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    move-object/from16 v46, v0

    if-eqz v46, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-object/from16 v46, v0

    invoke-virtual/range {v46 .. v46}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData()Z

    move-result v46

    if-eqz v46, :cond_11

    .line 219
    new-instance v23, Lco/vine/android/recorder/VineFrameGrabber;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    move-object/from16 v46, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Lco/vine/android/recorder/VineFrameGrabber;-><init>(Ljava/lang/String;)V

    .line 220
    .local v23, grabber:Lco/vine/android/recorder/VineFrameGrabber;
    invoke-virtual/range {v23 .. v23}, Lco/vine/android/recorder/VineFrameGrabber;->start()V

    .line 223
    const/16 v25, 0x0

    .line 224
    .local v25, index:I
    :cond_d
    :goto_7
    invoke-virtual/range {v23 .. v23}, Lco/vine/android/recorder/VineFrameGrabber;->grab()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v21

    .local v21, frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v21, :cond_10

    .line 225
    add-int/lit8 v25, v25, 0x1

    .line 226
    const/16 v46, 0x2

    move/from16 v0, v25

    move/from16 v1, v46

    if-eq v0, v1, :cond_e

    const/16 v46, 0x1

    move/from16 v0, v35

    move/from16 v1, v46

    if-ne v0, v1, :cond_f

    .line 227
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-object/from16 v46, v0

    const/16 v47, 0x2

    move-object/from16 v0, v21

    move-object/from16 v1, v46

    move/from16 v2, v47

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_imgproc;->cvCvtColor(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$CvArr;I)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-object/from16 v47, v0

    invoke-virtual/range {v47 .. v47}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v46, v0

    sget-object v47, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v48, 0x4b

    new-instance v49, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    move-object/from16 v50, v0

    invoke-direct/range {v49 .. v50}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v46 .. v49}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 230
    const-string v46, "First Thumbnail generated."

    invoke-static/range {v46 .. v46}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 232
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/recorder/CombingRunnable;->mSingleSegment:Z

    move/from16 v46, v0

    if-eqz v46, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mLastFrameOnlyModePath:Ljava/lang/String;

    move-object/from16 v46, v0

    if-nez v46, :cond_14

    .line 246
    :cond_10
    invoke-virtual/range {v23 .. v23}, Lco/vine/android/recorder/VineFrameGrabber;->stop()V

    .line 247
    invoke-virtual/range {v23 .. v23}, Lco/vine/android/recorder/VineFrameGrabber;->release()V
    :try_end_4
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_7

    .line 249
    :try_start_5
    new-instance v46, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    move-object/from16 v47, v0

    invoke-direct/range {v46 .. v47}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v46 .. v46}, Ljava/io/File;->exists()Z

    move-result v46

    if-nez v46, :cond_11

    .line 250
    const-string v46, "Retry generating thumbnail."

    invoke-static/range {v46 .. v46}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mVideoPath:Ljava/lang/String;

    move-object/from16 v46, v0

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [J

    move-object/from16 v47, v0

    const/16 v48, 0x0

    const-wide/16 v49, 0x0

    aput-wide v49, v47, v48

    invoke-static/range {v46 .. v47}, Lco/vine/android/util/MediaUtil;->getVideoFrames(Ljava/lang/String;[J)[Landroid/graphics/Bitmap;

    move-result-object v13

    .line 252
    .local v13, bitmaps:[Landroid/graphics/Bitmap;
    if-eqz v13, :cond_17

    array-length v0, v13

    move/from16 v46, v0

    const/16 v47, 0x1

    move/from16 v0, v46

    move/from16 v1, v47

    if-ne v0, v1, :cond_17

    .line 253
    const/16 v46, 0x0

    aget-object v46, v13, v46

    sget-object v47, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v48, 0x4b

    new-instance v49, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    move-object/from16 v50, v0

    invoke-direct/range {v49 .. v50}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v46 .. v49}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 254
    const-string v46, "First Thumbnail generated."

    invoke-static/range {v46 .. v46}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_7

    .line 270
    .end local v13           #bitmaps:[Landroid/graphics/Bitmap;
    .end local v21           #frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .end local v23           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v25           #index:I
    :cond_11
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    if-eqz v46, :cond_12

    .line 272
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFolder:Ljava/io/File;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    move-object/from16 v47, v0

    invoke-static/range {v46 .. v47}, Lco/vine/android/recorder/RecordSessionManager;->writeFrameInfo(Ljava/io/File;Ljava/util/ArrayList;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_8

    .line 278
    .end local v4           #audioArray:[S
    .end local v24           #i:I
    :cond_12
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    move-object/from16 v46, v0

    if-eqz v46, :cond_13

    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    move-object/from16 v46, v0

    const/16 v47, 0x63

    invoke-virtual/range {v46 .. v47}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publish(I)V

    .line 281
    :cond_13
    const-string v46, "Processing thread finished: failed {} frames."

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/CombingRunnable;->errorCount:I

    move/from16 v47, v0

    invoke-static/range {v47 .. v47}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v47

    invoke-static/range {v46 .. v47}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 282
    const-string v46, "Time used: video: {}, audio: {}, n: {}."

    invoke-static/range {v44 .. v45}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v48

    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v49

    invoke-static/range {v46 .. v49}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 283
    return-void

    .line 235
    .restart local v4       #audioArray:[S
    .restart local v21       #frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .restart local v23       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v24       #i:I
    .restart local v25       #index:I
    :cond_14
    move/from16 v0, v35

    move/from16 v1, v25

    if-gt v0, v1, :cond_d

    const/16 v46, 0x1

    move/from16 v0, v25

    move/from16 v1, v46

    if-eq v0, v1, :cond_d

    .line 236
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-object/from16 v46, v0

    const/16 v47, 0x2

    move-object/from16 v0, v21

    move-object/from16 v1, v46

    move/from16 v2, v47

    invoke-static {v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_imgproc;->cvCvtColor(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$CvArr;I)V

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v46, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mTempFrame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-object/from16 v47, v0

    invoke-virtual/range {v47 .. v47}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v47

    invoke-virtual/range {v46 .. v47}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v48, v0

    sget-object v49, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v50, 0x4b

    new-instance v51, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mLastFrameOnlyModePath:Ljava/lang/String;

    move-object/from16 v46, v0

    if-nez v46, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mThumbnailPath:Ljava/lang/String;

    move-object/from16 v46, v0

    move-object/from16 v47, v46

    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mFrameNumbers:Ljava/util/ArrayList;

    move-object/from16 v46, v0

    if-nez v46, :cond_16

    const/16 v46, 0x1

    :goto_b
    move-object/from16 v0, v47

    move/from16 v1, v46

    invoke-static {v0, v1}, Lco/vine/android/recorder/RecordingFile;->getLastFramePathThumbnailFromThumbnailPath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v51

    move-object/from16 v1, v46

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v48 .. v51}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 242
    const-string v46, "Last Thumbnail generated."

    invoke-static/range {v46 .. v46}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V
    :try_end_7
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_7 .. :try_end_7} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_7

    goto/16 :goto_7

    .line 263
    .end local v21           #frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .end local v23           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v25           #index:I
    :catch_4
    move-exception v18

    .line 264
    .restart local v18       #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v46, "Error flushing..."

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    aput-object v18, v47, v48

    invoke-static/range {v46 .. v47}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 238
    .end local v18           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    .restart local v21       #frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .restart local v23       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v25       #index:I
    :cond_15
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/CombingRunnable;->mLastFrameOnlyModePath:Ljava/lang/String;

    move-object/from16 v46, v0
    :try_end_8
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_7

    move-object/from16 v47, v46

    goto :goto_a

    :cond_16
    const/16 v46, 0x0

    goto :goto_b

    .line 256
    .restart local v13       #bitmaps:[Landroid/graphics/Bitmap;
    :cond_17
    :try_start_9
    new-instance v46, Ljava/lang/IllegalStateException;

    invoke-direct/range {v46 .. v46}, Ljava/lang/IllegalStateException;-><init>()V

    throw v46
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_9 .. :try_end_9} :catch_7

    .line 259
    .end local v13           #bitmaps:[Landroid/graphics/Bitmap;
    :catch_5
    move-exception v18

    .line 260
    .local v18, e:Ljava/lang/Exception;
    :try_start_a
    const-string v46, "Failed to generate thumbnail."

    invoke-static/range {v46 .. v46}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_a
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_a .. :try_end_a} :catch_4
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_7

    goto/16 :goto_8

    .line 265
    .end local v18           #e:Ljava/lang/Exception;
    .end local v21           #frame:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .end local v23           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v25           #index:I
    :catch_6
    move-exception v18

    .line 266
    .local v18, e:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    const-string v46, "Error creating thumbnail..."

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    aput-object v18, v47, v48

    invoke-static/range {v46 .. v47}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 267
    .end local v18           #e:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    :catch_7
    move-exception v18

    .line 268
    .local v18, e:Ljava/io/FileNotFoundException;
    const-string v46, "Error saving thumbnail..."

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    aput-object v18, v47, v48

    invoke-static/range {v46 .. v47}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 273
    .end local v18           #e:Ljava/io/FileNotFoundException;
    :catch_8
    move-exception v18

    .line 274
    .local v18, e:Ljava/io/IOException;
    invoke-static/range {v18 .. v18}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto/16 :goto_9
.end method
