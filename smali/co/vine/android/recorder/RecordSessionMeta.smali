.class public Lco/vine/android/recorder/RecordSessionMeta;
.super Ljava/lang/Object;
.source "RecordSessionMeta.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final serialVersionUID:J = 0x2f5b08d7602a389cL


# instance fields
.field private mLastModified:J

.field private mProgress:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .parameter "progress"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mLastModified:J

    .line 24
    iput p1, p0, Lco/vine/android/recorder/RecordSessionMeta;->mProgress:I

    .line 25
    return-void
.end method


# virtual methods
.method public getLastModified()J
    .locals 2

    .prologue
    .line 28
    iget-wide v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mLastModified:J

    return-wide v0
.end method

.method public getProgress()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mProgress:I

    return v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .locals 2
    .parameter "input"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mProgress:I

    .line 42
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mLastModified:J

    .line 43
    return-void
.end method

.method public setProgress(I)V
    .locals 0
    .parameter "progress"

    .prologue
    .line 36
    iput p1, p0, Lco/vine/android/recorder/RecordSessionMeta;->mProgress:I

    .line 37
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .locals 2
    .parameter "output"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mProgress:I

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 48
    iget-wide v0, p0, Lco/vine/android/recorder/RecordSessionMeta;->mLastModified:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 49
    return-void
.end method
