.class Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;
.super Ljava/lang/Object;
.source "MediaArtistNativeHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClips;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EffectSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioEffect;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$BackgroundMusicSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionBehaviour;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioTransition;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$SlideTransitionSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$SlideDirection;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AlphaMagicSettings;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoTransition;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoRendering;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoEffect;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoFrameRate;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoFrameSize;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoProfile;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$VideoFormat;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Result;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$MediaRendering;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$FileType;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Bitrate;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioSamplingFrequency;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioFormat;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$OnProgressUpdateListener;,
        Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$CodecConfig;
    }
.end annotation


# static fields
.field private static final AUDIO_TRACK_PCM_FILE:Ljava/lang/String; = "AudioPcm.pcm"

.field public static final PROCESSING_AUDIO_PCM:I = 0x1

.field public static final PROCESSING_EXPORT:I = 0x14

.field public static final PROCESSING_INTERMEDIATE1:I = 0xb

.field public static final PROCESSING_INTERMEDIATE2:I = 0xc

.field public static final PROCESSING_INTERMEDIATE3:I = 0xd

.field public static final PROCESSING_KENBURNS:I = 0x3

.field public static final PROCESSING_NONE:I = 0x0

.field public static final PROCESSING_TRANSITION:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MediaArtistNativeHelper"

.field public static final TASK_ENCODING:I = 0x2

.field public static final TASK_LOADING_SETTINGS:I = 0x1

.field public static mTNDecConfigAccurateMode:I

.field public static mTNDecConfigFastMode:I

.field private static final sResizePaint:Landroid/graphics/Paint;


# instance fields
.field private final MAX_THUMBNAIL_PERMITTED:I

.field private mAudioSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioSettings;

.field private mAudioTrackPCMFilePath:Ljava/lang/String;

.field private mClipList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

.field mEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

.field private mErrorFlagSet:Z

.field private mExportFilename:Ljava/lang/String;

.field private mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

.field public mInvalidatePreviewArray:Z

.field private mIsAbortGeneratePreviewInBGCalled:Z

.field private mIsFirstProgress:Z

.field private final mLock:Ljava/util/concurrent/Semaphore;

.field private mManualEditContext:I

.field private mOutputFilename:Ljava/lang/String;

.field private mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

.field mPreviewEffectsSize:I

.field private mPreviewProgress:J

.field private mProcessingObject:Ljava/lang/Object;

.field private mProcessingState:I

.field private mProgressToApp:I

.field private final mProjectPath:Ljava/lang/String;

.field private mRegenerateAudio:Z

.field private mRenderPreviewOverlayFile:Ljava/lang/String;

.field private mRenderPreviewRenderingMode:I

.field public mStoryBoardSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

.field private mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

