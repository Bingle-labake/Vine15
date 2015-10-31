.class public Lco/vine/android/recorder/EncodingRunnable;
.super Ljava/lang/Object;
.source "EncodingRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private hasLoggedException:Z

.field private mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

.field private mAudioPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

.field private mBufferedVideoData:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;"
        }
    .end annotation
.end field

.field private mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mCameraManager:Lco/vine/android/recorder/CameraManager;

.field private final mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;"
        }
    .end annotation
.end field

.field private mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

.field private final mEncodingImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

.field private final mEncodingTempPath:Ljava/lang/String;

.field private mLastSegment:Lco/vine/android/recorder/RecordSegment;

.field private mMatrixBitmap:Landroid/graphics/Bitmap;

.field private mMatrixCanvas:Landroid/graphics/Canvas;

.field private mMaxEncodedSize:I

.field private final mOutput:Ljava/lang/String;

.field private final mPictureConverter:Lco/vine/android/recorder/PictureConverter;

.field private final mProducer:Lco/vine/android/recorder/RecordController;

.field private final mRecorderFrameRate:I

.field private volatile mTerminateImmediately:Z

.field private final mThumbnailBitmap:Landroid/graphics/Bitmap;

.field private final mThumbnailCanvas:Landroid/graphics/Canvas;

.field private final mThumbnailMatrix:Landroid/graphics/Matrix;

.field private mTotalProcessed:I

