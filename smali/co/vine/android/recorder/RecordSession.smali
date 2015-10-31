.class public Lco/vine/android/recorder/RecordSession;
.super Ljava/lang/Object;
.source "RecordSession.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = 0x773660a9759c8145L


# instance fields
.field private mAudioData:[S

.field private mAudioDataCount:I

.field private mConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

.field private final mSegments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoData:[B

.field private mVideoDataCount:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    .line 24
    iput v1, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    .line 25
    iput v1, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    .line 29
    return-void
.end method

.method public static newSession(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)Lco/vine/android/recorder/RecordSession;
    .locals 2
    .parameter "config"

    .prologue
    .line 32
    new-instance v0, Lco/vine/android/recorder/RecordSession;

    invoke-direct {v0}, Lco/vine/android/recorder/RecordSession;-><init>()V

    .line 33
    .local v0, session:Lco/vine/android/recorder/RecordSession;
    invoke-static {p0}, Lco/vine/android/recorder/RecordConfigUtils;->getVideoBufferMax(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)I

    move-result v1

    new-array v1, v1, [B

    iput-object v1, v0, Lco/vine/android/recorder/RecordSession;->mVideoData:[B

    .line 34
    invoke-static {p0}, Lco/vine/android/recorder/RecordConfigUtils;->getMaxAudioBufferSize(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)I

    move-result v1

    new-array v1, v1, [S

    iput-object v1, v0, Lco/vine/android/recorder/RecordSession;->mAudioData:[S

    .line 35
    iput-object p0, v0, Lco/vine/android/recorder/RecordSession;->mConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    .line 36
    return-object v0
.end method


# virtual methods
.method public add(Lco/vine/android/recorder/RecordSegment;)V
    .locals 1
    .parameter "currentSegment"

    .prologue
    .line 118
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    return-void
.end method

.method public calculateAudioCount()I
    .locals 4

    .prologue
    .line 83
    const/4 v2, 0x0

    .line 84
    .local v2, total:I
    iget-object v3, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    .line 85
    .local v1, segment:Lco/vine/android/recorder/RecordSegment;
    iget-boolean v3, v1, Lco/vine/android/recorder/RecordSegment;->removed:Z

    if-nez v3, :cond_0

    .line 86
    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v3

    iget v3, v3, Lco/vine/android/recorder/AudioData;->size:I

    add-int/2addr v2, v3

    goto :goto_0

    .line 89
    .end local v1           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    return v2
.end method

.method public calculateVideoCount()I
    .locals 7

    .prologue
    .line 68
    const/4 v4, 0x0

    .line 69
    .local v4, total:I
    iget-object v6, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/recorder/RecordSegment;

    .line 70
    .local v3, segment:Lco/vine/android/recorder/RecordSegment;
    iget-boolean v6, v3, Lco/vine/android/recorder/RecordSegment;->removed:Z

    if-nez v6, :cond_0

    .line 71
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSegment;->getVideoData()Ljava/util/ArrayList;

    move-result-object v5

    .line 72
    .local v5, videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/VideoData;

    .line 73
    .local v0, data:Lco/vine/android/recorder/VideoData;
    iget v6, v0, Lco/vine/android/recorder/VideoData;->size:I

    if-lez v6, :cond_1

    .line 74
    iget v6, v0, Lco/vine/android/recorder/VideoData;->size:I

    add-int/2addr v4, v6

    goto :goto_0

    .line 79
    .end local v0           #data:Lco/vine/android/recorder/VideoData;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #segment:Lco/vine/android/recorder/RecordSegment;
    .end local v5           #videoData:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/VideoData;>;"
    :cond_2
    return v4
.end method

.method public getAudioData()[S
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioData:[S

    return-object v0
.end method

.method public getAudioDataCount()I
    .locals 2

    .prologue
    .line 47
    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 48
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    .line 50
    :cond_0
    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    return v0
.end method

.method public getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    return-object v0
.end method

.method public getSegments()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getVideoData()[B
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoData:[B

    return-object v0
.end method

.method public getVideoDataCount()I
    .locals 2

    .prologue
    .line 40
    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 41
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    .line 43
    :cond_0
    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    return v0
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
    .line 100
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    iput-object v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoData:[B

    .line 101
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    check-cast v0, [S

    iput-object v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioData:[S

    .line 102
    iget-object v1, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 103
    return-void
.end method

.method public setAudioDataCount(I)V
    .locals 3
    .parameter "audioDataCount"

    .prologue
    .line 61
    sget-boolean v0, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v0

    if-eq p1, v0, :cond_0

    .line 62
    const-string v0, "Audio Counts does not match: {} {}."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    :cond_0
    iput p1, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    .line 65
    return-void
.end method

.method public setConfig(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)V
    .locals 0
    .parameter "config"

    .prologue
    .line 126
    iput-object p1, p0, Lco/vine/android/recorder/RecordSession;->mConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    .line 127
    return-void
.end method

.method public setVideoDataCount(I)V
    .locals 3
    .parameter "videoDataCount"

    .prologue
    .line 54
    sget-boolean v0, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v0

    if-eq p1, v0, :cond_0

    .line 55
    const-string v0, "Video Counts does not match: {} {}."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 57
    :cond_0
    iput p1, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    .line 58
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 131
    const-string v1, "\nVideoData Count: {}, AudioData Count: {}, Segments: {}"

    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoDataCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioDataCount:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    invoke-static {v1, v2, v3, v0}, Lcom/edisonwang/android/slog/MessageFormatter;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/edisonwang/android/slog/FormattingTuple;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edisonwang/android/slog/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
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
    .line 93
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mVideoData:[B

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 94
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mAudioData:[S

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 95
    iget-object v0, p0, Lco/vine/android/recorder/RecordSession;->mSegments:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 96
    return-void
.end method
