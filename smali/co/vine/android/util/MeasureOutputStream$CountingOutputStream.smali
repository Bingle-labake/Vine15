.class public Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "MeasureOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/util/MeasureOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CountingOutputStream"
.end annotation


# instance fields
.field private final mProgressEvent:Lco/vine/android/util/VineProgressEvent;

.field private final mProgressListener:Lco/vine/android/util/VineProgressListener;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lco/vine/android/util/VineProgressListener;)V
    .locals 2
    .parameter "out"
    .parameter "listener"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 34
    iput-object p2, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    .line 35
    new-instance v0, Lco/vine/android/util/VineProgressEvent;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lco/vine/android/util/VineProgressEvent;-><init>(I)V

    iput-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressEvent:Lco/vine/android/util/VineProgressEvent;

    .line 36
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 48
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressEvent:Lco/vine/android/util/VineProgressEvent;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/util/VineProgressEvent;->setBytesTransfered(I)V

    .line 49
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    iget-object v1, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressEvent:Lco/vine/android/util/VineProgressEvent;

    invoke-interface {v0, v1}, Lco/vine/android/util/VineProgressListener;->progressChanged(Lco/vine/android/util/VineProgressEvent;)V

    .line 52
    :cond_0
    return-void
.end method

.method public write([BII)V
    .locals 2
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 40
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressEvent:Lco/vine/android/util/VineProgressEvent;

    invoke-virtual {v0, p3}, Lco/vine/android/util/VineProgressEvent;->setBytesTransfered(I)V

    .line 41
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    iget-object v1, p0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;->mProgressEvent:Lco/vine/android/util/VineProgressEvent;

    invoke-interface {v0, v1}, Lco/vine/android/util/VineProgressListener;->progressChanged(Lco/vine/android/util/VineProgressEvent;)V

    .line 44
    :cond_0
    return-void
.end method
