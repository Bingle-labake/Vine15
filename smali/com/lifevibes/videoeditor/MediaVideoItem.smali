.class public Lcom/lifevibes/videoeditor/MediaVideoItem;
.super Lcom/lifevibes/videoeditor/MediaItem;
.source "MediaVideoItem.java"


# instance fields
.field private final mAspectRatio:I

.field private final mAudioBitrate:I

.field private final mAudioChannels:I

.field private final mAudioSamplingFrequency:I

.field private final mAudioType:I

.field private mAudioWaveformFilename:Ljava/lang/String;

.field private mBeginBoundaryTimeMs:J

.field private final mDurationMs:J

.field private mEndBoundaryTimeMs:J

.field private mExclude:Z

.field private mExcludeBeginTime:J

.field private mExcludeEndTime:J

.field private final mFileType:I

.field private final mFps:I

.field private final mHeight:I

.field private mIsVideo3D:Z

.field private mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

.field private mMuted:Z

.field private mThumbnailLock:Ljava/util/concurrent/Semaphore;

.field private final mVideoBitrate:I

.field private mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditorImpl;

.field private final mVideoProfile:I

.field private final mVideoType:I

.field private mVolumePercentage:I

.field private final mWidth:I

.field private originalVolume:I


# direct methods
.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, v1, v1, v1, v0}, Lcom/lifevibes/videoeditor/MediaVideoItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V

    .line 106
    return-void
.end method

.method public constructor <init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 12
    .parameter "editor"
    .parameter "mediaItemId"
    .parameter "filename"
    .parameter "renderingMode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    const-wide/16 v5, 0x0

    const-wide/16 v7, -0x1

    const/16 v9, 0x64

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move/from16 v4, p4

    invoke-direct/range {v0 .. v11}, Lcom/lifevibes/videoeditor/MediaVideoItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;IJJIZLjava/lang/String;)V

    .line 121
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mThumbnailLock:Ljava/util/concurrent/Semaphore;

    .line 122
    return-void
.end method