.field private final mVideoDataBufferMax:[B

.field private mVideoDataBufferPosition:I

.field private mVideoPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

.field private timeToMatrix:J

.field private timeToRGB:J

.field private timeToRecord:J

.field private totalSizeToWait:I


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ConcurrentLinkedQueue;[BLco/vine/android/recorder/RecordController;Ljava/lang/String;ILcom/googlecode/javacv/cpp/opencv_core$IplImage;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lco/vine/android/recorder/PictureConverter;ILco/vine/android/recorder/CameraManager;)V
    .locals 3
    .parameter
    .parameter "videoDataBufferMax"
    .parameter "producer"
    .parameter "output"
    .parameter "frameRate"
    .parameter "image"
    .parameter "buffer"
    .parameter "bitmap"
    .parameter "thumbnailBitmap"
    .parameter "pc"
    .parameter "videoBufferPosition"
    .parameter "mCameraManager"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;[B",
            "Lco/vine/android/recorder/RecordController;",
            "Ljava/lang/String;",
            "I",
            "Lcom/googlecode/javacv/cpp/opencv_core$IplImage;",
            "Ljava/nio/ByteBuffer;",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            "Lco/vine/android/recorder/PictureConverter;",
            "I",
            "Lco/vine/android/recorder/CameraManager;",
            ")V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, queue:Ljava/util/concurrent/ConcurrentLinkedQueue;,"Ljava/util/concurrent/ConcurrentLinkedQueue<Lco/vine/android/recorder/VideoData;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v1, -0x1

    iput v1, p0, Lco/vine/android/recorder/EncodingRunnable;->totalSizeToWait:I

    .line 50
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    .line 69
    iput-object p6, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 70
    iput-object p1, p0, Lco/vine/android/recorder/EncodingRunnable;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 71
    iput-object p3, p0, Lco/vine/android/recorder/EncodingRunnable;->mProducer:Lco/vine/android/recorder/RecordController;

    .line 72
    iput-object p7, p0, Lco/vine/android/recorder/EncodingRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 73
    iput-object p8, p0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixBitmap:Landroid/graphics/Bitmap;

    .line 74
    iput-object p9, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    .line 75
    iput-object p12, p0, Lco/vine/android/recorder/EncodingRunnable;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    .line 76
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailCanvas:Landroid/graphics/Canvas;

    .line 77
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixCanvas:Landroid/graphics/Canvas;

    .line 78
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mBufferedVideoData:Ljava/util/LinkedList;

    .line 79
    iput-object p2, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferMax:[B

    .line 80
    iput p11, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferPosition:I

    .line 81
    iput-object p10, p0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    .line 82
    iput p5, p0, Lco/vine/android/recorder/EncodingRunnable;->mRecorderFrameRate:I

    .line 83
    iput-object p4, p0, Lco/vine/android/recorder/EncodingRunnable;->mOutput:Ljava/lang/String;

    .line 84
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailMatrix:Landroid/graphics/Matrix;

    .line 85
    const/high16 v1, 0x3f80

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 86
    .local v0, thumbnailScale:F
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mOutput:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".encode"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingTempPath:Ljava/lang/String;

    .line 88
    invoke-direct {p0}, Lco/vine/android/recorder/EncodingRunnable;->makeNewEncoder()V

    .line 89
    return-void
.end method

.method private doVideoFrame(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Z)Z
    .locals 4
    .parameter "image"
    .parameter "newSegment"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    if-nez v1, :cond_1

    .line 200
    invoke-direct {p0}, Lco/vine/android/recorder/EncodingRunnable;->makeNewEncoder()V

    .line 207
    :cond_0
    :goto_0
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mBufferedVideoData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/VideoData;

    .line 208
    .local v0, data:Lco/vine/android/recorder/VideoData;
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    iget-object v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferMax:[B

    iget v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferPosition:I

    invoke-virtual {v1, p1, v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->encode(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;[BI)I

    move-result v1

    iput v1, v0, Lco/vine/android/recorder/VideoData;->size:I

    .line 209
    const-string v1, "Write video frame size {}. Total processed {}."

    iget v2, v0, Lco/vine/android/recorder/VideoData;->size:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mTotalProcessed:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 210
    iget v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mTotalProcessed:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mTotalProcessed:I

    .line 211
    iget v1, v0, Lco/vine/android/recorder/VideoData;->size:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 212
    iget v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferPosition:I

    iput v1, v0, Lco/vine/android/recorder/VideoData;->start:I

    .line 213
    iget v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mMaxEncodedSize:I

    iget v2, v0, Lco/vine/android/recorder/VideoData;->size:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mMaxEncodedSize:I

    .line 214
    iget v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferPosition:I

    iget v2, v0, Lco/vine/android/recorder/VideoData;->size:I

    add-int/2addr v1, v2

    iput v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoDataBufferPosition:I

    .line 215
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mBufferedVideoData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 216
    const/4 v1, 0x1

    .line 219
    :goto_1
    return v1

    .line 202
    .end local v0           #data:Lco/vine/android/recorder/VideoData;
    :cond_1
    if-eqz p2, :cond_0

    .line 203
    invoke-direct {p0}, Lco/vine/android/recorder/EncodingRunnable;->stopEncoder()V

    .line 204
    invoke-direct {p0}, Lco/vine/android/recorder/EncodingRunnable;->makeNewEncoder()V

    goto :goto_0

    .line 218
    .restart local v0       #data:Lco/vine/android/recorder/VideoData;
    :cond_2
    const-string v1, "******Image was buffered to the next frame.********"

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 219
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private makeNewEncoder()V
    .locals 6

    .prologue
    .line 92
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    if-nez v1, :cond_0

    .line 93
    new-instance v1, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-direct {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 95
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mAudioPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    if-nez v1, :cond_1

    .line 96
    new-instance v1, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-direct {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mAudioPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 98
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingTempPath:Ljava/lang/String;

    iget v2, p0, Lco/vine/android/recorder/EncodingRunnable;->mRecorderFrameRate:I

    const/16 v3, 0x1e0

    iget-object v4, p0, Lco/vine/android/recorder/EncodingRunnable;->mVideoPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v5, p0, Lco/vine/android/recorder/EncodingRunnable;->mAudioPacket:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1, v2, v3, v4, v5}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;IILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    .line 100
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    :goto_0
    return-void

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v1, "Failed to start encoder"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private process(Z)V
    .locals 7
    .parameter "waitForMore"

    .prologue
    const/4 v4, 0x1

    .line 225
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    if-nez v3, :cond_4

    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/VideoData;

    .local v1, next:Lco/vine/android/recorder/VideoData;
    if-nez v1, :cond_1

    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mProducer:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 226
    :cond_1
    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mProducer:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    if-eqz v3, :cond_3

    .line 227
    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mDataQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v2

    .line 228
    .local v2, size:I
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 229
    iget v3, p0, Lco/vine/android/recorder/EncodingRunnable;->totalSizeToWait:I

    const/4 v5, -0x1

    if-ne v3, v5, :cond_2

    .line 230
    iput v2, p0, Lco/vine/android/recorder/EncodingRunnable;->totalSizeToWait:I

    .line 231
    const/4 v3, -0x8

    invoke-static {v3}, Landroid/os/Process;->setThreadPriority(I)V

    .line 233
    :cond_2
    iget-object v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    iget v5, p0, Lco/vine/android/recorder/EncodingRunnable;->totalSizeToWait:I

    sub-int/2addr v5, v2

    mul-int/lit8 v5, v5, 0x5a

    iget v6, p0, Lco/vine/android/recorder/EncodingRunnable;->totalSizeToWait:I

    div-int/2addr v5, v6

    invoke-virtual {v3, v5}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publish(I)V

    .line 235
    .end local v2           #size:I
    :cond_3
    if-nez v1, :cond_5

    .line 236
    if-eqz p1, :cond_0

    .line 238
    const-wide/16 v5, 0x64

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 239
    :catch_0
    move-exception v0

    .line 240
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v3, "Break signal reached."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 262
    .end local v0           #e:Ljava/lang/InterruptedException;
    .end local v1           #next:Lco/vine/android/recorder/VideoData;
    :cond_4
    return-void

    .line 246
    .restart local v1       #next:Lco/vine/android/recorder/VideoData;
    :cond_5
    if-nez p1, :cond_7

    move v3, v4

    :goto_1
    :try_start_1
    invoke-direct {p0, v1, v3}, Lco/vine/android/recorder/EncodingRunnable;->processVideoData(Lco/vine/android/recorder/VideoData;Z)V
    :try_end_1
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 247
    :catch_1
    move-exception v0

    .line 248
    .local v0, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    iget-boolean v3, p0, Lco/vine/android/recorder/EncodingRunnable;->hasLoggedException:Z

    if-nez v3, :cond_6

    .line 249
    iput-boolean v4, p0, Lco/vine/android/recorder/EncodingRunnable;->hasLoggedException:Z

    .line 250
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 252
    :cond_6
    const-string v3, "Failed to processVideoData sample."

    invoke-static {v3, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 246
    .end local v0           #e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    :cond_7
    const/4 v3, 0x0

    goto :goto_1

    .line 253
    :catch_2
    move-exception v0

    .line 254
    .local v0, e:Ljava/io/IOException;
    iget-boolean v3, p0, Lco/vine/android/recorder/EncodingRunnable;->hasLoggedException:Z

    if-nez v3, :cond_8

    .line 255
    iput-boolean v4, p0, Lco/vine/android/recorder/EncodingRunnable;->hasLoggedException:Z

    .line 256
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 258
    :cond_8
    const-string v3, "Failed to generate thumbnail."

    invoke-static {v3, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private processVideoData(Lco/vine/android/recorder/VideoData;Z)V
    .locals 17
    .parameter "next"
    .parameter "isFlushing"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mLastSegment:Lco/vine/android/recorder/RecordSegment;

    move-object/from16 v0, p1

    iget-object v12, v0, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    if-eq v11, v12, :cond_2

    const/4 v7, 0x1

    .line 148
    .local v7, newSegment:Z
    :goto_0
    move-object/from16 v0, p1

    iget-object v11, v0, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    move-object/from16 v0, p0

    iput-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mLastSegment:Lco/vine/android/recorder/RecordSegment;

    .line 149
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget-object v12, v11, Lco/vine/android/recorder/PictureConverter;->LOCK:[I

    monitor-enter v12

    .line 150
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 151
    .local v9, startTime:J
    move-object/from16 v0, p1

    iget-object v11, v0, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v11}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v2

    .line 152
    .local v2, cameraSetting:Lco/vine/android/recorder/CameraSetting;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    invoke-virtual {v11, v2}, Lco/vine/android/recorder/PictureConverter;->updateSettingsIfNeeded(Lco/vine/android/recorder/CameraSetting;)Z

    move-result v6

    .line 154
    .local v6, hasChanged:Z
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    iget v13, v2, Lco/vine/android/recorder/CameraSetting;->degrees:I

    const/4 v14, 0x0

    invoke-virtual {v11, v13, v14}, Lco/vine/android/recorder/PictureConverter;->giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(IZ)V

    .line 157
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    move-object/from16 v0, p1

    invoke-virtual {v11, v2, v0, v6}, Lco/vine/android/recorder/PictureConverter;->convert(Lco/vine/android/recorder/CameraSetting;Lco/vine/android/recorder/VideoData;Z)Z

    .line 159
    move-object/from16 v0, p0

    iget-wide v13, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToRGB:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    sub-long/2addr v15, v9

    add-long/2addr v13, v15

    move-object/from16 v0, p0

    iput-wide v13, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToRGB:J

    .line 160
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 164
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v11, v13}, Lco/vine/android/recorder/PictureConverter;->draw(Landroid/graphics/Canvas;)V

    .line 166
    move-object/from16 v0, p0

    iget-wide v13, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToMatrix:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    sub-long/2addr v15, v9

    add-long/2addr v13, v15

    move-object/from16 v0, p0

    iput-wide v13, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToMatrix:J

    .line 167
    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 171
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/recorder/EncodingRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v11, v12}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 173
    if-eqz v7, :cond_0

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    if-nez v11, :cond_0

    .line 174
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mPictureConverter:Lco/vine/android/recorder/PictureConverter;

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailCanvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/recorder/EncodingRunnable;->mMatrixBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v11, v12, v13, v14}, Lco/vine/android/recorder/PictureConverter;->drawGeneric(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    .line 175
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/recorder/EncodingRunnable;->mOutput:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".jpg"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 176
    .local v8, path:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v11, v0, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v11, v8}, Lco/vine/android/recorder/RecordSegment;->setThumbnailPath(Ljava/lang/String;)V

    .line 177
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 178
    .local v4, f:Ljava/io/File;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 179
    .local v1, bos:Ljava/io/ByteArrayOutputStream;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mThumbnailBitmap:Landroid/graphics/Bitmap;

    sget-object v12, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v13, 0x64

    invoke-virtual {v11, v12, v13, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 180
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 181
    .local v3, compressed:[B
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 182
    .local v5, fos:Ljava/io/FileOutputStream;
    invoke-virtual {v5, v3}, Ljava/io/FileOutputStream;->write([B)V

    .line 183
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 186
    .end local v1           #bos:Ljava/io/ByteArrayOutputStream;
    .end local v3           #compressed:[B
    .end local v4           #f:Ljava/io/File;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .end local v8           #path:Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    if-nez v11, :cond_1

    .line 188
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    .line 189
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    invoke-virtual {v11}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/recorder/EncodingRunnable;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 190
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mBufferedVideoData:Ljava/util/LinkedList;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 191
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingImage:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v7}, Lco/vine/android/recorder/EncodingRunnable;->doVideoFrame(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Z)Z

    .line 192
    move-object/from16 v0, p0

    iget-wide v11, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToRecord:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    sub-long/2addr v13, v9

    add-long/2addr v11, v13

    move-object/from16 v0, p0

    iput-wide v11, v0, Lco/vine/android/recorder/EncodingRunnable;->timeToRecord:J

    .line 194
    :cond_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/recorder/EncodingRunnable;->mCameraManager:Lco/vine/android/recorder/CameraManager;

    move-object/from16 v0, p1

    iget-object v12, v0, Lco/vine/android/recorder/VideoData;->data:[B

    move/from16 v0, p2

    invoke-virtual {v11, v12, v0}, Lco/vine/android/recorder/CameraManager;->addBuffer([BZ)V

    .line 195
    const/4 v11, 0x0

    move-object/from16 v0, p1

    iput-object v11, v0, Lco/vine/android/recorder/VideoData;->data:[B

    .line 196
    return-void

    .line 147
    .end local v2           #cameraSetting:Lco/vine/android/recorder/CameraSetting;
    .end local v6           #hasChanged:Z
    .end local v7           #newSegment:Z
    .end local v9           #startTime:J
    :cond_2
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 167
    .restart local v7       #newSegment:Z
    :catchall_0
    move-exception v11

    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v11
.end method

.method private stopEncoder()V
    .locals 3

    .prologue
    .line 108
    :cond_0
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mBufferedVideoData:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lco/vine/android/recorder/EncodingRunnable;->doVideoFrame(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Z)Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncoder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->stopEncoding()V
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v1, "Error flushing..."

    invoke-static {v1, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public getOutput()Ljava/lang/String;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mOutput:Ljava/lang/String;

    return-object v0
.end method

.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 126
    const/16 v0, 0x13

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 127
    const-string v0, "Processing started."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 128
    :goto_0
    iget-object v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mProducer:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    if-nez v0, :cond_0

    .line 129
    invoke-direct {p0, v5}, Lco/vine/android/recorder/EncodingRunnable;->process(Z)V

    goto :goto_0

    .line 131
    :cond_0
    const-string v0, "Flushing..."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 132
    iget-boolean v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    if-nez v0, :cond_2

    .line 133
    invoke-direct {p0, v4}, Lco/vine/android/recorder/EncodingRunnable;->process(Z)V

    .line 137
    :goto_1
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lco/vine/android/recorder/EncodingRunnable;->mEncodingTempPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 138
    iget-object v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    const/16 v1, 0x5a

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->publish(I)V

    .line 141
    :cond_1
    const-string v0, "Time used: rgb: {}, matrix: {}, encode: {}, n: {}, max: {}."

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lco/vine/android/recorder/EncodingRunnable;->timeToRGB:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    iget-wide v2, p0, Lco/vine/android/recorder/EncodingRunnable;->timeToMatrix:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x2

    iget-wide v3, p0, Lco/vine/android/recorder/EncodingRunnable;->timeToRecord:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mTotalProcessed:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget v3, p0, Lco/vine/android/recorder/EncodingRunnable;->mMaxEncodedSize:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mLastSegment:Lco/vine/android/recorder/RecordSegment;

    .line 144
    return-void

    .line 135
    :cond_2
    const-string v0, "Terminate without saving...."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setAsyncTask(Lco/vine/android/recorder/VineRecorder$FinishProcessTask;)V
    .locals 0
    .parameter "task"

    .prologue
    .line 116
    iput-object p1, p0, Lco/vine/android/recorder/EncodingRunnable;->mAsyncTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    .line 117
    return-void
.end method

.method public terminate()V
    .locals 1

    .prologue
    .line 120
    const-string v0, "Terminate without saving turned on."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 121
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/recorder/EncodingRunnable;->mTerminateImmediately:Z

    .line 122
    return-void
.end method
