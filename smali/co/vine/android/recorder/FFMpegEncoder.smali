.class public Lco/vine/android/recorder/FFMpegEncoder;
.super Ljava/lang/Object;
.source "FFMpegEncoder.java"

# interfaces
.implements Lco/vine/android/recorder/EncoderManager$Encoder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 16
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
    .line 18
    .local p4, frameInfo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v5, 0x0

    .line 19
    .local v5, grabber:Lco/vine/android/recorder/VineFrameGrabber;
    const/4 v9, 0x0

    .line 22
    .local v9, recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :try_start_0
    sget-object v12, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->LOCK:[I

    monitor-enter v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 23
    :try_start_1
    new-instance v6, Lco/vine/android/recorder/VineFrameGrabber;

    move-object/from16 v0, p2

    invoke-direct {v6, v0}, Lco/vine/android/recorder/VineFrameGrabber;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 25
    .end local v5           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .local v6, grabber:Lco/vine/android/recorder/VineFrameGrabber;
    :try_start_2
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 29
    :try_start_3
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getPixelFormat()I

    move-result v8

    .line 30
    .local v8, pix:I
    new-instance v10, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getImageWidth()I

    move-result v11

    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getImageHeight()I

    move-result v13

    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getAudioChannels()I

    move-result v14

    move-object/from16 v0, p3

    invoke-direct {v10, v0, v11, v13, v14}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;III)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 33
    .end local v9           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .local v10, recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    const/16 v11, 0x1c

    :try_start_4
    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setVideoCodec(I)V

    .line 34
    const v11, 0x15002

    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setAudioCodec(I)V

    .line 35
    const-string v11, "mp4"

    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFormat(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getFrameRate()D

    move-result-wide v13

    invoke-virtual {v10, v13, v14}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameRate(D)V

    .line 37
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getSampleFormat()I

    move-result v11

    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setSampleFormat(I)V

    .line 38
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getSampleRate()I

    move-result v11

    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setSampleRate(I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 40
    :try_start_5
    invoke-virtual {v10}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 51
    :try_start_6
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getLengthInFrames()I

    move-result v4

    .line 53
    .local v4, frameCount:I
    const-string v11, "Length in time: {}."

    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->getLengthInTime()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static {v11, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 54
    const-string v11, "Frame count: {}, pix format: {}, recorder pix format: {}."

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v10}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->getVideoCodecPixFormat()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v11, v13, v14, v15}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 55
    monitor-exit v12
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 59
    const/4 v7, 0x0

    .line 60
    .local v7, i:I
    :goto_0
    :try_start_7
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->grabFrame()Lcom/googlecode/javacv/Frame;

    move-result-object v3

    .local v3, frame:Lcom/googlecode/javacv/Frame;
    if-eqz v3, :cond_2

    .line 61
    const-string v11, "Doing frame: {}."

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 62
    iget-object v11, v3, Lcom/googlecode/javacv/Frame;->image:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    if-eqz v11, :cond_1

    .line 63
    if-eqz p4, :cond_0

    .line 64
    move-object/from16 v0, p4

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-virtual {v10, v11}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameNumber(I)V

    .line 66
    :cond_0
    add-int/lit8 v7, v7, 0x1

    .line 68
    :cond_1
    invoke-virtual {v10, v3}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->record(Lcom/googlecode/javacv/Frame;)V

    .line 69
    invoke-interface/range {p1 .. p1}, Lco/vine/android/recorder/EncoderManager$EncoderBoss;->isCancelled()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 74
    :cond_2
    const/4 v11, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lco/vine/android/recorder/EncoderManager$EncoderBoss;->updateLastProcess(I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_7 .. :try_end_7} :catch_5

    .line 78
    :try_start_8
    sget-object v12, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->LOCK:[I

    monitor-enter v12
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 79
    if-eqz v10, :cond_3

    .line 80
    :try_start_9
    invoke-virtual {v10}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->stop()V

    .line 81
    invoke-virtual {v10}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 83
    :cond_3
    if-eqz v6, :cond_4

    .line 84
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->stop()V

    .line 85
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->release()V

    .line 88
    :cond_4
    monitor-exit v12
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 93
    return-void

    .line 26
    .end local v3           #frame:Lcom/googlecode/javacv/Frame;
    .end local v4           #frameCount:I
    .end local v7           #i:I
    .end local v8           #pix:I
    .end local v10           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v9       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catch_0
    move-exception v1

    .line 27
    .local v1, e:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    :try_start_a
    new-instance v11, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v11, v1}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v11
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 55
    .end local v1           #e:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    :catchall_0
    move-exception v11

    move-object v5, v6

    .end local v6           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v5       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    :goto_1
    :try_start_b
    monitor-exit v12
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    :try_start_c
    throw v11
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_c .. :try_end_c} :catch_1
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_c .. :try_end_c} :catch_1

    .line 75
    :catch_1
    move-exception v1

    .line 76
    .local v1, e:Ljava/lang/Exception;
    :goto_2
    :try_start_d
    new-instance v11, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v11, v1}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v11
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 78
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_1
    move-exception v11

    :goto_3
    :try_start_e
    sget-object v12, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->LOCK:[I

    monitor-enter v12
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2

    .line 79
    if-eqz v9, :cond_5

    .line 80
    :try_start_f
    invoke-virtual {v9}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->stop()V

    .line 81
    invoke-virtual {v9}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->release()V

    .line 83
    :cond_5
    if-eqz v5, :cond_6

    .line 84
    invoke-virtual {v5}, Lco/vine/android/recorder/VineFrameGrabber;->stop()V

    .line 85
    invoke-virtual {v5}, Lco/vine/android/recorder/VineFrameGrabber;->release()V

    .line 88
    :cond_6
    monitor-exit v12
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    :try_start_10
    throw v11
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_2

    .line 90
    :catch_2
    move-exception v1

    .line 91
    .restart local v1       #e:Ljava/lang/Exception;
    :goto_4
    new-instance v11, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v11, v1}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 41
    .end local v1           #e:Ljava/lang/Exception;
    .end local v5           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v9           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v6       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v8       #pix:I
    .restart local v10       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catch_3
    move-exception v1

    .line 43
    .restart local v1       #e:Ljava/lang/Exception;
    :try_start_11
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->stop()V

    .line 44
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFrameGrabber;->release()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_2
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_11 .. :try_end_11} :catch_4

    .line 48
    :try_start_12
    new-instance v11, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v11, v1}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v11

    .line 55
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_2
    move-exception v11

    move-object v9, v10

    .end local v10           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v9       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    move-object v5, v6

    .end local v6           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v5       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    goto :goto_1

    .line 45
    .end local v5           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v9           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v1       #e:Ljava/lang/Exception;
    .restart local v6       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v10       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catch_4
    move-exception v2

    .line 46
    .local v2, e1:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    new-instance v11, Lco/vine/android/recorder/EncoderManager$EncodingException;

    invoke-direct {v11, v2}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v11
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 72
    .end local v1           #e:Ljava/lang/Exception;
    .end local v2           #e1:Lco/vine/android/recorder/VineFrameGrabber$Exception;
    .restart local v3       #frame:Lcom/googlecode/javacv/Frame;
    .restart local v4       #frameCount:I
    .restart local v7       #i:I
    :cond_7
    mul-int/lit8 v11, v7, 0x64

    :try_start_13
    div-int/2addr v11, v4

    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Lco/vine/android/recorder/EncoderManager$EncoderBoss;->updateProgress(I)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_13 .. :try_end_13} :catch_5
    .catch Lco/vine/android/recorder/VineFrameGrabber$Exception; {:try_start_13 .. :try_end_13} :catch_5

    goto/16 :goto_0

    .line 75
    .end local v3           #frame:Lcom/googlecode/javacv/Frame;
    :catch_5
    move-exception v1

    move-object v9, v10

    .end local v10           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v9       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    move-object v5, v6

    .end local v6           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v5       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    goto :goto_2

    .line 88
    .end local v5           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v9           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v3       #frame:Lcom/googlecode/javacv/Frame;
    .restart local v6       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v10       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catchall_3
    move-exception v11

    :try_start_14
    monitor-exit v12
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_3

    :try_start_15
    throw v11
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_6

    .line 90
    :catch_6
    move-exception v1

    move-object v9, v10

    .end local v10           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v9       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    move-object v5, v6

    .end local v6           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v5       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    goto :goto_4

    .line 88
    .end local v3           #frame:Lcom/googlecode/javacv/Frame;
    .end local v4           #frameCount:I
    .end local v7           #i:I
    .end local v8           #pix:I
    :catchall_4
    move-exception v11

    :try_start_16
    monitor-exit v12
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    :try_start_17
    throw v11
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_2

    .line 78
    .end local v5           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .end local v9           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v4       #frameCount:I
    .restart local v6       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v7       #i:I
    .restart local v8       #pix:I
    .restart local v10       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    :catchall_5
    move-exception v11

    move-object v9, v10

    .end local v10           #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .restart local v9       #recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    move-object v5, v6

    .end local v6           #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    .restart local v5       #grabber:Lco/vine/android/recorder/VineFrameGrabber;
    goto :goto_3

    .line 55
    .end local v4           #frameCount:I
    .end local v7           #i:I
    .end local v8           #pix:I
    :catchall_6
    move-exception v11

    goto :goto_1
.end method
