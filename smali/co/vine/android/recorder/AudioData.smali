.class public Lco/vine/android/recorder/AudioData;
.super Ljava/lang/Object;
.source "AudioData.java"

# interfaces
.implements Ljava/io/Externalizable;


# instance fields
.field size:I

.field start:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .parameter "start"
    .parameter "size"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lco/vine/android/recorder/AudioData;->start:I

    .line 24
    iput p2, p0, Lco/vine/android/recorder/AudioData;->size:I

    .line 25
    return-void
.end method

.method public constructor <init>(Lco/vine/android/recorder/AudioData;)V
    .locals 1
    .parameter "source"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iget v0, p1, Lco/vine/android/recorder/AudioData;->start:I

    iput v0, p0, Lco/vine/android/recorder/AudioData;->start:I

    .line 33
    iget v0, p1, Lco/vine/android/recorder/AudioData;->size:I

    iput v0, p0, Lco/vine/android/recorder/AudioData;->size:I

    .line 34
    return-void
.end method


# virtual methods
.method public getDurationNs()J
    .locals 2

    .prologue
    .line 37
    iget v0, p0, Lco/vine/android/recorder/AudioData;->size:I

    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 1
    .parameter "input"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/AudioData;->start:I

    .line 43
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/AudioData;->size:I

    .line 44
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 1
    .parameter "output"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    iget v0, p0, Lco/vine/android/recorder/AudioData;->start:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 49
    iget v0, p0, Lco/vine/android/recorder/AudioData;->size:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 50
    return-void
.end method
