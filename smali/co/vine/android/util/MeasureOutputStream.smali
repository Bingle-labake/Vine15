.class public Lco/vine/android/util/MeasureOutputStream;
.super Lorg/apache/http/entity/FileEntity;
.source "MeasureOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;
    }
.end annotation


# instance fields
.field private final mProgressListener:Lco/vine/android/util/VineProgressListener;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Lco/vine/android/util/VineProgressListener;)V
    .locals 0
    .parameter "file"
    .parameter "contentType"
    .parameter "listener"

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lorg/apache/http/entity/FileEntity;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    iput-object p3, p0, Lco/vine/android/util/MeasureOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    .line 20
    return-void
.end method


# virtual methods
.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 23
    new-instance v0, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;

    iget-object v1, p0, Lco/vine/android/util/MeasureOutputStream;->mProgressListener:Lco/vine/android/util/VineProgressListener;

    invoke-direct {v0, p1, v1}, Lco/vine/android/util/MeasureOutputStream$CountingOutputStream;-><init>(Ljava/io/OutputStream;Lco/vine/android/util/VineProgressListener;)V

    invoke-super {p0, v0}, Lorg/apache/http/entity/FileEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 24
    return-void
.end method
