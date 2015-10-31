.class public Lco/vine/android/recorder/VineFFmpegFrameRecorder;
.super Ljava/lang/Object;
.source "VineFFmpegFrameRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final LOCK:[I

.field private static loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;


# instance fields
.field protected audioBitrate:I

.field protected audioChannels:I

.field protected audioCodec:I

.field protected audioCodecName:Ljava/lang/String;

.field protected audioOptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected audioQuality:D

.field private audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

.field private audio_clock:J

.field private audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

.field private audio_input_frame_size:I

.field private audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

.field private audio_outbuf_size:I

.field public audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

.field private audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

.field private filename:Ljava/lang/String;

.field protected format:Ljava/lang/String;

.field private frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

.field protected frameNumber:I

.field protected frameRate:D

.field private got_audio_packet:[I

.field private got_video_packet:[I

.field private hasData:Z

.field protected imageHeight:I

.field protected imageWidth:I

.field private img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

.field protected interleaved:Z

.field private volatile isReleased:Z

.field private oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

.field private oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

.field private picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

.field private picture_buf:Lcom/googlecode/javacpp/BytePointer;

.field protected pixelFormat:I

.field protected sampleFormat:I

.field protected sampleRate:I

.field private samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

.field private samples_in:[Lcom/googlecode/javacpp/Pointer;

.field private samples_in_ptr:Lcom/googlecode/javacpp/PointerPointer;

.field private samples_out:[Lcom/googlecode/javacpp/BytePointer;

.field private samples_out_ptr:Lcom/googlecode/javacpp/PointerPointer;

.field protected timestamp:J

.field private tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

.field protected videoBitrate:I

.field protected videoCodec:I

.field protected videoCodecName:Ljava/lang/String;

.field protected videoOptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected videoQuality:D

.field private video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

.field private video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

.field private video_outbuf:Lcom/googlecode/javacpp/BytePointer;

.field private video_outbuf_size:I

.field public video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

.field private video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 87
    const-class v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->$assertionsDisabled:Z

    .line 102
    new-array v0, v1, [I

    sput-object v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->LOCK:[I

    .line 108
    const/4 v0, 0x0

    sput-object v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    .line 152
    sget-object v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->LOCK:[I

    monitor-enter v1

    .line 153
    :try_start_0
    invoke-static {}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_register_all()V

    .line 154
    invoke-static {}, Lcom/googlecode/javacv/cpp/avformat;->av_register_all()V

    .line 155
    monitor-exit v1

    .line 156
    return-void

    :cond_0
    move v0, v1

    .line 87
    goto :goto_0

    .line 155
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 1
    .parameter "file"
    .parameter "audioChannels"

    .prologue
    const/4 v0, 0x0

    .line 132
    invoke-direct {p0, p1, v0, v0, p2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/io/File;III)V

    .line 133
    return-void
.end method

.method public constructor <init>(Ljava/io/File;II)V
    .locals 1
    .parameter "file"
    .parameter "imageWidth"
    .parameter "imageHeight"

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/io/File;III)V

    .line 141
    return-void
.end method

.method public constructor <init>(Ljava/io/File;III)V
    .locals 1
    .parameter "file"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "audioChannels"

    .prologue
    .line 148
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;III)V

    .line 149
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter "filename"
    .parameter "audioChannels"

    .prologue
    const/4 v0, 0x0

    .line 136
    invoke-direct {p0, p1, v0, v0, p2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;III)V

    .line 137
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .parameter "filename"
    .parameter "imageWidth"
    .parameter "imageHeight"

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;III)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 7
    .parameter "filename"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "audioChannels"

    .prologue
    const/4 v5, 0x0

    .line 183
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;IIILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 184
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V
    .locals 5
    .parameter "filename"
    .parameter "imageWidth"
    .parameter "imageHeight"
    .parameter "audioChannels"
    .parameter "videoPacket"
    .parameter "audioPacket"

    .prologue
    const/4 v4, -0x1

    const-wide/high16 v0, -0x4010

    const/4 v3, 0x0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoQuality:D

    .line 95
    iput-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioQuality:D

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoOptions:Ljava/util/HashMap;

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioOptions:Ljava/util/HashMap;

    .line 99
    iput v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameNumber:I

    .line 100
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->timestamp:J

    .line 104
    iput-boolean v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData:Z

    .line 105
    iput-boolean v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->isReleased:Z

    .line 160
    const-string v0, "Creating a recorder thats {} * {}"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 162
    iput-object p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    .line 163
    iput p2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    .line 164
    iput p3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    .line 165
    iput p4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    .line 167
    iput v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->pixelFormat:I

    .line 168
    iput v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodec:I

    .line 169
    const v0, 0xf4240

    iput v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoBitrate:I

    .line 170
    const-wide/high16 v0, 0x403e

    iput-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameRate:D

    .line 172
    iput v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleFormat:I

    .line 173
    iput v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodec:I

    .line 174
    const v0, 0xfa00

    iput v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioBitrate:I

    .line 175
    const v0, 0xac44

    iput v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    .line 177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->interleaved:Z

    .line 178
    if-eqz p5, :cond_0

    .end local p5
    :goto_0
    iput-object p5, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 179
    if-eqz p6, :cond_1

    .end local p6
    :goto_1
    iput-object p6, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 180
    return-void

    .line 178
    .restart local p5
    .restart local p6
    :cond_0
    new-instance p5, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .end local p5
    invoke-direct {p5}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;-><init>()V

    goto :goto_0

    .line 179
    :cond_1
    new-instance p6, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .end local p6
    invoke-direct {p6}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;-><init>()V

    goto :goto_1
.end method

.method public static tryLoad(Landroid/content/Context;)V
    .locals 4
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 111
    sget-object v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    if-eqz v1, :cond_0

    .line 112
    sget-object v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    throw v1

    .line 115
    :cond_0
    :try_start_0
    const-class v1, Lcom/googlecode/javacv/cpp/avutil;

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;

    .line 116
    const-class v1, Lcom/googlecode/javacv/cpp/avcodec;

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;

    .line 117
    const-class v1, Lcom/googlecode/javacv/cpp/avformat;

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;

    .line 118
    const-class v1, Lcom/googlecode/javacv/cpp/swscale;

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;

    .line 119
    const-class v1, Lcom/googlecode/javacv/cpp/swresample;

    invoke-static {v1}, Lcom/googlecode/javacpp/Loader;->load(Ljava/lang/Class;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lco/vine/android/recorder/RecordConfigUtils;->setLoadWasEverSuccessful(Landroid/content/Context;Z)V

    .line 129
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, t:Ljava/lang/Throwable;
    instance-of v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    if-eqz v1, :cond_1

    .line 122
    check-cast v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    .end local v0           #t:Ljava/lang/Throwable;
    sput-object v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    throw v0

    .line 124
    .restart local v0       #t:Ljava/lang/Throwable;
    :cond_1
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to load "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    sput-object v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->loadingException:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    throw v1
.end method

.method private writeVideoFrame()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 737
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    monitor-enter v2

    .line 739
    :try_start_0
    iget-boolean v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->interleaved:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v1, :cond_0

    .line 740
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1, v3}, Lcom/googlecode/javacv/cpp/avformat;->av_interleaved_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    move-result v0

    .local v0, ret:I
    if-gez v0, :cond_1

    .line 741
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "av_interleaved_write_frame() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " while writing interleaved video frame."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 749
    .end local v0           #ret:I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 744
    :cond_0
    :try_start_1
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1, v3}, Lcom/googlecode/javacv/cpp/avformat;->av_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    move-result v0

    .restart local v0       #ret:I
    if-gez v0, :cond_1

    .line 745
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "av_write_frame() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " while writing video frame."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 748
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return v0
.end method


# virtual methods
.method public encode(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;[BI)I
    .locals 3
    .parameter "image"
    .parameter "output"
    .parameter "start"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 699
    const/4 v2, 0x1

    invoke-virtual {p0, p1, v1, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;IZ)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 700
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    .line 701
    .local v0, data:Lcom/googlecode/javacpp/BytePointer;
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->size()I

    move-result v1

    .line 702
    .local v1, limit:I
    invoke-virtual {v0, p2, p3, v1}, Lcom/googlecode/javacpp/BytePointer;->get([BII)Lcom/googlecode/javacpp/BytePointer;

    .line 705
    .end local v0           #data:Lcom/googlecode/javacpp/BytePointer;
    .end local v1           #limit:I
    :cond_0
    return v1
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 256
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 257
    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 258
    return-void
.end method

.method public getAudioCodecName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 855
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodecName:Ljava/lang/String;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1033
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    return-object v0
.end method

.method public getFrameNumber()I
    .locals 2

    .prologue
    .line 288
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v0

    long-to-int v0, v0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts()J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_0
.end method

.method public getFrameRate()D
    .locals 2

    .prologue
    .line 1044
    iget-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameRate:D

    return-wide v0
.end method

.method public getTimestamp()J
    .locals 4

    .prologue
    const-wide/32 v2, 0xf4240

    .line 300
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v0, :cond_0

    .line 301
    iget-wide v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_clock:J

    mul-long/2addr v0, v2

    iget v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    .line 303
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFrameNumber()I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v2

    long-to-double v0, v0

    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFrameRate()D

    move-result-wide v2

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    goto :goto_0
.end method

.method public getVideoCodecName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 848
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodecName:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoCodecPixFormat()I
    .locals 1

    .prologue
    .line 710
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt()I

    move-result v0

    return v0
.end method

.method public hasData()Z
    .locals 1

    .prologue
    .line 1025
    iget-boolean v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData:Z

    return v0
.end method

.method public isReleased()Z
    .locals 1

    .prologue
    .line 1029
    iget-boolean v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->isReleased:Z

    return v0
.end method

.method public record(Lcom/googlecode/javacv/Frame;)V
    .locals 1
    .parameter "frame"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 1063
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->image:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->samples:[Ljava/nio/Buffer;

    if-nez v0, :cond_2

    .line 1064
    :cond_0
    const/4 v0, 0x0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Z

    .line 1073
    :cond_1
    :goto_0
    return-void

    .line 1066
    :cond_2
    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->image:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-eqz v0, :cond_3

    .line 1067
    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->image:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Z

    move-result v0

    iput-boolean v0, p1, Lcom/googlecode/javacv/Frame;->keyFrame:Z

    .line 1069
    :cond_3
    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->samples:[Ljava/nio/Buffer;

    if-eqz v0, :cond_1

    .line 1070
    iget-object v0, p1, Lcom/googlecode/javacv/Frame;->samples:[Ljava/nio/Buffer;

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record([Ljava/nio/Buffer;)Z

    move-result v0

    iput-boolean v0, p1, Lcom/googlecode/javacv/Frame;->keyFrame:Z

    goto :goto_0
.end method

.method record(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)Z
    .locals 6
    .parameter "frame"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 986
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->av_init_packet(Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 987
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    invoke-virtual {v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 988
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf_size:I

    invoke-virtual {v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->size(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 989
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_audio_packet:[I

    invoke-static {v2, v3, p1, v4}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_encode_audio2(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avutil$AVFrame;[I)I

    move-result v0

    .local v0, ret:I
    if-gez v0, :cond_0

    .line 990
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "avcodec_encode_audio2() error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": Could not encode audio packet."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 992
    :cond_0
    if-eqz p1, :cond_1

    .line 993
    iget-wide v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_clock:J

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->nb_samples()I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_clock:J

    .line 996
    :cond_1
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_audio_packet:[I

    aget v2, v2, v1

    if-eqz v2, :cond_6

    .line 997
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v1

    sget-wide v3, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    .line 998
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v2

    iget-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v5}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 1000
    :cond_2
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v1

    sget-wide v3, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_3

    .line 1001
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v2

    iget-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v5}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 1003
    :cond_3
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->flags()I

    move-result v2

    or-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 1004
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->index()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->stream_index(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 1010
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    monitor-enter v2

    .line 1011
    :try_start_0
    iget-boolean v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->interleaved:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v1, :cond_4

    .line 1012
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1, v3}, Lcom/googlecode/javacv/cpp/avformat;->av_interleaved_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    move-result v0

    if-gez v0, :cond_5

    .line 1013
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "av_interleaved_write_frame() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " while writing interleaved audio frame."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1020
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1016
    :cond_4
    :try_start_1
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    iget-object v3, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1, v3}, Lcom/googlecode/javacv/cpp/avformat;->av_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    move-result v0

    if-gez v0, :cond_5

    .line 1017
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "av_write_frame() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " while writing audio frame."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1020
    :cond_5
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1021
    const/4 v1, 0x1

    :cond_6
    return v1
.end method

.method public record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Z
    .locals 2
    .parameter "image"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 695
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;IZ)Z

    move-result v0

    return v0
.end method

.method public record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;IZ)Z
    .locals 17
    .parameter "image"
    .parameter "pixelFormat"
    .parameter "encodeOnly"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 753
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-nez v1, :cond_0

    .line 754
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v4, "No video output stream (Is imageWidth > 0 && imageHeight > 0 and has start() been called?)"

    invoke-direct {v1, v4}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 757
    :cond_0
    if-nez p1, :cond_1

    .line 804
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v1

    and-int/lit8 v1, v1, 0x20

    if-eqz v1, :cond_14

    .line 805
    if-nez p1, :cond_11

    .line 806
    const/4 v1, 0x0

    .line 844
    :goto_1
    return v1

    .line 762
    :cond_1
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData:Z

    .line 763
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v2

    .line 764
    .local v2, width:I
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v3

    .line 765
    .local v3, height:I
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v16

    .line 766
    .local v16, step:I
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->imageData()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v13

    .line 768
    .local v13, data:Lcom/googlecode/javacpp/BytePointer;
    const/4 v1, -0x1

    move/from16 v0, p2

    if-ne v0, v1, :cond_3

    .line 769
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v14

    .line 770
    .local v14, depth:I
    invoke-virtual/range {p1 .. p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->nChannels()I

    move-result v12

    .line 771
    .local v12, channels:I
    const/16 v1, 0x8

    if-eq v14, v1, :cond_2

    const v1, -0x7ffffff8

    if-ne v14, v1, :cond_5

    :cond_2
    const/4 v1, 0x3

    if-ne v12, v1, :cond_5

    .line 772
    const/16 p2, 0x3

    .line 787
    .end local v12           #channels:I
    .end local v14           #depth:I
    :cond_3
    :goto_2
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt()I

    move-result v1

    move/from16 v0, p2

    if-ne v1, v0, :cond_4

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width()I

    move-result v1

    if-ne v1, v2, :cond_4

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height()I

    move-result v1

    if-eq v1, v3, :cond_10

    .line 789
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt()I

    move-result v7

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    check-cast v11, Lcom/googlecode/javacpp/DoublePointer;

    move/from16 v4, p2

    invoke-static/range {v1 .. v11}, Lcom/googlecode/javacv/cpp/swscale;->sws_getCachedContext(Lcom/googlecode/javacv/cpp/swscale$SwsContext;IIIIIIILcom/googlecode/javacv/cpp/swscale$SwsFilter;Lcom/googlecode/javacv/cpp/swscale$SwsFilter;Lcom/googlecode/javacpp/DoublePointer;)Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    move-result-object v1

    move-object/from16 v0, p0

    iput-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    .line 791
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    if-nez v1, :cond_f

    .line 792
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v4, "sws_getCachedContext() error: Cannot initialize the conversion context."

    invoke-direct {v1, v4}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 773
    .restart local v12       #channels:I
    .restart local v14       #depth:I
    :cond_5
    const/16 v1, 0x8

    if-eq v14, v1, :cond_6

    const v1, -0x7ffffff8

    if-ne v14, v1, :cond_7

    :cond_6
    const/4 v1, 0x1

    if-ne v12, v1, :cond_7

    .line 774
    const/16 p2, 0x8

    goto :goto_2

    .line 775
    :cond_7
    const/16 v1, 0x10

    if-eq v14, v1, :cond_8

    const v1, -0x7ffffff0

    if-ne v14, v1, :cond_a

    :cond_8
    const/4 v1, 0x1

    if-ne v12, v1, :cond_a

    .line 776
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    const/16 p2, 0x1f

    :goto_3
    goto/16 :goto_2

    :cond_9
    const/16 p2, 0x20

    goto :goto_3

    .line 777
    :cond_a
    const/16 v1, 0x8

    if-eq v14, v1, :cond_b

    const v1, -0x7ffffff8

    if-ne v14, v1, :cond_c

    :cond_b
    const/4 v1, 0x4

    if-ne v12, v1, :cond_c

    .line 778
    const/16 p2, 0x1c

    goto/16 :goto_2

    .line 779
    :cond_c
    const/16 v1, 0x8

    if-eq v14, v1, :cond_d

    const v1, -0x7ffffff8

    if-ne v14, v1, :cond_e

    :cond_d
    const/4 v1, 0x2

    if-ne v12, v1, :cond_e

    .line 780
    const/16 p2, 0x1a

    .line 781
    move/from16 v16, v2

    goto/16 :goto_2

    .line 783
    :cond_e
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not guess pixel format of image: depth="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", channels="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 794
    .end local v12           #channels:I
    .end local v14           #depth:I
    :cond_f
    new-instance v1, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move/from16 v0, p2

    invoke-static {v1, v13, v0, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec;->avpicture_fill(Lcom/googlecode/javacv/cpp/avcodec$AVPicture;Lcom/googlecode/javacpp/BytePointer;III)I

    .line 795
    new-instance v1, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v5}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt()I

    move-result v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v6}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v7}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height()I

    move-result v7

    invoke-static {v1, v4, v5, v6, v7}, Lcom/googlecode/javacv/cpp/avcodec;->avpicture_fill(Lcom/googlecode/javacv/cpp/avcodec$AVPicture;Lcom/googlecode/javacpp/BytePointer;III)I

    .line 796
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    const/4 v4, 0x0

    move/from16 v0, v16

    invoke-virtual {v1, v4, v0}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->linesize(II)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 797
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    new-instance v5, Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v5, v1}, Lcom/googlecode/javacpp/PointerPointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->linesize()Lcom/googlecode/javacpp/IntPointer;

    move-result-object v6

    const/4 v7, 0x0

    new-instance v9, Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v9, v1}, Lcom/googlecode/javacpp/PointerPointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->linesize()Lcom/googlecode/javacpp/IntPointer;

    move-result-object v10

    move v8, v3

    invoke-static/range {v4 .. v10}, Lcom/googlecode/javacv/cpp/swscale;->sws_scale(Lcom/googlecode/javacv/cpp/swscale$SwsContext;Lcom/googlecode/javacpp/PointerPointer;Lcom/googlecode/javacpp/IntPointer;IILcom/googlecode/javacpp/PointerPointer;Lcom/googlecode/javacpp/IntPointer;)I

    goto/16 :goto_0

    .line 800
    :cond_10
    new-instance v1, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move/from16 v0, p2

    invoke-static {v1, v13, v0, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec;->avpicture_fill(Lcom/googlecode/javacv/cpp/avcodec$AVPicture;Lcom/googlecode/javacpp/BytePointer;III)I

    .line 801
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    const/4 v4, 0x0

    move/from16 v0, v16

    invoke-virtual {v1, v4, v0}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->linesize(II)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    goto/16 :goto_0

    .line 809
    .end local v2           #width:I
    .end local v3           #height:I
    .end local v13           #data:Lcom/googlecode/javacpp/BytePointer;
    .end local v16           #step:I
    :cond_11
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1}, Lcom/googlecode/javacv/cpp/avcodec;->av_init_packet(Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 810
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->flags()I

    move-result v4

    or-int/lit8 v4, v4, 0x1

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 811
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->index()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->stream_index(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 812
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    new-instance v4, Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-direct {v4, v5}, Lcom/googlecode/javacpp/BytePointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 813
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    const-class v4, Lcom/googlecode/javacv/cpp/avcodec$AVPicture;

    invoke-static {v4}, Lcom/googlecode/javacpp/Loader;->sizeof(Ljava/lang/Class;)I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->size(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 841
    :cond_12
    :goto_4
    if-nez p3, :cond_13

    .line 842
    invoke-direct/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->writeVideoFrame()I

    .line 844
    :cond_13
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->key_frame()I

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    goto/16 :goto_1

    .line 817
    :cond_14
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1}, Lcom/googlecode/javacv/cpp/avcodec;->av_init_packet(Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 818
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 819
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf_size:I

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->size(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 820
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->global_quality()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->quality(I)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 821
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    if-nez p1, :cond_15

    const/4 v1, 0x0

    :goto_5
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_video_packet:[I

    invoke-static {v4, v5, v1, v6}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_encode_video2(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avutil$AVFrame;[I)I

    move-result v15

    .local v15, ret:I
    if-gez v15, :cond_16

    .line 822
    new-instance v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "avcodec_encode_video2() error "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": Could not encode video packet."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v1

    .line 821
    .end local v15           #ret:I
    :cond_15
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    goto :goto_5

    .line 824
    .restart local v15       #ret:I
    :cond_16
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts(J)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 827
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_video_packet:[I

    const/4 v4, 0x0

    aget v1, v1, v4

    if-eqz v1, :cond_19

    .line 828
    if-nez p3, :cond_12

    .line 829
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v4

    sget-wide v6, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v4, v6

    if-eqz v1, :cond_17

    .line 830
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v6}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v7}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 832
    :cond_17
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v4

    sget-wide v6, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v4, v6

    if-eqz v1, :cond_18

    .line 833
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v6}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v7}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 835
    :cond_18
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->index()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->stream_index(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    goto/16 :goto_4

    .line 838
    :cond_19
    const/4 v1, 0x0

    goto/16 :goto_1

    .line 844
    .end local v15           #ret:I
    :cond_1a
    const/4 v1, 0x0

    goto/16 :goto_1
.end method

.method public varargs record([Ljava/nio/Buffer;)Z
    .locals 24
    .parameter "samples"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 862
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-nez v2, :cond_0

    .line 863
    new-instance v2, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v3, "No audio output stream (Is audioChannels > 0 and has start() been called?)"

    invoke-direct {v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 865
    :cond_0
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData:Z

    .line 868
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    move-result v2

    const/4 v3, 0x0

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    move-result v3

    sub-int v19, v2, v3

    .line 869
    .local v19, inputSize:I
    const/4 v9, -0x1

    .line 870
    .local v9, inputFormat:I
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_1

    const/16 v16, 0x1

    .line 871
    .local v16, inputChannels:I
    :goto_0
    const/16 v18, 0x0

    .line 872
    .local v18, inputDepth:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt()I

    move-result v5

    .line 873
    .local v5, outputFormat:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    array-length v2, v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_2

    const/16 v20, 0x1

    .line 874
    .local v20, outputChannels:I
    :goto_1
    invoke-static {v5}, Lcom/googlecode/javacv/cpp/avutil;->av_get_bytes_per_sample(I)I

    move-result v22

    .line 875
    .local v22, outputDepth:I
    const/4 v2, 0x0

    aget-object v2, p1, v2

    instance-of v2, v2, Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_5

    .line 876
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_3

    const/4 v9, 0x5

    .line 877
    :goto_2
    const/16 v18, 0x1

    .line 878
    const/4 v15, 0x0

    .local v15, i:I
    :goto_3
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_12

    .line 879
    aget-object v13, p1, v15

    check-cast v13, Ljava/nio/ByteBuffer;

    .line 880
    .local v13, b:Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    instance-of v2, v2, Lcom/googlecode/javacpp/BytePointer;

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->capacity()I

    move-result v2

    move/from16 v0, v19

    if-lt v2, v0, :cond_4

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 881
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    check-cast v2, Lcom/googlecode/javacpp/BytePointer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v2

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    move/from16 v0, v19

    invoke-virtual {v2, v3, v4, v0}, Lcom/googlecode/javacpp/BytePointer;->put([BII)Lcom/googlecode/javacpp/BytePointer;

    .line 878
    :goto_4
    add-int/lit8 v15, v15, 0x1

    goto :goto_3

    .line 870
    .end local v5           #outputFormat:I
    .end local v13           #b:Ljava/nio/ByteBuffer;
    .end local v15           #i:I
    .end local v16           #inputChannels:I
    .end local v18           #inputDepth:I
    .end local v20           #outputChannels:I
    .end local v22           #outputDepth:I
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    move/from16 v16, v0

    goto :goto_0

    .line 873
    .restart local v5       #outputFormat:I
    .restart local v16       #inputChannels:I
    .restart local v18       #inputDepth:I
    :cond_2
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    move/from16 v20, v0

    goto :goto_1

    .line 876
    .restart local v20       #outputChannels:I
    .restart local v22       #outputDepth:I
    :cond_3
    const/4 v9, 0x0

    goto :goto_2

    .line 883
    .restart local v13       #b:Ljava/nio/ByteBuffer;
    .restart local v15       #i:I
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    new-instance v3, Lcom/googlecode/javacpp/BytePointer;

    invoke-direct {v3, v13}, Lcom/googlecode/javacpp/BytePointer;-><init>(Ljava/nio/ByteBuffer;)V

    aput-object v3, v2, v15

    goto :goto_4

    .line 886
    .end local v13           #b:Ljava/nio/ByteBuffer;
    .end local v15           #i:I
    :cond_5
    const/4 v2, 0x0

    aget-object v2, p1, v2

    instance-of v2, v2, Ljava/nio/ShortBuffer;

    if-eqz v2, :cond_8

    .line 887
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_6

    const/4 v9, 0x6

    .line 888
    :goto_5
    const/16 v18, 0x2

    .line 889
    const/4 v15, 0x0

    .restart local v15       #i:I
    :goto_6
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_12

    .line 890
    aget-object v13, p1, v15

    check-cast v13, Ljava/nio/ShortBuffer;

    .line 891
    .local v13, b:Ljava/nio/ShortBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    instance-of v2, v2, Lcom/googlecode/javacpp/ShortPointer;

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->capacity()I

    move-result v2

    move/from16 v0, v19

    if-lt v2, v0, :cond_7

    invoke-virtual {v13}, Ljava/nio/ShortBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 892
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    check-cast v2, Lcom/googlecode/javacpp/ShortPointer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/ShortPointer;->position(I)Lcom/googlecode/javacpp/ShortPointer;

    move-result-object v2

    invoke-virtual {v13}, Ljava/nio/ShortBuffer;->array()[S

    move-result-object v3

    aget-object v4, p1, v15

    invoke-virtual {v4}, Ljava/nio/Buffer;->position()I

    move-result v4

    move/from16 v0, v19

    invoke-virtual {v2, v3, v4, v0}, Lcom/googlecode/javacpp/ShortPointer;->put([SII)Lcom/googlecode/javacpp/ShortPointer;

    .line 889
    :goto_7
    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 887
    .end local v13           #b:Ljava/nio/ShortBuffer;
    .end local v15           #i:I
    :cond_6
    const/4 v9, 0x1

    goto :goto_5

    .line 894
    .restart local v13       #b:Ljava/nio/ShortBuffer;
    .restart local v15       #i:I
    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    new-instance v3, Lcom/googlecode/javacpp/ShortPointer;

    invoke-direct {v3, v13}, Lcom/googlecode/javacpp/ShortPointer;-><init>(Ljava/nio/ShortBuffer;)V

    aput-object v3, v2, v15

    goto :goto_7

    .line 897
    .end local v13           #b:Ljava/nio/ShortBuffer;
    .end local v15           #i:I
    :cond_8
    const/4 v2, 0x0

    aget-object v2, p1, v2

    instance-of v2, v2, Ljava/nio/IntBuffer;

    if-eqz v2, :cond_b

    .line 898
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_9

    const/4 v9, 0x7

    .line 899
    :goto_8
    const/16 v18, 0x4

    .line 900
    const/4 v15, 0x0

    .restart local v15       #i:I
    :goto_9
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_12

    .line 901
    aget-object v13, p1, v15

    check-cast v13, Ljava/nio/IntBuffer;

    .line 902
    .local v13, b:Ljava/nio/IntBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    instance-of v2, v2, Lcom/googlecode/javacpp/IntPointer;

    if-eqz v2, :cond_a

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->capacity()I

    move-result v2

    move/from16 v0, v19

    if-lt v2, v0, :cond_a

    invoke-virtual {v13}, Ljava/nio/IntBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 903
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    check-cast v2, Lcom/googlecode/javacpp/IntPointer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/IntPointer;->position(I)Lcom/googlecode/javacpp/IntPointer;

    move-result-object v2

    invoke-virtual {v13}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v3

    aget-object v4, p1, v15

    invoke-virtual {v4}, Ljava/nio/Buffer;->position()I

    move-result v4

    move/from16 v0, v19

    invoke-virtual {v2, v3, v4, v0}, Lcom/googlecode/javacpp/IntPointer;->put([III)Lcom/googlecode/javacpp/IntPointer;

    .line 900
    :goto_a
    add-int/lit8 v15, v15, 0x1

    goto :goto_9

    .line 898
    .end local v13           #b:Ljava/nio/IntBuffer;
    .end local v15           #i:I
    :cond_9
    const/4 v9, 0x2

    goto :goto_8

    .line 905
    .restart local v13       #b:Ljava/nio/IntBuffer;
    .restart local v15       #i:I
    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    new-instance v3, Lcom/googlecode/javacpp/IntPointer;

    invoke-direct {v3, v13}, Lcom/googlecode/javacpp/IntPointer;-><init>(Ljava/nio/IntBuffer;)V

    aput-object v3, v2, v15

    goto :goto_a

    .line 908
    .end local v13           #b:Ljava/nio/IntBuffer;
    .end local v15           #i:I
    :cond_b
    const/4 v2, 0x0

    aget-object v2, p1, v2

    instance-of v2, v2, Ljava/nio/FloatBuffer;

    if-eqz v2, :cond_e

    .line 909
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_c

    const/16 v9, 0x8

    .line 910
    :goto_b
    const/16 v18, 0x4

    .line 911
    const/4 v15, 0x0

    .restart local v15       #i:I
    :goto_c
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_12

    .line 912
    aget-object v13, p1, v15

    check-cast v13, Ljava/nio/FloatBuffer;

    .line 913
    .local v13, b:Ljava/nio/FloatBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    instance-of v2, v2, Lcom/googlecode/javacpp/FloatPointer;

    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->capacity()I

    move-result v2

    move/from16 v0, v19

    if-lt v2, v0, :cond_d

    invoke-virtual {v13}, Ljava/nio/FloatBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 914
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    check-cast v2, Lcom/googlecode/javacpp/FloatPointer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/FloatPointer;->position(I)Lcom/googlecode/javacpp/FloatPointer;

    move-result-object v2

    invoke-virtual {v13}, Ljava/nio/FloatBuffer;->array()[F

    move-result-object v3

    invoke-virtual {v13}, Ljava/nio/FloatBuffer;->position()I

    move-result v4

    move/from16 v0, v19

    invoke-virtual {v2, v3, v4, v0}, Lcom/googlecode/javacpp/FloatPointer;->put([FII)Lcom/googlecode/javacpp/FloatPointer;

    .line 911
    :goto_d
    add-int/lit8 v15, v15, 0x1

    goto :goto_c

    .line 909
    .end local v13           #b:Ljava/nio/FloatBuffer;
    .end local v15           #i:I
    :cond_c
    const/4 v9, 0x3

    goto :goto_b

    .line 916
    .restart local v13       #b:Ljava/nio/FloatBuffer;
    .restart local v15       #i:I
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    new-instance v3, Lcom/googlecode/javacpp/FloatPointer;

    invoke-direct {v3, v13}, Lcom/googlecode/javacpp/FloatPointer;-><init>(Ljava/nio/FloatBuffer;)V

    aput-object v3, v2, v15

    goto :goto_d

    .line 919
    .end local v13           #b:Ljava/nio/FloatBuffer;
    .end local v15           #i:I
    :cond_e
    const/4 v2, 0x0

    aget-object v2, p1, v2

    instance-of v2, v2, Ljava/nio/DoubleBuffer;

    if-eqz v2, :cond_11

    .line 920
    move-object/from16 v0, p1

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_f

    const/16 v9, 0x9

    .line 921
    :goto_e
    const/16 v18, 0x8

    .line 922
    const/4 v15, 0x0

    .restart local v15       #i:I
    :goto_f
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_12

    .line 923
    aget-object v13, p1, v15

    check-cast v13, Ljava/nio/DoubleBuffer;

    .line 924
    .local v13, b:Ljava/nio/DoubleBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    instance-of v2, v2, Lcom/googlecode/javacpp/DoublePointer;

    if-eqz v2, :cond_10

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->capacity()I

    move-result v2

    move/from16 v0, v19

    if-lt v2, v0, :cond_10

    invoke-virtual {v13}, Ljava/nio/DoubleBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 925
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    check-cast v2, Lcom/googlecode/javacpp/DoublePointer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/DoublePointer;->position(I)Lcom/googlecode/javacpp/DoublePointer;

    move-result-object v2

    invoke-virtual {v13}, Ljava/nio/DoubleBuffer;->array()[D

    move-result-object v3

    invoke-virtual {v13}, Ljava/nio/DoubleBuffer;->position()I

    move-result v4

    move/from16 v0, v19

    invoke-virtual {v2, v3, v4, v0}, Lcom/googlecode/javacpp/DoublePointer;->put([DII)Lcom/googlecode/javacpp/DoublePointer;

    .line 922
    :goto_10
    add-int/lit8 v15, v15, 0x1

    goto :goto_f

    .line 920
    .end local v13           #b:Ljava/nio/DoubleBuffer;
    .end local v15           #i:I
    :cond_f
    const/4 v9, 0x4

    goto :goto_e

    .line 927
    .restart local v13       #b:Ljava/nio/DoubleBuffer;
    .restart local v15       #i:I
    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    new-instance v3, Lcom/googlecode/javacpp/DoublePointer;

    invoke-direct {v3, v13}, Lcom/googlecode/javacpp/DoublePointer;-><init>(Ljava/nio/DoubleBuffer;)V

    aput-object v3, v2, v15

    goto :goto_10

    .line 931
    .end local v13           #b:Ljava/nio/DoubleBuffer;
    .end local v15           #i:I
    :cond_11
    new-instance v2, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Audio samples Buffer has unsupported type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 934
    .restart local v15       #i:I
    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    if-nez v2, :cond_14

    .line 935
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v3}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channel_layout()J

    move-result-wide v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v6}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_rate()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v7}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channel_layout()J

    move-result-wide v7

    move-object/from16 v0, p0

    iget-object v10, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v10}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_rate()I

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v2 .. v12}, Lcom/googlecode/javacv/cpp/swresample;->swr_alloc_set_opts(Lcom/googlecode/javacv/cpp/swresample$SwrContext;JIIJIIILcom/googlecode/javacpp/Pointer;)Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    .line 938
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    if-nez v2, :cond_13

    .line 939
    new-instance v2, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v3, "swr_alloc_set_opts() error: Cannot allocate the conversion context."

    invoke-direct {v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 940
    :cond_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/swresample;->swr_init(Lcom/googlecode/javacv/cpp/swresample$SwrContext;)I

    move-result v23

    .local v23, ret:I
    if-gez v23, :cond_14

    .line 941
    new-instance v2, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "swr_init() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Cannot initialize the conversion context."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 945
    .end local v23           #ret:I
    :cond_14
    const/4 v15, 0x0

    :goto_11
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_16

    .line 946
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v3, v3, v15

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Pointer;->position()I

    move-result v3

    mul-int v3, v3, v18

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v3, v3, v15

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Pointer;->position()I

    move-result v3

    add-int v3, v3, v19

    mul-int v3, v3, v18

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Pointer;->limit(I)Lcom/googlecode/javacpp/Pointer;

    .line 945
    add-int/lit8 v15, v15, 0x1

    goto :goto_11

    .line 976
    .local v14, count:I
    .local v17, inputCount:I
    .local v21, outputCount:I
    .restart local v23       #ret:I
    :cond_15
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v3}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->global_quality()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->quality(I)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 977
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)Z

    .line 949
    .end local v14           #count:I
    .end local v17           #inputCount:I
    .end local v21           #outputCount:I
    .end local v23           #ret:I
    :cond_16
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->position()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Pointer;->limit()I

    move-result v3

    if-ge v2, v3, :cond_1c

    .line 950
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/googlecode/javacpp/Pointer;->limit()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Pointer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int v3, v16, v18

    div-int v17, v2, v3

    .line 951
    .restart local v17       #inputCount:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/googlecode/javacpp/BytePointer;->limit()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/googlecode/javacpp/BytePointer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    mul-int v3, v20, v22

    div-int v21, v2, v3

    .line 952
    .restart local v21       #outputCount:I
    move/from16 v0, v17

    move/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v14

    .line 953
    .restart local v14       #count:I
    const/4 v15, 0x0

    :goto_12
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_17

    .line 954
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in_ptr:Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v3, v3, v15

    invoke-virtual {v2, v15, v3}, Lcom/googlecode/javacpp/PointerPointer;->put(ILcom/googlecode/javacpp/Pointer;)Lcom/googlecode/javacpp/PointerPointer;

    .line 953
    add-int/lit8 v15, v15, 0x1

    goto :goto_12

    .line 956
    :cond_17
    const/4 v15, 0x0

    :goto_13
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    array-length v2, v2

    if-ge v15, v2, :cond_18

    .line 957
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out_ptr:Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v3, v3, v15

    invoke-virtual {v2, v15, v3}, Lcom/googlecode/javacpp/PointerPointer;->put(ILcom/googlecode/javacpp/Pointer;)Lcom/googlecode/javacpp/PointerPointer;

    .line 956
    add-int/lit8 v15, v15, 0x1

    goto :goto_13

    .line 959
    :cond_18
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out_ptr:Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in_ptr:Lcom/googlecode/javacpp/PointerPointer;

    invoke-static {v2, v3, v14, v4, v14}, Lcom/googlecode/javacv/cpp/swresample;->swr_convert(Lcom/googlecode/javacv/cpp/swresample$SwrContext;Lcom/googlecode/javacpp/PointerPointer;ILcom/googlecode/javacpp/PointerPointer;I)I

    move-result v23

    .restart local v23       #ret:I
    if-gez v23, :cond_19

    .line 960
    new-instance v2, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "swr_convert() error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Cannot convert audio samples."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 962
    :cond_19
    const/4 v15, 0x0

    :goto_14
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v15, v2, :cond_1a

    .line 963
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v2, v2, v15

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    aget-object v3, v3, v15

    invoke-virtual {v3}, Lcom/googlecode/javacpp/Pointer;->position()I

    move-result v3

    mul-int v4, v23, v16

    mul-int v4, v4, v18

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    .line 962
    add-int/lit8 v15, v15, 0x1

    goto :goto_14

    .line 965
    :cond_1a
    const/4 v15, 0x0

    :goto_15
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    array-length v2, v2

    if-ge v15, v2, :cond_1b

    .line 966
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v2, v2, v15

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v3, v3, v15

    invoke-virtual {v3}, Lcom/googlecode/javacpp/BytePointer;->position()I

    move-result v3

    mul-int v4, v23, v20

    mul-int v4, v4, v22

    add-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    .line 965
    add-int/lit8 v15, v15, 0x1

    goto :goto_15

    .line 969
    :cond_1b
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/googlecode/javacpp/BytePointer;->position()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/googlecode/javacpp/BytePointer;->limit()I

    move-result v3

    if-lt v2, v3, :cond_16

    .line 970
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    invoke-virtual {v2, v3}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->nb_samples(I)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 971
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channels()I

    move-result v4

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v6, 0x0

    aget-object v6, v2, v6

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    const/4 v7, 0x0

    aget-object v2, v2, v7

    invoke-virtual {v2}, Lcom/googlecode/javacpp/BytePointer;->limit()I

    move-result v7

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_fill_audio_frame(Lcom/googlecode/javacv/cpp/avutil$AVFrame;IILcom/googlecode/javacpp/BytePointer;II)I

    .line 972
    const/4 v15, 0x0

    :goto_16
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    array-length v2, v2

    if-ge v15, v2, :cond_15

    .line 973
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v3, v3, v15

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v3

    invoke-virtual {v2, v15, v3}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->data(ILcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 974
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v3, v3, v15

    invoke-virtual {v3}, Lcom/googlecode/javacpp/BytePointer;->limit()I

    move-result v3

    invoke-virtual {v2, v15, v3}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->linesize(II)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 972
    add-int/lit8 v15, v15, 0x1

    goto :goto_16

    .line 980
    .end local v14           #count:I
    .end local v17           #inputCount:I
    .end local v21           #outputCount:I
    .end local v23           #ret:I
    :cond_1c
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->key_frame()I

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v2, 0x1

    :goto_17
    return v2

    :cond_1d
    const/4 v2, 0x0

    goto :goto_17
.end method

.method public release()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 187
    const/4 v2, 0x1

    iput-boolean v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->isReleased:Z

    .line 189
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    if-eqz v2, :cond_0

    .line 190
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_close(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;)I

    .line 191
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 193
    :cond_0
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    if-eqz v2, :cond_1

    .line 194
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_close(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;)I

    .line 195
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 197
    :cond_1
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    if-eqz v2, :cond_2

    .line 198
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 199
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    .line 201
    :cond_2
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-eqz v2, :cond_3

    .line 202
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_free_frame(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)V

    .line 203
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 205
    :cond_3
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-eqz v2, :cond_4

    .line 206
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_free_frame(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)V

    .line 207
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 209
    :cond_4
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    if-eqz v2, :cond_5

    .line 210
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 211
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 213
    :cond_5
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-eqz v2, :cond_6

    .line 214
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_free_frame(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)V

    .line 215
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 217
    :cond_6
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    if-eqz v2, :cond_8

    .line 218
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 219
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    aget-object v2, v2, v0

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v2

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 221
    :cond_7
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    .line 223
    .end local v0           #i:I
    :cond_8
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    if-eqz v2, :cond_9

    .line 224
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 225
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 227
    :cond_9
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    .line 228
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    .line 230
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    if-eqz v2, :cond_b

    .line 232
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->nb_streams()I

    move-result v1

    .line 233
    .local v1, nb_streams:I
    const/4 v0, 0x0

    .restart local v0       #i:I
    :goto_1
    if-ge v0, v1, :cond_a

    .line 234
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-virtual {v2, v0}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->streams(I)Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-result-object v2

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->codec()Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v2

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 235
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-virtual {v2, v0}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->streams(I)Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-result-object v2

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 233
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 239
    :cond_a
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/avutil;->av_free(Lcom/googlecode/javacpp/Pointer;)V

    .line 240
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    .line 243
    .end local v0           #i:I
    .end local v1           #nb_streams:I
    :cond_b
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    if-eqz v2, :cond_c

    .line 244
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/swscale;->sws_freeContext(Lcom/googlecode/javacv/cpp/swscale$SwsContext;)V

    .line 245
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->img_convert_ctx:Lcom/googlecode/javacv/cpp/swscale$SwsContext;

    .line 248
    :cond_c
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    if-eqz v2, :cond_d

    .line 249
    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    invoke-static {v2}, Lcom/googlecode/javacv/cpp/swresample;->swr_free(Lcom/googlecode/javacv/cpp/swresample$SwrContext;)V

    .line 250
    iput-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_convert_ctx:Lcom/googlecode/javacv/cpp/swresample$SwrContext;

    .line 252
    :cond_d
    return-void
.end method

.method public setAudioCodec(I)V
    .locals 0
    .parameter "audioCodec"

    .prologue
    .line 1055
    iput p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodec:I

    .line 1056
    return-void
.end method

.method public setAudioCodecName(Ljava/lang/String;)V
    .locals 0
    .parameter "audioCodecName"

    .prologue
    .line 858
    iput-object p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodecName:Ljava/lang/String;

    .line 859
    return-void
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 0
    .parameter "format"

    .prologue
    .line 1036
    iput-object p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    .line 1037
    return-void
.end method

.method public setFrameNumber(I)V
    .locals 3
    .parameter "frameNumber"

    .prologue
    .line 292
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v0, :cond_0

    .line 293
    iput p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameNumber:I

    .line 297
    :goto_0
    return-void

    .line 295
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts(J)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    goto :goto_0
.end method

.method public setFrameRate(D)V
    .locals 0
    .parameter "frameRate"

    .prologue
    .line 1047
    iput-wide p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameRate:D

    .line 1048
    return-void
.end method

.method public setSampleFormat(I)V
    .locals 0
    .parameter "sampleFormat"

    .prologue
    .line 1051
    iput p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleFormat:I

    .line 1052
    return-void
.end method

.method public setSampleRate(I)V
    .locals 0
    .parameter "sampleRate"

    .prologue
    .line 1059
    iput p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    .line 1060
    return-void
.end method

.method public setTimestamp(J)V
    .locals 4
    .parameter "timestamp"

    .prologue
    .line 314
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-eqz v0, :cond_0

    .line 315
    long-to-double v0, p1

    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFrameRate()D

    move-result-wide v2

    mul-double/2addr v0, v2

    const-wide v2, 0x412e848000000000L

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameNumber(I)V

    .line 317
    :cond_0
    return-void
.end method

.method public setTimestampAndGetFrameNumber(J)I
    .locals 5
    .parameter "timestamp"

    .prologue
    .line 308
    long-to-double v1, p1

    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getFrameRate()D

    move-result-wide v3

    mul-double/2addr v1, v3

    const-wide v3, 0x412e848000000000L

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    move-result-wide v1

    long-to-int v0, v1

    .line 309
    .local v0, fn:I
    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameNumber(I)V

    .line 310
    return v0
.end method

.method public setVideoCodec(I)V
    .locals 0
    .parameter "videoCodec"

    .prologue
    .line 1040
    iput p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodec:I

    .line 1041
    return-void
.end method

.method public setVideoCodecName(Ljava/lang/String;)V
    .locals 0
    .parameter "videoCodecName"

    .prologue
    .line 851
    iput-object p1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodecName:Ljava/lang/String;

    .line 852
    return-void
.end method

.method public start()V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 321
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 322
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 323
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    .line 324
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 325
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 326
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 327
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    .line 328
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 329
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 330
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    .line 331
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    .line 332
    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [I

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_video_packet:[I

    .line 333
    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [I

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->got_audio_packet:[I

    .line 336
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-nez v17, :cond_2

    :cond_0
    const/4 v5, 0x0

    .line 337
    .local v5, format_name:Ljava/lang/String;
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v5, v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->av_guess_format(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    if-nez v17, :cond_3

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, "://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v13

    .line 339
    .local v13, proto:I
    if-lez v13, :cond_1

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 342
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v5, v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->av_guess_format(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    if-nez v17, :cond_3

    .line 343
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "av_guess_format() error: Could not guess output format for \""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "\" and "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " format."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 336
    .end local v5           #format_name:Ljava/lang/String;
    .end local v13           #proto:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->format:Ljava/lang/String;

    goto/16 :goto_0

    .line 346
    .restart local v5       #format_name:Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->name()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacpp/BytePointer;->getString()Ljava/lang/String;

    move-result-object v5

    .line 349
    invoke-static {}, Lcom/googlecode/javacv/cpp/avformat;->avformat_alloc_context()Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    if-nez v17, :cond_4

    .line 350
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avformat_alloc_context() error: Could not allocate format context"

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 353
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->oformat(Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;)Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    .line 354
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->filename()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacpp/BytePointer;->putString(Ljava/lang/String;)Lcom/googlecode/javacpp/BytePointer;

    .line 359
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v17, v0

    if-lez v17, :cond_10

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v17, v0

    if-lez v17, :cond_10

    .line 360
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodec:I

    move/from16 v17, v0

    if-eqz v17, :cond_6

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodec:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    .line 373
    :cond_5
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoCodecName:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_find_encoder_by_name(Ljava/lang/String;)Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    if-nez v17, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec()I

    move-result v17

    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_find_encoder(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    if-nez v17, :cond_a

    .line 375
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 376
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avcodec_find_encoder() error: Video codec not found."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 362
    :cond_6
    const-string v17, "flv"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_7

    .line 363
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const/16 v18, 0x16

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto :goto_1

    .line 364
    :cond_7
    const-string v17, "mp4"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 365
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const/16 v18, 0xd

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto :goto_1

    .line 366
    :cond_8
    const-string v17, "3gp"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_9

    .line 367
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const/16 v18, 0x5

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto :goto_1

    .line 368
    :cond_9
    const-string v17, "avi"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const/16 v18, 0x1a

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto/16 :goto_1

    .line 379
    :cond_a
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frameRate:D

    move-wide/from16 v17, v0

    const v19, 0xf4628

    invoke-static/range {v17 .. v19}, Lcom/googlecode/javacv/cpp/avutil;->av_d2q(DI)Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v6

    .line 380
    .local v6, frame_rate:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodec;->supported_framerates()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v16

    .line 381
    .local v16, supported_framerates:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    if-eqz v16, :cond_b

    .line 382
    move-object/from16 v0, v16

    invoke-static {v6, v0}, Lcom/googlecode/javacv/cpp/avutil;->av_find_nearest_q_idx(Lcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)I

    move-result v9

    .line 383
    .local v9, idx:I
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Lcom/googlecode/javacv/cpp/avutil$AVRational;->position(I)Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v6

    .line 387
    .end local v9           #idx:I
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat;->avformat_new_stream(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVCodec;)Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-nez v17, :cond_c

    .line 388
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 389
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avformat_new_stream() error: Could not allocate video stream."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 391
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->codec()Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 392
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->video_codec()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_type(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 396
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoBitrate:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bit_rate(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0xf

    div-int/lit8 v18, v18, 0x10

    mul-int/lit8 v18, v18, 0x10

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-static {v6}, Lcom/googlecode/javacv/cpp/avutil;->av_inv_q(Lcom/googlecode/javacv/cpp/avutil$AVRational;)Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base(Lcom/googlecode/javacv/cpp/avutil$AVRational;)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0xc

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->gop_size(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 406
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoQuality:D

    move-wide/from16 v17, v0

    const-wide/16 v19, 0x0

    cmpl-double v17, v17, v19

    if-ltz v17, :cond_d

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags()I

    move-result v18

    or-int/lit8 v18, v18, 0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 408
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const-wide v18, 0x405d800000000000L

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoQuality:D

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->round(D)J

    move-result-wide v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->global_quality(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 411
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->pixelFormat:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_12

    .line 412
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->pixelFormat:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 420
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_15

    .line 422
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->max_b_frames(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 448
    :cond_e
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v17

    and-int/lit8 v17, v17, 0x40

    if-eqz v17, :cond_f

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags()I

    move-result v18

    const/high16 v19, 0x40

    or-int v18, v18, v19

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 452
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodec;->capabilities()I

    move-result v17

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0x200

    move/from16 v17, v0

    if-eqz v17, :cond_10

    .line 453
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, -0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->strict_std_compliance(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 460
    .end local v6           #frame_rate:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    .end local v16           #supported_framerates:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    :cond_10
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    move/from16 v17, v0

    if-lez v17, :cond_26

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioBitrate:I

    move/from16 v17, v0

    if-lez v17, :cond_26

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    move/from16 v17, v0

    if-lez v17, :cond_26

    .line 461
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodec:I

    move/from16 v17, v0

    if-eqz v17, :cond_1c

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodec:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->audio_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    .line 470
    :cond_11
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioCodecName:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_find_encoder_by_name(Ljava/lang/String;)Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    if-nez v17, :cond_1f

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->audio_codec()I

    move-result v17

    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_find_encoder(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    if-nez v17, :cond_1f

    .line 472
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 473
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avcodec_find_encoder() error: Audio codec not found."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 413
    .restart local v6       #frame_rate:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    .restart local v16       #supported_framerates:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0xe

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x3e

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x1a

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x22

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_14

    .line 415
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    sget v18, Lcom/googlecode/javacv/cpp/avutil;->AV_PIX_FMT_RGB32:I

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_2

    .line 417
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_2

    .line 423
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_16

    .line 427
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->mb_decision(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 428
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x5

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_1b

    .line 430
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v17, v0

    const/16 v18, 0x80

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_17

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v17, v0

    const/16 v18, 0x60

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_17

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x80

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    const/16 v18, 0x60

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 432
    :cond_17
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v17, v0

    const/16 v18, 0xb0

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_18

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v17, v0

    const/16 v18, 0x90

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_18

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0xb0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    const/16 v18, 0x90

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 434
    :cond_18
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v17, v0

    const/16 v18, 0x160

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_19

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v17, v0

    const/16 v18, 0x120

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_19

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x160

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    const/16 v18, 0x120

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 436
    :cond_19
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageWidth:I

    move/from16 v17, v0

    const/16 v18, 0x2c0

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_1a

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->imageHeight:I

    move/from16 v17, v0

    const/16 v18, 0x240

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_1a

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x2c0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    const/16 v18, 0x240

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 439
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x580

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    const/16 v18, 0x480

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 441
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const/16 v18, 0x1c

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_e

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x242

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->profile(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_3

    .line 463
    .end local v6           #frame_rate:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    .end local v16           #supported_framerates:Lcom/googlecode/javacv/cpp/avutil$AVRational;
    :cond_1c
    const-string v17, "flv"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1d

    const-string v17, "mp4"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1d

    const-string v17, "3gp"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1e

    .line 464
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const v18, 0x15002

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->audio_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto/16 :goto_4

    .line 465
    :cond_1e
    const-string v17, "avi"

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_11

    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    const/high16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->audio_codec(I)Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    goto/16 :goto_4

    .line 476
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v18, v0

    invoke-static/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avformat;->avformat_new_stream(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVCodec;)Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-nez v17, :cond_20

    .line 477
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 478
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avformat_new_stream() error: Could not allocate audio stream."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 480
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->codec()Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->audio_codec()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_type(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 485
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioBitrate:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bit_rate(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 486
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_rate(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 487
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channels(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 488
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioChannels:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avutil;->av_get_default_channel_layout(I)J

    move-result-wide v18

    invoke-virtual/range {v17 .. v19}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channel_layout(J)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 489
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleFormat:I

    move/from16 v17, v0

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_21

    .line 490
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleFormat:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 497
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v17

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avutil$AVRational;->num(I)Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v17

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->sampleRate:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avutil$AVRational;->den(I)Lcom/googlecode/javacv/cpp/avutil$AVRational;

    .line 498
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt()I

    move-result v17

    packed-switch v17, :pswitch_data_0

    .line 520
    sget-boolean v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->$assertionsDisabled:Z

    if-nez v17, :cond_23

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 491
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    const v18, 0x15002

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_22

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodec;->capabilities()I

    move-result v17

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0x200

    move/from16 v17, v0

    if-eqz v17, :cond_22

    .line 493
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x8

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto :goto_5

    .line 495
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto :goto_5

    .line 501
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x8

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bits_per_raw_sample(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 522
    :cond_23
    :goto_6
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioQuality:D

    move-wide/from16 v17, v0

    const-wide/16 v19, 0x0

    cmpl-double v17, v17, v19

    if-ltz v17, :cond_24

    .line 523
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags()I

    move-result v18

    or-int/lit8 v18, v18, 0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const-wide v18, 0x405d800000000000L

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioQuality:D

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->round(D)J

    move-result-wide v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->global_quality(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 528
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v17

    and-int/lit8 v17, v17, 0x40

    if-eqz v17, :cond_25

    .line 529
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags()I

    move-result v18

    const/high16 v19, 0x40

    or-int v18, v18, v19

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 532
    :cond_25
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodec;->capabilities()I

    move-result v17

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0x200

    move/from16 v17, v0

    if-eqz v17, :cond_26

    .line 533
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, -0x2

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->strict_std_compliance(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    .line 537
    :cond_26
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-static/range {v17 .. v20}, Lcom/googlecode/javacv/cpp/avformat;->av_dump_format(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;ILjava/lang/String;I)V

    .line 541
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-object/from16 v17, v0

    if-eqz v17, :cond_2d

    .line 542
    new-instance v10, Lcom/googlecode/javacv/cpp/avutil$AVDictionary;

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Lcom/googlecode/javacv/cpp/avutil$AVDictionary;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    .line 543
    .local v10, options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoQuality:D

    move-wide/from16 v17, v0

    const-wide/16 v19, 0x0

    cmpl-double v17, v17, v19

    if-ltz v17, :cond_27

    .line 544
    const-string v17, "crf"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoQuality:D

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_set(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;Ljava/lang/String;Ljava/lang/String;I)I

    .line 546
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->videoOptions:Ljava/util/HashMap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_28

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 547
    .local v4, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_set(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;Ljava/lang/String;Ljava/lang/String;I)I

    goto :goto_7

    .line 505
    .end local v4           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v10           #options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x10

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bits_per_raw_sample(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_6

    .line 509
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bits_per_raw_sample(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_6

    .line 513
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bits_per_raw_sample(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_6

    .line 517
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    const/16 v18, 0x40

    invoke-virtual/range {v17 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->bits_per_raw_sample(I)Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    goto/16 :goto_6

    .line 550
    .restart local v8       #i$:Ljava/util/Iterator;
    .restart local v10       #options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    :cond_28
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v10}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_open2(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;Lcom/googlecode/javacv/cpp/avcodec$AVCodec;Lcom/googlecode/javacv/cpp/avutil$AVDictionary;)I

    move-result v14

    .local v14, ret:I
    if-gez v14, :cond_29

    .line 551
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 552
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "avcodec_open2() error "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ": Could not open video codec."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 554
    :cond_29
    invoke-static {v10}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_free(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;)V

    .line 556
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 557
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v17

    and-int/lit8 v17, v17, 0x20

    if-nez v17, :cond_2a

    .line 564
    const/high16 v17, 0x4

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width()I

    move-result v18

    mul-int/lit8 v18, v18, 0x8

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height()I

    move-result v19

    mul-int v18, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf_size:I

    .line 565
    new-instance v17, Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf_size:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Lcom/googlecode/javacv/cpp/avutil;->av_malloc(J)Lcom/googlecode/javacpp/Pointer;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lcom/googlecode/javacpp/BytePointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 569
    :cond_2a
    invoke-static {}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_alloc_frame()Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v17, :cond_2b

    .line 570
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 571
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avcodec_alloc_frame() error: Could not allocate picture."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 573
    :cond_2b
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-object/from16 v17, v0

    const-wide/16 v18, 0x0

    invoke-virtual/range {v17 .. v19}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts(J)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->pix_fmt()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->width()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->height()I

    move-result v19

    invoke-static/range {v17 .. v19}, Lcom/googlecode/javacv/cpp/avcodec;->avpicture_get_size(III)I

    move-result v15

    .line 576
    .local v15, size:I
    new-instance v17, Lcom/googlecode/javacpp/BytePointer;

    int-to-long v0, v15

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Lcom/googlecode/javacv/cpp/avutil;->av_malloc(J)Lcom/googlecode/javacpp/Pointer;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lcom/googlecode/javacpp/BytePointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture_buf:Lcom/googlecode/javacpp/BytePointer;

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacpp/BytePointer;->isNull()Z

    move-result v17

    if-eqz v17, :cond_2c

    .line 577
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 578
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "av_malloc() error: Could not allocate picture buffer."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 583
    :cond_2c
    invoke-static {}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_alloc_frame()Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->tmp_picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v17, :cond_2d

    .line 584
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 585
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avcodec_alloc_frame() error: Could not allocate temporary picture."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 589
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v10           #options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    .end local v14           #ret:I
    .end local v15           #size:I
    :cond_2d
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    move-object/from16 v17, v0

    if-eqz v17, :cond_34

    .line 590
    new-instance v10, Lcom/googlecode/javacv/cpp/avutil$AVDictionary;

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Lcom/googlecode/javacv/cpp/avutil$AVDictionary;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    .line 591
    .restart local v10       #options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioQuality:D

    move-wide/from16 v17, v0

    const-wide/16 v19, 0x0

    cmpl-double v17, v17, v19

    if-ltz v17, :cond_2e

    .line 592
    const-string v17, "crf"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioQuality:D

    move-wide/from16 v19, v0

    invoke-virtual/range {v18 .. v20}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_set(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;Ljava/lang/String;Ljava/lang/String;I)I

    .line 594
    :cond_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audioOptions:Ljava/util/HashMap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_2f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 595
    .restart local v4       #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v10, v0, v1, v2}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_set(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;Ljava/lang/String;Ljava/lang/String;I)I

    goto :goto_8

    .line 598
    .end local v4           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_codec:Lcom/googlecode/javacv/cpp/avcodec$AVCodec;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v10}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_open2(Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;Lcom/googlecode/javacv/cpp/avcodec$AVCodec;Lcom/googlecode/javacv/cpp/avutil$AVDictionary;)I

    move-result v14

    .restart local v14       #ret:I
    if-gez v14, :cond_30

    .line 599
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 600
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "avcodec_open2() error "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ": Could not open audio codec."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 602
    :cond_30
    invoke-static {v10}, Lcom/googlecode/javacv/cpp/avutil;->av_dict_free(Lcom/googlecode/javacv/cpp/avutil$AVDictionary;)V

    .line 604
    const/high16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf_size:I

    .line 605
    new-instance v17, Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf_size:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Lcom/googlecode/javacv/cpp/avutil;->av_malloc(J)Lcom/googlecode/javacpp/Pointer;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lcom/googlecode/javacpp/BytePointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf:Lcom/googlecode/javacpp/BytePointer;

    .line 609
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->frame_size()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_31

    .line 610
    const/16 v17, 0x4000

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf_size:I

    .line 611
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_outbuf_size:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channels()I

    move-result v18

    div-int v17, v17, v18

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    .line 612
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->codec_id()I

    move-result v17

    packed-switch v17, :pswitch_data_1

    .line 626
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt()I

    move-result v17

    invoke-static/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avutil;->av_sample_fmt_is_planar(I)I

    move-result v17

    if-eqz v17, :cond_32

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channels()I

    move-result v12

    .line 627
    .local v12, planes:I
    :goto_a
    const/16 v17, 0x0

    check-cast v17, Lcom/googlecode/javacpp/IntPointer;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->channels()I

    move-result v18

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->sample_fmt()I

    move-result v20

    const/16 v21, 0x1

    invoke-static/range {v17 .. v21}, Lcom/googlecode/javacv/cpp/avutil;->av_samples_get_buffer_size(Lcom/googlecode/javacpp/IntPointer;IIII)I

    move-result v17

    div-int v3, v17, v12

    .line 629
    .local v3, data_size:I
    new-array v0, v12, [Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    .line 630
    const/4 v7, 0x0

    .local v7, i:I
    :goto_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v7, v0, :cond_33

    .line 631
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out:[Lcom/googlecode/javacpp/BytePointer;

    move-object/from16 v17, v0

    new-instance v18, Lcom/googlecode/javacpp/BytePointer;

    int-to-long v0, v3

    move-wide/from16 v19, v0

    invoke-static/range {v19 .. v20}, Lcom/googlecode/javacv/cpp/avutil;->av_malloc(J)Lcom/googlecode/javacpp/Pointer;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/googlecode/javacpp/BytePointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lcom/googlecode/javacpp/BytePointer;->capacity(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v18

    aput-object v18, v17, v7

    .line 630
    add-int/lit8 v7, v7, 0x1

    goto :goto_b

    .line 617
    .end local v3           #data_size:I
    .end local v7           #i:I
    .end local v12           #planes:I
    :pswitch_5
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    move/from16 v17, v0

    shr-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    goto/16 :goto_9

    .line 623
    :cond_31
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->frame_size()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_input_frame_size:I

    goto/16 :goto_9

    .line 626
    :cond_32
    const/4 v12, 0x1

    goto :goto_a

    .line 633
    .restart local v3       #data_size:I
    .restart local v7       #i:I
    .restart local v12       #planes:I
    :cond_33
    const/16 v17, 0x8

    move/from16 v0, v17

    new-array v0, v0, [Lcom/googlecode/javacpp/Pointer;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in:[Lcom/googlecode/javacpp/Pointer;

    .line 634
    new-instance v17, Lcom/googlecode/javacpp/PointerPointer;

    const/16 v18, 0x8

    invoke-direct/range {v17 .. v18}, Lcom/googlecode/javacpp/PointerPointer;-><init>(I)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_in_ptr:Lcom/googlecode/javacpp/PointerPointer;

    .line 635
    new-instance v17, Lcom/googlecode/javacpp/PointerPointer;

    const/16 v18, 0x8

    invoke-direct/range {v17 .. v18}, Lcom/googlecode/javacpp/PointerPointer;-><init>(I)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->samples_out_ptr:Lcom/googlecode/javacpp/PointerPointer;

    .line 638
    invoke-static {}, Lcom/googlecode/javacv/cpp/avcodec;->avcodec_alloc_frame()Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->frame:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    if-nez v17, :cond_34

    .line 639
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 640
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    const-string v18, "avcodec_alloc_frame() error: Could not allocate audio frame."

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 644
    .end local v3           #data_size:I
    .end local v7           #i:I
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v10           #options:Lcom/googlecode/javacv/cpp/avutil$AVDictionary;
    .end local v12           #planes:I
    .end local v14           #ret:I
    :cond_34
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static/range {v17 .. v17}, Lco/vine/android/util/SystemUtil;->quietlyEnsureParentExists(Ljava/io/File;)V

    .line 647
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v17

    and-int/lit8 v17, v17, 0x1

    if-nez v17, :cond_36

    .line 648
    new-instance v11, Lcom/googlecode/javacv/cpp/avformat$AVIOContext;

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-direct {v11, v0}, Lcom/googlecode/javacv/cpp/avformat$AVIOContext;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    .line 649
    .local v11, pb:Lcom/googlecode/javacv/cpp/avformat$AVIOContext;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v11, v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->avio_open(Lcom/googlecode/javacv/cpp/avformat$AVIOContext;Ljava/lang/String;I)I

    move-result v14

    .restart local v14       #ret:I
    if-gez v14, :cond_35

    .line 650
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 651
    new-instance v17, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "BAD avio_open error() error "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ": Could not open \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->filename:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;-><init>(Ljava/lang/String;)V

    throw v17

    .line 653
    :cond_35
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->pb(Lcom/googlecode/javacv/cpp/avformat$AVIOContext;)Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    .line 657
    .end local v11           #pb:Lcom/googlecode/javacv/cpp/avformat$AVIOContext;
    .end local v14           #ret:I
    :cond_36
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    move-object/from16 v18, v0

    const/16 v17, 0x0

    check-cast v17, Lcom/googlecode/javacpp/PointerPointer;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->avformat_write_header(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacpp/PointerPointer;)I

    .line 658
    return-void

    .line 498
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 612
    :pswitch_data_1
    .packed-switch 0x10000
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public stop()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 671
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    if-eqz v0, :cond_3

    .line 674
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;IZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 675
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v0, :cond_2

    move-object v0, v1

    check-cast v0, Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/cpp/avutil$AVFrame;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 677
    :cond_2
    iget-boolean v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->interleaved:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->audio_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    if-eqz v0, :cond_4

    .line 678
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-static {v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->av_interleaved_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    .line 684
    :goto_0
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/avformat;->av_write_trailer(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;)I

    .line 686
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_3

    .line 688
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->pb()Lcom/googlecode/javacv/cpp/avformat$AVIOContext;

    move-result-object v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/avformat;->avio_close(Lcom/googlecode/javacv/cpp/avformat$AVIOContext;)I

    .line 691
    :cond_3
    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 692
    return-void

    .line 680
    :cond_4
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-static {v0, v1}, Lcom/googlecode/javacv/cpp/avformat;->av_write_frame(Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)I

    goto :goto_0
.end method

.method public stopEncoding()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 661
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    if-eqz v0, :cond_0

    .line 662
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oformat:Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avformat$AVOutputFormat;->flags()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 664
    iget-object v0, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->oc:Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;

    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/avformat$AVFormatContext;->pb()Lcom/googlecode/javacv/cpp/avformat$AVIOContext;

    move-result-object v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/avformat;->avio_close(Lcom/googlecode/javacv/cpp/avformat$AVIOContext;)I

    .line 667
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 668
    return-void
.end method

.method public writeEncodedImage([BII)V
    .locals 6
    .parameter "data"
    .parameter "start"
    .parameter "length"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
        }
    .end annotation

    .prologue
    .line 714
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->hasData:Z

    .line 715
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-static {v1}, Lcom/googlecode/javacv/cpp/avcodec;->av_init_packet(Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 716
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_outbuf:Lcom/googlecode/javacpp/BytePointer;

    invoke-virtual {v1, v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 717
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->data()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    .line 718
    .local v0, pData:Lcom/googlecode/javacpp/BytePointer;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    .line 719
    invoke-virtual {v0, p1, p2, p3}, Lcom/googlecode/javacpp/BytePointer;->put([BII)Lcom/googlecode/javacpp/BytePointer;

    .line 720
    invoke-virtual {v0, p3}, Lcom/googlecode/javacpp/BytePointer;->limit(I)Lcom/googlecode/javacpp/BytePointer;

    .line 721
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1, p3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->size(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 722
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 723
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 724
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->picture:Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts()J

    move-result-wide v2

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avutil$AVFrame;->pts(J)Lcom/googlecode/javacv/cpp/avutil$AVFrame;

    .line 725
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v1

    sget-wide v3, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    .line 726
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts()J

    move-result-wide v2

    iget-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v5}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->pts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 728
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v1

    sget-wide v3, Lcom/googlecode/javacv/cpp/avutil;->AV_NOPTS_VALUE:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    .line 729
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts()J

    move-result-wide v2

    iget-object v4, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_c:Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;

    invoke-virtual {v4}, Lcom/googlecode/javacv/cpp/avcodec$AVCodecContext;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v5}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->time_base()Lcom/googlecode/javacv/cpp/avutil$AVRational;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/googlecode/javacv/cpp/avutil;->av_rescale_q(JLcom/googlecode/javacv/cpp/avutil$AVRational;Lcom/googlecode/javacv/cpp/avutil$AVRational;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->dts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 731
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_pkt:Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    iget-object v2, p0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->video_st:Lcom/googlecode/javacv/cpp/avformat$AVStream;

    invoke-virtual {v2}, Lcom/googlecode/javacv/cpp/avformat$AVStream;->index()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->stream_index(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    .line 732
    invoke-direct {p0}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->writeVideoFrame()I

    .line 733
    return-void
.end method