.field mThumbnailTime:[I

.field private mTotalClips:I

.field mTotalKenBurnClips:I

.field mTotalTransitions:I

.field private final mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 82
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->sResizePaint:Landroid/graphics/Paint;

    .line 168
    const/4 v0, 0x0

    sput v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigAccurateMode:I

    .line 169
    const/4 v0, 0x1

    sput v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigFastMode:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/concurrent/Semaphore;Lcom/lifevibes/videoeditor/VideoEditor;)V
    .locals 6
    .parameter "projectPath"
    .parameter "lock"
    .parameter "veObj"

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1954
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipList:Ljava/util/List;

    .line 76
    const/16 v1, 0x8

    iput v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->MAX_THUMBNAIL_PERMITTED:I

    .line 94
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    .line 96
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    .line 100
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioSettings;

    .line 103
    iput-boolean v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mInvalidatePreviewArray:Z

    .line 105
    iput-boolean v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mRegenerateAudio:Z

    .line 107
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    .line 136
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewProgress:J

    .line 138
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    .line 140
    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    .line 142
    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEffectsSize:I

    .line 143
    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalTransitions:I

    .line 144
    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalKenBurnClips:I

    .line 146
    iput-boolean v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mErrorFlagSet:Z

    .line 148
    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mManualEditContext:I

    .line 151
    iput-boolean v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mIsAbortGeneratePreviewInBGCalled:Z

    .line 1955
    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProjectPath:Ljava/lang/String;

    .line 1956
    if-eqz p3, :cond_1

    .line 1957
    iput-object p3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    .line 1962
    iget-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mStoryBoardSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    if-nez v1, :cond_0

    .line 1963
    new-instance v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-direct {v1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;-><init>()V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mStoryBoardSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    .line 1966
    :cond_0
    iput-object p2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mLock:Ljava/util/concurrent/Semaphore;

    .line 1968
    iget-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProjectPath:Ljava/lang/String;

    const-string v2, "null"

    invoke-direct {p0, v1, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->_init(Ljava/lang/String;Ljava/lang/String;)V

    .line 1969
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    .line 1970
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getVersion()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;

    move-result-object v0

    .line 1971
    .local v0, version:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;
    const-string v1, "MediaArtistNativeHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VideoEditor Version "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;->major:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;->minor:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;->revision:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1973
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 1974
    invoke-direct {p0, v4, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->onProgressUpdate(II)V

    .line 1975
    return-void

    .line 1959
    .end local v0           #version:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;
    :cond_1
    iput-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    .line 1960
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "video editor object is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private native _init(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private findVideoBitrate(I)I
    .locals 3
    .parameter "frameSize"

    .prologue
    .line 3230
    const/4 v0, 0x0

    .line 3232
    .local v0, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 3260
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "bitrate for frame size not found"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3262
    :goto_0
    return v0

    .line 3237
    :pswitch_0
    const v0, 0x7d000

    .line 3238
    goto :goto_0

    .line 3242
    :pswitch_1
    const v0, 0x16e360

    .line 3243
    goto :goto_0

    .line 3246
    :pswitch_2
    const v0, 0x1e8480

    .line 3247
    goto :goto_0

    .line 3251
    :pswitch_3
    const v0, 0x4c4b40

    .line 3252
    goto :goto_0

    .line 3257
    :pswitch_4
    const v0, 0x7a1200

    .line 3258
    goto :goto_0

    .line 3232
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private findVideoFrameDimensions(I)Landroid/util/Pair;
    .locals 6
    .parameter "videoResolution"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v5, 0x438

    const/16 v1, 0x280

    const/4 v4, 0x0

    const/16 v3, 0x2d0

    const/16 v2, 0x1e0

    .line 3170
    packed-switch p1, :pswitch_data_0

    .line 3217
    new-instance v0, Landroid/util/Pair;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3220
    .local v0, videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :goto_0
    return-object v0

    .line 3172
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_0
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x80

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x60

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3173
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3175
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_1
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0xa0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x78

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3176
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3178
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_2
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0xb0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x90

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3179
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3181
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_3
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x140

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xf0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3182
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3184
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_4
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x160

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x120

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3185
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3187
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_5
    new-instance v0, Landroid/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3188
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3190
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_6
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x320

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3191
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto :goto_0

    .line 3193
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_7
    new-instance v0, Landroid/util/Pair;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3194
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3196
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_8
    new-instance v0, Landroid/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x168

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3197
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3199
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_9
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x356

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3200
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3202
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_a
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x500

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3203
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3205
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_b
    new-instance v0, Landroid/util/Pair;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3206
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3208
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_c
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x3c0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3209
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3211
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_d
    new-instance v0, Landroid/util/Pair;

    const/16 v1, 0x780

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3212
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3214
    .end local v0           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_e
    new-instance v0, Landroid/util/Pair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3215
    .restart local v0       #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    goto/16 :goto_0

    .line 3170
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_e
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method private findVideoResolution(II)I
    .locals 6
    .parameter "aspectRatio"
    .parameter "height"

    .prologue
    const/16 v5, 0x2d0

    const/16 v4, 0x1e0

    .line 3105
    const/4 v2, -0x1

    .line 3106
    .local v2, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 3150
    :cond_0
    :goto_0
    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 3151
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    invoke-interface {v3}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v3

    invoke-static {v3}, Lcom/lifevibes/videoeditor/MediaProperties;->getSupportedResolutions(I)[Landroid/util/Pair;

    move-result-object v1

    .line 3153
    .local v1, resolutions:[Landroid/util/Pair;,"[Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    aget-object v0, v1, v3

    .line 3154
    .local v0, maxResolution:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    invoke-interface {v3}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v4

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v4, v3}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoResolution(II)I

    move-result v2

    .line 3157
    .end local v0           #maxResolution:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .end local v1           #resolutions:[Landroid/util/Pair;,"[Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_1
    return v2

    .line 3108
    :pswitch_0
    if-ne p2, v4, :cond_2

    .line 3109
    const/16 v2, 0x8

    goto :goto_0

    .line 3110
    :cond_2
    if-ne p2, v5, :cond_0

    .line 3111
    const/16 v2, 0xc

    goto :goto_0

    .line 3114
    :pswitch_1
    if-ne p2, v4, :cond_3

    .line 3115
    const/16 v2, 0xa

    goto :goto_0

    .line 3116
    :cond_3
    if-ne p2, v5, :cond_4

    .line 3117
    const/16 v2, 0xb

    goto :goto_0

    .line 3118
    :cond_4
    const/16 v3, 0x438

    if-ne p2, v3, :cond_5

    .line 3119
    const/16 v2, 0xe

    goto :goto_0

    .line 3120
    :cond_5
    const/16 v3, 0x168

    if-ne p2, v3, :cond_0

    .line 3121
    const/16 v2, 0x9

    goto :goto_0

    .line 3124
    :pswitch_2
    const/16 v3, 0x60

    if-ne p2, v3, :cond_6

    .line 3125
    const/4 v2, 0x0

    goto :goto_0

    .line 3126
    :cond_6
    const/16 v3, 0x78

    if-ne p2, v3, :cond_7

    .line 3127
    const/4 v2, 0x1

    goto :goto_0

    .line 3128
    :cond_7
    const/16 v3, 0xf0

    if-ne p2, v3, :cond_8

    .line 3129
    const/4 v2, 0x3

    goto :goto_0

    .line 3130
    :cond_8
    if-ne p2, v4, :cond_9

    .line 3131
    const/4 v2, 0x6

    goto :goto_0

    .line 3132
    :cond_9
    if-ne p2, v5, :cond_0

    .line 3133
    const/16 v2, 0xd

    goto :goto_0

    .line 3136
    :pswitch_3
    if-ne p2, v4, :cond_0

    .line 3137
    const/4 v2, 0x7

    goto :goto_0

    .line 3140
    :pswitch_4
    const/16 v3, 0x90

    if-ne p2, v3, :cond_a

    .line 3141
    const/4 v2, 0x2

    goto :goto_0

    .line 3142
    :cond_a
    const/16 v3, 0x120

    if-ne p2, v3, :cond_0

    .line 3143
    const/4 v2, 0x4

    goto :goto_0

    .line 3146
    :pswitch_5
    if-ne p2, v4, :cond_0

    .line 3147
    const/4 v2, 0x5

    goto :goto_0

    .line 3106
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private getMediaItemProperties(Ljava/util/List;)V
    .locals 13
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lifevibes/videoeditor/MediaItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, mediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const/16 v12, 0x64

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 2096
    iput v9, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    .line 2098
    new-instance v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-direct {v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;-><init>()V

    iput-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    .line 2099
    new-instance v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    invoke-direct {v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;-><init>()V

    iput-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    .line 2100
    new-array v1, v11, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;

    .line 2101
    .local v1, clipSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;
    new-instance v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;

    invoke-direct {v0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;-><init>()V

    .line 2102
    .local v0, clipSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;
    const/4 v3, 0x0

    .line 2104
    .local v3, lMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lcom/lifevibes/videoeditor/MediaVideoItem;

    if-nez v4, :cond_0

    .line 2105
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Not a media video item"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2108
    :cond_0
    invoke-interface {p1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #lMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    check-cast v3, Lcom/lifevibes/videoeditor/MediaVideoItem;

    .line 2109
    .restart local v3       #lMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    iput v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    .line 2111
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    new-array v5, v5, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;

    iput-object v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->clipSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;

    .line 2112
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    new-array v5, v9, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EffectSettings;

    iput-object v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->effectSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EffectSettings;

    .line 2113
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    add-int/lit8 v5, v5, -0x1

    new-array v5, v5, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    iput-object v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->transitionSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    .line 2114
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v5, 0x0

    iput-object v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->backgroundMusicSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$BackgroundMusicSettings;

    .line 2115
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v12, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->primaryTrackVolume:I

    .line 2116
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    new-array v5, v5, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    iput-object v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    .line 2118
    invoke-virtual {p0, v0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->initClipSettings(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;)V

    .line 2119
    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFilename()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipPath:Ljava/lang/String;

    .line 2120
    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFileType()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaItemFileType(I)I

    move-result v4

    iput v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->fileType:I

    .line 2123
    :try_start_0
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    const/4 v5, 0x0

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFilename()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaProperties(Ljava/lang/String;)Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    move-result-object v6

    aput-object v6, v4, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2128
    new-array v4, v11, [I

    iput-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    .line 2129
    new-array v4, v11, [I

    iput-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    .line 2131
    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->isExcludeCalled()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2132
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getDuration()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getExcludeEndTime()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getExcludeBeginTime()J

    move-result-wide v7

    long-to-int v7, v7

    sub-int/2addr v6, v7

    sub-int/2addr v5, v6

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    .line 2135
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    aput v9, v4, v9

    .line 2136
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getExcludeBeginTime()J

    move-result-wide v5

    long-to-int v5, v5

    add-int/lit8 v5, v5, -0x1

    aput v5, v4, v9

    .line 2137
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getExcludeEndTime()J

    move-result-wide v5

    long-to-int v5, v5

    add-int/lit8 v5, v5, 0x1

    aput v5, v4, v10

    .line 2138
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getDuration()J

    move-result-wide v5

    long-to-int v5, v5

    aput v5, v4, v10

    .line 2139
    iput v11, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->mNumCuts:I

    .line 2141
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoDuration:I

    if-eqz v4, :cond_1

    .line 2142
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v5, v5, v9

    iget v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoDuration:I

    .line 2145
    :cond_1
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioDuration:I

    if-eqz v4, :cond_2

    .line 2146
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v5, v5, v9

    iget v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioDuration:I

    .line 2164
    :cond_2
    :goto_0
    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getRenderingMode()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaItemRenderingMode(I)I

    move-result v4

    iput v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->mediaRendering:I

    .line 2165
    iput v12, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipVolumePercentage:I

    .line 2167
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->clipSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;

    aput-object v0, v4, v9

    .line 2169
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    invoke-interface {v5}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v5

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getHeight()I

    move-result v6

    invoke-direct {p0, v5, v6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoResolution(II)I

    move-result v5

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    .line 2172
    return-void

    .line 2125
    :catch_0
    move-exception v2

    .line 2126
    .local v2, e:Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Unsupported file or file not found"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2150
    .end local v2           #e:Ljava/lang/Exception;
    :cond_3
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getBoundaryBeginTime()J

    move-result-wide v5

    long-to-int v5, v5

    aput v5, v4, v9

    .line 2151
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    aput v9, v4, v10

    .line 2152
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    invoke-virtual {v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getBoundaryEndTime()J

    move-result-wide v5

    long-to-int v5, v5

    aput v5, v4, v9

    .line 2153
    iget-object v4, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    aput v9, v4, v10

    .line 2154
    iput v10, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->mNumCuts:I

    .line 2155
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget-object v5, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayEndCutTime:[I

    aget v5, v5, v9

    iget-object v6, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->arrayBeginCutTime:[I

    aget v6, v6, v9

    sub-int/2addr v5, v6

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    .line 2156
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoDuration:I

    if-eqz v4, :cond_4

    .line 2157
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v5, v5, v9

    iget v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoDuration:I

    .line 2160
    :cond_4
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioDuration:I

    if-eqz v4, :cond_2

    .line 2161
    iget-object v4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v4, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v4, v4, v9

    iget-object v5, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    aget-object v5, v5, v9

    iget v5, v5, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->duration:I

    iput v5, v4, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->audioDuration:I

    goto/16 :goto_0
.end method

.method private native getVersion()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Version;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private lock()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    .line 3603
    const-string v0, "MediaArtistNativeHelper"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3604
    const-string v0, "MediaArtistNativeHelper"

    const-string v1, "lock: grabbing semaphore"

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3606
    :cond_0
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 3607
    const-string v0, "MediaArtistNativeHelper"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3608
    const-string v0, "MediaArtistNativeHelper"

    const-string v1, "lock: grabbed semaphore"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3610
    :cond_1
    return-void
.end method

.method private native nativeClearSurface(Landroid/view/Surface;)V
.end method

.method private native nativeGenerateAudioGraph(Ljava/lang/String;Ljava/lang/String;III)I
.end method

.method private native nativeGenerateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native nativeGenerateRawAudio(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeGenerateRawAudioMedia(Ljava/lang/String;Ljava/lang/String;JJ)I
.end method

.method private native nativeGetPixels(Ljava/lang/String;IIJI)Landroid/graphics/Bitmap;
.end method

.method private native nativeGetPixelsList(Ljava/lang/String;IIIIII[IILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)I
.end method

.method private native nativeGetPixelsList(Ljava/lang/String;IIIIII[II)[Landroid/graphics/Bitmap;
.end method

.method private native nativePopulateSettings(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$AudioSettings;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native nativeRenderMediaItemPreviewFrame(Landroid/view/Surface;Ljava/lang/String;IIIIJ)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native nativeRenderPreviewFrame(Landroid/view/Surface;JII)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native nativeStartPreview(Landroid/view/Surface;JJIZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native nativeStopPreview()I
.end method

.method private onAudioGraphExtractProgressUpdate(IZ)V
    .locals 0
    .parameter "progress"
    .parameter "isVideo"

    .prologue
    .line 2028
    return-void
.end method

.method private onProgressUpdate(II)V
    .locals 4
    .parameter "taskId"
    .parameter "progress"

    .prologue
    .line 2004
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I

    const/16 v1, 0x14

    if-ne v0, v1, :cond_0

    .line 2005
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    if-eqz v0, :cond_0

    .line 2006
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    const/16 v1, 0x64

    if-gt v0, v1, :cond_0

    .line 2007
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    if-gt v0, p2, :cond_1

    .line 2008
    iput p2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    .line 2016
    :goto_0
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    iget-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mOutputFilename:Ljava/lang/String;

    iget v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    invoke-interface {v0, v1, v2, v3}, Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;->onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V

    .line 2021
    :cond_0
    return-void

    .line 2010
    :cond_1
    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_0

    .line 2011
    iget v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    goto :goto_0
.end method

.method private native release()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native stopEncoding()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native stopExtraction()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method private native stopThumbnail()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method private unlock()V
    .locals 2

    .prologue
    .line 3616
    const-string v0, "MediaArtistNativeHelper"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3617
    const-string v0, "MediaArtistNativeHelper"

    const-string v1, "unlock: releasing semaphore"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3619
    :cond_0
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 3620
    return-void
.end method


# virtual methods
.method GetClosestVideoFrameRate(I)I
    .locals 5
    .parameter "averageFrameRate"

    .prologue
    const/4 v0, 0x5

    .line 2749
    const/16 v1, 0x19

    if-le p1, v1, :cond_1

    .line 2750
    const/4 v0, 0x7

    .line 2764
    :cond_0
    :goto_0
    return v0

    .line 2751
    :cond_1
    const/16 v1, 0x14

    if-le p1, v1, :cond_2

    .line 2752
    const/4 v0, 0x6

    goto :goto_0

    .line 2753
    :cond_2
    const/16 v1, 0xf

    if-gt p1, v1, :cond_0

    .line 2755
    int-to-double v1, p1

    const-wide/high16 v3, 0x4029

    cmpl-double v1, v1, v3

    if-lez v1, :cond_3

    .line 2756
    const/4 v0, 0x4

    goto :goto_0

    .line 2757
    :cond_3
    const/16 v1, 0xa

    if-le p1, v1, :cond_4

    .line 2758
    const/4 v0, 0x3

    goto :goto_0

    .line 2759
    :cond_4
    int-to-double v1, p1

    const-wide/high16 v3, 0x401e

    cmpl-double v1, v1, v3

    if-lez v1, :cond_5

    .line 2760
    const/4 v0, 0x2

    goto :goto_0

    .line 2761
    :cond_5
    if-le p1, v0, :cond_6

    .line 2762
    const/4 v0, 0x1

    goto :goto_0

    .line 2764
    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public export(Ljava/lang/String;Ljava/lang/String;IIIIJLjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 21
    .parameter "filePath"
    .parameter "projectDir"
    .parameter "height"
    .parameter "bitrate"
    .parameter "audioCodec"
    .parameter "videoCodec"
    .parameter "outputFileSize"
    .parameter
    .parameter "listener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "IIIIJ",
            "Ljava/util/List",
            "<",
            "Lcom/lifevibes/videoeditor/MediaItem;",
            ">;",
            "Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2377
    .local p9, mediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const/4 v13, 0x0

    .line 2378
    .local v13, outBitrate:I
    move-object/from16 v12, p9

    .line 2379
    .local v12, newListMediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    .line 2380
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    .line 2381
    if-eqz p10, :cond_0

    .line 2382
    move-object/from16 v0, p10

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2384
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaItemProperties(Ljava/util/List;)V

    .line 2386
    sparse-switch p4, :sswitch_data_0

    .line 2438
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "Argument Bitrate incorrect"

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 2388
    :sswitch_0
    const/16 v13, 0x7d00

    .line 2440
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x7

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mOutputFilename:Ljava/lang/String;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->outputFile:Ljava/lang/String;

    .line 2442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoRenderingType:I

    .line 2444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v3

    .line 2445
    .local v3, aspectRatio:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v3, v1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoResolution(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    .line 2447
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    move/from16 v16, v0

    const/16 v17, 0x6

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_2

    .line 2448
    const v16, 0xc3500

    move/from16 v0, v16

    if-ne v13, v0, :cond_1

    .line 2449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x5

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2451
    :cond_1
    const v16, 0x7d000

    move/from16 v0, v16

    if-ne v13, v0, :cond_2

    .line 2452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2456
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    move/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_4

    .line 2457
    const v16, 0x5dc00

    move/from16 v0, v16

    if-ne v13, v0, :cond_3

    .line 2458
    const/16 v16, 0x1

    move/from16 v0, p6

    move/from16 v1, v16

    if-eq v0, v1, :cond_6

    .line 2459
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x6

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2465
    :cond_3
    :goto_1
    const v16, 0x3e800

    move/from16 v0, v16

    if-ne v13, v0, :cond_4

    .line 2466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2470
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    move/from16 v16, v0

    const/16 v17, 0x2

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_5

    .line 2471
    const v16, 0x2ee00

    move/from16 v0, v16

    if-ne v13, v0, :cond_8

    .line 2472
    const/16 v16, 0x1

    move/from16 v0, p6

    move/from16 v1, v16

    if-eq v0, v1, :cond_7

    .line 2473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x5

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2490
    :cond_5
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoBitrate(I)I

    move-result v14

    .line 2491
    .local v14, videoBitratePreset:I
    if-ge v14, v13, :cond_b

    .line 2492
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "Argument Bitrate NOT Supported for supplied resolution"

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 2391
    .end local v3           #aspectRatio:I
    .end local v14           #videoBitratePreset:I
    :sswitch_1
    const v13, 0xbb80

    .line 2392
    goto/16 :goto_0

    .line 2394
    :sswitch_2
    const v13, 0xfa00

    .line 2395
    goto/16 :goto_0

    .line 2397
    :sswitch_3
    const v13, 0x17700

    .line 2398
    goto/16 :goto_0

    .line 2400
    :sswitch_4
    const v13, 0x1f400

    .line 2401
    goto/16 :goto_0

    .line 2403
    :sswitch_5
    const v13, 0x2ee00

    .line 2404
    goto/16 :goto_0

    .line 2406
    :sswitch_6
    const v13, 0x3e800

    .line 2407
    goto/16 :goto_0

    .line 2409
    :sswitch_7
    const v13, 0x5dc00

    .line 2410
    goto/16 :goto_0

    .line 2412
    :sswitch_8
    const v13, 0x7d000

    .line 2413
    goto/16 :goto_0

    .line 2415
    :sswitch_9
    const v13, 0xc3500

    .line 2416
    goto/16 :goto_0

    .line 2418
    :sswitch_a
    const v13, 0xf4240

    .line 2419
    goto/16 :goto_0

    .line 2421
    :sswitch_b
    const v13, 0x124f80

    .line 2422
    goto/16 :goto_0

    .line 2424
    :sswitch_c
    const v13, 0x16e360

    .line 2425
    goto/16 :goto_0

    .line 2427
    :sswitch_d
    const v13, 0x1e8480

    .line 2428
    goto/16 :goto_0

    .line 2431
    :sswitch_e
    const v13, 0x4c4b40

    .line 2432
    goto/16 :goto_0

    .line 2435
    :sswitch_f
    const v13, 0x7a1200

    .line 2436
    goto/16 :goto_0

    .line 2462
    .restart local v3       #aspectRatio:I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_1

    .line 2476
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_2

    .line 2479
    :cond_8
    const v16, 0x1f400

    move/from16 v0, v16

    if-ne v13, v0, :cond_9

    .line 2480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_2

    .line 2482
    :cond_9
    const v16, 0x17700

    move/from16 v0, v16

    if-ne v13, v0, :cond_a

    .line 2483
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x2

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_2

    .line 2485
    :cond_a
    const v16, 0xfa00

    move/from16 v0, v16

    if-ne v13, v0, :cond_5

    .line 2486
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x2

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_2

    .line 2495
    .restart local v14       #videoBitratePreset:I
    :cond_b
    packed-switch p5, :pswitch_data_0

    .line 2516
    :goto_3
    packed-switch p6, :pswitch_data_1

    .line 2533
    :pswitch_0
    new-instance v16, Ljava/lang/IllegalArgumentException;

    const-string v17, "Argument Video codec NOT Supported"

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 2497
    :pswitch_1
    const/16 v16, 0x0

    move-object/from16 v0, p9

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/lifevibes/videoeditor/MediaVideoItem;

    .line 2499
    .local v11, mVI:Lcom/lifevibes/videoeditor/MediaVideoItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0xfe

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2504
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    invoke-virtual {v11}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioBitrate()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2505
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    invoke-virtual {v11}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioSamplingFrequency()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2506
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    invoke-virtual {v11}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioChannels()I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    goto :goto_3

    .line 2509
    .end local v11           #mVI:Lcom/lifevibes/videoeditor/MediaVideoItem;
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2510
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x2fa8

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2511
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x1f40

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2512
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    goto/16 :goto_3

    .line 2518
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2536
    :goto_4
    const-wide/16 v16, 0x0

    cmp-long v16, p7, v16

    if-eqz v16, :cond_10

    .line 2537
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-wide/from16 v0, p7

    long-to-int v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    .line 2543
    :goto_5
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    move/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_f

    .line 2545
    const/16 v16, 0x0

    move-object/from16 v0, p9

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/lifevibes/videoeditor/MediaItem;

    .line 2546
    .local v10, lMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    invoke-virtual {v10}, Lcom/lifevibes/videoeditor/MediaItem;->getTimelineDuration()J

    move-result-wide v4

    .line 2547
    .local v4, duration:J
    const-wide v16, 0x3ff0a3d70a3d70a4L

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v19, v19, v20

    move-object/from16 v0, v19

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoBitrate:I

    move/from16 v19, v0

    add-int v18, v18, v19

    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v18, v0

    mul-double v16, v16, v18

    long-to-double v0, v4

    move-wide/from16 v18, v0

    mul-double v16, v16, v18

    const-wide v18, 0x40bf400000000000L

    div-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-long v8, v0

    .line 2548
    .local v8, fileSizeForNullEncoding:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoFrameDimensions(I)Landroid/util/Pair;

    move-result-object v15

    .line 2549
    .local v15, videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 2551
    .local v2, NullEncodingOK:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    move/from16 v16, v0

    if-eqz v16, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    cmp-long v16, v8, v16

    if-lez v16, :cond_d

    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    move/from16 v16, v0

    if-nez v16, :cond_e

    .line 2554
    :cond_d
    const/4 v2, 0x1

    .line 2556
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoFormat:I

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_f

    iget-object v0, v15, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->width:I

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_f

    iget-object v0, v15, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v16, v0

    check-cast v16, Ljava/lang/Integer;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->height:I

    move/from16 v17, v0

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_f

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v2, v0, :cond_f

    .line 2561
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0xfe

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2565
    .end local v2           #NullEncodingOK:Z
    .end local v4           #duration:J
    .end local v8           #fileSizeForNullEncoding:J
    .end local v10           #lMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    .end local v15           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iput v13, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    .line 2566
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move/from16 v0, v17

    new-array v0, v0, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->transitionSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    .line 2569
    const/4 v6, 0x0

    .line 2571
    .local v6, err:I
    const/16 v16, 0x14

    :try_start_0
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I

    .line 2572
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingObject:Ljava/lang/Object;

    .line 2573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->generateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I

    move-result v6

    .line 2574
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2586
    if-eqz v6, :cond_11

    .line 2587
    const-string v16, "MediaArtistNativeHelper"

    const-string v17, "RuntimeException for generateClip"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2588
    new-instance v16, Ljava/lang/RuntimeException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "generateClip failed with error="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 2521
    .end local v6           #err:I
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_4

    .line 2524
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x5

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_4

    .line 2527
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x6

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_4

    .line 2530
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x2

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_4

    .line 2539
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, v16

    iput v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    goto/16 :goto_5

    .line 2575
    .restart local v6       #err:I
    :catch_0
    move-exception v7

    .line 2576
    .local v7, ex:Ljava/lang/IllegalArgumentException;
    const-string v16, "MediaArtistNativeHelper"

    const-string v17, "IllegalArgument for generateClip"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2577
    throw v7

    .line 2578
    .end local v7           #ex:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v7

    .line 2579
    .local v7, ex:Ljava/lang/IllegalStateException;
    const-string v16, "MediaArtistNativeHelper"

    const-string v17, "IllegalStateExceptiont for generateClip"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2580
    throw v7

    .line 2581
    .end local v7           #ex:Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v7

    .line 2582
    .local v7, ex:Ljava/lang/RuntimeException;
    const-string v16, "MediaArtistNativeHelper"

    const-string v17, "RuntimeException for generateClip"

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2583
    throw v7

    .line 2591
    .end local v7           #ex:Ljava/lang/RuntimeException;
    :cond_11
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2592
    return-void

    .line 2386
    nop

    :sswitch_data_0
    .sparse-switch
        0x6d60 -> :sswitch_0
        0x9c40 -> :sswitch_1
        0xfa00 -> :sswitch_2
        0x17700 -> :sswitch_3
        0x1f400 -> :sswitch_4
        0x2ee00 -> :sswitch_5
        0x3e800 -> :sswitch_6
        0x5dc00 -> :sswitch_7
        0x7d000 -> :sswitch_8
        0xc3500 -> :sswitch_9
        0xf4240 -> :sswitch_a
        0x124f80 -> :sswitch_b
        0x16e360 -> :sswitch_c
        0x1e8480 -> :sswitch_d
        0x4c4b40 -> :sswitch_e
        0x7a1200 -> :sswitch_f
    .end sparse-switch

    .line 2495
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 2516
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_7
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method export(Ljava/lang/String;Ljava/lang/String;IILjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 11
    .parameter "filePath"
    .parameter "projectDir"
    .parameter "height"
    .parameter "bitrate"
    .parameter
    .parameter "listener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List",
            "<",
            "Lcom/lifevibes/videoeditor/MediaItem;",
            ">;",
            "Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2189
    .local p5, mediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const/4 v8, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Lcom/lifevibes/videoeditor/MediaVideoItem;

    if-nez v8, :cond_0

    .line 2190
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "Not a media video item"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2192
    :cond_0
    const/4 v5, 0x0

    .line 2193
    .local v5, outBitrate:I
    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    .line 2194
    const/4 v8, 0x0

    iput v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProgressToApp:I

    .line 2195
    if-eqz p6, :cond_1

    .line 2196
    move-object/from16 v0, p6

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2198
    :cond_1
    move-object/from16 v0, p5

    invoke-direct {p0, v0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaItemProperties(Ljava/util/List;)V

    .line 2200
    sparse-switch p4, :sswitch_data_0

    .line 2252
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Argument Bitrate incorrect"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2202
    :sswitch_0
    const/16 v5, 0x7d00

    .line 2254
    :goto_0
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x7

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2255
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mOutputFilename:Ljava/lang/String;

    iput-object p1, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->outputFile:Ljava/lang/String;

    .line 2256
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x0

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoRenderingType:I

    .line 2258
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    invoke-interface {v8}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v1

    .line 2259
    .local v1, aspectRatio:I
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-direct {p0, v1, p3}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoResolution(II)I

    move-result v9

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    .line 2261
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v8, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    invoke-direct {p0, v8}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoBitrate(I)I

    move-result v6

    .line 2262
    .local v6, videoBitratePreset:I
    if-ge v6, v5, :cond_2

    .line 2263
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Argument Bitrate NOT Supported for supplied resolution"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2205
    .end local v1           #aspectRatio:I
    .end local v6           #videoBitratePreset:I
    :sswitch_1
    const v5, 0xbb80

    .line 2206
    goto :goto_0

    .line 2208
    :sswitch_2
    const v5, 0xfa00

    .line 2209
    goto :goto_0

    .line 2211
    :sswitch_3
    const v5, 0x17700

    .line 2212
    goto :goto_0

    .line 2214
    :sswitch_4
    const v5, 0x1f400

    .line 2215
    goto :goto_0

    .line 2217
    :sswitch_5
    const v5, 0x2ee00

    .line 2218
    goto :goto_0

    .line 2220
    :sswitch_6
    const v5, 0x3e800

    .line 2221
    goto :goto_0

    .line 2223
    :sswitch_7
    const v5, 0x5dc00

    .line 2224
    goto :goto_0

    .line 2226
    :sswitch_8
    const v5, 0x7d000

    .line 2227
    goto :goto_0

    .line 2229
    :sswitch_9
    const v5, 0xc3500

    .line 2230
    goto :goto_0

    .line 2232
    :sswitch_a
    const v5, 0xf4240

    .line 2233
    goto :goto_0

    .line 2235
    :sswitch_b
    const v5, 0x124f80

    .line 2236
    goto :goto_0

    .line 2238
    :sswitch_c
    const v5, 0x16e360

    .line 2239
    goto :goto_0

    .line 2241
    :sswitch_d
    const v5, 0x1e8480

    .line 2242
    goto :goto_0

    .line 2245
    :sswitch_e
    const v5, 0x4c4b40

    .line 2246
    goto :goto_0

    .line 2248
    :sswitch_f
    const v5, 0x7a1200

    .line 2249
    goto :goto_0

    .line 2266
    .restart local v1       #aspectRatio:I
    .restart local v6       #videoBitratePreset:I
    :cond_2
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x4

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2267
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x2

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2268
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const v9, 0x17700

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2269
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/16 v9, 0x7d00

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2270
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x2

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    .line 2271
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x0

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    .line 2272
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v5, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    .line 2274
    const/4 v8, 0x0

    move-object/from16 v0, p5

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/lifevibes/videoeditor/MediaVideoItem;

    .line 2276
    .local v4, m1:Lcom/lifevibes/videoeditor/MediaVideoItem;
    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoType()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3

    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoType()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_5

    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v8, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    const/4 v9, 0x4

    if-gt v8, v9, :cond_5

    .line 2280
    :cond_3
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/16 v9, 0xfe

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2282
    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioType()I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_4

    .line 2283
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioBitrate()I

    move-result v9

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2285
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioSamplingFrequency()I

    move-result v9

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2287
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioChannels()I

    move-result v9

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    .line 2291
    :cond_4
    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoType()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 2308
    :pswitch_0
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "Argument Video codec NOT Supported"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2293
    :pswitch_1
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x1

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2311
    :goto_1
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v8, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_7

    .line 2312
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x4

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2319
    :cond_5
    :goto_2
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v9, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    add-int/lit8 v9, v9, -0x1

    new-array v9, v9, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    iput-object v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->transitionSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    .line 2322
    iget v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_6

    .line 2324
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v8, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    invoke-direct {p0, v8}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoFrameDimensions(I)Landroid/util/Pair;

    move-result-object v7

    .line 2325
    .local v7, videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v8, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    iget-object v9, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    iget v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->videoFormat:I

    if-ne v8, v9, :cond_6

    iget-object v8, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    iget-object v9, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    iget v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->width:I

    if-ne v8, v9, :cond_6

    iget-object v8, v7, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    iget-object v9, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mClipProperties:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;

    iget-object v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$PreviewClipProperties;->clipProperties:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;

    const/4 v10, 0x0

    aget-object v9, v9, v10

    iget v9, v9, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;->height:I

    if-ne v8, v9, :cond_6

    .line 2329
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/16 v9, 0xfe

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2333
    .end local v7           #videoFrameDimensions:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_6
    const/4 v2, 0x0

    .line 2335
    .local v2, err:I
    const/16 v8, 0x14

    :try_start_0
    iput v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I

    .line 2336
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingObject:Ljava/lang/Object;

    .line 2337
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {p0, v8}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->generateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I

    move-result v2

    .line 2338
    const/4 v8, 0x0

    iput v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2350
    if-eqz v2, :cond_8

    .line 2351
    const-string v8, "MediaArtistNativeHelper"

    const-string v9, "RuntimeException for generateClip"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2352
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "generateClip failed with error="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2296
    .end local v2           #err:I
    :pswitch_2
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x4

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_1

    .line 2299
    :pswitch_3
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x5

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_1

    .line 2302
    :pswitch_4
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x6

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_1

    .line 2305
    :pswitch_5
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v9, 0x2

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_1

    .line 2314
    :cond_7
    iget-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFps()I

    move-result v9

    invoke-virtual {p0, v9}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->GetClosestVideoFrameRate(I)I

    move-result v9

    iput v9, v8, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    goto/16 :goto_2

    .line 2339
    .restart local v2       #err:I
    :catch_0
    move-exception v3

    .line 2340
    .local v3, ex:Ljava/lang/IllegalArgumentException;
    const-string v8, "MediaArtistNativeHelper"

    const-string v9, "IllegalArgument for generateClip"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2341
    throw v3

    .line 2342
    .end local v3           #ex:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    .line 2343
    .local v3, ex:Ljava/lang/IllegalStateException;
    const-string v8, "MediaArtistNativeHelper"

    const-string v9, "IllegalStateExceptiont for generateClip"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2344
    throw v3

    .line 2345
    .end local v3           #ex:Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v3

    .line 2346
    .local v3, ex:Ljava/lang/RuntimeException;
    const-string v8, "MediaArtistNativeHelper"

    const-string v9, "RuntimeException for generateClip"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2347
    throw v3

    .line 2355
    .end local v3           #ex:Ljava/lang/RuntimeException;
    :cond_8
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2356
    return-void

    .line 2200
    nop

    :sswitch_data_0
    .sparse-switch
        0x6d60 -> :sswitch_0
        0x9c40 -> :sswitch_1
        0xfa00 -> :sswitch_2
        0x17700 -> :sswitch_3
        0x1f400 -> :sswitch_4
        0x2ee00 -> :sswitch_5
        0x3e800 -> :sswitch_6
        0x5dc00 -> :sswitch_7
        0x7d000 -> :sswitch_8
        0xc3500 -> :sswitch_9
        0xf4240 -> :sswitch_a
        0x124f80 -> :sswitch_b
        0x16e360 -> :sswitch_c
        0x1e8480 -> :sswitch_d
        0x4c4b40 -> :sswitch_e
        0x7a1200 -> :sswitch_f
    .end sparse-switch

    .line 2291
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method exportAs2D(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 10
    .parameter "filePath"
    .parameter "projectDir"
    .parameter
    .parameter "listener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/lifevibes/videoeditor/MediaItem;",
            ">;",
            "Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, mediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const v9, 0x5dc00

    const/4 v8, 0x2

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 2598
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    if-nez v2, :cond_0

    .line 2599
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Not a media video item"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2602
    :cond_0
    invoke-direct {p0, p3}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getMediaItemProperties(Ljava/util/List;)V

    .line 2603
    if-eqz p4, :cond_1

    .line 2604
    iput-object p4, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2605
    :cond_1
    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    .line 2606
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFps()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->GetClosestVideoFrameRate(I)I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2607
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mOutputFilename:Ljava/lang/String;

    iput-object p1, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->outputFile:Ljava/lang/String;

    .line 2608
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaItem;->getWidth()I

    move-result v4

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaItem;->getHeight()I

    move-result v2

    invoke-virtual {p0, v4, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getAspectRatio(II)I

    move-result v4

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaItem;->getHeight()I

    move-result v2

    invoke-direct {p0, v4, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->findVideoResolution(II)I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    .line 2609
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoBitrate()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getClosestVideoBitrate(I)I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    .line 2610
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v6, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoRenderingType:I

    .line 2613
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoType()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 2630
    :pswitch_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Argument Video codec NOT Supported"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2615
    :pswitch_1
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v6, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    .line 2634
    :goto_0
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v2, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    if-ne v2, v6, :cond_2

    .line 2635
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2636
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v2, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    if-le v2, v9, :cond_2

    .line 2637
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v9, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    .line 2641
    :cond_2
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioType()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 2643
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioType()I

    move-result v2

    packed-switch v2, :pswitch_data_1

    .line 2660
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v5, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->maxFileSize:I

    .line 2661
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTotalClips:I

    add-int/lit8 v3, v3, -0x1

    new-array v3, v3, [Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    iput-object v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->transitionSettingsArray:[Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$TransitionSettings;

    .line 2663
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v2, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    if-ne v2, v6, :cond_4

    .line 2664
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameRate:I

    .line 2665
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const v3, 0x3e800

    iput v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoBitrate:I

    .line 2666
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iget v2, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    if-le v2, v7, :cond_4

    .line 2667
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFrameSize:I

    .line 2670
    :cond_4
    const/4 v0, 0x0

    .line 2672
    .local v0, err:I
    const/16 v2, 0x14

    :try_start_0
    iput v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I

    .line 2673
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingObject:Ljava/lang/Object;

    .line 2674
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-virtual {p0, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->generateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I

    move-result v0

    .line 2675
    const/4 v2, 0x0

    iput v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProcessingState:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 2687
    if-eqz v0, :cond_5

    .line 2688
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "RuntimeException for generateClip"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2689
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "generateClip failed with error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2618
    .end local v0           #err:I
    :pswitch_2
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v7, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_0

    .line 2621
    :pswitch_3
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v3, 0x5

    iput v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_0

    .line 2624
    :pswitch_4
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/4 v3, 0x6

    iput v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_0

    .line 2627
    :pswitch_5
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v8, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->videoFormat:I

    goto/16 :goto_0

    .line 2645
    :pswitch_6
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v8, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2646
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioBitrate()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getClosestAudioBitrate(I)I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2647
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioSamplingFrequency()I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2648
    iget-object v3, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioChannels()I

    move-result v2

    iput v2, v3, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    goto/16 :goto_1

    .line 2651
    :pswitch_7
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v6, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioFormat:I

    .line 2652
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/16 v3, 0x2fa8

    iput v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioBitrate:I

    .line 2653
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    const/16 v3, 0x1f40

    iput v3, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioSamplingFreq:I

    .line 2654
    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mPreviewEditSettings:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;

    iput v6, v2, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;->audioChannels:I

    goto/16 :goto_1

    .line 2676
    .restart local v0       #err:I
    :catch_0
    move-exception v1

    .line 2677
    .local v1, ex:Ljava/lang/IllegalArgumentException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "IllegalArgument for generateClip"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2678
    throw v1

    .line 2679
    .end local v1           #ex:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v1

    .line 2680
    .local v1, ex:Ljava/lang/IllegalStateException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "IllegalStateExceptiont for generateClip"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2681
    throw v1

    .line 2682
    .end local v1           #ex:Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v1

    .line 2683
    .local v1, ex:Ljava/lang/RuntimeException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "RuntimeException for generateClip"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2684
    throw v1

    .line 2692
    .end local v1           #ex:Ljava/lang/RuntimeException;
    :cond_5
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportProgressListener:Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;

    .line 2693
    return-void

    .line 2613
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 2643
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method findThumbnailMode(Ljava/lang/String;IJJ)Z
    .locals 4
    .parameter "filename"
    .parameter "thumbnailCount"
    .parameter "startMs"
    .parameter "endMs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 3534
    const/4 v1, 0x1

    .line 3538
    .local v1, result:Z
    :try_start_0
    invoke-virtual/range {p0 .. p6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeFindThumbnailMode(Ljava/lang/String;IJJ)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 3544
    :goto_0
    return v1

    .line 3539
    :catch_0
    move-exception v0

    .line 3540
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "Runtime exception in nativeFindThumbnailMode"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3542
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public generateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I
    .locals 5
    .parameter "editSettings"

    .prologue
    const/4 v2, -0x1

    .line 2777
    const/4 v0, 0x0

    .line 2780
    .local v0, err:I
    :try_start_0
    invoke-direct {p0, p1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGenerateClip(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$EditSettings;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    move v2, v0

    .line 2803
    :cond_0
    :goto_0
    return v2

    .line 2781
    :catch_0
    move-exception v1

    .line 2782
    .local v1, ex:Ljava/lang/IllegalArgumentException;
    const-string v3, "MediaArtistNativeHelper"

    const-string v4, "Illegal Argument exception in load settings"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2783
    if-eqz v0, :cond_0

    move v2, v0

    .line 2786
    goto :goto_0

    .line 2788
    .end local v1           #ex:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v1

    .line 2789
    .local v1, ex:Ljava/lang/IllegalStateException;
    const-string v3, "MediaArtistNativeHelper"

    const-string v4, "Illegal state exception in load settings"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2790
    if-eqz v0, :cond_0

    move v2, v0

    .line 2793
    goto :goto_0

    .line 2795
    .end local v1           #ex:Ljava/lang/IllegalStateException;
    :catch_2
    move-exception v1

    .line 2796
    .local v1, ex:Ljava/lang/RuntimeException;
    const-string v3, "MediaArtistNativeHelper"

    const-string v4, "Runtime exception in load settings"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2797
    if-eqz v0, :cond_0

    move v2, v0

    .line 2800
    goto :goto_0
.end method

.method getAspectRatio(II)I
    .locals 8
    .parameter "w"
    .parameter "h"

    .prologue
    .line 2853
    int-to-double v4, p1

    int-to-double v6, p2

    div-double v0, v4, v6

    .line 2854
    .local v0, apRatio:D
    new-instance v2, Ljava/math/BigDecimal;

    invoke-direct {v2, v0, v1}, Ljava/math/BigDecimal;-><init>(D)V

    .line 2855
    .local v2, bd:Ljava/math/BigDecimal;
    const/4 v4, 0x3

    const/4 v5, 0x4

    invoke-virtual {v2, v4, v5}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object v2

    .line 2856
    invoke-virtual {v2}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    .line 2857
    const/4 v3, 0x2

    .line 2858
    .local v3, var:I
    const-wide v4, 0x3ffb333333333333L

    cmpl-double v4, v0, v4

    if-ltz v4, :cond_1

    .line 2859
    const/4 v3, 0x2

    .line 2871
    :cond_0
    :goto_0
    return v3

    .line 2860
    :cond_1
    const-wide v4, 0x3ff999999999999aL

    cmpl-double v4, v0, v4

    if-ltz v4, :cond_2

    .line 2861
    const/4 v3, 0x4

    goto :goto_0

    .line 2862
    :cond_2
    const-wide/high16 v4, 0x3ff8

    cmpl-double v4, v0, v4

    if-ltz v4, :cond_3

    .line 2863
    const/4 v3, 0x1

    goto :goto_0

    .line 2864
    :cond_3
    const-wide v4, 0x3ff4cccccccccccdL

    cmpl-double v4, v0, v4

    if-lez v4, :cond_4

    .line 2865
    const/4 v3, 0x3

    goto :goto_0

    .line 2866
    :cond_4
    const-wide v4, 0x3ff3333333333333L

    cmpl-double v4, v0, v4

    if-ltz v4, :cond_5

    .line 2867
    const/4 v3, 0x5

    goto :goto_0

    .line 2868
    :cond_5
    const-wide/high16 v4, 0x3ff0

    cmpl-double v4, v0, v4

    if-nez v4, :cond_0

    .line 2869
    const/4 v3, 0x6

    goto :goto_0
.end method

.method getAudioCodecType(I)I
    .locals 1
    .parameter "codecType"

    .prologue
    .line 2961
    const/4 v0, -0x1

    .line 2962
    .local v0, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 2980
    const/4 v0, -0x1

    .line 2982
    :goto_0
    return v0

    .line 2964
    :pswitch_0
    const/4 v0, 0x1

    .line 2965
    goto :goto_0

    .line 2967
    :pswitch_1
    const/4 v0, 0x2

    .line 2968
    goto :goto_0

    .line 2970
    :pswitch_2
    const/4 v0, 0x3

    .line 2971
    goto :goto_0

    .line 2973
    :pswitch_3
    const/4 v0, 0x4

    .line 2974
    goto :goto_0

    .line 2976
    :pswitch_4
    const/4 v0, 0x5

    .line 2977
    goto :goto_0

    .line 2962
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method getAudioflag()Z
    .locals 1

    .prologue
    .line 2738
    iget-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mRegenerateAudio:Z

    return v0
.end method

.method getClosestAudioBitrate(I)I
    .locals 5
    .parameter "bitrateValue"

    .prologue
    const v4, 0xfa00

    const v3, 0xbb80

    const/16 v2, 0x7d00

    const/16 v1, 0x5dc0

    const/16 v0, 0x3e80

    .line 2072
    if-lez p1, :cond_0

    if-gt p1, v0, :cond_0

    .line 2091
    :goto_0
    return v0

    .line 2074
    :cond_0
    if-le p1, v0, :cond_1

    if-gt p1, v1, :cond_1

    move v0, v1

    .line 2075
    goto :goto_0

    .line 2076
    :cond_1
    if-le p1, v1, :cond_2

    if-gt p1, v2, :cond_2

    move v0, v2

    .line 2077
    goto :goto_0

    .line 2078
    :cond_2
    if-le p1, v2, :cond_3

    if-gt p1, v3, :cond_3

    move v0, v3

    .line 2079
    goto :goto_0

    .line 2080
    :cond_3
    if-le p1, v3, :cond_4

    if-gt p1, v4, :cond_4

    move v0, v4

    .line 2081
    goto :goto_0

    .line 2082
    :cond_4
    if-le p1, v4, :cond_5

    const v0, 0x17700

    if-gt p1, v0, :cond_5

    .line 2083
    const v0, 0x17700

    goto :goto_0

    .line 2084
    :cond_5
    const v0, 0x17700

    if-le p1, v0, :cond_6

    const v0, 0x1f400

    if-gt p1, v0, :cond_6

    .line 2085
    const v0, 0x1f400

    goto :goto_0

    .line 2086
    :cond_6
    const v0, 0x1f400

    if-le p1, v0, :cond_7

    const v0, 0x2ee00

    if-gt p1, v0, :cond_7

    .line 2087
    const v0, 0x2ee00

    goto :goto_0

    .line 2088
    :cond_7
    const v0, 0x2ee00

    if-le p1, v0, :cond_8

    const v0, 0x3e800

    if-gt p1, v0, :cond_8

    .line 2089
    const v0, 0x3e800

    goto :goto_0

    .line 2091
    :cond_8
    const/4 v0, -0x1

    goto :goto_0
.end method

.method getClosestVideoBitrate(I)I
    .locals 5
    .parameter "bitrateValue"

    .prologue
    const v3, 0x2ee00

    const v2, 0x1f400

    const v1, 0x17700

    const v0, 0xfa00

    const v4, 0x7a1200

    .line 2032
    if-lez p1, :cond_0

    if-gt p1, v0, :cond_0

    .line 2065
    :goto_0
    return v0

    .line 2034
    :cond_0
    if-le p1, v0, :cond_1

    if-gt p1, v1, :cond_1

    move v0, v1

    .line 2035
    goto :goto_0

    .line 2036
    :cond_1
    if-le p1, v1, :cond_2

    if-gt p1, v2, :cond_2

    move v0, v2

    .line 2037
    goto :goto_0

    .line 2038
    :cond_2
    if-le p1, v2, :cond_3

    if-gt p1, v3, :cond_3

    move v0, v3

    .line 2039
    goto :goto_0

    .line 2040
    :cond_3
    if-le p1, v3, :cond_4

    const v0, 0x3e800

    if-gt p1, v0, :cond_4

    .line 2041
    const v0, 0x3e800

    goto :goto_0

    .line 2042
    :cond_4
    const v0, 0x3e800

    if-le p1, v0, :cond_5

    const v0, 0x46500

    if-gt p1, v0, :cond_5

    .line 2043
    const v0, 0x46500

    goto :goto_0

    .line 2044
    :cond_5
    const v0, 0x46500

    if-le p1, v0, :cond_6

    const v0, 0x5dc00

    if-gt p1, v0, :cond_6

    .line 2045
    const v0, 0x5dc00

    goto :goto_0

    .line 2046
    :cond_6
    const v0, 0x5dc00

    if-le p1, v0, :cond_7

    const v0, 0x7d000

    if-gt p1, v0, :cond_7

    .line 2047
    const v0, 0x7d000

    goto :goto_0

    .line 2048
    :cond_7
    const v0, 0x7d000

    if-le p1, v0, :cond_8

    const v0, 0xc3500

    if-gt p1, v0, :cond_8

    .line 2049
    const v0, 0xc3500

    goto :goto_0

    .line 2050
    :cond_8
    const v0, 0xc3500

    if-le p1, v0, :cond_9

    const v0, 0xf4240

    if-gt p1, v0, :cond_9

    .line 2051
    const v0, 0xf4240

    goto :goto_0

    .line 2052
    :cond_9
    const v0, 0xf4240

    if-le p1, v0, :cond_a

    const v0, 0x124f80

    if-gt p1, v0, :cond_a

    .line 2053
    const v0, 0x124f80

    goto :goto_0

    .line 2054
    :cond_a
    const v0, 0x124f80

    if-le p1, v0, :cond_b

    const v0, 0x16e360

    if-gt p1, v0, :cond_b

    .line 2055
    const v0, 0x16e360

    goto :goto_0

    .line 2056
    :cond_b
    const v0, 0x16e360

    if-le p1, v0, :cond_c

    const v0, 0x1e8480

    if-gt p1, v0, :cond_c

    .line 2057
    const v0, 0x1e8480

    goto/16 :goto_0

    .line 2058
    :cond_c
    const v0, 0x1e8480

    if-le p1, v0, :cond_d

    const v0, 0x4c4b40

    if-gt p1, v0, :cond_d

    .line 2059
    const v0, 0x4c4b40

    goto/16 :goto_0

    .line 2060
    :cond_d
    const v0, 0x4c4b40

    if-le p1, v0, :cond_e

    if-gt p1, v4, :cond_e

    move v0, v4

    .line 2061
    goto/16 :goto_0

    .line 2062
    :cond_e
    if-le p1, v4, :cond_f

    move v0, v4

    .line 2063
    goto/16 :goto_0

    .line 2065
    :cond_f
    const/4 v0, -0x1

    goto/16 :goto_0
.end method

.method getFileType(I)I
    .locals 1
    .parameter "fileType"

    .prologue
    .line 2883
    const/4 v0, -0x1

    .line 2884
    .local v0, retValue:I
    sparse-switch p1, :sswitch_data_0

    .line 2910
    const/4 v0, -0x1

    .line 2912
    :goto_0
    return v0

    .line 2886
    :sswitch_0
    const/16 v0, 0xff

    .line 2887
    goto :goto_0

    .line 2889
    :sswitch_1
    const/4 v0, 0x0

    .line 2890
    goto :goto_0

    .line 2892
    :sswitch_2
    const/4 v0, 0x1

    .line 2893
    goto :goto_0

    .line 2895
    :sswitch_3
    const/4 v0, 0x5

    .line 2896
    goto :goto_0

    .line 2898
    :sswitch_4
    const/16 v0, 0x8

    .line 2899
    goto :goto_0

    .line 2901
    :sswitch_5
    const/4 v0, 0x3

    .line 2902
    goto :goto_0

    .line 2904
    :sswitch_6
    const/16 v0, 0xa

    .line 2905
    goto :goto_0

    .line 2907
    :sswitch_7
    const/4 v0, 0x2

    .line 2908
    goto :goto_0

    .line 2884
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x1 -> :sswitch_2
        0x2 -> :sswitch_7
        0x3 -> :sswitch_5
        0x5 -> :sswitch_3
        0x8 -> :sswitch_4
        0xa -> :sswitch_6
        0xff -> :sswitch_0
    .end sparse-switch
.end method

.method getFrameRate(I)I
    .locals 1
    .parameter "fps"

    .prologue
    .line 2993
    const/4 v0, -0x1

    .line 2994
    .local v0, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 3021
    const/4 v0, -0x1

    .line 3023
    :goto_0
    return v0

    .line 2996
    :pswitch_0
    const/4 v0, 0x5

    .line 2997
    goto :goto_0

    .line 2999
    :pswitch_1
    const/16 v0, 0x8

    .line 3000
    goto :goto_0

    .line 3002
    :pswitch_2
    const/16 v0, 0xa

    .line 3003
    goto :goto_0

    .line 3005
    :pswitch_3
    const/16 v0, 0xd

    .line 3006
    goto :goto_0

    .line 3008
    :pswitch_4
    const/16 v0, 0xf

    .line 3009
    goto :goto_0

    .line 3011
    :pswitch_5
    const/16 v0, 0x14

    .line 3012
    goto :goto_0

    .line 3014
    :pswitch_6
    const/16 v0, 0x19

    .line 3015
    goto :goto_0

    .line 3017
    :pswitch_7
    const/16 v0, 0x1e

    .line 3018
    goto :goto_0

    .line 2994
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method getGeneratePreview()Z
    .locals 1

    .prologue
    .line 2841
    iget-boolean v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mInvalidatePreviewArray:Z

    return v0
.end method

.method getMediaItemFileType(I)I
    .locals 1
    .parameter "fileType"

    .prologue
    .line 3035
    const/4 v0, -0x1

    .line 3037
    .local v0, retValue:I
    sparse-switch p1, :sswitch_data_0

    .line 3060
    const/4 v0, -0x1

    .line 3062
    :goto_0
    return v0

    .line 3039
    :sswitch_0
    const/16 v0, 0xff

    .line 3040
    goto :goto_0

    .line 3042
    :sswitch_1
    const/4 v0, 0x0

    .line 3043
    goto :goto_0

    .line 3045
    :sswitch_2
    const/4 v0, 0x1

    .line 3046
    goto :goto_0

    .line 3048
    :sswitch_3
    const/4 v0, 0x5

    .line 3049
    goto :goto_0

    .line 3051
    :sswitch_4
    const/16 v0, 0x8

    .line 3052
    goto :goto_0

    .line 3054
    :sswitch_5
    const/16 v0, 0xa

    .line 3055
    goto :goto_0

    .line 3057
    :sswitch_6
    const/4 v0, 0x2

    .line 3058
    goto :goto_0

    .line 3037
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x1 -> :sswitch_2
        0x2 -> :sswitch_6
        0x5 -> :sswitch_3
        0x8 -> :sswitch_4
        0xa -> :sswitch_5
        0xff -> :sswitch_0
    .end sparse-switch
.end method

.method getMediaItemRenderingMode(I)I
    .locals 1
    .parameter "renderingMode"

    .prologue
    .line 3075
    const/4 v0, -0x1

    .line 3076
    .local v0, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 3088
    const/4 v0, -0x1

    .line 3090
    :goto_0
    return v0

    .line 3078
    :pswitch_0
    const/4 v0, 0x2

    .line 3079
    goto :goto_0

    .line 3081
    :pswitch_1
    const/4 v0, 0x0

    .line 3082
    goto :goto_0

    .line 3084
    :pswitch_2
    const/4 v0, 0x1

    .line 3085
    goto :goto_0

    .line 3076
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method native getMediaProperties(Ljava/lang/String;)Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/lang/RuntimeException;,
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method getPixels(Ljava/lang/String;IIJ)Landroid/graphics/Bitmap;
    .locals 7
    .parameter "inputFile"
    .parameter "width"
    .parameter "height"
    .parameter "timeMS"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 3277
    if-nez p1, :cond_0

    .line 3278
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid input file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3280
    :cond_0
    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixels(Ljava/lang/String;IIJI)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method getPixelsFast(Ljava/lang/String;IIJ)Landroid/graphics/Bitmap;
    .locals 9
    .parameter "inputFile"
    .parameter "width"
    .parameter "height"
    .parameter "timeMS"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 3300
    const/4 v7, 0x0

    .line 3302
    .local v7, TNFastConfigFailed:Z
    if-nez p1, :cond_0

    .line 3303
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 3308
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNFastCodecConfig()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsFast(Ljava/lang/String;IIJI)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 3327
    :goto_0
    return-object v0

    .line 3310
    :catch_0
    move-exception v8

    .line 3311
    .local v8, x:Ljava/lang/Exception;
    const-string v0, "MediaArtistNativeHelper"

    const-string v1, "Runtime exception in getPixelsFast call "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3312
    const/4 v7, 0x1

    .line 3316
    const/4 v0, 0x1

    if-ne v7, v0, :cond_1

    .line 3319
    :try_start_1
    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsFast(Ljava/lang/String;IIJI)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 3321
    :catch_1
    move-exception v8

    .line 3322
    .local v8, x:Ljava/lang/RuntimeException;
    const-string v0, "MediaArtistNativeHelper"

    const-string v1, "Runtime exception in getPixelsFast call with fallback"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3323
    throw v8

    .line 3327
    .local v8, x:Ljava/lang/Exception;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getPixelsList(Ljava/lang/String;IIJJILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)V
    .locals 13
    .parameter "filename"
    .parameter "width"
    .parameter "height"
    .parameter "startMs"
    .parameter "endMs"
    .parameter "thumbnailCount"
    .parameter "callback"

    .prologue
    .line 3371
    move/from16 v0, p8

    new-array v10, v0, [I

    .line 3372
    .local v10, tnTimeList:[I
    sub-long v2, p6, p4

    long-to-int v2, v2

    div-int v6, v2, p8

    .line 3373
    .local v6, deltaTime:I
    move-object/from16 v0, p9

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

    .line 3374
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v11

    iget-object v12, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-direct/range {v2 .. v12}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsList(Ljava/lang/String;IIIIII[IILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)I

    .line 3377
    return-void
.end method

.method getPixelsList(Ljava/lang/String;IIJJI)[Landroid/graphics/Bitmap;
    .locals 13
    .parameter "filename"
    .parameter "width"
    .parameter "height"
    .parameter "startMs"
    .parameter "endMs"
    .parameter "thumbnailCount"

    .prologue
    .line 3346
    move/from16 v0, p8

    new-array v10, v0, [I

    .line 3347
    .local v10, tnTimeList:[I
    sub-long v2, p6, p4

    long-to-int v2, v2

    div-int v6, v2, p8

    .line 3348
    .local v6, deltaTime:I
    const/4 v12, 0x0

    .line 3349
    .local v12, bitmaps:[Landroid/graphics/Bitmap;
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v11

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-direct/range {v2 .. v11}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsList(Ljava/lang/String;IIIIII[II)[Landroid/graphics/Bitmap;

    move-result-object v12

    .line 3352
    iput-object v10, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailTime:[I

    .line 3353
    return-object v12
.end method

.method getPixelsListFast(Ljava/lang/String;IIJJILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)V
    .locals 17
    .parameter "filename"
    .parameter "width"
    .parameter "height"
    .parameter "startMs"
    .parameter "endMs"
    .parameter "thumbnailCount"
    .parameter "callback"

    .prologue
    .line 3473
    const/4 v13, 0x0

    .line 3476
    .local v13, TNFastConfigFailed:Z
    add-int/lit8 v2, p2, 0x1

    and-int/lit8 v15, v2, -0x2

    .line 3477
    .local v15, newWidth:I
    add-int/lit8 v2, p3, 0x1

    and-int/lit8 v14, v2, -0x2

    .line 3482
    .local v14, newHeight:I
    move/from16 v0, p8

    new-array v10, v0, [I

    .line 3483
    .local v10, tnTimeList:[I
    sub-long v2, p6, p4

    long-to-int v2, v2

    div-int v6, v2, p8

    .line 3484
    .local v6, deltaTime:I
    move-object/from16 v0, p9

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

    .line 3487
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNFastCodecConfig()I

    move-result v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-virtual/range {v2 .. v12}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsListFastCB(Ljava/lang/String;IIIIII[IILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3498
    :goto_0
    const/4 v2, 0x1

    if-ne v13, v2, :cond_0

    .line 3501
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mThumbnailListListener:Lcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-virtual/range {v2 .. v12}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsListFastCB(Ljava/lang/String;IIIIII[IILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)I
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3512
    :cond_0
    return-void

    .line 3492
    :catch_0
    move-exception v16

    .line 3493
    .local v16, x:Ljava/lang/Exception;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "Runtime exception in getPixelsListFast call "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3494
    const/4 v13, 0x1

    goto :goto_0

    .line 3506
    .end local v16           #x:Ljava/lang/Exception;
    :catch_1
    move-exception v16

    .line 3507
    .local v16, x:Ljava/lang/RuntimeException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "Runtime exception in getPixelsListFast call with fallback"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3508
    throw v16
.end method

.method getPixelsListFast(Ljava/lang/String;IIJJI)[Landroid/util/Pair;
    .locals 22
    .parameter "filename"
    .parameter "width"
    .parameter "height"
    .parameter "startMs"
    .parameter "endMs"
    .parameter "thumbnailCount"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIJJI)[",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3398
    const/16 v18, 0x0

    .line 3399
    .local v18, rgb888:[I
    const/16 v20, 0x0

    .line 3400
    .local v20, thumbnailSize:I
    const/16 v19, 0x0

    .line 3401
    .local v19, tempBitmap:Landroid/graphics/Bitmap;
    const/4 v13, 0x0

    .line 3404
    .local v13, TNFastConfigFailed:Z
    add-int/lit8 v2, p2, 0x1

    and-int/lit8 v17, v2, -0x2

    .line 3405
    .local v17, newWidth:I
    add-int/lit8 v2, p3, 0x1

    and-int/lit8 v16, v2, -0x2

    .line 3406
    .local v16, newHeight:I
    mul-int v2, v17, v16

    mul-int/lit8 v20, v2, 0x4

    .line 3408
    const/4 v15, 0x0

    .line 3410
    .local v15, i:I
    const/4 v14, 0x0

    .line 3411
    .local v14, bitmaps:[Landroid/graphics/Bitmap;
    move/from16 v0, p8

    new-array v10, v0, [I

    .line 3412
    .local v10, tnTimeList:[I
    move/from16 v0, p8

    new-array v12, v0, [Landroid/util/Pair;

    .line 3413
    .local v12, PixelList:[Landroid/util/Pair;,"[Landroid/util/Pair<Ljava/lang/Integer;Landroid/graphics/Bitmap;>;"
    sub-long v2, p6, p4

    long-to-int v2, v2

    div-int v6, v2, p8

    .line 3416
    .local v6, deltaTime:I
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNFastCodecConfig()I

    move-result v11

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-virtual/range {v2 .. v11}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsListFast(Ljava/lang/String;IIIIII[II)[Landroid/graphics/Bitmap;

    move-result-object v14

    .line 3419
    :goto_0
    move/from16 v0, p8

    if-ge v15, v0, :cond_0

    .line 3420
    new-instance v2, Landroid/util/Pair;

    aget v3, v10, v15

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aget-object v4, v14, v15

    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    aput-object v2, v12, v15
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3419
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 3424
    :catch_0
    move-exception v21

    .line 3425
    .local v21, x:Ljava/lang/Exception;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "Runtime exception in getPixelsListFast call "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3426
    const/4 v13, 0x1

    .line 3430
    .end local v21           #x:Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x1

    if-ne v13, v2, :cond_1

    .line 3433
    move-wide/from16 v0, p4

    long-to-int v8, v0

    move-wide/from16 v0, p6

    long-to-int v9, v0

    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getTNAccurateCodecConfig()I

    move-result v11

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p8

    invoke-virtual/range {v2 .. v11}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->nativeGetPixelsListFast(Ljava/lang/String;IIIIII[II)[Landroid/graphics/Bitmap;

    move-result-object v14

    .line 3436
    :goto_1
    move/from16 v0, p8

    if-ge v15, v0, :cond_1

    .line 3437
    new-instance v2, Landroid/util/Pair;

    aget v3, v10, v15

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aget-object v4, v14, v15

    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    aput-object v2, v12, v15
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3436
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 3441
    :catch_1
    move-exception v21

    .line 3442
    .local v21, x:Ljava/lang/RuntimeException;
    const-string v2, "MediaArtistNativeHelper"

    const-string v3, "Runtime exception in getPixelsListFast call with fallback"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3443
    throw v21

    .line 3447
    .end local v21           #x:Ljava/lang/RuntimeException;
    :cond_1
    return-object v12
.end method

.method getProjectAudioTrackPCMFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1988
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    return-object v0
.end method

.method getProjectPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1981
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProjectPath:Ljava/lang/String;

    return-object v0
.end method

.method public getTNAccurateCodecConfig()I
    .locals 1

    .prologue
    .line 3627
    sget v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigAccurateMode:I

    return v0
.end method

.method public getTNFastCodecConfig()I
    .locals 1

    .prologue
    .line 3635
    sget v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigFastMode:I

    return v0
.end method

.method public getVideoCodecType(I)I
    .locals 1
    .parameter "codecType"

    .prologue
    .line 2924
    const/4 v0, -0x1

    .line 2925
    .local v0, retValue:I
    packed-switch p1, :pswitch_data_0

    .line 2947
    :pswitch_0
    const/4 v0, -0x1

    .line 2949
    :goto_0
    return v0

    .line 2927
    :pswitch_1
    const/4 v0, 0x1

    .line 2928
    goto :goto_0

    .line 2930
    :pswitch_2
    const/4 v0, 0x4

    .line 2931
    goto :goto_0

    .line 2933
    :pswitch_3
    const/4 v0, 0x5

    .line 2934
    goto :goto_0

    .line 2936
    :pswitch_4
    const/4 v0, 0x6

    .line 2937
    goto :goto_0

    .line 2939
    :pswitch_5
    const/4 v0, 0x2

    .line 2940
    goto :goto_0

    .line 2942
    :pswitch_6
    const/4 v0, 0x0

    .line 2943
    goto :goto_0

    .line 2925
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_1
        :pswitch_5
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method initClipSettings(Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;)V
    .locals 2
    .parameter "lclipSettings"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 2813
    iput-object v1, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipPath:Ljava/lang/String;

    .line 2814
    iput-object v1, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipDecodedPath:Ljava/lang/String;

    .line 2815
    iput-object v1, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipOriginalPath:Ljava/lang/String;

    .line 2816
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->fileType:I

    .line 2817
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->endCutTime:I

    .line 2818
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->beginCutTime:I

    .line 2819
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->beginCutPercent:I

    .line 2820
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->endCutPercent:I

    .line 2821
    iput-boolean v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomEnabled:Z

    .line 2822
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomPercentStart:I

    .line 2823
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomTopLeftXStart:I

    .line 2824
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomTopLeftYStart:I

    .line 2825
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomPercentEnd:I

    .line 2826
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomTopLeftXEnd:I

    .line 2827
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->panZoomTopLeftYEnd:I

    .line 2828
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->mediaRendering:I

    .line 2829
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->rgbWidth:I

    .line 2830
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->rgbHeight:I

    .line 2831
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->clipVolumePercentage:I

    .line 2832
    iput v0, p1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper$ClipSettings;->mNumCuts:I

    .line 2833
    return-void
.end method

.method invalidatePcmFile()V
    .locals 2

    .prologue
    .line 1995
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1996
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1997
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mAudioTrackPCMFilePath:Ljava/lang/String;

    .line 1999
    :cond_0
    return-void
.end method

.method public native nativeFindThumbnailMode(Ljava/lang/String;IJJ)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation
.end method

.method public native nativeGetPixelsFast(Ljava/lang/String;IIJI)Landroid/graphics/Bitmap;
.end method

.method public native nativeGetPixelsListFast(Ljava/lang/String;IIIIII[II)[Landroid/graphics/Bitmap;
.end method

.method public native nativeGetPixelsListFastCB(Ljava/lang/String;IIIIII[IILcom/lifevibes/videoeditor/MediaItem$GetThumbnailListCallback;)I
.end method

.method nativeHelperGetAspectRatio()I
    .locals 1

    .prologue
    .line 2714
    iget-object v0, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mVideoEditor:Lcom/lifevibes/videoeditor/VideoEditor;

    invoke-interface {v0}, Lcom/lifevibes/videoeditor/VideoEditor;->getAspectRatio()I

    move-result v0

    return v0
.end method

.method public releaseNativeHelper()V
    .locals 3

    .prologue
    .line 2701
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2710
    return-void

    .line 2702
    :catch_0
    move-exception v0

    .line 2703
    .local v0, ex:Ljava/lang/IllegalStateException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Illegal State exeption caught in releaseNativeHelper"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2705
    throw v0

    .line 2706
    .end local v0           #ex:Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 2707
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Runtime exeption caught in releaseNativeHelper"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2708
    throw v0
.end method

.method setAudioflag(Z)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 2725
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mProjectPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "AudioPcm.pcm"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2726
    const/4 p1, 0x1

    .line 2728
    :cond_0
    iput-boolean p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mRegenerateAudio:Z

    .line 2729
    return-void
.end method

.method setFit2ShareFile(Ljava/lang/String;)V
    .locals 0
    .parameter "filename"

    .prologue
    .line 3581
    iput-object p1, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    .line 3582
    return-void
.end method

.method stop(Ljava/lang/String;)V
    .locals 3
    .parameter "filename"

    .prologue
    .line 3554
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->stopEncoding()V

    .line 3555
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mExportFilename:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 3563
    return-void

    .line 3556
    :catch_0
    move-exception v0

    .line 3557
    .local v0, ex:Ljava/lang/IllegalStateException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Illegal state exception in unload settings"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3558
    throw v0

    .line 3559
    .end local v0           #ex:Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 3560
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Runtime exception in unload settings"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3561
    throw v0
.end method

.method stopAudioWaveformExtraction()V
    .locals 3

    .prologue
    .line 3567
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->stopExtraction()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 3575
    return-void

    .line 3568
    :catch_0
    move-exception v0

    .line 3569
    .local v0, ex:Ljava/lang/IllegalStateException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Illegal state exception in unload settings"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3570
    throw v0

    .line 3571
    .end local v0           #ex:Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v0

    .line 3572
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Runtime exception in unload settings"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3573
    throw v0
.end method

.method stopThumbnailList()V
    .locals 3

    .prologue
    .line 3590
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->stopThumbnail()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3595
    return-void

    .line 3591
    :catch_0
    move-exception v0

    .line 3592
    .local v0, ex:Ljava/lang/IllegalStateException;
    const-string v1, "MediaArtistNativeHelper"

    const-string v2, "Illegal state exception in stopThumbnail"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3593
    throw v0
.end method