.method constructor <init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;IJJIZLjava/lang/String;)V
    .locals 8
    .parameter "editor"
    .parameter "mediaItemId"
    .parameter "filename"
    .parameter "renderingMode"
    .parameter "beginMs"
    .parameter "endMs"
    .parameter "volumePercent"
    .parameter "muted"
    .parameter "audioWaveformFilename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/lifevibes/videoeditor/MediaItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V

    .line 147
    instance-of v3, p1, Lcom/lifevibes/videoeditor/VideoEditorImpl;

    if-eqz v3, :cond_0

    move-object v3, p1

    .line 148
    check-cast v3, Lcom/lifevibes/videoeditor/VideoEditorImpl;

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->getNativeContext()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-result-object v3

    iput-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    .line 149
    check-cast p1, Lcom/lifevibes/videoeditor/VideoEditorImpl;

    .end local p1
    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditorImpl;

    .line 151
    :cond_0
    new-instance v3, Ljava/util/concurrent/Semaphore;

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mThumbnailLock:Ljava/util/concurrent/Semaphore;

    .line 154
    :try_start_0
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual {v3, p3}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaProperties(Ljava/lang/String;)Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 159
    .local v2, properties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->fileType:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getFileType(I)I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 166
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unsupported Input File Type (%d)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->fileType:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 155
    .end local v2           #properties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;
    :catch_0
    move-exception v1

    .line 156
    .local v1, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {p3, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {p3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 169
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v2       #properties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;
    :sswitch_0
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoFormat:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getVideoCodecType(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 178
    :pswitch_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unsupported Video Codec Format in Input File (%d)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoFormat:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 181
    :pswitch_1
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioFormat:I

    if-eqz v3, :cond_1

    .line 182
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioFormat:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getAudioCodecType(I)I

    move-result v3

    packed-switch v3, :pswitch_data_1

    .line 191
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unsupported Audio Codec Format in Input File (%d)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioFormat:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 195
    :cond_1
    :pswitch_2
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->profileAndLevel:I

    const/16 v4, 0xff

    if-ne v3, v4, :cond_2

    .line 196
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unsupported Video Codec Profile in Input File (%d)"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->profileAndLevel:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 199
    :cond_2
    iget-boolean v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->bIsVideo3D:Z

    iput-boolean v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mIsVideo3D:Z

    .line 200
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->width:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mWidth:I

    .line 201
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->height:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mHeight:I

    .line 202
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->width:I

    iget v5, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->height:I

    invoke-virtual {v3, v4, v5}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getAspectRatio(II)I

    move-result v3

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAspectRatio:I

    .line 204
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->fileType:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getFileType(I)I

    move-result v3

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mFileType:I

    .line 205
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoFormat:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getVideoCodecType(I)I

    move-result v3

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoType:I

    .line 206
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->profileAndLevel:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoProfile:I

    .line 207
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoDuration:I

    int-to-long v3, v3

    iput-wide v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mDurationMs:J

    .line 208
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoBitrate:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoBitrate:I

    .line 209
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioBitrate:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioBitrate:I

    .line 210
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->averageFrameRate:F

    float-to-int v3, v3

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mFps:I

    .line 211
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget v4, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioFormat:I

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getAudioCodecType(I)I

    move-result v3

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioType:I

    .line 212
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioChannels:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioChannels:I

    .line 213
    iget v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioSamplingFrequency:I

    iput v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioSamplingFrequency:I

    .line 214
    iput-wide p5, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mBeginBoundaryTimeMs:J

    .line 215
    const-wide/16 v3, -0x1

    cmp-long v3, p7, v3

    if-nez v3, :cond_3

    iget-wide p7, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mDurationMs:J

    .end local p7
    :cond_3
    iput-wide p7, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mEndBoundaryTimeMs:J

    .line 216
    move/from16 v0, p9

    iput v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVolumePercentage:I

    move/from16 v0, p9

    iput v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->originalVolume:I

    .line 217
    move/from16 v0, p10

    iput-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMuted:Z

    .line 218
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioWaveformFilename:Ljava/lang/String;

    .line 219
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeBeginTime:J

    .line 220
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeEndTime:J

    .line 222
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExclude:Z

    .line 223
    return-void

    .line 159
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_0
        0xa -> :sswitch_0
    .end sparse-switch

    .line 169
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 182
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private thumbnailLock()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 374
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mThumbnailLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 375
    return-void
.end method

.method private thumbnailUnlock()V
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mThumbnailLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 382
    return-void
.end method


# virtual methods
.method public getAspectRatio()I
    .locals 1

    .prologue
    .line 258
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAspectRatio:I

    return v0
.end method

.method public getAudioBitrate()I
    .locals 1

    .prologue
    .line 337
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioBitrate:I

    return v0
.end method

.method public getAudioChannels()I
    .locals 1

    .prologue
    .line 358
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioChannels:I

    return v0
.end method

.method public getAudioSamplingFrequency()I
    .locals 1

    .prologue
    .line 365
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioSamplingFrequency:I

    return v0
.end method

.method public getAudioType()I
    .locals 1

    .prologue
    .line 351
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mAudioType:I

    return v0
.end method

.method public getBoundaryBeginTime()J
    .locals 2

    .prologue
    .line 243
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mBeginBoundaryTimeMs:J

    return-wide v0
.end method

.method public getBoundaryEndTime()J
    .locals 2

    .prologue
    .line 250
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mEndBoundaryTimeMs:J

    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 290
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mDurationMs:J

    return-wide v0
.end method

.method getExcludeBeginTime()J
    .locals 2

    .prologue
    .line 389
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeBeginTime:J

    return-wide v0
.end method

.method getExcludeEndTime()J
    .locals 2

    .prologue
    .line 392
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeEndTime:J

    return-wide v0
.end method

.method public getFileType()I
    .locals 1

    .prologue
    .line 266
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mFileType:I

    return v0
.end method

.method public getFps()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mFps:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 282
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mHeight:I

    return v0
.end method

.method public getTimelineDuration()J
    .locals 6

    .prologue
    .line 298
    iget-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExclude:Z

    if-nez v0, :cond_0

    .line 299
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mEndBoundaryTimeMs:J

    iget-wide v2, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mBeginBoundaryTimeMs:J

    sub-long/2addr v0, v2

    .line 301
    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeBeginTime:J

    const-wide/16 v2, 0x0

    sub-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getDuration()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExcludeEndTime:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    goto :goto_0
.end method

.method public getVideoBitrate()I
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoBitrate:I

    return v0
.end method

.method public getVideoProfile()I
    .locals 1

    .prologue
    .line 323
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoProfile:I

    return v0
.end method

.method public getVideoType()I
    .locals 1

    .prologue
    .line 316
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mVideoType:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mWidth:I

    return v0
.end method

.method isExcludeCalled()Z
    .locals 1

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mExclude:Z

    return v0
.end method

.method public isMuted()Z
    .locals 1

    .prologue
    .line 309
    iget-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaVideoItem;->mMuted:Z

    return v0
.end method
