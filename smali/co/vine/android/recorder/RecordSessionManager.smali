.class public Lco/vine/android/recorder/RecordSessionManager;
.super Ljava/lang/Object;
.source "RecordSessionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
    }
.end annotation


# static fields
.field private static INSTANCE:Lco/vine/android/recorder/RecordSessionManager; = null

.field private static final REQUIRED_SPACE_LIMIT:I = 0x1400000


# instance fields
.field private final mDir:Ljava/io/File;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 46
    .local v2, root:Ljava/io/File;
    if-nez v2, :cond_0

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 49
    :cond_0
    new-instance v3, Ljava/io/File;

    const-string v4, "drafts"

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    .line 50
    iget-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 51
    iget-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_1

    .line 52
    iget-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-static {v3}, Lorg/apache/commons/io/FileUtils;->forceDelete(Ljava/io/File;)V

    .line 55
    :cond_1
    iget-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-static {v3}, Lorg/apache/commons/io/FileUtils;->forceMkdir(Ljava/io/File;)V

    .line 57
    :try_start_0
    iget-object v3, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v0

    .line 58
    .local v0, freeBytes:J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-lez v3, :cond_2

    const-wide/32 v3, 0x1400000

    cmp-long v3, v0, v3

    if-gez v3, :cond_2

    .line 59
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Not enough space left for drafts."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 63
    .end local v0           #freeBytes:J
    :catch_0
    move-exception v3

    .line 66
    :goto_0
    return-void

    .line 61
    .restart local v0       #freeBytes:J
    :cond_2
    const-string v3, "free space left: {}."

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public static deleteSession(Ljava/io/File;Ljava/lang/String;)V
    .locals 3
    .parameter "folder"
    .parameter "reason"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    const-string v0, "Session deleted: {}, {}."

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p0, v1, v2

    invoke-static {v0, v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 246
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 247
    return-void
.end method

.method public static getDataFile(Ljava/io/File;Z)Ljava/io/File;
    .locals 2
    .parameter "folder"
    .parameter "isFinal"

    .prologue
    .line 213
    new-instance v1, Ljava/io/File;

    if-eqz p1, :cond_0

    const-string v0, "data.bin"

    :goto_0
    invoke-direct {v1, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1

    :cond_0
    const-string v0, "data.temp"

    goto :goto_0
.end method

.method public static getFrameInfoFile(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .parameter "folder"

    .prologue
    .line 209
    new-instance v0, Ljava/io/File;

    const-string v1, "frame.info"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;
    .locals 1
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    sget-object v0, Lco/vine/android/recorder/RecordSessionManager;->INSTANCE:Lco/vine/android/recorder/RecordSessionManager;

    if-nez v0, :cond_0

    .line 78
    new-instance v0, Lco/vine/android/recorder/RecordSessionManager;

    invoke-direct {v0, p0}, Lco/vine/android/recorder/RecordSessionManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/recorder/RecordSessionManager;->INSTANCE:Lco/vine/android/recorder/RecordSessionManager;

    .line 80
    :cond_0
    sget-object v0, Lco/vine/android/recorder/RecordSessionManager;->INSTANCE:Lco/vine/android/recorder/RecordSessionManager;

    return-object v0
.end method

.method public static getMetaFile(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .parameter "folder"

    .prologue
    .line 217
    new-instance v0, Ljava/io/File;

    const-string v1, "meta.bin"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getNumberOfValidSessions(Landroid/content/Context;)I
    .locals 2
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getValidSessions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    .line 163
    .local v0, info:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    if-eqz v0, :cond_0

    .line 164
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 166
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getPreviewThumbnailPath(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "folder"

    .prologue
    .line 241
    new-instance v0, Ljava/io/File;

    const-string v1, "preview.jpg"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPreviewVideoPath(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "folder"

    .prologue
    .line 237
    new-instance v0, Ljava/io/File;

    const-string v1, "preview.mp4"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSegmentThumbnailPath(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "folder"

    .prologue
    .line 233
    new-instance v0, Ljava/io/File;

    const-string v1, "segment.jpg"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSegmentVideoPath(Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .parameter "folder"

    .prologue
    .line 229
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "segment_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getThumbnailPath(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "folder"

    .prologue
    .line 225
    new-instance v0, Ljava/io/File;

    const-string v1, "thumbnail.jpg"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getValidSessions(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 1
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSessionManager;->getValidSessions()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getVideoPath(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .parameter "folder"

    .prologue
    .line 221
    new-instance v0, Ljava/io/File;

    const-string v1, "video.mp4"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isSessionSaved(Ljava/io/File;)Z
    .locals 2
    .parameter "folder"

    .prologue
    const/4 v0, 0x1

    .line 107
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getMetaFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0, v0}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static readDataObject(Ljava/io/File;)Lco/vine/android/recorder/RecordSession;
    .locals 1
    .parameter "folder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 316
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/recorder/RecordSessionManager;->readObject(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/RecordSession;

    return-object v0
.end method

.method public static readFrameInfo(Ljava/io/File;)Ljava/util/ArrayList;
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 268
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->readObject(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public static readMetaObject(Ljava/io/File;)Lco/vine/android/recorder/RecordSessionMeta;
    .locals 1
    .parameter "folder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getMetaFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/recorder/RecordSessionManager;->readObject(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/RecordSessionMeta;

    return-object v0
.end method

.method private static readObject(Ljava/io/File;)Ljava/lang/Object;
    .locals 8
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 293
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 294
    new-instance v5, Ljava/io/FileNotFoundException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "File not found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    :catch_0
    move-exception v2

    .line 311
    .local v2, ex:Ljava/lang/ClassNotFoundException;
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Invalid file found."

    invoke-direct {v5, v6, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 296
    .end local v2           #ex:Ljava/lang/ClassNotFoundException;
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 297
    .local v3, file:Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 299
    .local v0, buffer:Ljava/io/InputStream;
    :try_start_2
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    .line 301
    .local v4, input:Ljava/io/ObjectInput;
    :try_start_3
    invoke-interface {v4}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v5

    .line 303
    :try_start_4
    invoke-interface {v4}, Ljava/io/ObjectInput;->close()V

    return-object v5

    :catchall_0
    move-exception v5

    invoke-interface {v4}, Ljava/io/ObjectInput;->close()V

    throw v5
    :try_end_4
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 305
    .end local v4           #input:Ljava/io/ObjectInput;
    :catch_1
    move-exception v1

    .line 306
    .local v1, e:Ljava/io/EOFException;
    :try_start_5
    const-string v5, "Failed to read a corrupted file."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    .line 307
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 308
    throw v1
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
.end method

.method private static writeData(Ljava/io/File;Lco/vine/android/recorder/RecordSession;Z)V
    .locals 1
    .parameter "folder"
    .parameter "session"
    .parameter "isFinal"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    invoke-static {p0, p2}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lco/vine/android/recorder/RecordSessionManager;->writeObject(Ljava/io/File;Ljava/lang/Object;)V

    .line 282
    if-eqz p2, :cond_0

    .line 283
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 285
    :cond_0
    return-void
.end method

.method public static writeFrameInfo(Ljava/io/File;Ljava/util/ArrayList;)V
    .locals 1
    .parameter "folder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    .local p1, info:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getFrameInfoFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lco/vine/android/recorder/RecordSessionManager;->writeObject(Ljava/io/File;Ljava/lang/Object;)V

    .line 265
    return-void
.end method

.method private static writeMeta(Ljava/io/File;Lco/vine/android/recorder/RecordSessionMeta;)V
    .locals 1
    .parameter "folder"
    .parameter "meta"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getMetaFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lco/vine/android/recorder/RecordSessionManager;->writeObject(Ljava/io/File;Ljava/lang/Object;)V

    .line 289
    return-void
.end method

.method private static writeObject(Ljava/io/File;Ljava/lang/Object;)V
    .locals 7
    .parameter "f"
    .parameter "obj"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 250
    const-string v3, "Writing: {}."

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v6

    invoke-static {v3, v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 251
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->quietlyEnsureParentExists(Ljava/io/File;)V

    .line 252
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 253
    .local v1, file:Ljava/io/OutputStream;
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 254
    .local v0, buffer:Ljava/io/OutputStream;
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 256
    .local v2, output:Ljava/io/ObjectOutput;
    :try_start_0
    invoke-interface {v2, p1}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 258
    invoke-interface {v2}, Ljava/io/ObjectOutput;->close()V

    .line 259
    const-string v3, "Closed: {}."

    new-array v4, v5, [Ljava/lang/Object;

    aput-object p0, v4, v6

    invoke-static {v3, v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 261
    return-void

    .line 258
    :catchall_0
    move-exception v3

    invoke-interface {v2}, Ljava/io/ObjectOutput;->close()V

    .line 259
    const-string v4, "Closed: {}."

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v3
.end method

.method public static writeRecordingFile(Lco/vine/android/recorder/RecordingFile;Z)V
    .locals 3
    .parameter "file"
    .parameter "isFinal"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v0, p0, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lco/vine/android/recorder/RecordSessionManager;->writeData(Ljava/io/File;Lco/vine/android/recorder/RecordSession;Z)V

    .line 273
    if-eqz p1, :cond_0

    .line 274
    iget-object v0, p0, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    new-instance v1, Lco/vine/android/recorder/RecordSessionMeta;

    invoke-virtual {p0}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSession;->getAudioDataCount()I

    move-result v2

    invoke-static {v2}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v2

    div-int/lit16 v2, v2, 0x3e8

    invoke-direct {v1, v2}, Lco/vine/android/recorder/RecordSessionMeta;-><init>(I)V

    invoke-static {v0, v1}, Lco/vine/android/recorder/RecordSessionManager;->writeMeta(Ljava/io/File;Lco/vine/android/recorder/RecordSessionMeta;)V

    .line 276
    iget-object v0, p0, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 278
    :cond_0
    return-void
.end method


# virtual methods
.method public cleanUnusedFolders()V
    .locals 10

    .prologue
    .line 112
    const/4 v3, 0x0

    .line 113
    .local v3, i:I
    iget-object v8, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 114
    .local v6, list:[Ljava/io/File;
    if-eqz v6, :cond_3

    .line 115
    move-object v0, v6

    .local v0, arr$:[Ljava/io/File;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_3

    aget-object v2, v0, v4

    .line 116
    .local v2, folder:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 117
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    .line 118
    .local v7, listFiles:[Ljava/io/File;
    if-eqz v7, :cond_0

    .line 119
    array-length v8, v7

    if-nez v8, :cond_1

    .line 120
    invoke-static {v2}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 121
    add-int/lit8 v3, v3, 0x1

    .line 115
    .end local v7           #listFiles:[Ljava/io/File;
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 123
    .restart local v7       #listFiles:[Ljava/io/File;
    :cond_1
    array-length v8, v7

    const/4 v9, 0x1

    if-ne v8, v9, :cond_2

    .line 124
    const/4 v8, 0x0

    aget-object v1, v7, v8

    .line 125
    .local v1, f:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, ".mp4"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 126
    invoke-static {v2}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    .line 129
    .end local v1           #f:Ljava/io/File;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 135
    .end local v0           #arr$:[Ljava/io/File;
    .end local v2           #folder:Ljava/io/File;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v7           #listFiles:[Ljava/io/File;
    :cond_3
    const-string v8, "{} empty folders deleted."

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public createFolderForSession()Ljava/io/File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    .local v0, folder:Ljava/io/File;
    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->forceMkdir(Ljava/io/File;)V

    .line 86
    return-object v0
.end method

.method public getCrashedSession()Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/recorder/RecordSession;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSessionManager;->getFolders()Ljava/util/ArrayList;

    move-result-object v3

    .line 193
    .local v3, folders:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 194
    .local v2, folder:Ljava/io/File;
    const/4 v6, 0x0

    invoke-static {v2, v6}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v0

    .line 195
    .local v0, dataFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 197
    :try_start_0
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 198
    .local v5, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    invoke-static {v0}, Lco/vine/android/recorder/RecordSessionManager;->readObject(Ljava/io/File;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v5, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    .end local v0           #dataFile:Ljava/io/File;
    .end local v2           #folder:Ljava/io/File;
    .end local v5           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/recorder/RecordSession;Ljava/io/File;>;"
    :goto_1
    return-object v5

    .line 200
    .restart local v0       #dataFile:Ljava/io/File;
    .restart local v2       #folder:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 201
    .local v1, e:Ljava/io/IOException;
    const-string v6, "Failed to read session object."

    invoke-static {v6, v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 205
    .end local v0           #dataFile:Ljava/io/File;
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #folder:Ljava/io/File;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public getFolderFromName(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "name"

    .prologue
    .line 69
    if-eqz p1, :cond_0

    .line 70
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 72
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFolders()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .local v2, folders:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/io/File;>;"
    iget-object v6, p0, Lco/vine/android/recorder/RecordSessionManager;->mDir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 95
    .local v5, list:[Ljava/io/File;
    if-nez v5, :cond_0

    .line 96
    new-instance v6, Ljava/io/IOException;

    const-string v7, "This should never happen."

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 98
    :cond_0
    move-object v0, v5

    .local v0, arr$:[Ljava/io/File;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 99
    .local v1, folder:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 100
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 103
    .end local v1           #folder:Ljava/io/File;
    :cond_2
    return-object v2
.end method

.method public getValidSessions()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-virtual {p0}, Lco/vine/android/recorder/RecordSessionManager;->getFolders()Ljava/util/ArrayList;

    move-result-object v2

    .line 172
    .local v2, folders:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 173
    .local v5, sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 175
    .local v1, folder:Ljava/io/File;
    :try_start_0
    invoke-static {v1}, Lco/vine/android/recorder/RecordSessionManager;->getMetaFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 176
    new-instance v6, Ljava/io/File;

    invoke-static {v1}, Lco/vine/android/recorder/RecordSessionManager;->getThumbnailPath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 177
    .local v6, thumb:Ljava/io/File;
    new-instance v7, Ljava/io/File;

    invoke-static {v1}, Lco/vine/android/recorder/RecordSessionManager;->getVideoPath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 178
    .local v7, video:Ljava/io/File;
    invoke-static {v1}, Lco/vine/android/recorder/RecordSessionManager;->readMetaObject(Ljava/io/File;)Lco/vine/android/recorder/RecordSessionMeta;

    move-result-object v4

    .line 179
    .local v4, meta:Lco/vine/android/recorder/RecordSessionMeta;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 180
    new-instance v8, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    invoke-direct {v8, v1, v6, v7, v4}, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Lco/vine/android/recorder/RecordSessionMeta;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    .end local v4           #meta:Lco/vine/android/recorder/RecordSessionMeta;
    .end local v6           #thumb:Ljava/io/File;
    .end local v7           #video:Ljava/io/File;
    :catch_0
    move-exception v0

    .line 184
    .local v0, e:Ljava/lang/Exception;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 187
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #folder:Ljava/io/File;
    :cond_1
    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 188
    return-object v5
.end method
