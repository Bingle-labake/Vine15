.class public Lco/vine/android/util/MediaUtil;
.super Ljava/lang/Object;
.source "MediaUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/MediaUtil$MediaConnectionClient;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static getVideoFrames(Ljava/lang/String;[J)[Landroid/graphics/Bitmap;
    .locals 14
    .parameter "videoPath"
    .parameter "frameTime"

    .prologue
    .line 25
    new-instance v9, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v9}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 27
    .local v9, retriever:Landroid/media/MediaMetadataRetriever;
    :try_start_0
    invoke-virtual {v9, p0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 28
    array-length v12, p1

    new-array v8, v12, [Landroid/graphics/Bitmap;

    .line 29
    .local v8, r:[Landroid/graphics/Bitmap;
    const/4 v5, 0x0

    .line 30
    .local v5, i:I
    const-wide/16 v1, -0x1

    .line 31
    .local v1, duration:J
    move-object v0, p1

    .local v0, arr$:[J
    array-length v7, v0

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_2

    aget-wide v10, v0, v6

    .line 32
    .local v10, time:J
    const-wide/16 v12, -0x1

    cmp-long v12, v10, v12

    if-nez v12, :cond_1

    .line 33
    const-wide/16 v12, -0x1

    cmp-long v12, v1, v12

    if-nez v12, :cond_0

    .line 34
    const/16 v12, 0x9

    invoke-virtual {v9, v12}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v3

    .line 35
    .local v3, durationString:Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 36
    const-string v12, "Got duration: {}."

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    .end local v3           #durationString:Ljava/lang/String;
    :cond_0
    const-wide/16 v12, 0x3e8

    mul-long v10, v1, v12

    .line 40
    :cond_1
    const/4 v12, 0x1

    invoke-virtual {v9, v10, v11, v12}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime(JI)Landroid/graphics/Bitmap;

    move-result-object v12

    aput-object v12, v8, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 41
    add-int/lit8 v5, v5, 0x1

    .line 31
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 48
    .end local v10           #time:J
    :cond_2
    :try_start_1
    invoke-virtual {v9}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 53
    .end local v0           #arr$:[J
    .end local v1           #duration:J
    .end local v5           #i:I
    .end local v6           #i$:I
    .end local v7           #len$:I
    .end local v8           #r:[Landroid/graphics/Bitmap;
    :goto_1
    return-object v8

    .line 49
    .restart local v0       #arr$:[J
    .restart local v1       #duration:J
    .restart local v5       #i:I
    .restart local v6       #i$:I
    .restart local v7       #len$:I
    .restart local v8       #r:[Landroid/graphics/Bitmap;
    :catch_0
    move-exception v4

    .line 50
    .local v4, e:Ljava/lang/RuntimeException;
    const-string v12, "Failed to release."

    invoke-static {v12, v4}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 44
    .end local v0           #arr$:[J
    .end local v1           #duration:J
    .end local v4           #e:Ljava/lang/RuntimeException;
    .end local v5           #i:I
    .end local v6           #i$:I
    .end local v7           #len$:I
    .end local v8           #r:[Landroid/graphics/Bitmap;
    :catch_1
    move-exception v4

    .line 45
    .restart local v4       #e:Ljava/lang/RuntimeException;
    :try_start_2
    const-string v12, "Failed to get frame."

    invoke-static {v12, v4}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    :try_start_3
    invoke-virtual {v9}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2

    .line 53
    :goto_2
    const/4 v8, 0x0

    goto :goto_1

    .line 49
    :catch_2
    move-exception v4

    .line 50
    const-string v12, "Failed to release."

    invoke-static {v12, v4}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 47
    .end local v4           #e:Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v12

    .line 48
    :try_start_4
    invoke-virtual {v9}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_3

    .line 51
    :goto_3
    throw v12

    .line 49
    :catch_3
    move-exception v4

    .line 50
    .restart local v4       #e:Ljava/lang/RuntimeException;
    const-string v13, "Failed to release."

    invoke-static {v13, v4}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public static scanFile(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "file"
    .parameter "mimeType"

    .prologue
    .line 57
    new-instance v0, Lco/vine/android/util/MediaUtil$MediaConnectionClient;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, p2}, Lco/vine/android/util/MediaUtil$MediaConnectionClient;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .local v0, client:Lco/vine/android/util/MediaUtil$MediaConnectionClient;
    new-instance v1, Landroid/media/MediaScannerConnection;

    invoke-direct {v1, p0, v0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    .line 59
    .local v1, connection:Landroid/media/MediaScannerConnection;
    iput-object v1, v0, Lco/vine/android/util/MediaUtil$MediaConnectionClient;->connection:Landroid/media/MediaScannerConnection;

    .line 60
    invoke-virtual {v1}, Landroid/media/MediaScannerConnection;->connect()V

    .line 61
    return-void
.end method
