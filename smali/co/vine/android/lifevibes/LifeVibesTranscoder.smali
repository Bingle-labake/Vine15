.class public Lco/vine/android/lifevibes/LifeVibesTranscoder;
.super Ljava/lang/Object;
.source "LifeVibesTranscoder.java"

# interfaces
.implements Lco/vine/android/recorder/EncoderManager$Encoder;
.implements Lcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;


# instance fields
.field private mProgress:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    packed-switch v0, :pswitch_data_0

    .line 30
    const-string v0, "lifevibes_sw_JB"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 33
    :goto_0
    return-void

    .line 26
    :pswitch_0
    const-string v0, "lifevibes_sw_ICS"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    goto :goto_0

    .line 23
    nop

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgress(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;I)V
    .locals 0
    .parameter "videoEditor"
    .parameter "outputFIle"
    .parameter "progress"

    .prologue
    .line 78
    iput p3, p0, Lco/vine/android/lifevibes/LifeVibesTranscoder;->mProgress:I

    .line 79
    return-void
.end method

.method public transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 14
    .parameter "boss"
    .parameter "input"
    .parameter "output"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/EncoderManager$EncoderBoss;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lco/vine/android/recorder/EncoderManager$EncodingException;
        }
    .end annotation

    .prologue
    .line 39
    .local p4, frameInfo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v9, Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v9, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    .local v9, inputFile:Ljava/io/File;
    const/4 v11, 0x0

    .line 41
    .local v11, originalFile:Ljava/io/File;
    const-string v2, ".mp4"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 42
    new-instance v11, Ljava/io/File;

    .end local v11           #originalFile:Ljava/io/File;
    move-object/from16 v0, p2

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    .restart local v11       #originalFile:Ljava/io/File;
    new-instance v12, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_t.mp4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v12, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .local v12, renamed:Ljava/io/File;
    invoke-virtual {v9, v12}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 45
    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    .line 46
    move-object v9, v12

    .line 49
    .end local v12           #renamed:Ljava/io/File;
    :cond_0
    :try_start_0
    new-instance v13, Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    const-string v3, "temp"

    invoke-direct {v13, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    .local v13, tempDir:Ljava/io/File;
    invoke-static {v13}, Lorg/apache/commons/io/FileUtils;->forceMkdir(Ljava/io/File;)V

    .line 51
    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/lifevibes/videoeditor/VideoEditorFactory;->create(Ljava/lang/String;)Lcom/lifevibes/videoeditor/VideoEditor;

    move-result-object v1

    .line 52
    .local v1, videoEditor:Lcom/lifevibes/videoeditor/VideoEditor;
    new-instance v10, Lcom/lifevibes/videoeditor/MediaVideoItem;

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-direct {v10, v1, v2, v0, v3}, Lcom/lifevibes/videoeditor/MediaVideoItem;-><init>(Lcom/lifevibes/videoeditor/VideoEditor;Ljava/lang/String;Ljava/lang/String;I)V

    .line 53
    .local v10, item:Lcom/lifevibes/videoeditor/MediaVideoItem;
    invoke-interface {v1, v10}, Lcom/lifevibes/videoeditor/VideoEditor;->addMediaItem(Lcom/lifevibes/videoeditor/MediaItem;)V

    .line 54
    const/4 v2, 0x6

    invoke-interface {v1, v2}, Lcom/lifevibes/videoeditor/VideoEditor;->setAspectRatio(I)V

    .line 55
    const/16 v3, 0x1e0

    const v4, 0x16e360

    const/4 v5, 0x2

    const/4 v6, 0x4

    move-object/from16 v2, p3

    move-object v7, p0

    invoke-interface/range {v1 .. v7}, Lcom/lifevibes/videoeditor/VideoEditor;->export(Ljava/lang/String;IIIILcom/lifevibes/videoeditor/VideoEditor$ExportProgressListener;)V

    .line 59
    :goto_0
    iget v2, p0, Lco/vine/android/lifevibes/LifeVibesTranscoder;->mProgress:I

    const/16 v3, 0x64

    if-eq v2, v3, :cond_3

    .line 60
    invoke-interface {p1}, Lco/vine/android/recorder/EncoderManager$EncoderBoss;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 61
    move-object/from16 v0, p3

    invoke-interface {v1, v0}, Lcom/lifevibes/videoeditor/VideoEditor;->cancelExport(Ljava/lang/String;)V

    .line 63
    :cond_1
    iget v2, p0, Lco/vine/android/lifevibes/LifeVibesTranscoder;->mProgress:I

    invoke-interface {p1, v2}, Lco/vine/android/recorder/EncoderManager$EncoderBoss;->updateLastProcess(I)V

    .line 64
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 67
    .end local v1           #videoEditor:Lcom/lifevibes/videoeditor/VideoEditor;
    .end local v10           #item:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .end local v13           #tempDir:Ljava/io/File;
    :catch_0
    move-exception v8

    .line 68
    .local v8, e:Ljava/lang/Exception;
    :try_start_1
    new-instance v2, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v2, v8}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    .end local v8           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    if-eqz v11, :cond_2

    .line 71
    invoke-virtual {v9, v11}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_2
    throw v2

    .line 70
    .restart local v1       #videoEditor:Lcom/lifevibes/videoeditor/VideoEditor;
    .restart local v10       #item:Lcom/lifevibes/videoeditor/MediaVideoItem;
    .restart local v13       #tempDir:Ljava/io/File;
    :cond_3
    if-eqz v11, :cond_4

    .line 71
    invoke-virtual {v9, v11}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 74
    :cond_4
    return-void
.end method
