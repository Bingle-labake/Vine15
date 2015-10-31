.class public Lco/vine/android/util/video/VideoCache;
.super Lco/vine/android/util/UrlResourceCache;
.source "VideoCache.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/vine/android/util/UrlResourceCache",
        "<",
        "Lco/vine/android/util/video/VideoKey;",
        "Lco/vine/android/util/video/UrlVideo;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# static fields
.field private static final AVG_LOCK:[I = null

.field private static final CACHE_NAME:Ljava/lang/String; = "video_cache"

.field private static final INDEX_TIMESTAMP:I = 0x1

.field private static final INDEX_VIDEO_BYTES:I = 0x0

.field private static final LOCK:[I = null

.field private static final MAX_AVERAGE:I = 0x5

.field private static final MAX_EXTERNAL_DISK_CACHE_SIZE:I = 0x9600000

.field private static final MAX_INTERNAL_DISK_CACHE_SIZE:I = 0x3200000

.field private static final VALUE_COUNT:I = 0x2

.field private static final VERSION:I = 0x2

.field private static averagePosition:I

.field private static final averages:[I

.field private static hasAveragePositionCycled:Z

.field private static sDiskCache:Lcom/vandalsoftware/io/DiskLruCache;

.field private static sIsCacheInitialized:Z


# instance fields
.field private final mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/util/video/VideoListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    new-array v0, v1, [I

    sput-object v0, Lco/vine/android/util/video/VideoCache;->LOCK:[I

    .line 38
    sput-boolean v1, Lco/vine/android/util/video/VideoCache;->sIsCacheInitialized:Z

    .line 43
    const/4 v0, 0x5

    new-array v0, v0, [I

    sput-object v0, Lco/vine/android/util/video/VideoCache;->averages:[I

    .line 44
    sput v1, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    .line 45
    sput-boolean v1, Lco/vine/android/util/video/VideoCache;->hasAveragePositionCycled:Z

    .line 46
    new-array v0, v1, [I

    sput-object v0, Lco/vine/android/util/video/VideoCache;->AVG_LOCK:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .parameter "context"
    .parameter "maxCacheSize"

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lco/vine/android/util/UrlResourceCache;-><init>(Landroid/content/Context;I)V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    .line 96
    return-void
.end method

.method public static evictExpiredEntries(Landroid/content/Context;I)V
    .locals 14
    .parameter "context"
    .parameter "lifetime"

    .prologue
    .line 157
    invoke-static {p0}, Lco/vine/android/util/video/VideoCache;->getCacheInstance(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;

    move-result-object v4

    .line 158
    .local v4, diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-virtual {v4}, Lcom/vandalsoftware/io/DiskLruCache;->getLruEntries()Ljava/util/LinkedHashMap;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 159
    .local v5, entrySet:Ljava/util/LinkedHashSet;,"Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    invoke-virtual {v5}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 161
    .local v7, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 162
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 163
    .local v8, key:Ljava/lang/String;
    const/4 v10, 0x1

    invoke-virtual {v4, v8, v10}, Lcom/vandalsoftware/io/DiskLruCache;->get(Ljava/lang/String;Z)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;

    move-result-object v9

    .line 164
    .local v9, snapshot:Lcom/vandalsoftware/io/DiskLruCache$Snapshot;
    if-eqz v9, :cond_0

    .line 169
    const/16 v10, 0x8

    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 170
    .local v3, buffer:Ljava/nio/ByteBuffer;
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/vandalsoftware/io/DiskLruCache$Snapshot;->getInputStream(I)Ljava/io/InputStream;

    move-result-object v6

    .line 171
    .local v6, is:Ljava/io/InputStream;
    const/16 v10, 0x8

    new-array v2, v10, [B

    .line 172
    .local v2, b:[B
    const/4 v10, 0x0

    const/16 v11, 0x8

    invoke-virtual {v6, v2, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v10

    if-lez v10, :cond_0

    .line 173
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 174
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v12

    sub-long v0, v10, v12

    .line 175
    .local v0, age:J
    int-to-long v10, p1

    const-wide/32 v12, 0x36ee80

    mul-long/2addr v10, v12

    cmp-long v10, v0, v10

    if-lez v10, :cond_1

    .line 176
    invoke-virtual {v4, v8}, Lcom/vandalsoftware/io/DiskLruCache;->remove(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 183
    .end local v0           #age:J
    .end local v2           #b:[B
    .end local v3           #buffer:Ljava/nio/ByteBuffer;
    .end local v6           #is:Ljava/io/InputStream;
    .end local v8           #key:Ljava/lang/String;
    .end local v9           #snapshot:Lcom/vandalsoftware/io/DiskLruCache$Snapshot;
    :catch_0
    move-exception v10

    .line 185
    :cond_1
    return-void
.end method

.method protected static getCacheDir()Ljava/io/File;
    .locals 2

    .prologue
    .line 202
    sget-object v1, Lco/vine/android/util/video/VideoCache;->LOCK:[I

    monitor-enter v1

    .line 203
    :try_start_0
    sget-object v0, Lco/vine/android/util/video/VideoCache;->sDiskCache:Lcom/vandalsoftware/io/DiskLruCache;

    if-eqz v0, :cond_0

    .line 204
    sget-object v0, Lco/vine/android/util/video/VideoCache;->sDiskCache:Lcom/vandalsoftware/io/DiskLruCache;

    invoke-virtual {v0}, Lcom/vandalsoftware/io/DiskLruCache;->getDirectory()Ljava/io/File;

    move-result-object v0

    monitor-exit v1

    .line 206
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    .line 208
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static getCacheInstance(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;
    .locals 7
    .parameter "context"

    .prologue
    .line 132
    sget-object v3, Lco/vine/android/util/video/VideoCache;->LOCK:[I

    monitor-enter v3

    .line 133
    :try_start_0
    sget-boolean v2, Lco/vine/android/util/video/VideoCache;->sIsCacheInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 134
    const/4 v1, 0x0

    .line 136
    .local v1, diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :try_start_1
    invoke-static {p0}, Lco/vine/android/util/Util;->getExternalCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 137
    .local v0, cacheDir:Ljava/io/File;
    if-eqz v0, :cond_1

    .line 138
    const-wide/32 v4, 0x9600000

    const/4 v2, 0x0

    invoke-static {v0, v4, v5, v2}, Lco/vine/android/util/video/VideoCache;->prepareCache(Ljava/io/File;JZ)Lcom/vandalsoftware/io/DiskLruCache;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 144
    .end local v0           #cacheDir:Ljava/io/File;
    :goto_0
    :try_start_2
    sput-object v1, Lco/vine/android/util/video/VideoCache;->sDiskCache:Lcom/vandalsoftware/io/DiskLruCache;

    .line 145
    const/4 v2, 0x1

    sput-boolean v2, Lco/vine/android/util/video/VideoCache;->sIsCacheInitialized:Z

    .line 147
    .end local v1           #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :cond_0
    sget-object v2, Lco/vine/android/util/video/VideoCache;->sDiskCache:Lcom/vandalsoftware/io/DiskLruCache;

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-object v2

    .line 140
    .restart local v0       #cacheDir:Ljava/io/File;
    .restart local v1       #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :cond_1
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-wide/32 v4, 0x3200000

    const/4 v6, 0x0

    invoke-static {v2, v4, v5, v6}, Lco/vine/android/util/video/VideoCache;->prepareCache(Ljava/io/File;JZ)Lcom/vandalsoftware/io/DiskLruCache;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v1

    goto :goto_0

    .line 148
    .end local v0           #cacheDir:Ljava/io/File;
    .end local v1           #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :catchall_0
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v2

    .line 142
    .restart local v1       #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static getCurrentAverageSpeed()I
    .locals 8

    .prologue
    .line 68
    sget-object v7, Lco/vine/android/util/video/VideoCache;->AVG_LOCK:[I

    monitor-enter v7

    .line 69
    const/4 v5, 0x0

    .line 70
    .local v5, total:I
    :try_start_0
    sget-boolean v6, Lco/vine/android/util/video/VideoCache;->hasAveragePositionCycled:Z

    if-eqz v6, :cond_0

    .line 71
    sget-object v0, Lco/vine/android/util/video/VideoCache;->averages:[I

    .local v0, arr$:[I
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget v4, v0, v2

    .line 72
    .local v4, speed:I
    add-int/2addr v5, v4

    .line 71
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 75
    .end local v0           #arr$:[I
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v4           #speed:I
    :cond_0
    sget v6, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    if-nez v6, :cond_1

    .line 76
    const v6, 0x7fffffff

    monitor-exit v7

    .line 82
    :goto_1
    return v6

    .line 78
    :cond_1
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    sget v6, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    if-ge v1, v6, :cond_2

    .line 79
    sget-object v6, Lco/vine/android/util/video/VideoCache;->averages:[I

    aget v6, v6, v1

    add-int/2addr v5, v6

    .line 78
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 82
    .end local v1           #i:I
    :cond_2
    div-int/lit8 v6, v5, 0x5

    monitor-exit v7

    goto :goto_1

    .line 83
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6
.end method

.method private static prepareCache(Ljava/io/File;JZ)Lcom/vandalsoftware/io/DiskLruCache;
    .locals 10
    .parameter "dir"
    .parameter "absMax"
    .parameter "appendCacheName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    .line 188
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 189
    .local v4, stat:Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v7, v7

    mul-long v0, v5, v7

    .line 191
    .local v0, available:J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-lez v5, :cond_2

    .line 192
    cmp-long v5, v0, p1

    if-lez v5, :cond_1

    move-wide v2, p1

    .line 196
    .local v2, maxSize:J
    :goto_0
    const-string v5, "Preparing a DiskLruCache with absMax={}, available={}, maxSize={}"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v5, v6, v7, v8}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 198
    if-eqz p3, :cond_0

    new-instance v5, Ljava/io/File;

    const-string v6, "video_cache"

    invoke-direct {v5, p0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object p0, v5

    .end local p0
    :cond_0
    invoke-static {p0, v9, v9, v2, v3}, Lcom/vandalsoftware/io/DiskLruCache;->open(Ljava/io/File;IIJ)Lcom/vandalsoftware/io/DiskLruCache;

    move-result-object v5

    return-object v5

    .line 192
    .end local v2           #maxSize:J
    .restart local p0
    :cond_1
    const-wide/16 v5, 0xa

    div-long v2, v0, v5

    goto :goto_0

    .line 194
    :cond_2
    move-wide v2, p1

    .restart local v2       #maxSize:J
    goto :goto_0
.end method

.method private static reportAverageSpeed(I)V
    .locals 4
    .parameter "speed"

    .prologue
    .line 56
    sget-object v2, Lco/vine/android/util/video/VideoCache;->AVG_LOCK:[I

    monitor-enter v2

    .line 57
    :try_start_0
    const-string v1, "Latest download speed: {}"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    sget v1, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    rem-int/lit8 v0, v1, 0x5

    .line 59
    .local v0, nextPos:I
    sget-object v1, Lco/vine/android/util/video/VideoCache;->averages:[I

    aput p0, v1, v0

    .line 60
    add-int/lit8 v1, v0, 0x1

    rem-int/lit8 v1, v1, 0x5

    sput v1, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    .line 61
    sget v1, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    if-nez v1, :cond_0

    .line 62
    const/4 v1, 0x1

    sput-boolean v1, Lco/vine/android/util/video/VideoCache;->hasAveragePositionCycled:Z

    .line 64
    :cond_0
    monitor-exit v2

    .line 65
    return-void

    .line 64
    .end local v0           #nextPos:I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static resetAverageSpeed()V
    .locals 2

    .prologue
    .line 49
    sget-object v1, Lco/vine/android/util/video/VideoCache;->AVG_LOCK:[I

    monitor-enter v1

    .line 50
    const/4 v0, 0x0

    :try_start_0
    sput v0, Lco/vine/android/util/video/VideoCache;->averagePosition:I

    .line 51
    const/4 v0, 0x0

    sput-boolean v0, Lco/vine/android/util/video/VideoCache;->hasAveragePositionCycled:Z

    .line 52
    monitor-exit v1

    .line 53
    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public addListener(Lco/vine/android/util/video/VideoListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 217
    iget-object v0, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    return-void
.end method

.method public get(JLco/vine/android/util/video/VideoKey;)Lco/vine/android/util/video/UrlVideo;
    .locals 6
    .parameter "ownerId"
    .parameter "key"

    .prologue
    .line 128
    iget-object v4, p3, Lco/vine/android/util/video/VideoKey;->url:Ljava/lang/String;

    const/4 v5, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-super/range {v0 .. v5}, Lco/vine/android/util/UrlResourceCache;->get(JLjava/lang/Object;Ljava/lang/String;Z)Lco/vine/android/util/UrlResource;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/video/UrlVideo;

    return-object v0
.end method

.method public getFile(JLco/vine/android/util/video/VideoKey;Z)Ljava/lang/String;
    .locals 7
    .parameter "ownerId"
    .parameter "key"
    .parameter "peekOnly"

    .prologue
    .line 109
    iget-object v4, p3, Lco/vine/android/util/video/VideoKey;->url:Ljava/lang/String;

    const/4 v5, 0x1

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/util/video/VideoCache;->get(JLjava/lang/Object;Ljava/lang/String;Z)Lco/vine/android/util/UrlResource;

    move-result-object v6

    check-cast v6, Lco/vine/android/util/video/UrlVideo;

    .line 110
    .local v6, video:Lco/vine/android/util/video/UrlVideo;
    if-eqz v6, :cond_0

    .line 111
    iget-object v0, v6, Lco/vine/android/util/video/UrlVideo;->value:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 113
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected bridge synthetic instantiateResource(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/UrlResource;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 29
    check-cast p1, Lco/vine/android/util/video/VideoKey;

    .end local p1
    check-cast p3, Ljava/io/File;

    .end local p3
    invoke-virtual {p0, p1, p2, p3}, Lco/vine/android/util/video/VideoCache;->instantiateResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/File;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v0

    return-object v0
.end method

.method protected instantiateResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/File;)Lco/vine/android/util/video/UrlVideo;
    .locals 1
    .parameter "key"
    .parameter "url"
    .parameter "file"

    .prologue
    .line 307
    new-instance v0, Lco/vine/android/util/video/UrlVideo;

    invoke-direct {v0, p2, p3}, Lco/vine/android/util/video/UrlVideo;-><init>(Ljava/lang/String;Ljava/io/File;)V

    return-object v0
.end method

.method protected bridge synthetic loadResource(JLjava/lang/Object;Ljava/lang/String;)Lco/vine/android/util/UrlResource;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 29
    check-cast p3, Lco/vine/android/util/video/VideoKey;

    .end local p3
    invoke-virtual {p0, p1, p2, p3, p4}, Lco/vine/android/util/video/VideoCache;->loadResource(JLco/vine/android/util/video/VideoKey;Ljava/lang/String;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v0

    return-object v0
.end method

.method protected loadResource(JLco/vine/android/util/video/VideoKey;Ljava/lang/String;)Lco/vine/android/util/video/UrlVideo;
    .locals 7
    .parameter "ownerId"
    .parameter "key"
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 231
    invoke-static {p4}, Lco/vine/android/util/Util;->md5Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, diskCacheKey:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 251
    :goto_0
    return-object v3

    .line 235
    :cond_0
    const/4 v2, 0x0

    .line 236
    .local v2, snapshot:Lcom/vandalsoftware/io/DiskLruCache$Snapshot;
    sget-object v4, Lco/vine/android/util/video/VideoCache;->LOCK:[I

    monitor-enter v4

    .line 237
    :try_start_0
    iget-object v5, p0, Lco/vine/android/util/video/VideoCache;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/video/VideoCache;->getCacheInstance(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;

    move-result-object v0

    .line 238
    .local v0, diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/vandalsoftware/io/DiskLruCache;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_2

    .line 240
    :try_start_1
    invoke-virtual {v0, v1}, Lcom/vandalsoftware/io/DiskLruCache;->get(Ljava/lang/String;)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 241
    if-nez v2, :cond_1

    .line 247
    :try_start_2
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    monitor-exit v4

    goto :goto_0

    .line 250
    .end local v0           #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 244
    .restart local v0       #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    :cond_1
    :try_start_3
    new-instance v5, Ljava/io/File;

    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lcom/vandalsoftware/io/DiskLruCache$Snapshot;->getPath(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p3, p4, v5}, Lco/vine/android/util/video/VideoCache;->instantiateResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/File;)Lco/vine/android/util/video/UrlVideo;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v3

    .line 247
    :try_start_4
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    monitor-exit v4

    goto :goto_0

    .line 245
    :catch_0
    move-exception v5

    .line 247
    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 250
    :cond_2
    monitor-exit v4

    goto :goto_0

    .line 247
    :catchall_1
    move-exception v3

    invoke-static {v2}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method protected bridge synthetic obtainResource(Ljava/lang/Object;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/UrlResource;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 29
    check-cast p1, Lco/vine/android/util/video/VideoKey;

    .end local p1
    invoke-virtual {p0, p1, p2, p3}, Lco/vine/android/util/video/VideoCache;->obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v0

    return-object v0
.end method

.method protected obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;
    .locals 16
    .parameter "key"
    .parameter "url"
    .parameter "is"

    .prologue
    .line 327
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/util/video/VideoCache;->mContext:Landroid/content/Context;

    invoke-static {v12}, Lco/vine/android/util/Util;->getCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v2

    .line 329
    .local v2, cacheDir:Ljava/io/File;
    if-eqz v2, :cond_1

    .line 330
    invoke-static/range {p2 .. p2}, Lco/vine/android/util/Util;->md5Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 331
    .local v5, md5:Ljava/lang/String;
    if-nez v5, :cond_0

    .line 332
    const/16 v12, 0xa

    invoke-static {v12}, Lco/vine/android/util/Util;->randomString(I)Ljava/lang/String;

    move-result-object v5

    .line 334
    :cond_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 339
    .local v4, f:Ljava/io/File;
    const/4 v6, 0x0

    .line 341
    .local v6, out:Ljava/io/FileOutputStream;
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 342
    .local v8, startTime:J
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 343
    .end local v6           #out:Ljava/io/FileOutputStream;
    .local v7, out:Ljava/io/FileOutputStream;
    const/16 v12, 0x1000

    :try_start_1
    move-object/from16 v0, p3

    invoke-static {v0, v7, v12}, Lco/vine/android/util/Util;->readFullyWriteTo(Ljava/io/InputStream;Ljava/io/OutputStream;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    .line 344
    .local v1, bytesLen:I
    if-nez v1, :cond_2

    .line 345
    const/4 v12, 0x0

    .line 359
    invoke-static {v7}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    .end local v1           #bytesLen:I
    .end local v4           #f:Ljava/io/File;
    .end local v5           #md5:Ljava/lang/String;
    .end local v7           #out:Ljava/io/FileOutputStream;
    .end local v8           #startTime:J
    :goto_0
    return-object v12

    .line 336
    :cond_1
    const-string v12, "cache dir is null."

    invoke-static {v12}, Lcom/edisonwang/android/slog/SLog;->w(Ljava/lang/String;)V

    .line 337
    const/4 v12, 0x0

    goto :goto_0

    .line 347
    .restart local v1       #bytesLen:I
    .restart local v4       #f:Ljava/io/File;
    .restart local v5       #md5:Ljava/lang/String;
    .restart local v7       #out:Ljava/io/FileOutputStream;
    .restart local v8       #startTime:J
    :cond_2
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    sub-long/2addr v12, v8

    const-wide/16 v14, 0x3e8

    div-long v10, v12, v14

    .line 348
    .local v10, time:J
    if-lez v1, :cond_3

    .line 349
    const-string v12, "Download time: {}."

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 350
    div-int/lit16 v12, v1, 0x400

    int-to-double v12, v12

    const-wide/16 v14, 0x1

    invoke-static {v14, v15, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    long-to-double v14, v14

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->round(D)J

    move-result-wide v12

    long-to-int v12, v12

    invoke-static {v12}, Lco/vine/android/util/video/VideoCache;->reportAverageSpeed(I)V

    .line 354
    :goto_1
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 359
    invoke-static {v7}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 361
    new-instance v12, Lco/vine/android/util/video/UrlVideo;

    move-object/from16 v0, p2

    invoke-direct {v12, v0, v4}, Lco/vine/android/util/video/UrlVideo;-><init>(Ljava/lang/String;Ljava/io/File;)V

    goto :goto_0

    .line 352
    :cond_3
    :try_start_3
    const-string v12, "Invalid bytesLen or time: {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 355
    .end local v1           #bytesLen:I
    .end local v10           #time:J
    :catch_0
    move-exception v3

    move-object v6, v7

    .line 356
    .end local v7           #out:Ljava/io/FileOutputStream;
    .end local v8           #startTime:J
    .local v3, e:Ljava/io/IOException;
    .restart local v6       #out:Ljava/io/FileOutputStream;
    :goto_2
    :try_start_4
    const-string v12, "Failed to download file."

    invoke-static {v12, v3}, Lcom/edisonwang/android/slog/SLog;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 357
    const/4 v12, 0x0

    .line 359
    invoke-static {v6}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_0

    .end local v3           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v12

    :goto_3
    invoke-static {v6}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    throw v12

    .end local v6           #out:Ljava/io/FileOutputStream;
    .restart local v7       #out:Ljava/io/FileOutputStream;
    .restart local v8       #startTime:J
    :catchall_1
    move-exception v12

    move-object v6, v7

    .end local v7           #out:Ljava/io/FileOutputStream;
    .restart local v6       #out:Ljava/io/FileOutputStream;
    goto :goto_3

    .line 355
    .end local v8           #startTime:J
    :catch_1
    move-exception v3

    goto :goto_2
.end method

.method protected onResourceError(Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V
    .locals 2
    .parameter "key"
    .parameter "result"

    .prologue
    .line 320
    iget-object v1, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 321
    iget-object v1, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/util/video/VideoListener;

    invoke-interface {v1, p0, p1, p2}, Lco/vine/android/util/video/VideoListener;->onVideoPathError(Lco/vine/android/util/video/VideoCache;Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V

    .line 320
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 323
    :cond_0
    return-void
.end method

.method protected bridge synthetic onResourceError(Ljava/lang/Object;Lco/vine/android/network/HttpResult;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 29
    check-cast p1, Lco/vine/android/util/video/VideoKey;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lco/vine/android/util/video/VideoCache;->onResourceError(Lco/vine/android/util/video/VideoKey;Lco/vine/android/network/HttpResult;)V

    return-void
.end method

.method protected onResourceLoaded(Ljava/util/HashMap;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Lco/vine/android/util/video/UrlVideo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p1, resources:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    iget-object v1, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 314
    iget-object v1, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/util/video/VideoListener;

    invoke-interface {v1, p0, p1}, Lco/vine/android/util/video/VideoListener;->onVideoPathObtained(Lco/vine/android/util/video/VideoCache;Ljava/util/HashMap;)V

    .line 313
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 316
    :cond_0
    return-void
.end method

.method public peekPath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 371
    invoke-super {p0, p1}, Lco/vine/android/util/UrlResourceCache;->peek(Ljava/lang/Object;)Lco/vine/android/util/UrlResource;

    move-result-object v0

    check-cast v0, Lco/vine/android/util/video/UrlVideo;

    .line 372
    .local v0, video:Lco/vine/android/util/video/UrlVideo;
    if-eqz v0, :cond_0

    .line 373
    iget-object v1, v0, Lco/vine/android/util/video/UrlVideo;->url:Ljava/lang/String;

    .line 375
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public removeListener(Lco/vine/android/util/video/VideoListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 226
    iget-object v0, p0, Lco/vine/android/util/video/VideoCache;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method protected bridge synthetic saveResource(JLjava/lang/Object;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/UrlResource;
    .locals 6
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 29
    move-object v3, p3

    check-cast v3, Lco/vine/android/util/video/VideoKey;

    move-object v0, p0

    move-wide v1, p1

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lco/vine/android/util/video/VideoCache;->saveResource(JLco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v0

    return-object v0
.end method

.method protected saveResource(JLco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;
    .locals 17
    .parameter "ownerId"
    .parameter "key"
    .parameter "url"
    .parameter "is"

    .prologue
    .line 256
    invoke-static/range {p4 .. p4}, Lco/vine/android/util/Util;->md5Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 257
    .local v6, diskCacheKey:Ljava/lang/String;
    const/4 v8, 0x0

    .line 258
    .local v8, editor:Lcom/vandalsoftware/io/DiskLruCache$Editor;
    const/4 v10, 0x0

    .line 259
    .local v10, ret:Lco/vine/android/util/video/UrlVideo;
    sget-object v14, Lco/vine/android/util/video/VideoCache;->LOCK:[I

    monitor-enter v14

    .line 260
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/util/video/VideoCache;->mContext:Landroid/content/Context;

    invoke-static {v13}, Lco/vine/android/util/video/VideoCache;->getCacheInstance(Landroid/content/Context;)Lcom/vandalsoftware/io/DiskLruCache;

    move-result-object v5

    .line 261
    .local v5, diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Lcom/vandalsoftware/io/DiskLruCache;->isClosed()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v13

    if-nez v13, :cond_7

    .line 262
    const/4 v12, 0x0

    .line 264
    .local v12, success:Z
    :try_start_1
    invoke-virtual {v5, v6}, Lcom/vandalsoftware/io/DiskLruCache;->edit(Ljava/lang/String;)Lcom/vandalsoftware/io/DiskLruCache$Editor;

    move-result-object v8

    .line 265
    if-eqz v8, :cond_0

    .line 266
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v13

    const/16 v15, 0x1000

    move-object/from16 v0, p5

    invoke-static {v0, v13, v15}, Lco/vine/android/util/Util;->readFullyWriteTo(Ljava/io/InputStream;Ljava/io/OutputStream;I)I

    move-result v13

    if-lez v13, :cond_2

    const/4 v12, 0x1

    .line 270
    :goto_0
    const/16 v13, 0x8

    invoke-static {v13}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 271
    .local v4, buffer:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    move-wide v0, v15

    invoke-virtual {v4, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 272
    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v13

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v15

    invoke-virtual {v13, v15}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 277
    .end local v4           #buffer:Ljava/nio/ByteBuffer;
    :cond_0
    if-eqz v8, :cond_1

    .line 281
    if-eqz v12, :cond_3

    .line 282
    :try_start_2
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->commit()V

    .line 283
    invoke-virtual {v5}, Lcom/vandalsoftware/io/DiskLruCache;->flush()V

    .line 284
    new-instance v9, Ljava/io/File;

    const/4 v13, 0x0

    invoke-virtual {v5, v6, v13}, Lcom/vandalsoftware/io/DiskLruCache;->get(Ljava/lang/String;Z)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;

    move-result-object v13

    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Lcom/vandalsoftware/io/DiskLruCache$Snapshot;->getPath(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v9, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 286
    .local v9, f:Ljava/io/File;
    new-instance v11, Lco/vine/android/util/video/UrlVideo;

    move-object/from16 v0, p4

    invoke-direct {v11, v0, v9}, Lco/vine/android/util/video/UrlVideo;-><init>(Ljava/lang/String;Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .end local v10           #ret:Lco/vine/android/util/video/UrlVideo;
    .local v11, ret:Lco/vine/android/util/video/UrlVideo;
    move-object v10, v11

    .line 301
    .end local v9           #f:Ljava/io/File;
    .end local v11           #ret:Lco/vine/android/util/video/UrlVideo;
    .end local v12           #success:Z
    .restart local v10       #ret:Lco/vine/android/util/video/UrlVideo;
    :cond_1
    :goto_1
    :try_start_3
    monitor-exit v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 302
    return-object v10

    .line 266
    .restart local v12       #success:Z
    :cond_2
    const/4 v12, 0x0

    goto :goto_0

    .line 288
    :cond_3
    :try_start_4
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->abort()V

    .line 289
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/util/video/VideoCache;->obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v10

    .line 290
    const-string v13, "Failed to save a video to DiskLruCache"

    invoke-static {v13}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 292
    :catch_0
    move-exception v13

    goto :goto_1

    .line 274
    :catch_1
    move-exception v7

    .line 275
    .local v7, e:Ljava/io/IOException;
    const/4 v12, 0x0

    .line 277
    if-eqz v8, :cond_1

    .line 281
    if-eqz v12, :cond_4

    .line 282
    :try_start_5
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->commit()V

    .line 283
    invoke-virtual {v5}, Lcom/vandalsoftware/io/DiskLruCache;->flush()V

    .line 284
    new-instance v9, Ljava/io/File;

    const/4 v13, 0x0

    invoke-virtual {v5, v6, v13}, Lcom/vandalsoftware/io/DiskLruCache;->get(Ljava/lang/String;Z)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;

    move-result-object v13

    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Lcom/vandalsoftware/io/DiskLruCache$Snapshot;->getPath(I)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v9, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 286
    .restart local v9       #f:Ljava/io/File;
    new-instance v11, Lco/vine/android/util/video/UrlVideo;

    move-object/from16 v0, p4

    invoke-direct {v11, v0, v9}, Lco/vine/android/util/video/UrlVideo;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .end local v10           #ret:Lco/vine/android/util/video/UrlVideo;
    .restart local v11       #ret:Lco/vine/android/util/video/UrlVideo;
    move-object v10, v11

    .line 287
    .end local v11           #ret:Lco/vine/android/util/video/UrlVideo;
    .restart local v10       #ret:Lco/vine/android/util/video/UrlVideo;
    goto :goto_1

    .line 288
    .end local v9           #f:Ljava/io/File;
    :cond_4
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->abort()V

    .line 289
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/util/video/VideoCache;->obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v10

    .line 290
    const-string v13, "Failed to save a video to DiskLruCache"

    invoke-static {v13}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    .line 292
    :catch_2
    move-exception v13

    goto :goto_1

    .line 277
    .end local v7           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v13

    if-eqz v8, :cond_5

    .line 281
    if-eqz v12, :cond_6

    .line 282
    :try_start_6
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->commit()V

    .line 283
    invoke-virtual {v5}, Lcom/vandalsoftware/io/DiskLruCache;->flush()V

    .line 284
    new-instance v9, Ljava/io/File;

    const/4 v15, 0x0

    invoke-virtual {v5, v6, v15}, Lcom/vandalsoftware/io/DiskLruCache;->get(Ljava/lang/String;Z)Lcom/vandalsoftware/io/DiskLruCache$Snapshot;

    move-result-object v15

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/vandalsoftware/io/DiskLruCache$Snapshot;->getPath(I)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v9, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 286
    .restart local v9       #f:Ljava/io/File;
    new-instance v11, Lco/vine/android/util/video/UrlVideo;

    move-object/from16 v0, p4

    invoke-direct {v11, v0, v9}, Lco/vine/android/util/video/UrlVideo;-><init>(Ljava/lang/String;Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .end local v10           #ret:Lco/vine/android/util/video/UrlVideo;
    .restart local v11       #ret:Lco/vine/android/util/video/UrlVideo;
    move-object v10, v11

    .line 293
    .end local v9           #f:Ljava/io/File;
    .end local v11           #ret:Lco/vine/android/util/video/UrlVideo;
    .restart local v10       #ret:Lco/vine/android/util/video/UrlVideo;
    :cond_5
    :goto_2
    :try_start_7
    throw v13

    .line 301
    .end local v5           #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    .end local v12           #success:Z
    :catchall_1
    move-exception v13

    monitor-exit v14
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v13

    .line 288
    .restart local v5       #diskCache:Lcom/vandalsoftware/io/DiskLruCache;
    .restart local v12       #success:Z
    :cond_6
    :try_start_8
    invoke-virtual {v8}, Lcom/vandalsoftware/io/DiskLruCache$Editor;->abort()V

    .line 289
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/util/video/VideoCache;->obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v10

    .line 290
    const-string v15, "Failed to save a video to DiskLruCache"

    invoke-static {v15}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_2

    .line 292
    :catch_3
    move-exception v15

    goto :goto_2

    .line 298
    .end local v12           #success:Z
    :cond_7
    :try_start_9
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/util/video/VideoCache;->obtainResource(Lco/vine/android/util/video/VideoKey;Ljava/lang/String;Ljava/io/InputStream;)Lco/vine/android/util/video/UrlVideo;

    move-result-object v10

    .line 299
    const-string v13, "Videos DiskLruCache could not be opened"

    invoke-static {v13}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto/16 :goto_1
.end method
