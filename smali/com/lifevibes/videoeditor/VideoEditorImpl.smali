.class public Lcom/lifevibes/videoeditor/VideoEditorImpl;
.super Ljava/lang/Object;
.source "VideoEditorImpl.java"

# interfaces
.implements Lcom/lifevibes/videoeditor/VideoEditor;


# static fields
.field private static final CODECCONFIG_FILENAME:Ljava/lang/String; = "CodecConfig.xml"

.field private static final TAG:Ljava/lang/String; = "VideoEditorImpl"

.field private static final TAG_DEC_CONFIG_TN_ACCURATE_MODE:Ljava/lang/String; = "ThubmnailAccurateMode"

.field private static final TAG_DEC_CONFIG_TN_FAST_MODE:Ljava/lang/String; = "ThubmnailFastMode"

.field private static final TAG_TN:Ljava/lang/String; = "ThumbNailcodecConfig"


# instance fields
.field private mAspectRatio:I

.field private mClipsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDurationMs:J

.field private mIsFirstVideoItemAdded:Z

.field private mIsList3D:Z

.field private final mLock:Ljava/util/concurrent/Semaphore;

.field private mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

.field private final mMediaItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lifevibes/videoeditor/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private final mProjectPath:Ljava/lang/String;

.field private modifiedBitrate:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "projectPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mClipsList:Ljava/util/List;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    .line 124
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v1, v1}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    .line 125
    new-instance v0, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, p1, v1, p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;-><init>(Ljava/lang/String;Ljava/util/concurrent/Semaphore;Lcom/lifevibes/videoeditor/VideoEditor;)V

    iput-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    .line 126
    iput-object p1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    .line 127
    const/4 v0, 0x3

    iput v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 128
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    .line 129
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "projectPath"
    .parameter "codecConfigPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mClipsList:Ljava/util/List;

    .line 105
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    .line 141
    new-instance v1, Ljava/util/concurrent/Semaphore;

    invoke-direct {v1, v2, v2}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    .line 142
    new-instance v1, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget-object v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-direct {v1, p1, v2, p0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;-><init>(Ljava/lang/String;Ljava/util/concurrent/Semaphore;Lcom/lifevibes/videoeditor/VideoEditor;)V

    iput-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    .line 143
    iput-object p1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    .line 144
    const/4 v1, 0x3

    iput v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 145
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    .line 146
    new-instance v0, Ljava/io/File;

    const-string v1, "CodecConfig.xml"

    invoke-direct {v0, p2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .local v0, CodecConfigXml:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    :try_start_0
    invoke-direct {p0, p2}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->readCodecConfigFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    :cond_0
    :goto_0
    return-void

    .line 151
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private computeTimelineDuration()V
    .locals 7

    .prologue
    .line 1028
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    .line 1029
    iget-object v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 1030
    .local v2, mediaItemsCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 1031
    iget-object v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lifevibes/videoeditor/MediaItem;

    .line 1032
    .local v1, mediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    iget-wide v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    invoke-virtual {v1}, Lcom/lifevibes/videoeditor/MediaItem;->getTimelineDuration()J

    move-result-wide v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    .line 1030
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1034
    .end local v1           #mediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    :cond_0
    return-void
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

    .line 1042
    const-string v0, "VideoEditorImpl"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1043
    const-string v0, "VideoEditorImpl"

    const-string v1, "lock: grabbing semaphore"

    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1045
    :cond_0
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 1046
    const-string v0, "VideoEditorImpl"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1047
    const-string v0, "VideoEditorImpl"

    const-string v1, "lock: grabbed semaphore"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1049
    :cond_1
    return-void
.end method

.method private lock(J)Z
    .locals 5
    .parameter "timeoutMs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 1060
    const-string v1, "VideoEditorImpl"

    invoke-static {v1, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1061
    const-string v1, "VideoEditorImpl"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lock: grabbing semaphore with timeout "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/Throwable;

    invoke-direct {v3}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1064
    :cond_0
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, p1, p2, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    .line 1065
    .local v0, acquireSem:Z
    const-string v1, "VideoEditorImpl"

    invoke-static {v1, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1066
    const-string v1, "VideoEditorImpl"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lock: grabbed semaphore status "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1069
    :cond_1
    return v0
.end method

.method private readCodecConfigFile(Ljava/lang/String;)V
    .locals 12
    .parameter "codecConfigPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    .line 1083
    new-instance v4, Ljava/io/File;

    const-string v8, "CodecConfig.xml"

    invoke-direct {v4, p1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1085
    .local v4, file:Ljava/io/File;
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1087
    .local v5, fis:Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 1089
    .local v7, parser:Lorg/xmlpull/v1/XmlPullParser;
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v2

    .line 1090
    .local v2, factory:Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v2, v10}, Lorg/xmlpull/v1/XmlPullParserFactory;->setNamespaceAware(Z)V

    .line 1091
    invoke-virtual {v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v7

    .line 1092
    const-string v8, "UTF-8"

    invoke-interface {v7, v5, v8}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 1093
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 1095
    .local v1, eventType:I
    const/4 v3, 0x0

    .line 1096
    .local v3, fastmode:Z
    const/4 v0, 0x0

    .line 1098
    .local v0, accuratemode:Z
    :goto_0
    if-eq v1, v10, :cond_7

    .line 1099
    packed-switch v1, :pswitch_data_0

    .line 1144
    :cond_0
    :goto_1
    :pswitch_0
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    .line 1101
    :pswitch_1
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 1102
    .local v6, name:Ljava/lang/String;
    const-string v8, "ThumbNailcodecConfig"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1104
    const-string v8, "ThubmnailFastMode"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1105
    const/4 v3, 0x1

    goto :goto_1

    .line 1107
    :cond_1
    const-string v8, "ThubmnailAccurateMode"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1108
    const/4 v0, 0x1

    goto :goto_1

    .line 1114
    .end local v6           #name:Ljava/lang/String;
    :pswitch_2
    if-eqz v3, :cond_4

    .line 1115
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "NXPSWVDEC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1117
    sput v10, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigFastMode:I

    .line 1124
    :cond_2
    :goto_2
    const/4 v3, 0x0

    goto :goto_1

    .line 1120
    :cond_3
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "SFHWVDEC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1122
    sput v11, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigFastMode:I

    goto :goto_2

    .line 1125
    :cond_4
    if-eqz v0, :cond_0

    .line 1126
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "NXPSWVDEC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 1128
    sput v10, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigAccurateMode:I

    .line 1135
    :cond_5
    :goto_3
    const/4 v0, 0x0

    goto :goto_1

    .line 1131
    :cond_6
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v8

    const-string v9, "SFHWVDEC"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1133
    sput v11, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->mTNDecConfigAccurateMode:I

    goto :goto_3

    .line 1146
    :cond_7
    const/4 v7, 0x0

    .line 1147
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 1149
    return-void

    .line 1099
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private setOptimalConfiguration(I)I
    .locals 5
    .parameter "bitrate"

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x5

    .line 410
    const/4 v0, 0x0

    .line 411
    .local v0, height:I
    const v1, 0x7a1200

    if-lt p1, v1, :cond_0

    .line 412
    const p1, 0x7a1200

    .line 413
    const/16 v0, 0x438

    .line 414
    const/4 v1, 0x2

    iput v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 474
    :goto_0
    iput p1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->modifiedBitrate:I

    .line 475
    return v0

    .line 416
    :cond_0
    const v1, 0x4c4b40

    if-lt p1, v1, :cond_1

    .line 417
    const p1, 0x4c4b40

    .line 418
    const/16 v0, 0x2d0

    .line 419
    iput v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 421
    :cond_1
    const v1, 0x1e8480

    if-lt p1, v1, :cond_2

    .line 422
    const p1, 0x1e8480

    .line 423
    const/16 v0, 0x1e0

    .line 424
    iput v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 426
    :cond_2
    const v1, 0xf4240

    if-lt p1, v1, :cond_3

    .line 427
    const p1, 0xf4240

    .line 428
    const/16 v0, 0x1e0

    .line 429
    iput v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 431
    :cond_3
    const v1, 0xc3500

    if-lt p1, v1, :cond_4

    .line 432
    const p1, 0xc3500

    .line 433
    const/16 v0, 0x1e0

    .line 434
    iput v4, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 436
    :cond_4
    const v1, 0x7d000

    if-lt p1, v1, :cond_5

    .line 437
    const p1, 0x7d000

    .line 438
    const/16 v0, 0x1e0

    .line 439
    iput v4, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 441
    :cond_5
    const v1, 0x5dc00

    if-lt p1, v1, :cond_6

    .line 442
    const p1, 0x5dc00

    .line 443
    const/16 v0, 0x120

    .line 444
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 446
    :cond_6
    const v1, 0x3e800

    if-lt p1, v1, :cond_7

    .line 447
    const p1, 0x3e800

    .line 448
    const/16 v0, 0x120

    .line 449
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 451
    :cond_7
    const v1, 0x2ee00

    if-lt p1, v1, :cond_8

    .line 452
    const p1, 0x2ee00

    .line 453
    const/16 v0, 0x90

    .line 454
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 457
    :cond_8
    const v1, 0x1f400

    if-lt p1, v1, :cond_9

    .line 458
    const p1, 0x1f400

    .line 459
    const/16 v0, 0x90

    .line 460
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto :goto_0

    .line 463
    :cond_9
    const v1, 0x17700

    if-lt p1, v1, :cond_a

    .line 464
    const p1, 0x17700

    .line 465
    const/16 v0, 0x90

    .line 466
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto/16 :goto_0

    .line 470
    :cond_a
    const p1, 0xfa00

    .line 471
    const/16 v0, 0x90

    .line 472
    iput v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    goto/16 :goto_0
.end method

.method private unlock()V
    .locals 2

    .prologue
    .line 1076
    const-string v0, "VideoEditorImpl"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1077
    const-string v0, "VideoEditorImpl"

    const-string v1, "unlock: releasing semaphore"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1079
    :cond_0
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 1080
    return-void
.end method


# virtual methods
.method public declared-synchronized addMediaItem(Lcom/lifevibes/videoeditor/MediaItem;)V
    .locals 3
    .parameter "mediaItem"

    .prologue
    .line 198
    monitor-enter p0

    if-nez p1, :cond_0

    .line 199
    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Media item is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 204
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 205
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Media item already exists: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lifevibes/videoeditor/MediaItem;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_1
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 208
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "More than one media item cannot be added for MediaShare configuration"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_2
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->computeTimelineDuration()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 217
    monitor-exit p0

    return-void
.end method

.method public cancelExport(Ljava/lang/String;)V
    .locals 1
    .parameter "filename"

    .prologue
    .line 223
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 224
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual {v0, p1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->stop(Ljava/lang/String;)V

    .line 226
    :cond_0
    return-void
.end method

.method public cancelFit2Share(Ljava/lang/String;)V
    .locals 1
    .parameter "filename"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 955
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 956
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual {v0, p1}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->stop(Ljava/lang/String;)V

    .line 958
    :cond_0
    return-void
.end method

.method public export(Ljava/lang/String;JLcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)J
    .locals 20
    .parameter "filename"
    .parameter "outputsize"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 486
    const/4 v5, 0x0

    .line 487
    .local v5, height:I
    const/4 v14, 0x0

    .line 488
    .local v14, bitrate:I
    const/16 v16, 0x0

    .line 489
    .local v16, duration:I
    const/4 v13, 0x0

    .line 491
    .local v13, aspectRatioSet:I
    if-nez p1, :cond_0

    .line 492
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "export: filename is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 494
    :cond_0
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 495
    .local v19, tempPathFile:Ljava/io/File;
    if-nez v19, :cond_1

    .line 496
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "can not be created"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 498
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 499
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No MediaItems added"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 501
    :cond_2
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-gtz v2, :cond_3

    .line 502
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Size is Zero"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 504
    :cond_3
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    const-wide/16 v9, 0x3e8

    div-long/2addr v2, v9

    long-to-int v0, v2

    move/from16 v16, v0

    .line 509
    move-wide/from16 v0, p2

    long-to-double v2, v0

    move-wide/from16 v0, p2

    long-to-double v9, v0

    const-wide v11, 0x3fa47ae147ae147bL

    mul-double/2addr v9, v11

    sub-double/2addr v2, v9

    move/from16 v0, v16

    int-to-double v9, v0

    div-double/2addr v2, v9

    const-wide/high16 v9, 0x4020

    mul-double/2addr v2, v9

    double-to-int v14, v2

    .line 514
    add-int/lit16 v14, v14, -0x2fa8

    .line 516
    const v2, 0xfa00

    if-gt v14, v2, :cond_4

    .line 518
    move-wide/from16 v0, p2

    long-to-double v2, v0

    move-wide/from16 v0, p2

    long-to-double v9, v0

    const-wide v11, 0x3fa47ae147ae147bL

    mul-double/2addr v9, v11

    sub-double/2addr v2, v9

    const-wide v9, 0x40ef400000000000L

    div-double/2addr v2, v9

    const-wide/high16 v9, 0x4020

    mul-double/2addr v2, v9

    const-wide v9, 0x408f400000000000L

    mul-double/2addr v2, v9

    double-to-float v15, v2

    .line 521
    .local v15, dur:F
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "export: limit file duration to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ms"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 526
    .end local v15           #dur:F
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->setOptimalConfiguration(I)I

    move-result v5

    .line 527
    const/4 v7, 0x1

    .line 528
    .local v7, audioCodec:I
    const/4 v8, 0x4

    .line 530
    .local v8, videoCodec:I
    move-object/from16 v0, p0

    iget v13, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 535
    const/16 v18, 0x0

    .line 537
    .local v18, semAcquireDone:Z
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 538
    const/16 v18, 0x1

    .line 540
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v2, :cond_6

    .line 541
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "The video editor is not initialized"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 545
    :catch_0
    move-exception v17

    .line 546
    .local v17, ex:Ljava/lang/InterruptedException;
    :try_start_1
    const-string v2, "VideoEditorImpl"

    const-string v3, "Sem acquire NOT successful in export"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 548
    if-eqz v18, :cond_5

    .line 549
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 555
    .end local v17           #ex:Ljava/lang/InterruptedException;
    :cond_5
    :goto_0
    move-object/from16 v0, p0

    iput v13, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 560
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->length()J

    move-result-wide v2

    cmp-long v2, v2, p2

    if-lez v2, :cond_8

    .line 564
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    .line 565
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Generated File size > outputsize; reduce Input file duration and retry"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 543
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v6, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->modifiedBitrate:I

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    move-object/from16 v3, p1

    move-wide/from16 v9, p2

    move-object/from16 v12, p4

    invoke-virtual/range {v2 .. v12}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->export(Ljava/lang/String;Ljava/lang/String;IIIIJLjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 548
    if-eqz v18, :cond_5

    .line 549
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_0

    .line 548
    :catchall_0
    move-exception v2

    if-eqz v18, :cond_7

    .line 549
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_7
    throw v2

    .line 568
    :cond_8
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->length()J

    move-result-wide v2

    return-wide v2
.end method

.method public export(Ljava/lang/String;IIIILcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 15
    .parameter "filename"
    .parameter "height"
    .parameter "bitrate"
    .parameter "audioCodec"
    .parameter "videoCodec"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    if-nez p1, :cond_0

    .line 236
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "export: filename is null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_0
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 239
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No MediaItems added"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_1
    packed-switch p4, :pswitch_data_0

    .line 245
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported audio codec type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 246
    .local v13, message:Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 250
    .end local v13           #message:Ljava/lang/String;
    :pswitch_0
    packed-switch p5, :pswitch_data_1

    .line 254
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported video codec type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 255
    .restart local v13       #message:Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 259
    .end local v13           #message:Ljava/lang/String;
    :pswitch_1
    packed-switch p2, :pswitch_data_2

    .line 263
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument Height incorrect"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 266
    :pswitch_2
    sparse-switch p3, :sswitch_data_0

    .line 285
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument Bitrate incorrect"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 288
    :sswitch_0
    const/4 v1, 0x1

    move/from16 v0, p5

    if-ne v0, v1, :cond_2

    .line 289
    sparse-switch p2, :sswitch_data_1

    .line 302
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Argument Height incorrect for H263 output codec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 291
    :sswitch_1
    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->getAspectRatio()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    .line 292
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Aspect ratio not correct for H263 output codec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 297
    :sswitch_2
    invoke-virtual {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->getAspectRatio()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    .line 298
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Aspect ratio not correct for H263 output codec"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 306
    :cond_2
    const/4 v14, 0x0

    .line 308
    .local v14, semAcquireDone:Z
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 309
    const/4 v14, 0x1

    .line 311
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v1, :cond_4

    .line 312
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The video editor is not initialized"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    :catch_0
    move-exception v12

    .line 317
    .local v12, ex:Ljava/lang/InterruptedException;
    :try_start_1
    const-string v1, "VideoEditorImpl"

    const-string v2, "Sem acquire NOT successful in export"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 319
    if-eqz v14, :cond_3

    .line 320
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 323
    .end local v12           #ex:Ljava/lang/InterruptedException;
    :cond_3
    :goto_0
    return-void

    .line 314
    :cond_4
    :try_start_2
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget-object v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    const-wide/16 v8, 0x0

    iget-object v10, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    move-object/from16 v2, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move-object/from16 v11, p6

    invoke-virtual/range {v1 .. v11}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->export(Ljava/lang/String;Ljava/lang/String;IIIIJLjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 319
    if-eqz v14, :cond_3

    .line 320
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_0

    .line 319
    :catchall_0
    move-exception v1

    if-eqz v14, :cond_5

    .line 320
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_5
    throw v1

    .line 241
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch

    .line 250
    :pswitch_data_1
    .packed-switch 0x4
        :pswitch_1
    .end packed-switch

    .line 259
    :pswitch_data_2
    .packed-switch 0x1e0
        :pswitch_2
    .end packed-switch

    .line 266
    :sswitch_data_0
    .sparse-switch
        0x6d60 -> :sswitch_0
        0x9c40 -> :sswitch_0
        0xfa00 -> :sswitch_0
        0x17700 -> :sswitch_0
        0x1f400 -> :sswitch_0
        0x2ee00 -> :sswitch_0
        0x3e800 -> :sswitch_0
        0x5dc00 -> :sswitch_0
        0x7d000 -> :sswitch_0
        0xc3500 -> :sswitch_0
        0xf4240 -> :sswitch_0
        0x124f80 -> :sswitch_0
        0x16e360 -> :sswitch_0
        0x1e8480 -> :sswitch_0
        0x4c4b40 -> :sswitch_0
        0x7a1200 -> :sswitch_0
    .end sparse-switch

    .line 289
    :sswitch_data_1
    .sparse-switch
        0x60 -> :sswitch_1
        0x90 -> :sswitch_2
        0x120 -> :sswitch_2
    .end sparse-switch
.end method

.method public export(Ljava/lang/String;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 9
    .parameter "filename"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 360
    const/4 v1, 0x0

    .line 361
    .local v1, maxDurationMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    if-nez p1, :cond_0

    .line 362
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "export: filename is null"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 364
    :cond_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 365
    .local v5, tempPathFile:Ljava/io/File;
    if-nez v5, :cond_1

    .line 366
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "can not be created"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 368
    :cond_1
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_2

    .line 369
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #maxDurationMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    check-cast v1, Lcom/lifevibes/videoeditor/MediaItem;

    .line 372
    .restart local v1       #maxDurationMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    :cond_2
    const-wide/16 v2, 0x0

    .line 374
    .local v2, maximumDuration:J
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_3

    instance-of v6, v1, Lcom/lifevibes/videoeditor/MediaVideoItem;

    if-eqz v6, :cond_3

    .line 375
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #maxDurationMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    check-cast v1, Lcom/lifevibes/videoeditor/MediaItem;

    .line 376
    .restart local v1       #maxDurationMediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual {v1}, Lcom/lifevibes/videoeditor/MediaItem;->getWidth()I

    move-result v7

    invoke-virtual {v1}, Lcom/lifevibes/videoeditor/MediaItem;->getHeight()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->getAspectRatio(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->setAspectRatio(I)V

    .line 378
    :cond_3
    const/4 v4, 0x0

    .line 380
    .local v4, semAcquireDone:Z
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 381
    const/4 v4, 0x1

    .line 383
    iget-object v6, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v6, :cond_5

    .line 384
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "The video editor is not initialized"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 386
    :catch_0
    move-exception v0

    .line 387
    .local v0, ex:Ljava/lang/InterruptedException;
    :try_start_1
    const-string v6, "VideoEditorImpl"

    const-string v7, "Sem acquire NOT successful in export"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 389
    if-eqz v4, :cond_4

    .line 390
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 393
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :cond_4
    :goto_0
    return-void

    .line 389
    :cond_5
    if-eqz v4, :cond_4

    .line 390
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_0

    .line 389
    :catchall_0
    move-exception v6

    if-eqz v4, :cond_6

    .line 390
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_6
    throw v6
.end method

.method public exportAs2D(Ljava/lang/String;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    .locals 6
    .parameter "filename"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 328
    if-nez p1, :cond_0

    .line 329
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "export: filename is null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 331
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 332
    .local v2, tempPathFile:Ljava/io/File;
    if-nez v2, :cond_1

    .line 333
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "can not be created"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 336
    :cond_1
    const/4 v1, 0x0

    .line 338
    .local v1, semAcquireDone:Z
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 339
    const/4 v1, 0x1

    .line 341
    iget-object v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v3, :cond_3

    .line 342
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "The video editor is not initialized"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 345
    :catch_0
    move-exception v0

    .line 346
    .local v0, ex:Ljava/lang/InterruptedException;
    :try_start_1
    const-string v3, "VideoEditorImpl"

    const-string v4, "Sem acquire NOT successful in export"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 348
    if-eqz v1, :cond_2

    .line 349
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 354
    .end local v0           #ex:Ljava/lang/InterruptedException;
    :cond_2
    :goto_0
    return-void

    .line 344
    :cond_3
    :try_start_2
    iget-object v3, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    iget-object v4, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    iget-object v5, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-virtual {v3, p1, v4, v5, p2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->exportAs2D(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 348
    if-eqz v1, :cond_2

    .line 349
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_0

    .line 348
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_4

    .line 349
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_4
    throw v3
.end method

.method public fit2Share(Ljava/lang/String;Ljava/lang/String;JLcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)J
    .locals 37
    .parameter "fileIn"
    .parameter "fileOut"
    .parameter "maxFileSize"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 795
    const/4 v6, 0x0

    .line 796
    .local v6, height:I
    const/16 v17, 0x0

    .line 797
    .local v17, bitrate:I
    const/16 v20, 0x0

    .line 799
    .local v20, duration:I
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 800
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "fit2Share: filename is null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 803
    :cond_1
    new-instance v31, Ljava/io/File;

    move-object/from16 v0, v31

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 804
    .local v31, tempPathFile:Ljava/io/File;
    if-nez v31, :cond_2

    .line 805
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "can not be created"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 808
    :cond_2
    new-instance v25, Ljava/io/File;

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 809
    .local v25, inputFile:Ljava/io/File;
    if-nez v25, :cond_3

    .line 810
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "can not be created"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 812
    :cond_3
    const-wide/16 v3, 0x0

    cmp-long v3, p3, v3

    if-gtz v3, :cond_4

    .line 813
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "fit2Share: File Size is Zero"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 816
    :cond_4
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 817
    .local v12, mediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const/16 v27, 0x0

    .line 823
    .local v27, mediaVidItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    :try_start_0
    new-instance v27, Lcom/lifevibes/videoeditor/MediaVideoItem;

    .end local v27           #mediaVidItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    const-string v3, "mediaVidItem"

    const/4 v4, 0x0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v3, v2, v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 830
    .restart local v27       #mediaVidItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    move-object/from16 v0, v27

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 833
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_9

    .line 834
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->length()J

    move-result-wide v3

    cmp-long v3, v3, p3

    if-gtz v3, :cond_9

    .line 836
    const-string v3, "FIT2SHARE"

    const-string v4, "Copying inputfile to output"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    new-instance v15, Ljava/io/FileOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v15, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 841
    .local v15, OutputStream:Ljava/io/FileOutputStream;
    new-instance v14, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 843
    .local v14, InputStream:Ljava/io/FileInputStream;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->setFit2ShareFile(Ljava/lang/String;)V

    .line 844
    const/4 v3, 0x1

    new-array v0, v3, [B

    move-object/from16 v18, v0

    .line 846
    .local v18, buffer:[B
    const-wide/16 v28, 0x0

    .line 847
    .local v28, prevProgress:J
    const-wide/16 v32, 0x0

    .line 848
    .local v32, totalBytesRead:J
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->length()J

    move-result-wide v23

    .line 849
    .local v23, fileLength:J
    move-object/from16 v34, p0

    .line 850
    .local v34, x:Lcom/lifevibes/videoeditor/VideoEditor;
    :cond_5
    :goto_0
    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v26

    .local v26, length:I
    if-lez v26, :cond_7

    .line 851
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 853
    if-eqz p5, :cond_5

    .line 854
    move/from16 v0, v26

    int-to-long v3, v0

    add-long v32, v32, v3

    .line 855
    const-wide/16 v3, 0x64

    mul-long v3, v3, v32

    div-long v3, v3, v23

    cmp-long v3, v3, v28

    if-eqz v3, :cond_6

    .line 856
    const-wide/16 v3, 0x0

    cmp-long v3, v28, v3

    if-eqz v3, :cond_6

    .line 857
    move-wide/from16 v0, v28

    long-to-int v3, v0

    move-object/from16 v0, p5

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;->onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V

    .line 860
    :cond_6
    const-wide/16 v3, 0x64

    mul-long v3, v3, v32

    div-long v28, v3, v23

    goto :goto_0

    .line 825
    .end local v14           #InputStream:Ljava/io/FileInputStream;
    .end local v15           #OutputStream:Ljava/io/FileOutputStream;
    .end local v18           #buffer:[B
    .end local v23           #fileLength:J
    .end local v26           #length:I
    .end local v27           #mediaVidItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .end local v28           #prevProgress:J
    .end local v32           #totalBytesRead:J
    .end local v34           #x:Lcom/lifevibes/videoeditor/VideoEditor;
    :catch_0
    move-exception v21

    .line 826
    .local v21, e:Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can not create an Media Video Item of fileIn  Issue = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 864
    .end local v21           #e:Ljava/lang/IllegalArgumentException;
    .restart local v14       #InputStream:Ljava/io/FileInputStream;
    .restart local v15       #OutputStream:Ljava/io/FileOutputStream;
    .restart local v18       #buffer:[B
    .restart local v23       #fileLength:J
    .restart local v26       #length:I
    .restart local v27       #mediaVidItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .restart local v28       #prevProgress:J
    .restart local v32       #totalBytesRead:J
    .restart local v34       #x:Lcom/lifevibes/videoeditor/VideoEditor;
    :cond_7
    if-eqz p5, :cond_8

    .line 866
    move-wide/from16 v0, v28

    long-to-int v3, v0

    move-object/from16 v0, p5

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;->onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V

    .line 869
    :cond_8
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->flush()V

    .line 870
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V

    .line 871
    invoke-virtual {v14}, Ljava/io/FileInputStream;->close()V

    .line 872
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 947
    .end local v14           #InputStream:Ljava/io/FileInputStream;
    .end local v15           #OutputStream:Ljava/io/FileOutputStream;
    .end local v18           #buffer:[B
    .end local v23           #fileLength:J
    .end local v26           #length:I
    .end local v28           #prevProgress:J
    .end local v32           #totalBytesRead:J
    .end local v34           #x:Lcom/lifevibes/videoeditor/VideoEditor;
    :goto_1
    return-wide v3

    .line 878
    :cond_9
    invoke-virtual/range {v27 .. v27}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getTimelineDuration()J

    move-result-wide v3

    const-wide/16 v10, 0x3e8

    div-long/2addr v3, v10

    long-to-int v0, v3

    move/from16 v20, v0

    .line 883
    move-wide/from16 v0, p3

    long-to-double v3, v0

    move-wide/from16 v0, p3

    long-to-double v10, v0

    const-wide v35, 0x3fa47ae147ae147bL

    mul-double v10, v10, v35

    sub-double/2addr v3, v10

    move/from16 v0, v20

    int-to-double v10, v0

    div-double/2addr v3, v10

    const-wide/high16 v10, 0x4020

    mul-double/2addr v3, v10

    double-to-int v0, v3

    move/from16 v17, v0

    .line 888
    move/from16 v0, v17

    add-int/lit16 v0, v0, -0x2fa8

    move/from16 v17, v0

    .line 890
    const v3, 0xfa00

    move/from16 v0, v17

    if-gt v0, v3, :cond_a

    .line 892
    move-wide/from16 v0, p3

    long-to-double v3, v0

    move-wide/from16 v0, p3

    long-to-double v10, v0

    const-wide v35, 0x3fa47ae147ae147bL

    mul-double v10, v10, v35

    sub-double/2addr v3, v10

    const-wide v10, 0x40ef400000000000L

    div-double/2addr v3, v10

    const-wide/high16 v10, 0x4020

    mul-double/2addr v3, v10

    const-wide v10, 0x408f400000000000L

    mul-double/2addr v3, v10

    double-to-float v0, v3

    move/from16 v19, v0

    .line 895
    .local v19, dur:F
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fit2share: limit file duration to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 899
    .end local v19           #dur:F
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    move/from16 v16, v0

    .line 901
    .local v16, aspectRatioSet:I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->setOptimalConfiguration(I)I

    move-result v6

    .line 903
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    move/from16 v0, v16

    if-ne v0, v3, :cond_b

    .line 904
    const/4 v3, 0x1

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->setRenderingMode(I)V

    .line 907
    :cond_b
    const/4 v8, 0x1

    .line 908
    .local v8, audioCodec:I
    const/4 v9, 0x4

    .line 909
    .local v9, videoCodec:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    move/from16 v16, v0

    .line 913
    const/16 v30, 0x0

    .line 915
    .local v30, semAcquireDone:Z
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 916
    const/16 v30, 0x1

    .line 917
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v3, :cond_d

    .line 918
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "The video editor is not initialized"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 922
    :catch_1
    move-exception v22

    .line 923
    .local v22, ex:Ljava/lang/InterruptedException;
    :try_start_2
    const-string v3, "VideoEditorImpl"

    const-string v4, "Sem acquire NOT successful in export"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 925
    if-eqz v30, :cond_c

    .line 926
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 933
    .end local v22           #ex:Ljava/lang/InterruptedException;
    :cond_c
    :goto_2
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 938
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->length()J

    move-result-wide v3

    cmp-long v3, v3, p3

    if-lez v3, :cond_f

    .line 942
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->delete()Z

    .line 943
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Generated File size > outputsize; reduce Input file duration and retry"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 920
    :cond_d
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v7, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->modifiedBitrate:I

    move-object/from16 v4, p2

    move-wide/from16 v10, p3

    move-object/from16 v13, p5

    invoke-virtual/range {v3 .. v13}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->export(Ljava/lang/String;Ljava/lang/String;IIIIJLjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 925
    if-eqz v30, :cond_c

    .line 926
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_2

    .line 925
    :catchall_0
    move-exception v3

    if-eqz v30, :cond_e

    .line 926
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_e
    throw v3

    .line 947
    :cond_f
    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->length()J

    move-result-wide v3

    goto/16 :goto_1
.end method

.method public fit2ShareMMS(Ljava/lang/String;Ljava/lang/String;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)J
    .locals 34
    .parameter "fileIn"
    .parameter "fileOut"
    .parameter "listener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 578
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 579
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "fit2ShareMMS: filename is null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 582
    :cond_1
    new-instance v29, Ljava/io/File;

    move-object/from16 v0, v29

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 583
    .local v29, tempPathFile:Ljava/io/File;
    if-nez v29, :cond_2

    .line 584
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "can not be created"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 587
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-nez v3, :cond_3

    .line 588
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "The video editor is not initialized"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 594
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    move/from16 v17, v0

    .line 595
    .local v17, aspectRatioSet:I
    move-object/from16 v0, p0

    iget v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    const/4 v4, 0x5

    if-eq v3, v4, :cond_4

    .line 596
    const/4 v3, 0x5

    move-object/from16 v0, p0

    iput v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 599
    :cond_4
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 600
    .local v12, mmsMediaItemsList:Ljava/util/List;,"Ljava/util/List<Lcom/lifevibes/videoeditor/MediaItem;>;"
    const/16 v25, 0x0

    .line 606
    .local v25, mmsMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    :try_start_0
    new-instance v25, Lcom/lifevibes/videoeditor/MediaVideoItem;

    .end local v25           #mmsMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    const-string v3, "mmsMediaItem"

    const/4 v4, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v3, v2, v4}, Lcom/lifevibes/videoeditor/MediaVideoItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 613
    .restart local v25       #mmsMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    move-object/from16 v0, v25

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 620
    .local v14, InFileHandle:Ljava/io/File;
    if-eqz v14, :cond_9

    .line 624
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/32 v10, 0x4b000

    cmp-long v3, v3, v10

    if-gtz v3, :cond_9

    .line 628
    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoType()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getFps()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->GetClosestVideoFrameRate(I)I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_9

    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getVideoProfile()I

    move-result v3

    const/4 v4, 0x4

    if-gt v3, v4, :cond_9

    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAudioType()I

    move-result v3

    const/4 v4, 0x1

    if-gt v3, v4, :cond_9

    .line 636
    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 637
    .local v16, OutputStream:Ljava/io/FileOutputStream;
    new-instance v15, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 639
    .local v15, InputStream:Ljava/io/FileInputStream;
    const/4 v3, 0x1

    new-array v0, v3, [B

    move-object/from16 v18, v0

    .line 641
    .local v18, buffer:[B
    const-wide/16 v26, 0x0

    .line 642
    .local v26, prevProgress:J
    const-wide/16 v30, 0x0

    .line 643
    .local v30, totalBytesRead:J
    invoke-virtual {v14}, Ljava/io/File;->length()J

    move-result-wide v22

    .line 644
    .local v22, fileLength:J
    :cond_5
    :goto_0
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v24

    .local v24, length:I
    if-lez v24, :cond_7

    .line 645
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 647
    if-eqz p3, :cond_5

    .line 648
    move/from16 v0, v24

    int-to-long v3, v0

    add-long v30, v30, v3

    .line 649
    const-wide/16 v3, 0x64

    mul-long v3, v3, v30

    div-long v3, v3, v22

    cmp-long v3, v3, v26

    if-eqz v3, :cond_6

    .line 650
    const-wide/16 v3, 0x0

    cmp-long v3, v26, v3

    if-eqz v3, :cond_6

    .line 651
    move-wide/from16 v0, v26

    long-to-int v3, v0

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;->onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V

    .line 654
    :cond_6
    const-wide/16 v3, 0x64

    mul-long v3, v3, v30

    div-long v26, v3, v22

    goto :goto_0

    .line 608
    .end local v14           #InFileHandle:Ljava/io/File;
    .end local v15           #InputStream:Ljava/io/FileInputStream;
    .end local v16           #OutputStream:Ljava/io/FileOutputStream;
    .end local v18           #buffer:[B
    .end local v22           #fileLength:J
    .end local v24           #length:I
    .end local v25           #mmsMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .end local v26           #prevProgress:J
    .end local v30           #totalBytesRead:J
    :catch_0
    move-exception v20

    .line 609
    .local v20, e:Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Can not create an Media Video Item of fileIn file for MMS  Issue = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v20 .. v20}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 657
    .end local v20           #e:Ljava/lang/IllegalArgumentException;
    .restart local v14       #InFileHandle:Ljava/io/File;
    .restart local v15       #InputStream:Ljava/io/FileInputStream;
    .restart local v16       #OutputStream:Ljava/io/FileOutputStream;
    .restart local v18       #buffer:[B
    .restart local v22       #fileLength:J
    .restart local v24       #length:I
    .restart local v25       #mmsMediaItem:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .restart local v26       #prevProgress:J
    .restart local v30       #totalBytesRead:J
    :cond_7
    if-eqz p3, :cond_8

    .line 659
    move-wide/from16 v0, v26

    long-to-int v3, v0

    move-object/from16 v0, p3

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    invoke-interface {v0, v1, v2, v3}, Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;->onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V

    .line 663
    :cond_8
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->flush()V

    .line 664
    invoke-virtual/range {v16 .. v16}, Ljava/io/FileOutputStream;->close()V

    .line 665
    invoke-virtual {v15}, Ljava/io/FileInputStream;->close()V

    .line 667
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 785
    .end local v15           #InputStream:Ljava/io/FileInputStream;
    .end local v16           #OutputStream:Ljava/io/FileOutputStream;
    .end local v18           #buffer:[B
    .end local v22           #fileLength:J
    .end local v24           #length:I
    .end local v26           #prevProgress:J
    .end local v30           #totalBytesRead:J
    :goto_1
    return-wide v3

    .line 675
    :cond_9
    const/16 v6, 0x90

    .line 676
    .local v6, height:I
    const/4 v8, 0x1

    .line 677
    .local v8, audioCodec:I
    const/4 v9, 0x1

    .line 679
    .local v9, videoCodec:I
    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getAspectRatio()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_a

    .line 680
    const/4 v3, 0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;->setRenderingMode(I)V

    .line 686
    :cond_a
    const-wide/32 v3, 0x47400

    invoke-virtual/range {v25 .. v25}, Lcom/lifevibes/videoeditor/MediaVideoItem;->getDuration()J

    move-result-wide v10

    const-wide/16 v32, 0x3e8

    div-long v10, v10, v32

    div-long/2addr v3, v10

    const-wide/16 v10, 0x8

    mul-long/2addr v3, v10

    long-to-int v7, v3

    .line 694
    .local v7, bitrate:I
    add-int/lit16 v7, v7, -0x2fa8

    .line 699
    const v3, 0x7a1200

    if-ge v7, v3, :cond_c

    const v3, 0x4c4b40

    if-lt v7, v3, :cond_c

    .line 701
    const v7, 0x4c4b40

    .line 750
    :goto_2
    const/16 v28, 0x0

    .line 752
    .local v28, semAcquireDone:Z
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 753
    const/16 v28, 0x1

    .line 754
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    const-wide/32 v10, 0x4b000

    move-object/from16 v4, p2

    move-object/from16 v13, p3

    invoke-virtual/range {v3 .. v13}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->export(Ljava/lang/String;Ljava/lang/String;IIIIJLjava/util/List;Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 760
    if-eqz v28, :cond_b

    .line 761
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 767
    :cond_b
    :goto_3
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    .line 773
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/32 v10, 0x4b000

    cmp-long v3, v3, v10

    if-lez v3, :cond_1a

    .line 777
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->delete()Z

    .line 778
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Generated File size > MAX_MMS_CLIP_SIZE; reduce Input file duration and retry"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 702
    .end local v28           #semAcquireDone:Z
    :cond_c
    const v3, 0x4c4b40

    if-ge v7, v3, :cond_d

    const v3, 0x1e8480

    if-lt v7, v3, :cond_d

    .line 704
    const v7, 0x1e8480

    goto :goto_2

    .line 705
    :cond_d
    const v3, 0x1e8480

    if-ge v7, v3, :cond_e

    const v3, 0x16e360

    if-lt v7, v3, :cond_e

    .line 707
    const v7, 0x16e360

    goto :goto_2

    .line 708
    :cond_e
    const v3, 0x16e360

    if-ge v7, v3, :cond_f

    const v3, 0x124f80

    if-lt v7, v3, :cond_f

    .line 710
    const v7, 0x124f80

    goto :goto_2

    .line 711
    :cond_f
    const v3, 0x124f80

    if-ge v7, v3, :cond_10

    const v3, 0xf4240

    if-lt v7, v3, :cond_10

    .line 713
    const v7, 0xf4240

    goto :goto_2

    .line 714
    :cond_10
    const v3, 0xf4240

    if-ge v7, v3, :cond_11

    const v3, 0xc3500

    if-lt v7, v3, :cond_11

    .line 716
    const v7, 0xc3500

    goto :goto_2

    .line 717
    :cond_11
    const v3, 0xc3500

    if-ge v7, v3, :cond_12

    const v3, 0x7d000

    if-lt v7, v3, :cond_12

    .line 719
    const v7, 0x7d000

    goto/16 :goto_2

    .line 720
    :cond_12
    const v3, 0x7d000

    if-ge v7, v3, :cond_13

    const v3, 0x5dc00

    if-lt v7, v3, :cond_13

    .line 722
    const v7, 0x5dc00

    goto/16 :goto_2

    .line 723
    :cond_13
    const v3, 0x5dc00

    if-ge v7, v3, :cond_14

    const v3, 0x3e800

    if-lt v7, v3, :cond_14

    .line 725
    const v7, 0x3e800

    goto/16 :goto_2

    .line 726
    :cond_14
    const v3, 0x3e800

    if-ge v7, v3, :cond_15

    const v3, 0x2ee00

    if-lt v7, v3, :cond_15

    .line 728
    const v7, 0x2ee00

    goto/16 :goto_2

    .line 729
    :cond_15
    const v3, 0x2ee00

    if-ge v7, v3, :cond_16

    const v3, 0x1f400

    if-lt v7, v3, :cond_16

    .line 731
    const v7, 0x1f400

    goto/16 :goto_2

    .line 732
    :cond_16
    const v3, 0x1f400

    if-ge v7, v3, :cond_17

    const v3, 0x17700

    if-lt v7, v3, :cond_17

    .line 734
    const v7, 0x17700

    goto/16 :goto_2

    .line 735
    :cond_17
    const v3, 0x17700

    if-ge v7, v3, :cond_18

    const v3, 0xfa00

    if-lt v7, v3, :cond_18

    .line 737
    const v7, 0xfa00

    goto/16 :goto_2

    .line 740
    :cond_18
    const/16 v19, 0x7d00

    .line 743
    .local v19, dur:I
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fit2ShareMMS: limit file duration to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ms"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 757
    .end local v19           #dur:I
    .restart local v28       #semAcquireDone:Z
    :catch_1
    move-exception v21

    .line 758
    .local v21, ex:Ljava/lang/InterruptedException;
    :try_start_2
    const-string v3, "VideoEditorImpl"

    const-string v4, "Sem acquire NOT successful in export"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 760
    if-eqz v28, :cond_b

    .line 761
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto/16 :goto_3

    .line 760
    .end local v21           #ex:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v3

    if-eqz v28, :cond_19

    .line 761
    invoke-direct/range {p0 .. p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_19
    throw v3

    .line 785
    :cond_1a
    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->length()J

    move-result-wide v3

    goto/16 :goto_1
.end method

.method public getAspectRatio()I
    .locals 1

    .prologue
    .line 964
    iget v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I

    return v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 975
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->computeTimelineDuration()V

    .line 976
    iget-wide v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mDurationMs:J

    return-wide v0
.end method

.method getNativeContext()Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 990
    iget-object v0, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mProjectPath:Ljava/lang/String;

    return-object v0
.end method

.method public release()V
    .locals 4

    .prologue
    .line 998
    const/4 v1, 0x0

    .line 1000
    .local v1, semAcquireDone:Z
    :try_start_0
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->lock()V

    .line 1001
    const/4 v1, 0x1

    .line 1003
    iget-object v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    if-eqz v2, :cond_0

    .line 1004
    iget-object v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 1005
    iget-object v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;

    invoke-virtual {v2}, Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;->releaseNativeHelper()V

    .line 1006
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMANativeHelper:Lcom/lifevibes/videoeditor/MediaArtistNativeHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1011
    :cond_0
    if-eqz v1, :cond_1

    .line 1012
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    .line 1015
    :cond_1
    :goto_0
    return-void

    .line 1008
    :catch_0
    move-exception v0

    .line 1009
    .local v0, ex:Ljava/lang/Exception;
    :try_start_1
    const-string v2, "VideoEditorImpl"

    const-string v3, "Sem acquire NOT successful in export"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1011
    if-eqz v1, :cond_1

    .line 1012
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    goto :goto_0

    .line 1011
    .end local v0           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    .line 1012
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->unlock()V

    :cond_2
    throw v2
.end method

.method public declared-synchronized removeMediaItem(Ljava/lang/String;)Lcom/lifevibes/videoeditor/MediaItem;
    .locals 3
    .parameter "mediaItemId"

    .prologue
    .line 171
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 172
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lifevibes/videoeditor/MediaItem;

    .line 173
    .local v0, mediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    if-eqz v0, :cond_0

    .line 174
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 176
    :cond_0
    iget-object v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mMediaItems:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 177
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mIsList3D:Z

    .line 178
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mIsFirstVideoItemAdded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    .end local v0           #mediaItem:Lcom/lifevibes/videoeditor/MediaItem;
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 171
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setAspectRatio(I)V
    .locals 1
    .parameter "aspectRatio"

    .prologue
    .line 1021
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/lifevibes/videoeditor/VideoEditorImpl;->mAspectRatio:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1022
    monitor-exit p0

    return-void

    .line 1021
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method updateTimelineDuration()V
    .locals 0

    .prologue
    .line 983
    invoke-direct {p0}, Lcom/lifevibes/videoeditor/VideoEditorImpl;->computeTimelineDuration()V

    .line 984
    return-void
.end method
