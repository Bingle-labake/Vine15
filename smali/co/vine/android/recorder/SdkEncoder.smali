.class public Lco/vine/android/recorder/SdkEncoder;
.super Ljava/lang/Object;
.source "SdkEncoder.java"

# interfaces
.implements Lco/vine/android/recorder/EncoderManager$Encoder;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 12

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v9, "*****************************"

    invoke-static {v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 31
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v1

    .line 32
    .local v1, codecCount:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v1, :cond_1

    .line 33
    invoke-static {v4}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v2

    .line 34
    .local v2, codecInfo:Landroid/media/MediaCodecInfo;
    const-string v9, "Codec: {}."

    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v8

    .line 36
    .local v8, supportedTypes:[Ljava/lang/String;
    move-object v0, v8

    .local v0, arr$:[Ljava/lang/String;
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1
    if-ge v5, v6, :cond_0

    aget-object v7, v0, v5

    .line 37
    .local v7, supportedType:Ljava/lang/String;
    invoke-virtual {v2, v7}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v3

    .line 38
    .local v3, cp:Landroid/media/MediaCodecInfo$CodecCapabilities;
    const-string v9, "Codec support {} with {} and {}."

    iget-object v10, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    iget-object v11, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    invoke-static {v9, v7, v10, v11}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 32
    .end local v3           #cp:Landroid/media/MediaCodecInfo$CodecCapabilities;
    .end local v7           #supportedType:Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 42
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #codecInfo:Landroid/media/MediaCodecInfo;
    .end local v5           #i$:I
    .end local v6           #len$:I
    .end local v8           #supportedTypes:[Ljava/lang/String;
    :cond_1
    const-string v9, "*****************************"

    invoke-static {v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 44
    return-void
.end method


# virtual methods
.method public transcode(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 35
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
    .line 50
    .local p4, frameInfo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :try_start_0
    new-instance v33, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v33

    invoke-direct {v0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 51
    .local v33, outputStream:Ljava/io/BufferedOutputStream;
    const-string v4, "video/avc"

    invoke-static {v4}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v20

    .line 53
    .local v20, encodingCodec:Landroid/media/MediaCodec;
    new-instance v21, Landroid/media/MediaExtractor;

    invoke-direct/range {v21 .. v21}, Landroid/media/MediaExtractor;-><init>()V

    .line 54
    .local v21, extractor:Landroid/media/MediaExtractor;
    move-object/from16 v0, v21

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 56
    const/4 v2, 0x0

    .line 57
    .local v2, decodingCodec:Landroid/media/MediaCodec;
    const/16 v32, 0x0

    .line 58
    .local v32, outputFormat:Landroid/media/MediaFormat;
    const/16 v22, 0x0

    .local v22, i:I
    :goto_0
    invoke-virtual/range {v21 .. v21}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v4

    move/from16 v0, v22

    if-ge v0, v4, :cond_0

    .line 59
    invoke-virtual/range {v21 .. v22}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v25

    .line 60
    .local v25, inputFormat:Landroid/media/MediaFormat;
    const-string v4, "mime"

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 61
    .local v27, mime:Ljava/lang/String;
    const-string v4, "video/"

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 62
    invoke-virtual/range {v21 .. v22}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 63
    const-string v4, "video/avc"

    const/16 v6, 0x1e0

    const/16 v8, 0x1e0

    invoke-static {v4, v6, v8}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v32

    .line 64
    const-string v4, "bitrate"

    const v6, 0xf4240

    move-object/from16 v0, v32

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 65
    const-string v4, "frame-rate"

    const/16 v6, 0x1e

    move-object/from16 v0, v32

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 66
    const-string v4, "color-format"

    const/16 v6, 0x15

    move-object/from16 v0, v32

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 67
    const-string v4, "i-frame-interval"

    const/4 v6, 0x5

    move-object/from16 v0, v32

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 68
    invoke-static/range {v27 .. v27}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    .line 69
    const-string v4, "color-format"

    const/16 v6, 0x13

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 70
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v2, v0, v4, v6, v8}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 74
    .end local v25           #inputFormat:Landroid/media/MediaFormat;
    .end local v27           #mime:Ljava/lang/String;
    :cond_0
    if-eqz v2, :cond_1

    if-nez v32, :cond_3

    .line 75
    :cond_1
    new-instance v4, Ljava/io/IOException;

    const-string v6, "Invalid file: {}, {}."

    move-object/from16 v0, v32

    invoke-static {v6, v2, v0}, Lcom/edisonwang/android/slog/MessageFormatter;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lcom/edisonwang/android/slog/FormattingTuple;

    move-result-object v6

    invoke-virtual {v6}, Lcom/edisonwang/android/slog/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    .end local v2           #decodingCodec:Landroid/media/MediaCodec;
    .end local v20           #encodingCodec:Landroid/media/MediaCodec;
    .end local v21           #extractor:Landroid/media/MediaExtractor;
    .end local v22           #i:I
    .end local v32           #outputFormat:Landroid/media/MediaFormat;
    .end local v33           #outputStream:Ljava/io/BufferedOutputStream;
    :catch_0
    move-exception v17

    .line 174
    .local v17, e:Ljava/lang/Exception;
    new-instance v4, Lco/vine/android/recorder/EncoderManager$EncodingException;

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lco/vine/android/recorder/EncoderManager$EncodingException;-><init>(Ljava/lang/Exception;)V

    throw v4

    .line 58
    .end local v17           #e:Ljava/lang/Exception;
    .restart local v2       #decodingCodec:Landroid/media/MediaCodec;
    .restart local v20       #encodingCodec:Landroid/media/MediaCodec;
    .restart local v21       #extractor:Landroid/media/MediaExtractor;
    .restart local v22       #i:I
    .restart local v25       #inputFormat:Landroid/media/MediaFormat;
    .restart local v27       #mime:Ljava/lang/String;
    .restart local v32       #outputFormat:Landroid/media/MediaFormat;
    .restart local v33       #outputStream:Ljava/io/BufferedOutputStream;
    :cond_2
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_0

    .line 78
    .end local v25           #inputFormat:Landroid/media/MediaFormat;
    .end local v27           #mime:Ljava/lang/String;
    :cond_3
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x1

    :try_start_1
    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1, v4, v6, v8}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 79
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->start()V

    .line 80
    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 81
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v15

    .line 82
    .local v15, decoderInputBuffers:[Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v16

    .line 83
    .local v16, decoderOutputBuffers:[Ljava/nio/ByteBuffer;
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v18

    .line 84
    .local v18, encoderInputBuffers:[Ljava/nio/ByteBuffer;
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v19

    .line 86
    .local v19, encoderOutputBuffers:[Ljava/nio/ByteBuffer;
    new-instance v23, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct/range {v23 .. v23}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 87
    .local v23, info:Landroid/media/MediaCodec$BufferInfo;
    const/16 v26, 0x0

    .line 89
    .local v26, isEOS:Z
    :cond_4
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v4

    if-nez v4, :cond_6

    .line 90
    if-nez v26, :cond_5

    .line 91
    const-wide/16 v8, -0x1

    invoke-virtual {v2, v8, v9}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v3

    .line 92
    .local v3, inIndex:I
    if-ltz v3, :cond_5

    .line 93
    aget-object v13, v15, v3

    .line 94
    .local v13, buffer:Ljava/nio/ByteBuffer;
    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v13, v4}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v5

    .line 95
    .local v5, sampleSize:I
    if-gez v5, :cond_7

    .line 96
    const-string v4, "InputBuffer BUFFER_FLAG_END_OF_STREAM"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 97
    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x4

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 98
    .end local v5           #sampleSize:I
    const/16 v26, 0x1

    .line 105
    .end local v3           #inIndex:I
    .end local v13           #buffer:Ljava/nio/ByteBuffer;
    :cond_5
    :goto_1
    const-wide/16 v8, -0x1

    move-object/from16 v0, v23

    invoke-virtual {v2, v0, v8, v9}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v29

    .line 106
    .local v29, outIndex:I
    packed-switch v29, :pswitch_data_0

    .line 118
    aget-object v13, v16, v29

    .line 119
    .restart local v13       #buffer:Ljava/nio/ByteBuffer;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "We can\'t use this buffer but render it due to the API limit, "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 121
    const-wide/16 v8, -0x1

    :try_start_2
    move-object/from16 v0, v20

    invoke-virtual {v0, v8, v9}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v7

    .line 122
    .local v7, inputBufferIndex:I
    if-ltz v7, :cond_8

    .line 123
    aget-object v24, v18, v7

    .line 124
    .local v24, inputBuffer:Ljava/nio/ByteBuffer;
    invoke-virtual/range {v24 .. v24}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Input buffer: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 126
    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 127
    const/4 v8, 0x0

    invoke-virtual/range {v24 .. v24}, Ljava/nio/ByteBuffer;->limit()I

    move-result v9

    move-object/from16 v0, v23

    iget-wide v10, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    const/4 v12, 0x0

    move-object/from16 v6, v20

    invoke-virtual/range {v6 .. v12}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 132
    .end local v24           #inputBuffer:Ljava/nio/ByteBuffer;
    :goto_2
    new-instance v14, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v14}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 133
    .local v14, bufferInfo:Landroid/media/MediaCodec$BufferInfo;
    const-wide/16 v8, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v14, v8, v9}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v31

    .line 134
    .local v31, outputBufferIndex:I
    packed-switch v31, :pswitch_data_1

    .line 146
    aget-object v30, v19, v31

    .line 147
    .local v30, outputBuffer:Ljava/nio/ByteBuffer;
    iget v4, v14, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v0, v4, [B

    move-object/from16 v28, v0

    .line 148
    .local v28, outData:[B
    move-object/from16 v0, v30

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 149
    const/4 v4, 0x0

    move-object/from16 v0, v28

    array-length v6, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v4, v6}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 150
    const-string v4, "AvcEncoder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v28

    array-length v8, v0

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " bytes written"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    const/4 v4, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v31

    invoke-virtual {v0, v1, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 156
    .end local v7           #inputBufferIndex:I
    .end local v14           #bufferInfo:Landroid/media/MediaCodec$BufferInfo;
    .end local v28           #outData:[B
    .end local v30           #outputBuffer:Ljava/nio/ByteBuffer;
    .end local v31           #outputBufferIndex:I
    :goto_3
    const/4 v4, 0x1

    :try_start_3
    move/from16 v0, v29

    invoke-virtual {v2, v0, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 157
    invoke-virtual/range {v21 .. v21}, Landroid/media/MediaExtractor;->advance()Z

    .line 161
    .end local v13           #buffer:Ljava/nio/ByteBuffer;
    :goto_4
    move-object/from16 v0, v23

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_4

    .line 162
    const-string v4, "DecodeActivity"

    const-string v6, "OutputBuffer BUFFER_FLAG_END_OF_STREAM"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .end local v29           #outIndex:I
    :cond_6
    invoke-virtual {v2}, Landroid/media/MediaCodec;->stop()V

    .line 167
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V

    .line 168
    invoke-virtual/range {v21 .. v21}, Landroid/media/MediaExtractor;->release()V

    .line 169
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->stop()V

    .line 170
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->release()V

    .line 171
    invoke-virtual/range {v33 .. v33}, Ljava/io/BufferedOutputStream;->flush()V

    .line 172
    invoke-virtual/range {v33 .. v33}, Ljava/io/BufferedOutputStream;->close()V

    .line 176
    return-void

    .line 100
    .restart local v3       #inIndex:I
    .restart local v5       #sampleSize:I
    .restart local v13       #buffer:Ljava/nio/ByteBuffer;
    :cond_7
    const/4 v4, 0x0

    invoke-virtual/range {v21 .. v21}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v6

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    goto/16 :goto_1

    .line 108
    .end local v3           #inIndex:I
    .end local v5           #sampleSize:I
    .end local v13           #buffer:Ljava/nio/ByteBuffer;
    .restart local v29       #outIndex:I
    :pswitch_0
    const-string v4, "INFO_OUTPUT_BUFFERS_CHANGED"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v16

    .line 110
    goto :goto_4

    .line 112
    :pswitch_1
    const-string v4, "New format found: {}"

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 115
    :pswitch_2
    const-string v4, "dequeueOutputBuffer timed out!"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .line 129
    .restart local v7       #inputBufferIndex:I
    .restart local v13       #buffer:Ljava/nio/ByteBuffer;
    :cond_8
    :try_start_4
    const-string v4, "Input buffer timeout."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_2

    .line 153
    .end local v7           #inputBufferIndex:I
    :catch_1
    move-exception v34

    .line 154
    .local v34, t:Ljava/lang/Throwable;
    :try_start_5
    const-string v4, "Something wrong."

    move-object/from16 v0, v34

    invoke-static {v4, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3

    .line 136
    .end local v34           #t:Ljava/lang/Throwable;
    .restart local v7       #inputBufferIndex:I
    .restart local v14       #bufferInfo:Landroid/media/MediaCodec$BufferInfo;
    .restart local v31       #outputBufferIndex:I
    :pswitch_3
    :try_start_6
    const-string v4, "INFO_OUTPUT_BUFFERS_CHANGED"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 137
    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v19

    .line 138
    goto :goto_3

    .line 140
    :pswitch_4
    const-string v4, "New format found: {}"

    invoke-virtual/range {v20 .. v20}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 143
    :pswitch_5
    const-string v4, "dequeueOutputBuffer timed out!"

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_3

    .line 106
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 134
    :pswitch_data_1
    .packed-switch -0x3
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
