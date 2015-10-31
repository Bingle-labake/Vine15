.class public Lco/vine/android/recorder/RecordSegment;
.super Ljava/lang/Object;
.source "RecordSegment.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = 0x62d905fb96c6389cL


# instance fields
.field public drawable:Landroid/graphics/drawable/Drawable;

.field public index:I

.field private mAudioData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/AudioData;",
            ">;"
        }
    .end annotation
.end field

.field private mSetting:Lco/vine/android/recorder/CameraSetting;

.field private mThumbnailPath:Ljava/lang/String;

.field private mVideoData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;"
        }
    .end annotation
.end field

.field public removed:Z

.field public startTimestamp:J

.field public videoPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(J)V
    .locals 1
    .parameter "currentDuration"

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    .line 46
    iput-wide p1, p0, Lco/vine/android/recorder/RecordSegment;->startTimestamp:J

    .line 47
    return-void
.end method

.method public constructor <init>(Lco/vine/android/recorder/RecordSegment;)V
    .locals 5
    .parameter "source"

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    .line 56
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    .line 57
    iget-boolean v3, p1, Lco/vine/android/recorder/RecordSegment;->removed:Z

    iput-boolean v3, p0, Lco/vine/android/recorder/RecordSegment;->removed:Z

    .line 58
    iget v3, p1, Lco/vine/android/recorder/RecordSegment;->index:I

    iput v3, p0, Lco/vine/android/recorder/RecordSegment;->index:I

    .line 59
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    .line 60
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->videoPath:Ljava/lang/String;

    .line 61
    iget-wide v3, p1, Lco/vine/android/recorder/RecordSegment;->startTimestamp:J

    iput-wide v3, p0, Lco/vine/android/recorder/RecordSegment;->startTimestamp:J

    .line 62
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    .line 63
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/recorder/VideoData;

    .line 64
    .local v2, videoData:Lco/vine/android/recorder/VideoData;
    iget-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    new-instance v4, Lco/vine/android/recorder/VideoData;

    invoke-direct {v4, v2}, Lco/vine/android/recorder/VideoData;-><init>(Lco/vine/android/recorder/VideoData;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 66
    .end local v2           #videoData:Lco/vine/android/recorder/VideoData;
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    .line 67
    iget-object v3, p1, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/AudioData;

    .line 68
    .local v0, audioData:Lco/vine/android/recorder/AudioData;
    iget-object v3, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    new-instance v4, Lco/vine/android/recorder/AudioData;

    invoke-direct {v4, v0}, Lco/vine/android/recorder/AudioData;-><init>(Lco/vine/android/recorder/AudioData;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 70
    .end local v0           #audioData:Lco/vine/android/recorder/AudioData;
    :cond_1
    return-void
.end method

.method public static applyEditedChanges(Lco/vine/android/recorder/RecordSession;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 2
    .parameter "session"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/RecordSession;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    const/4 v1, 0x0

    .line 132
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->getSegments()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {p0, v0, v1, v1, p1}, Lco/vine/android/recorder/RecordSegment;->applyEditedChanges(Lco/vine/android/recorder/RecordSession;Ljava/util/ArrayList;[B[SLjava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private static applyEditedChanges(Lco/vine/android/recorder/RecordSession;Ljava/util/ArrayList;[B[SLjava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 35
    .parameter "session"
    .parameter
    .parameter "destinationVideo"
    .parameter "destinationAudio"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/RecordSession;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;[B[S",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 153
    .local p1, originalSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .local p4, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    if-nez p2, :cond_2

    const/4 v5, 0x1

    .line 154
    .local v5, applyOnSource:Z
    :goto_0
    const-string v31, "Apply changes, on source: {}."

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 155
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v18, modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v27, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    if-eqz p4, :cond_c

    .line 158
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v30

    .line 159
    .local v30, videoData:[B
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v7

    .line 160
    .local v7, audioData:[S
    if-eqz v5, :cond_0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    new-array v0, v0, [B

    move-object/from16 p2, v0

    .end local p2
    :cond_0
    invoke-static/range {p2 .. p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v29

    .line 161
    .local v29, videoBuffer:Ljava/nio/ByteBuffer;
    if-eqz v5, :cond_1

    array-length v0, v7

    move/from16 v31, v0

    move/from16 v0, v31

    new-array v0, v0, [S

    move-object/from16 p3, v0

    .end local p3
    :cond_1
    invoke-static/range {p3 .. p3}, Ljava/nio/ShortBuffer;->wrap([S)Ljava/nio/ShortBuffer;

    move-result-object v6

    .line 162
    .local v6, audioBuffer:Ljava/nio/ShortBuffer;
    if-eqz v5, :cond_3

    .line 163
    const/4 v11, 0x0

    .local v11, i:I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v31

    move/from16 v0, v31

    if-ge v11, v0, :cond_3

    .line 164
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lco/vine/android/recorder/RecordSegment;

    move-object/from16 v0, v31

    iput v11, v0, Lco/vine/android/recorder/RecordSegment;->index:I

    .line 163
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 153
    .end local v5           #applyOnSource:Z
    .end local v6           #audioBuffer:Ljava/nio/ShortBuffer;
    .end local v7           #audioData:[S
    .end local v11           #i:I
    .end local v18           #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .end local v27           #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .end local v29           #videoBuffer:Ljava/nio/ByteBuffer;
    .end local v30           #videoData:[B
    .restart local p2
    .restart local p3
    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 167
    .end local p2
    .end local p3
    .restart local v5       #applyOnSource:Z
    .restart local v6       #audioBuffer:Ljava/nio/ShortBuffer;
    .restart local v7       #audioData:[S
    .restart local v18       #modified:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .restart local v27       #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .restart local v29       #videoBuffer:Ljava/nio/ByteBuffer;
    .restart local v30       #videoData:[B
    :cond_3
    const/4 v8, 0x0

    .line 168
    .local v8, audioTimeStamp:I
    const-wide/16 v19, -0x1

    .line 170
    .local v19, nextTimeStamp:J
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/vine/android/recorder/RecordSegment;

    .line 171
    .local v22, originalSegment:Lco/vine/android/recorder/RecordSegment;
    move-object/from16 v0, v22

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordSegment;->removed:Z

    move/from16 v31, v0

    if-nez v31, :cond_9

    .line 172
    if-eqz v5, :cond_5

    move-object/from16 v24, v22

    .line 173
    .local v24, targetSegment:Lco/vine/android/recorder/RecordSegment;
    :goto_3
    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    const-string v31, "Adding segment: {}."

    move-object/from16 v0, v22

    iget v0, v0, Lco/vine/android/recorder/RecordSegment;->index:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 175
    invoke-virtual/range {v24 .. v24}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v9

    .line 176
    .local v9, combinedAudio:Lco/vine/android/recorder/AudioData;
    invoke-virtual/range {v24 .. v24}, Lco/vine/android/recorder/RecordSegment;->getVideoData()Ljava/util/ArrayList;

    move-result-object v23

    .line 178
    .local v23, segmentVideo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    const-wide/16 v14, -0x1

    .local v14, lastOriginalTimeStamp:J
    const-wide/16 v16, 0x0

    .line 179
    .local v16, lastTimeStamp:J
    iget v0, v9, Lco/vine/android/recorder/AudioData;->start:I

    move/from16 v31, v0

    iget v0, v9, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v32, v0

    move/from16 v0, v31

    move/from16 v1, v32

    invoke-virtual {v6, v7, v0, v1}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 180
    const-string v31, "Audio Buffers from {} with size {}."

    iget v0, v9, Lco/vine/android/recorder/AudioData;->start:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    iget v0, v9, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v33, v0

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    invoke-static/range {v31 .. v33}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    iput v8, v9, Lco/vine/android/recorder/AudioData;->start:I

    .line 182
    iget v0, v9, Lco/vine/android/recorder/AudioData;->size:I

    move/from16 v31, v0

    add-int v8, v8, v31

    .line 183
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v31

    if-eqz v31, :cond_8

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/recorder/VideoData;

    .line 184
    .local v10, data:Lco/vine/android/recorder/VideoData;
    iget v0, v10, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v31, v0

    if-ltz v31, :cond_4

    .line 187
    iget v0, v10, Lco/vine/android/recorder/VideoData;->start:I

    move/from16 v21, v0

    .line 188
    .local v21, oldStart:I
    const-wide/16 v31, -0x1

    cmp-long v31, v14, v31

    if-nez v31, :cond_7

    .line 189
    iget-wide v14, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 190
    const-wide/16 v31, -0x1

    cmp-long v31, v19, v31

    if-nez v31, :cond_6

    .line 191
    const-wide/16 v19, 0x0

    .line 192
    const-wide/16 v31, 0x0

    move-wide/from16 v0, v31

    iput-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 201
    :goto_5
    const-string v31, "Modifying timestamp from {} to {}."

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v32

    iget-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v33, v0

    invoke-static/range {v33 .. v34}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v33

    invoke-static/range {v31 .. v33}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 202
    iget-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v16, v0

    .line 203
    invoke-virtual/range {v29 .. v29}, Ljava/nio/ByteBuffer;->position()I

    move-result v31

    move/from16 v0, v31

    iput v0, v10, Lco/vine/android/recorder/VideoData;->start:I

    .line 204
    iget v0, v10, Lco/vine/android/recorder/VideoData;->size:I

    move/from16 v31, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move/from16 v2, v21

    move/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    goto :goto_4

    .line 172
    .end local v9           #combinedAudio:Lco/vine/android/recorder/AudioData;
    .end local v10           #data:Lco/vine/android/recorder/VideoData;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #lastOriginalTimeStamp:J
    .end local v16           #lastTimeStamp:J
    .end local v21           #oldStart:I
    .end local v23           #segmentVideo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .end local v24           #targetSegment:Lco/vine/android/recorder/RecordSegment;
    :cond_5
    new-instance v24, Lco/vine/android/recorder/RecordSegment;

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lco/vine/android/recorder/RecordSegment;-><init>(Lco/vine/android/recorder/RecordSegment;)V

    goto/16 :goto_3

    .line 194
    .restart local v9       #combinedAudio:Lco/vine/android/recorder/AudioData;
    .restart local v10       #data:Lco/vine/android/recorder/VideoData;
    .restart local v13       #i$:Ljava/util/Iterator;
    .restart local v14       #lastOriginalTimeStamp:J
    .restart local v16       #lastTimeStamp:J
    .restart local v21       #oldStart:I
    .restart local v23       #segmentVideo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .restart local v24       #targetSegment:Lco/vine/android/recorder/RecordSegment;
    :cond_6
    move-wide/from16 v0, v19

    iput-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    goto :goto_5

    .line 197
    :cond_7
    iget-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v25, v0

    .line 198
    .local v25, thisOriginalTimeStamp:J
    iget-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    move-wide/from16 v31, v0

    sub-long v31, v31, v14

    add-long v31, v31, v16

    move-wide/from16 v0, v31

    iput-wide v0, v10, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 199
    move-wide/from16 v14, v25

    goto :goto_5

    .line 206
    .end local v10           #data:Lco/vine/android/recorder/VideoData;
    .end local v21           #oldStart:I
    .end local v25           #thisOriginalTimeStamp:J
    :cond_8
    invoke-static {v8}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v31

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v32

    const v33, 0xf4240

    mul-int v32, v32, v33

    invoke-virtual/range {v24 .. v24}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v33

    move-object/from16 v0, v33

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    move/from16 v33, v0

    div-int v32, v32, v33

    invoke-static/range {v31 .. v32}, Ljava/lang/Math;->max(II)I

    move-result v31

    const v32, 0xf4240

    invoke-virtual/range {v24 .. v24}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v33

    move-object/from16 v0, v33

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    move/from16 v33, v0

    div-int v32, v32, v33

    sub-int v31, v31, v32

    move/from16 v0, v31

    int-to-long v0, v0

    move-wide/from16 v19, v0

    .line 208
    const-string v31, "Next timestamp: {}"

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 210
    .end local v9           #combinedAudio:Lco/vine/android/recorder/AudioData;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v14           #lastOriginalTimeStamp:J
    .end local v16           #lastTimeStamp:J
    .end local v23           #segmentVideo:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    .end local v24           #targetSegment:Lco/vine/android/recorder/RecordSegment;
    :cond_9
    move-object/from16 v0, v27

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 213
    .end local v22           #originalSegment:Lco/vine/android/recorder/RecordSegment;
    :cond_a
    invoke-virtual {v6}, Ljava/nio/ShortBuffer;->position()I

    move-result v4

    .line 214
    .local v4, aPosition:I
    invoke-virtual/range {v29 .. v29}, Ljava/nio/ByteBuffer;->position()I

    move-result v28

    .line 215
    .local v28, vPosition:I
    const-string v31, "Buffer limits: {}, {}."

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    invoke-static/range {v31 .. v33}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 216
    if-eqz v5, :cond_b

    .line 217
    const/16 v31, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 218
    invoke-virtual/range {v29 .. v30}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 219
    const/16 v31, 0x0

    move/from16 v0, v31

    invoke-virtual {v6, v0}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 220
    invoke-virtual {v6, v7}, Ljava/nio/ShortBuffer;->get([S)Ljava/nio/ShortBuffer;

    .line 221
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lco/vine/android/recorder/RecordSession;->setAudioDataCount(I)V

    .line 222
    move-object/from16 v0, p0

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordSession;->setVideoDataCount(I)V

    .line 224
    :cond_b
    move-object/from16 v0, p4

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 225
    if-eqz p1, :cond_c

    .line 226
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->clear()V

    .line 227
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 230
    .end local v4           #aPosition:I
    .end local v6           #audioBuffer:Ljava/nio/ShortBuffer;
    .end local v7           #audioData:[S
    .end local v8           #audioTimeStamp:I
    .end local v19           #nextTimeStamp:J
    .end local v28           #vPosition:I
    .end local v29           #videoBuffer:Ljava/nio/ByteBuffer;
    .end local v30           #videoData:[B
    :cond_c
    if-eqz v5, :cond_d

    .end local v27           #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    :goto_6
    return-object v27

    .restart local v27       #toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    :cond_d
    move-object/from16 v27, v18

    goto :goto_6
.end method

.method public static applyForEditedChanges(Lco/vine/android/recorder/RecordSession;[B[SLjava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1
    .parameter "session"
    .parameter "destinationVideoBuffer"
    .parameter "destinationAudioBuffer"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/recorder/RecordSession;",
            "[B[S",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    .local p3, editedSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2, p3}, Lco/vine/android/recorder/RecordSegment;->applyEditedChanges(Lco/vine/android/recorder/RecordSession;Ljava/util/ArrayList;[B[SLjava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addAudioData(Lco/vine/android/recorder/AudioData;)V
    .locals 1
    .parameter "data"

    .prologue
    .line 118
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    return-void
.end method

.method public getCameraSetting()Lco/vine/android/recorder/CameraSetting;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    return-object v0
.end method

.method public getCombinedAudioData()Lco/vine/android/recorder/AudioData;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 97
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_0

    .line 98
    new-instance v4, Lco/vine/android/recorder/AudioData;

    invoke-direct {v4, v6, v6}, Lco/vine/android/recorder/AudioData;-><init>(II)V

    .line 109
    :goto_0
    return-object v4

    .line 100
    :cond_0
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_2

    .line 101
    const/4 v3, 0x0

    .line 102
    .local v3, t:I
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/AudioData;

    .line 103
    .local v1, data:Lco/vine/android/recorder/AudioData;
    iget v4, v1, Lco/vine/android/recorder/AudioData;->size:I

    add-int/2addr v3, v4

    .line 104
    goto :goto_1

    .line 105
    .end local v1           #data:Lco/vine/android/recorder/AudioData;
    :cond_1
    new-instance v0, Lco/vine/android/recorder/AudioData;

    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/recorder/AudioData;

    iget v4, v4, Lco/vine/android/recorder/AudioData;->start:I

    invoke-direct {v0, v4, v3}, Lco/vine/android/recorder/AudioData;-><init>(II)V

    .line 106
    .local v0, audioCombined:Lco/vine/android/recorder/AudioData;
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 107
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .end local v0           #audioCombined:Lco/vine/android/recorder/AudioData;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #t:I
    :cond_2
    iget-object v4, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/recorder/AudioData;

    goto :goto_0
.end method

.method public getDrawableCopy(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .locals 4
    .parameter "context"

    .prologue
    .line 235
    iget-object v1, p0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 236
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v1, p0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 244
    .local v0, bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    :goto_0
    return-object v0

    .line 239
    .end local v0           #bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSegment;->getThumbnailPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 241
    .restart local v0       #bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lco/vine/android/recorder/RecordSegment;->drawable:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    return-object v0
.end method

.method public getVideoData()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/VideoData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    return-object v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 2
    .parameter "stream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/CameraSetting;

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    .line 90
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    .line 91
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    .line 93
    iget-object v1, p0, Lco/vine/android/recorder/RecordSegment;->mAudioData:Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/AudioData;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    return-void
.end method

.method public setCameraSetting(Lco/vine/android/recorder/CameraSetting;)Lco/vine/android/recorder/RecordSegment;
    .locals 0
    .parameter "cameraSetting"

    .prologue
    .line 126
    iput-object p1, p0, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    .line 127
    return-object p0
.end method

.method public setThumbnailPath(Ljava/lang/String;)V
    .locals 0
    .parameter "path"

    .prologue
    .line 77
    iput-object p1, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mSetting:Lco/vine/android/recorder/CameraSetting;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mThumbnailPath:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 83
    iget-object v0, p0, Lco/vine/android/recorder/RecordSegment;->mVideoData:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 84
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 85
    return-void
.end method
