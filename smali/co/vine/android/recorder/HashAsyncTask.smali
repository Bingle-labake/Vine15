.class public abstract Lco/vine/android/recorder/HashAsyncTask;
.super Landroid/os/AsyncTask;
.source "HashAsyncTask.java"

# interfaces
.implements Lco/vine/android/recorder/RecordCompleteConsumer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lco/vine/android/recorder/RecordingFile;",
        "Ljava/lang/Void;",
        "Lco/vine/android/recorder/RecordingFile;",
        ">;",
        "Lco/vine/android/recorder/RecordCompleteConsumer;"
    }
.end annotation


# instance fields
.field private final mParent:Lco/vine/android/recorder/RecordCompleteConsumer;


# direct methods
.method public constructor <init>(Lco/vine/android/recorder/RecordCompleteConsumer;)V
    .locals 0
    .parameter "parent"

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 53
    iput-object p1, p0, Lco/vine/android/recorder/HashAsyncTask;->mParent:Lco/vine/android/recorder/RecordCompleteConsumer;

    .line 54
    return-void
.end method

.method private static createChecksum(Ljava/lang/String;)[B
    .locals 6
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 22
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 23
    new-array v4, v5, [B

    .line 36
    :goto_0
    return-object v4

    .line 25
    :cond_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 26
    .local v2, fis:Ljava/io/InputStream;
    const/16 v4, 0x400

    new-array v0, v4, [B

    .line 27
    .local v0, buffer:[B
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 31
    .local v1, complete:Ljava/security/MessageDigest;
    :cond_1
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 32
    .local v3, numRead:I
    if-lez v3, :cond_2

    .line 33
    invoke-virtual {v1, v0, v5, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 35
    :cond_2
    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    .line 36
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    goto :goto_0
.end method

.method public static getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {p0}, Lco/vine/android/recorder/HashAsyncTask;->createChecksum(Ljava/lang/String;)[B

    move-result-object v2

    .line 45
    .local v2, bytes:[B
    const-string v5, ""

    .line 46
    .local v5, result:Ljava/lang/String;
    move-object v0, v2

    .local v0, arr$:[B
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-byte v1, v0, v3

    .line 47
    .local v1, b:B
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    and-int/lit16 v7, v1, 0xff

    add-int/lit16 v7, v7, 0x100

    const/16 v8, 0x10

    invoke-static {v7, v8}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 46
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 49
    .end local v1           #b:B
    :cond_0
    return-object v5
.end method

.method public static setMD5Checksum(Lco/vine/android/recorder/RecordingFile;)V
    .locals 1
    .parameter "filename"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/recorder/HashAsyncTask;->getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/RecordingFile;->setHash(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;
    .locals 5
    .parameter "params"

    .prologue
    const/4 v2, 0x0

    .line 75
    if-eqz p1, :cond_0

    array-length v3, p1

    if-nez v3, :cond_1

    :cond_0
    move-object v1, v2

    .line 87
    :goto_0
    return-object v1

    .line 78
    :cond_1
    array-length v3, p1

    const/4 v4, 0x1

    if-le v3, v4, :cond_2

    .line 79
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "You can only throw on file per execute."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 81
    :cond_2
    const/4 v3, 0x0

    aget-object v1, p1, v3

    .line 83
    .local v1, file:Lco/vine/android/recorder/RecordingFile;
    :try_start_0
    invoke-virtual {v1}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/recorder/HashAsyncTask;->getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lco/vine/android/recorder/RecordingFile;->setHash(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {p0, v1, v0}, Lco/vine/android/recorder/HashAsyncTask;->onError(Lco/vine/android/recorder/RecordingFile;Ljava/lang/Exception;)V

    move-object v1, v2

    .line 87
    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 17
    check-cast p1, [Lco/vine/android/recorder/RecordingFile;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/HashAsyncTask;->doInBackground([Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    move-result-object v0

    return-object v0
.end method

.method public final onComplete(Lco/vine/android/recorder/RecordingFile;)V
    .locals 1
    .parameter "recordingFile"

    .prologue
    .line 61
    iget-object v0, p0, Lco/vine/android/recorder/HashAsyncTask;->mParent:Lco/vine/android/recorder/RecordCompleteConsumer;

    invoke-virtual {p0, p1, v0}, Lco/vine/android/recorder/HashAsyncTask;->onComplete(Lco/vine/android/recorder/RecordingFile;Lco/vine/android/recorder/RecordCompleteConsumer;)V

    .line 62
    return-void
.end method

.method public abstract onComplete(Lco/vine/android/recorder/RecordingFile;Lco/vine/android/recorder/RecordCompleteConsumer;)V
.end method

.method public final onError(Lco/vine/android/recorder/RecordingFile;Ljava/lang/Exception;)V
    .locals 1
    .parameter "recordingFile"
    .parameter "e"

    .prologue
    .line 57
    iget-object v0, p0, Lco/vine/android/recorder/HashAsyncTask;->mParent:Lco/vine/android/recorder/RecordCompleteConsumer;

    invoke-virtual {p0, p1, p2, v0}, Lco/vine/android/recorder/HashAsyncTask;->onError(Lco/vine/android/recorder/RecordingFile;Ljava/lang/Exception;Lco/vine/android/recorder/RecordCompleteConsumer;)V

    .line 58
    return-void
.end method

.method public abstract onError(Lco/vine/android/recorder/RecordingFile;Ljava/lang/Exception;Lco/vine/android/recorder/RecordCompleteConsumer;)V
.end method

.method protected final onPostExecute(Lco/vine/android/recorder/RecordingFile;)V
    .locals 1
    .parameter "recordingFiles"

    .prologue
    .line 70
    iget-object v0, p0, Lco/vine/android/recorder/HashAsyncTask;->mParent:Lco/vine/android/recorder/RecordCompleteConsumer;

    invoke-virtual {p0, p1, v0}, Lco/vine/android/recorder/HashAsyncTask;->onComplete(Lco/vine/android/recorder/RecordingFile;Lco/vine/android/recorder/RecordCompleteConsumer;)V

    .line 71
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 17
    check-cast p1, Lco/vine/android/recorder/RecordingFile;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/HashAsyncTask;->onPostExecute(Lco/vine/android/recorder/RecordingFile;)V

    return-void
.end method
