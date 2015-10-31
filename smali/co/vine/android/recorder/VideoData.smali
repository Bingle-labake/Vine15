.class public Lco/vine/android/recorder/VideoData;
.super Ljava/lang/Object;
.source "VideoData.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = 0x773635a4cd84a345L


# instance fields
.field data:[B

.field segment:Lco/vine/android/recorder/RecordSegment;

.field size:I

.field public start:I

.field timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(J[B)V
    .locals 1
    .parameter "timestamp"
    .parameter "data"

    .prologue
    const/4 v0, -0x1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-wide p1, p0, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 34
    iput-object p3, p0, Lco/vine/android/recorder/VideoData;->data:[B

    .line 35
    iput v0, p0, Lco/vine/android/recorder/VideoData;->start:I

    .line 36
    iput v0, p0, Lco/vine/android/recorder/VideoData;->size:I

    .line 37
    return-void
.end method

.method public constructor <init>(Lco/vine/android/recorder/VideoData;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iget-wide v0, p1, Lco/vine/android/recorder/VideoData;->timestamp:J

    iput-wide v0, p0, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 45
    iget-object v0, p1, Lco/vine/android/recorder/VideoData;->data:[B

    iput-object v0, p0, Lco/vine/android/recorder/VideoData;->data:[B

    .line 46
    iget v0, p1, Lco/vine/android/recorder/VideoData;->size:I

    iput v0, p0, Lco/vine/android/recorder/VideoData;->size:I

    .line 47
    iget v0, p1, Lco/vine/android/recorder/VideoData;->start:I

    iput v0, p0, Lco/vine/android/recorder/VideoData;->start:I

    .line 48
    return-void
.end method


# virtual methods
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
    .line 62
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/recorder/VideoData;->timestamp:J

    .line 63
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/VideoData;->start:I

    .line 64
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/VideoData;->size:I

    .line 65
    return-void
.end method

.method public setSegment(Lco/vine/android/recorder/RecordSegment;)V
    .locals 0
    .parameter "segment"

    .prologue
    .line 51
    iput-object p1, p0, Lco/vine/android/recorder/VideoData;->segment:Lco/vine/android/recorder/RecordSegment;

    .line 52
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 2
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-wide v0, p0, Lco/vine/android/recorder/VideoData;->timestamp:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 56
    iget v0, p0, Lco/vine/android/recorder/VideoData;->start:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 57
    iget v0, p0, Lco/vine/android/recorder/VideoData;->size:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 58
    return-void
.end method
