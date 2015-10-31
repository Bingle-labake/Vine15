.class public Lco/vine/android/util/UploadManager;
.super Ljava/lang/Object;
.source "UploadManager.java"


# static fields
.field public static final EXPIRE_TIME:J = 0x5265c00L

.field private static final SHARED_LOCK:[I = null

.field public static final STATUS_FAILED:I = 0x2

.field public static final STATUS_INVALID:I = -0x1

.field public static final STATUS_NEED_POST:I = 0x1

.field public static final STATUS_NEED_UPLOAD:I = 0x0

.field private static final SUB_PREF_HASH:Ljava/lang/String; = "_hash.sub"

.field private static final SUB_PREF_POST:Ljava/lang/String; = "_post.sub"

.field private static final SUB_PREF_THUMBNAIL:Ljava/lang/String; = "_thumbnail_url.sub"

.field private static final SUB_PREF_VIDEO:Ljava/lang/String; = "_video_url.sub"

.field private static final SUB_UPLOAD_TIME:Ljava/lang/String; = "_upload_time.sub"

.field private static final TYPE_VINE_POST:Ljava/lang/String; = "type_post"

.field private static mUploadPref:Landroid/content/SharedPreferences;


# instance fields
.field private final mMediaUtility:Lco/vine/android/util/MediaUtility;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 462
    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v0, Lco/vine/android/util/MediaUtility;

    invoke-direct {v0, p1}, Lco/vine/android/util/MediaUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lco/vine/android/util/UploadManager;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    .line 77
    return-void
.end method

.method public static addOrUpdateUpload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lco/vine/android/recorder/RecordSessionManager;)V
    .locals 15
    .parameter "context"
    .parameter "path"
    .parameter "hash"
    .parameter "reference"
    .parameter "rsm"

    .prologue
    .line 119
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v9

    .line 120
    .local v9, ownerId:J
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v8

    .line 121
    .local v8, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "uploads/upload"

    invoke-virtual {v8, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 122
    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 123
    const-string v1, "path"

    move-object/from16 v0, p1

    invoke-virtual {v8, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 125
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 128
    .local v7, c:Landroid/database/Cursor;
    new-instance v14, Landroid/content/ContentValues;

    invoke-direct {v14}, Landroid/content/ContentValues;-><init>()V

    .line 129
    .local v14, values:Landroid/content/ContentValues;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_2

    .line 130
    :cond_0
    invoke-static/range {p1 .. p1}, Lco/vine/android/recorder/RecordConfigUtils;->getThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 131
    .local v13, thumbnailPath:Ljava/lang/String;
    const-string v1, "path"

    move-object/from16 v0, p1

    invoke-virtual {v14, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    const-string v1, "thumbnail_path"

    invoke-virtual {v14, v1, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string v1, "hash"

    move-object/from16 v0, p2

    invoke-virtual {v14, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    const-string v1, "status"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 135
    const-string v1, "reference"

    move-object/from16 v0, p3

    invoke-virtual {v14, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    const-string v1, "owner_id"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 138
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "uploads/put_new_upload"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v14}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 151
    .end local v13           #thumbnailPath:Ljava/lang/String;
    :goto_0
    if-eqz v7, :cond_1

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 152
    :cond_1
    return-void

    .line 141
    :cond_2
    const-string v11, "path=?"

    .line 142
    .local v11, selection:Ljava/lang/String;
    const/4 v1, 0x1

    new-array v12, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v12, v1

    .line 143
    .local v12, selectionArgs:[Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 144
    const-string v1, "hash"

    move-object/from16 v0, p2

    invoke-virtual {v14, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    :cond_3
    const-string v1, "status"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 148
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "uploads/put_values"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v8

    .line 149
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v8}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    const-string v3, "path=?"

    invoke-virtual {v1, v2, v14, v3, v12}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static addToUploadQueue(Landroid/content/Context;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "file"
    .parameter "thumbnail"
    .parameter "reference"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    :try_start_0
    invoke-static {p0}, Lco/vine/android/recorder/RecordConfigUtils;->getGenericConfig(Landroid/content/Context;)Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    iget-object v1, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processDir:Ljava/io/File;

    invoke-static {p0, v1, p1, p2, p3}, Lco/vine/android/util/UploadManager;->addToUploadQueue(Landroid/content/Context;Ljava/io/File;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 99
    :goto_0
    return-object v1

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-static {p0, v1, p1, p2, p3}, Lco/vine/android/util/UploadManager;->addToUploadQueue(Landroid/content/Context;Ljava/io/File;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static addToUploadQueue(Landroid/content/Context;Ljava/io/File;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "context"
    .parameter "dir"
    .parameter "file"
    .parameter "thumbnail"
    .parameter "reference"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, fileName:Ljava/lang/String;
    invoke-virtual {p2}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3, v0}, Lco/vine/android/recorder/RecordConfigUtils;->copyForUpload(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 87
    .local v2, videoFile:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, path:Ljava/lang/String;
    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->getThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, p3, v3}, Lco/vine/android/recorder/RecordConfigUtils;->copyForUpload(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p3

    .line 89
    iget-object v3, p2, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-static {v3}, Lco/vine/android/recorder/RecordSessionManager;->getFrameInfoFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->getFrameInfoPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v3, v4}, Lco/vine/android/recorder/RecordConfigUtils;->copyForUpload(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 90
    invoke-virtual {p2}, Lco/vine/android/recorder/RecordingFile;->getHash()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v1, v3, p3, p4}, Lco/vine/android/service/VineUploadService;->getUploadIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 92
    return-object v1
.end method

.method public static clearSp()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 577
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 578
    :try_start_0
    sget-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 579
    monitor-exit v1

    .line 580
    return-void

    .line 579
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static clearUploadCaptchas(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 452
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "uploads/put_values"

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 453
    .local v0, uri:Landroid/net/Uri$Builder;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 454
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "captcha_url"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    const-string v4, "1"

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v1, v4, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 456
    return-void
.end method

.method public static deleteUploadRecord(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6
    .parameter "context"
    .parameter "path"

    .prologue
    .line 185
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 186
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v3, "uploads/delete_upload"

    invoke-virtual {v0, v3}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 187
    const-string v2, "path=?"

    .line 188
    .local v2, whereClause:Ljava/lang/String;
    const/4 v3, 0x1

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    .line 189
    .local v1, whereArgs:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    const-string v5, "path=?"

    invoke-virtual {v3, v4, v5, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 190
    return-void
.end method

.method public static getAllPaths(Landroid/content/Context;)Ljava/util/LinkedHashMap;
    .locals 12
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 365
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    .line 366
    .local v10, paths:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v7

    .line 367
    .local v7, ownerId:J
    sget-object v0, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 368
    .local v1, contentUri:Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "_id ASC"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 370
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 371
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 372
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 373
    .local v9, path:Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 374
    .local v11, status:I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v10, v9, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 376
    .end local v9           #path:Ljava/lang/String;
    .end local v11           #status:I
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 378
    :cond_1
    return-object v10
.end method

.method private static getBaseUri()Landroid/net/Uri$Builder;
    .locals 3

    .prologue
    .line 193
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 194
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "content"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 195
    return-object v0
.end method

.method public static getHashSp(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 536
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 537
    :try_start_0
    sget-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_hash.sub"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 538
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getPendingPaths(Landroid/content/Context;)Ljava/util/LinkedList;
    .locals 6
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 385
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 386
    .local v3, pendingPaths:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-static {p0}, Lco/vine/android/util/UploadManager;->getAllPaths(Landroid/content/Context;)Ljava/util/LinkedHashMap;

    move-result-object v0

    .line 387
    .local v0, allPaths:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 388
    .local v2, path:Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 389
    .local v4, status:I
    const/4 v5, 0x2

    if-eq v4, v5, :cond_0

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 390
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 393
    .end local v2           #path:Ljava/lang/String;
    .end local v4           #status:I
    :cond_1
    return-object v3
.end method

.method public static getPendingPathsSp()Ljava/util/HashMap;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 499
    sget-object v6, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v6

    .line 501
    :try_start_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 502
    .local v3, pendingPaths:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v5, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 503
    .local v0, all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 504
    .local v2, key:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/util/UploadManager;->isKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 505
    const-string v5, "Key: {}"

    invoke-static {v5, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 506
    invoke-static {v2}, Lco/vine/android/util/UploadManager;->getStatusSp(Ljava/lang/String;)I

    move-result v4

    .line 507
    .local v4, status:I
    invoke-static {v2}, Lco/vine/android/util/UploadManager;->isUploadExpiredSp(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 508
    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 513
    :pswitch_0
    const-string v5, "cNotify"

    invoke-virtual {v3, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 531
    .end local v0           #all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;*>;"
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #key:Ljava/lang/String;
    .end local v4           #status:I
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5

    .line 510
    .restart local v0       #all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;*>;"
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #key:Ljava/lang/String;
    .restart local v4       #status:I
    :pswitch_1
    :try_start_1
    const-string v5, "aUpload"

    invoke-virtual {v3, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 517
    :cond_1
    packed-switch v4, :pswitch_data_1

    goto :goto_0

    .line 523
    :pswitch_2
    const-string v5, "cNotify"

    invoke-virtual {v3, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 519
    :pswitch_3
    const-string v5, "File does not exist any more (uploaded)."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 520
    const-string v5, "bPost"

    invoke-virtual {v3, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 530
    .end local v2           #key:Ljava/lang/String;
    .end local v4           #status:I
    :cond_2
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v3

    .line 508
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 517
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static getPostInfoSp(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 557
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 558
    :try_start_0
    sget-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_post.sub"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 559
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getReferenceCursor(Landroid/content/Context;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .parameter "context"
    .parameter "reference"

    .prologue
    const/4 v3, 0x0

    .line 104
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    :goto_0
    return-object v3

    .line 107
    :cond_0
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v7

    .line 108
    .local v7, ownerId:J
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v6

    .line 109
    .local v6, contentUri:Landroid/net/Uri$Builder;
    const-string v0, "uploads/reference"

    invoke-virtual {v6, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 110
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 111
    const-string v0, "reference"

    invoke-virtual {v6, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 112
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    goto :goto_0
.end method

.method public static getStatusSp(Ljava/lang/String;)I
    .locals 3
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 550
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 551
    :try_start_0
    sget-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    const/4 v2, -0x1

    invoke-interface {v0, p0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    monitor-exit v1

    return v0

    .line 552
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;
    .locals 11
    .parameter "context"
    .parameter "path"

    .prologue
    const/4 v3, 0x0

    .line 166
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v8

    .line 167
    .local v8, ownerId:J
    const/4 v10, 0x0

    .line 168
    .local v10, ret:Lco/vine/android/api/VineUpload;
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v7

    .line 169
    .local v7, contentUri:Landroid/net/Uri$Builder;
    const-string v0, "uploads/upload"

    invoke-virtual {v7, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 170
    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 171
    const-string v0, "path"

    invoke-virtual {v7, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 173
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v7}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 175
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 176
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 177
    invoke-static {p1, v6}, Lco/vine/android/api/VineUpload;->fromCursor(Ljava/lang/String;Landroid/database/Cursor;)Lco/vine/android/api/VineUpload;

    move-result-object v10

    .line 179
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 181
    :cond_1
    return-object v10
.end method

.method public static getUploadTimeSp(Ljava/lang/String;)J
    .locals 5
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 543
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 544
    :try_start_0
    sget-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_upload_time.sub"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    .line 545
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getUrisSp(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 564
    sget-object v1, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v1

    .line 565
    const/4 v0, 0x2

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    sget-object v3, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_video_url.sub"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    sget-object v3, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_thumbnail_url.sub"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    monitor-exit v1

    return-object v0

    .line 567
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static initUploadPref(Landroid/content/Context;)V
    .locals 2
    .parameter "context"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 472
    const-string v0, "upload"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    .line 473
    return-void
.end method

.method public static isEmptySp()Z
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 482
    sget-object v4, Lco/vine/android/util/UploadManager;->SHARED_LOCK:[I

    monitor-enter v4

    .line 483
    :try_start_0
    sget-object v5, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 484
    .local v0, all:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;*>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 485
    :cond_0
    monitor-exit v4

    .line 492
    :goto_0
    return v3

    .line 487
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 488
    .local v2, key:Ljava/lang/String;
    invoke-static {v2}, Lco/vine/android/util/UploadManager;->isKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 489
    const/4 v3, 0x0

    monitor-exit v4

    goto :goto_0

    .line 494
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #key:Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 492
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_3
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public static isKey(Ljava/lang/String;)Z
    .locals 1
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 477
    const-string v0, ".sub"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isUploadExpiredSp(Ljava/lang/String;)Z
    .locals 6
    .parameter "path"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 572
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lco/vine/android/util/UploadManager;->mUploadPref:Landroid/content/SharedPreferences;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_upload_time.sub"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static removeFromUploadQueue(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "path"

    .prologue
    .line 80
    invoke-static {p0, p1}, Lco/vine/android/service/VineUploadService;->getDiscardIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 81
    return-void
.end method

.method public static setHash(Landroid/content/Context;Lco/vine/android/api/VineUpload;Ljava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "upload"
    .parameter "hash"

    .prologue
    const/4 v4, 0x0

    .line 397
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 398
    .local v0, contentUri:Landroid/net/Uri$Builder;
    iput-object p2, p1, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    .line 399
    const-string v1, "uploads/put_hash"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "path"

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "hash"

    invoke-virtual {v1, v2, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 402
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 403
    return-void
.end method

.method public static setPostInfo(Landroid/content/Context;Lco/vine/android/api/VineUpload;Lco/vine/android/api/VineUpload$PostInfo;)V
    .locals 5
    .parameter "context"
    .parameter "upload"
    .parameter "info"

    .prologue
    const/4 v4, 0x0

    .line 406
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting post info for path="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with caption="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", twitter="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p2, Lco/vine/android/api/VineUpload$PostInfo;->postToTwitter:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", facebook="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p2, Lco/vine/android/api/VineUpload$PostInfo;->postToFacebook:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 408
    invoke-virtual {p2}, Lco/vine/android/api/VineUpload$PostInfo;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lco/vine/android/api/VineUpload;->postInfo:Ljava/lang/String;

    .line 409
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 410
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "uploads/put_post_info"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "path"

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "post_info"

    invoke-virtual {p2}, Lco/vine/android/api/VineUpload$PostInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 413
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 414
    return-void
.end method

.method public static setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;I)V
    .locals 1
    .parameter "context"
    .parameter "upload"
    .parameter "status"

    .prologue
    .line 417
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lco/vine/android/util/UploadManager;->setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;ILjava/lang/String;)V

    .line 418
    return-void
.end method

.method public static setStatus(Landroid/content/Context;Lco/vine/android/api/VineUpload;ILjava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "upload"
    .parameter "status"
    .parameter "captcha"

    .prologue
    const/4 v4, 0x0

    .line 421
    iput p2, p1, Lco/vine/android/api/VineUpload;->status:I

    .line 422
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 423
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "uploads/put_status"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "path"

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "status"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 426
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 427
    const-string v1, "captcha_url"

    invoke-virtual {v0, v1, p3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 429
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 430
    return-void
.end method

.method public static setUploadTime(Landroid/content/Context;Lco/vine/android/api/VineUpload;)V
    .locals 6
    .parameter "context"
    .parameter "upload"

    .prologue
    const/4 v5, 0x0

    .line 433
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Lco/vine/android/api/VineUpload;->uploadTime:J

    .line 434
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 435
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "uploads/put_upload_time"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "path"

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "upload_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 438
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v5, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 439
    return-void
.end method

.method public static setUris(Landroid/content/Context;Lco/vine/android/api/VineUpload;[Ljava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "upload"
    .parameter "uris"

    .prologue
    const/4 v4, 0x0

    .line 442
    invoke-virtual {p1, p2}, Lco/vine/android/api/VineUpload;->setUris([Ljava/lang/String;)V

    .line 443
    invoke-static {}, Lco/vine/android/util/UploadManager;->getBaseUri()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 444
    .local v0, contentUri:Landroid/net/Uri$Builder;
    const-string v1, "uploads/put_uris"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "path"

    iget-object v3, p1, Lco/vine/android/api/VineUpload;->path:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "video_url"

    const/4 v3, 0x0

    aget-object v3, p2, v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "thumbnail_url"

    const/4 v3, 0x1

    aget-object v3, p2, v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 448
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 449
    return-void
.end method

.method public static uploadListIsEmpty(Landroid/content/Context;)Z
    .locals 8
    .parameter "context"

    .prologue
    const/4 v3, 0x0

    const/4 v7, 0x1

    .line 155
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 157
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 158
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v0, v7, :cond_1

    .line 159
    .local v7, cursorIsEmpty:Z
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 162
    .end local v7           #cursorIsEmpty:Z
    :cond_0
    return v7

    .line 158
    :cond_1
    const/4 v7, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized post(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;
    .locals 22
    .parameter "context"
    .parameter "postType"
    .parameter "path"
    .parameter "info"

    .prologue
    .line 199
    monitor-enter p0

    :try_start_0
    invoke-static/range {p1 .. p1}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v2

    .line 200
    .local v2, api:Lco/vine/android/client/VineAPI;
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 202
    .local v8, postBody:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v11

    .line 203
    .local v11, upload:Lco/vine/android/api/VineUpload;
    if-nez v11, :cond_0

    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    invoke-direct/range {v18 .. v19}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    :goto_0
    monitor-exit p0

    return-object v18

    .line 205
    :cond_0
    :try_start_1
    invoke-virtual {v11}, Lco/vine/android/api/VineUpload;->getUris()[Ljava/lang/String;

    move-result-object v13

    .line 207
    .local v13, uris:[Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lco/vine/android/util/MediaUtility;->getUploadType(Landroid/content/Context;)I

    move-result v12

    .line 209
    .local v12, uploadType:I
    packed-switch v12, :pswitch_data_0

    .line 216
    const-string v9, ""

    .line 221
    .local v9, prefix:Ljava/lang/String;
    :goto_1
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x0

    aget-object v19, v13, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 222
    .local v15, videoUrl:Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x1

    aget-object v19, v13, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 224
    .local v10, thumbnailUrl:Ljava/lang/String;
    const-string v18, "videoUrl"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    const-string v18, "thumbnailUrl"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    const-string v18, "model"

    sget-object v19, Landroid/os/Build;->MODEL:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    const-string v18, "device"

    sget-object v19, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 230
    :try_start_2
    const-string v18, "version"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v19

    move-object/from16 v0, v19

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 237
    :goto_2
    :try_start_3
    const-string v18, "type_post"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 238
    invoke-virtual {v2}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "posts"

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 239
    .local v14, url:Ljava/lang/StringBuilder;
    const/16 v18, 0xc

    invoke-static/range {v18 .. v18}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v16

    .line 240
    .local v16, vp:Lco/vine/android/api/VineParserReader;
    if-eqz p4, :cond_3

    .line 241
    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_5

    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_5

    .line 242
    const-string v18, "Added description: {}."

    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v18 .. v19}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 243
    const-string v18, "description"

    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lco/vine/android/util/Util;->cleanse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    if-eqz v18, :cond_1

    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_1

    .line 245
    const-string v18, "entities"

    move-object/from16 v0, p4

    iget-object v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lco/vine/android/api/VineUpload$PostInfo;->entitiesToMaps(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    :cond_1
    :goto_3
    move-object/from16 v0, p4

    iget-wide v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->channelId:J

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x0

    cmp-long v18, v18, v20

    if-lez v18, :cond_2

    .line 251
    const-string v18, "channelId"

    move-object/from16 v0, p4

    iget-wide v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->channelId:J

    move-wide/from16 v19, v0

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    :cond_2
    const-string v19, "postToTwitter"

    move-object/from16 v0, p4

    iget-boolean v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->postToTwitter:Z

    move/from16 v18, v0

    if-eqz v18, :cond_6

    const-string v18, "1"

    :goto_4
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    const-string v19, "postToFacebook"

    move-object/from16 v0, p4

    iget-boolean v0, v0, Lco/vine/android/api/VineUpload$PostInfo;->postToFacebook:Z

    move/from16 v18, v0

    if-eqz v18, :cond_7

    const-string v18, "1"

    :goto_5
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    :cond_3
    const-string v18, "Prefix {}"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    const-string v18, "Adding URI Params: {}, {}."

    const/16 v19, 0x0

    aget-object v19, v13, v19

    const/16 v20, 0x1

    aget-object v20, v13, v20

    invoke-static/range {v18 .. v20}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 262
    invoke-static/range {p1 .. p1}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v3

    .line 263
    .local v3, client:Lco/vine/android/network/ThreadedHttpOperationClient;
    move-object/from16 v0, v16

    invoke-static {v3, v14, v2, v8, v0}, Lco/vine/android/network/HttpOperation;->createBasicAuthJsonPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v7

    .line 265
    .local v7, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v7}, Lco/vine/android/network/HttpOperation;->isOK()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v18

    if-eqz v18, :cond_a

    .line 267
    :try_start_4
    const-string v18, "type_post"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 268
    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lco/vine/android/api/VinePostResponse;

    .line 269
    .local v17, vpr:Lco/vine/android/api/VinePostResponse;
    if-nez v17, :cond_9

    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    invoke-direct/range {v18 .. v19}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0

    .line 274
    .end local v17           #vpr:Lco/vine/android/api/VinePostResponse;
    :catch_0
    move-exception v4

    .line 275
    .local v4, e:Ljava/lang/Exception;
    :try_start_5
    const-string v18, "Update timeline failed."

    const/16 v19, 0x0

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v4, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 277
    .end local v4           #e:Ljava/lang/Exception;
    :cond_4
    :goto_6
    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x1

    invoke-direct/range {v18 .. v19}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_0

    .line 199
    .end local v2           #api:Lco/vine/android/client/VineAPI;
    .end local v3           #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    .end local v7           #op:Lco/vine/android/network/HttpOperation;
    .end local v8           #postBody:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9           #prefix:Ljava/lang/String;
    .end local v10           #thumbnailUrl:Ljava/lang/String;
    .end local v11           #upload:Lco/vine/android/api/VineUpload;
    .end local v12           #uploadType:I
    .end local v13           #uris:[Ljava/lang/String;
    .end local v14           #url:Ljava/lang/StringBuilder;
    .end local v15           #videoUrl:Ljava/lang/String;
    .end local v16           #vp:Lco/vine/android/api/VineParserReader;
    :catchall_0
    move-exception v18

    monitor-exit p0

    throw v18

    .line 211
    .restart local v2       #api:Lco/vine/android/client/VineAPI;
    .restart local v8       #postBody:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v11       #upload:Lco/vine/android/api/VineUpload;
    .restart local v12       #uploadType:I
    .restart local v13       #uris:[Ljava/lang/String;
    :pswitch_0
    :try_start_6
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lco/vine/android/client/VineAPI;->getAmazonUrl()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static/range {p1 .. p1}, Lco/vine/android/client/Amazon;->getBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 212
    .restart local v9       #prefix:Ljava/lang/String;
    goto/16 :goto_1

    .line 248
    .restart local v10       #thumbnailUrl:Ljava/lang/String;
    .restart local v14       #url:Ljava/lang/StringBuilder;
    .restart local v15       #videoUrl:Ljava/lang/String;
    .restart local v16       #vp:Lco/vine/android/api/VineParserReader;
    :cond_5
    const-string v18, "empty description."

    invoke-static/range {v18 .. v18}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 253
    :cond_6
    const-string v18, "0"

    goto/16 :goto_4

    .line 254
    :cond_7
    const-string v18, "0"

    goto/16 :goto_5

    .line 257
    .end local v14           #url:Ljava/lang/StringBuilder;
    .end local v16           #vp:Lco/vine/android/api/VineParserReader;
    :cond_8
    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    invoke-direct/range {v18 .. v19}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0

    .line 270
    .restart local v3       #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    .restart local v7       #op:Lco/vine/android/network/HttpOperation;
    .restart local v14       #url:Ljava/lang/StringBuilder;
    .restart local v16       #vp:Lco/vine/android/api/VineParserReader;
    .restart local v17       #vpr:Lco/vine/android/api/VinePostResponse;
    :cond_9
    :try_start_7
    new-instance v6, Landroid/content/Intent;

    const-string v18, "co.vine.android.service.mergePost"

    move-object/from16 v0, v18

    invoke-direct {v6, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 271
    .local v6, intent:Landroid/content/Intent;
    const-string v18, "post"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 272
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    goto :goto_6

    .line 279
    .end local v6           #intent:Landroid/content/Intent;
    .end local v17           #vpr:Lco/vine/android/api/VinePostResponse;
    :cond_a
    :try_start_8
    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/api/VineError;

    .line 280
    .local v5, error:Lco/vine/android/api/VineError;
    if-eqz v7, :cond_c

    if-eqz v5, :cond_c

    .line 281
    const-string v18, "ERROR POSTING: {} {}"

    iget v0, v7, Lco/vine/android/network/HttpOperation;->statusCode:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    iget-object v0, v5, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v18 .. v20}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 283
    iget v0, v5, Lco/vine/android/api/VineError;->errorCode:I

    move/from16 v18, v0

    sget-object v19, Lco/vine/android/api/VineError$VineKnownErrors;->INVALID_SESSION:Lco/vine/android/api/VineError$VineKnownErrors;

    move-object/from16 v0, v19

    iget v0, v0, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_b

    .line 284
    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v21}, Lco/vine/android/service/PostResult;-><init>(ZZLjava/lang/String;)V

    goto/16 :goto_0

    .line 286
    :cond_b
    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    const/16 v20, 0x0

    iget-object v0, v5, Lco/vine/android/api/VineError;->data:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-direct/range {v18 .. v21}, Lco/vine/android/service/PostResult;-><init>(ZZLjava/lang/String;)V

    goto/16 :goto_0

    .line 289
    :cond_c
    const-string v18, "UNKNOWN ERROR WHILE POSTING."

    invoke-static/range {v18 .. v18}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    .line 290
    new-instance v18, Lco/vine/android/service/PostResult;

    const/16 v19, 0x0

    invoke-direct/range {v18 .. v19}, Lco/vine/android/service/PostResult;-><init>(Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    .line 231
    .end local v3           #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    .end local v5           #error:Lco/vine/android/api/VineError;
    .end local v7           #op:Lco/vine/android/network/HttpOperation;
    .end local v14           #url:Ljava/lang/StringBuilder;
    .end local v16           #vp:Lco/vine/android/api/VineParserReader;
    :catch_1
    move-exception v18

    goto/16 :goto_2

    .line 209
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized postShare(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;
    .locals 1
    .parameter "context"
    .parameter "videoPath"
    .parameter "info"

    .prologue
    .line 296
    monitor-enter p0

    :try_start_0
    const-string v0, "type_post"

    invoke-virtual {p0, p1, v0, p2, p3}, Lco/vine/android/util/UploadManager;->post(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized upload(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 15
    .parameter "serviceAsyncTask"
    .parameter "encoded"
    .parameter "thumbnail"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 302
    monitor-enter p0

    :try_start_0
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 303
    .local v4, file:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_0

    .line 304
    const-string v11, "Files does not exist."

    invoke-static {v11}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    const/4 v11, 0x0

    .line 357
    :goto_0
    monitor-exit p0

    return-object v11

    .line 308
    :cond_0
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v11

    move-object/from16 v0, p4

    invoke-static {v11, v0}, Lco/vine/android/util/UploadManager;->getUpload(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;

    move-result-object v9

    .line 309
    .local v9, upload:Lco/vine/android/api/VineUpload;
    if-nez v9, :cond_1

    .line 310
    new-instance v11, Ljava/lang/Exception;

    const-string v12, "Upload record was null"

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 355
    .end local v9           #upload:Lco/vine/android/api/VineUpload;
    :catch_0
    move-exception v2

    .line 356
    .local v2, e:Ljava/lang/Exception;
    :try_start_2
    const-string v11, "Upload failed: {}"

    move-object/from16 v0, p4

    invoke-static {v11, v0, v2}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 357
    const/4 v11, 0x0

    goto :goto_0

    .line 313
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v9       #upload:Lco/vine/android/api/VineUpload;
    :cond_1
    :try_start_3
    invoke-static/range {p2 .. p2}, Lco/vine/android/recorder/HashAsyncTask;->getMD5Checksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 314
    .local v7, hash:Ljava/lang/String;
    iget-object v3, v9, Lco/vine/android/api/VineUpload;->hash:Ljava/lang/String;

    .line 315
    .local v3, expected:Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 316
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 317
    const-string v11, "Invalid hash: actual {}, expected {}."

    invoke-static {v11, v7, v3}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 318
    const/4 v11, 0x0

    goto :goto_0

    .line 320
    :cond_2
    new-instance v11, Lco/vine/android/VineException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected hash was invalid: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v11}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 324
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 325
    .local v1, context:Landroid/content/Context;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v11, "yyyy/MM/dd/"

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v6, v11, v12}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 326
    .local v6, formatter:Ljava/text/SimpleDateFormat;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v12, Ljava/util/Date;

    invoke-direct {v12}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6, v12}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "_"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v12, v13, v14}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v12

    iget v12, v12, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".mp4"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 330
    .local v5, fileName:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->isCancelled()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 331
    const-string v11, "Task is already cancelled."

    invoke-static {v11}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 332
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 335
    :cond_4
    iget-object v11, p0, Lco/vine/android/util/UploadManager;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0, v4, v1, v5}, Lco/vine/android/util/MediaUtility;->getVideoUri(Lco/vine/android/util/VineProgressListener;Ljava/io/File;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 338
    .local v10, videoUri:Ljava/lang/String;
    if-nez v10, :cond_5

    .line 339
    new-instance v11, Ljava/lang/Exception;

    const-string v12, "Failed to upload video."

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 302
    .end local v1           #context:Landroid/content/Context;
    .end local v3           #expected:Ljava/lang/String;
    .end local v4           #file:Ljava/io/File;
    .end local v5           #fileName:Ljava/lang/String;
    .end local v6           #formatter:Ljava/text/SimpleDateFormat;
    .end local v7           #hash:Ljava/lang/String;
    .end local v9           #upload:Lco/vine/android/api/VineUpload;
    .end local v10           #videoUri:Ljava/lang/String;
    :catchall_0
    move-exception v11

    monitor-exit p0

    throw v11

    .line 342
    .restart local v1       #context:Landroid/content/Context;
    .restart local v3       #expected:Ljava/lang/String;
    .restart local v4       #file:Ljava/io/File;
    .restart local v5       #fileName:Ljava/lang/String;
    .restart local v6       #formatter:Ljava/text/SimpleDateFormat;
    .restart local v7       #hash:Ljava/lang/String;
    .restart local v9       #upload:Lco/vine/android/api/VineUpload;
    .restart local v10       #videoUri:Ljava/lang/String;
    :cond_5
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->isCancelled()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 343
    const-string v11, "Task is already cancelled."

    invoke-static {v11}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 344
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 347
    :cond_6
    iget-object v11, p0, Lco/vine/android/util/UploadManager;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    new-instance v12, Ljava/io/File;

    move-object/from16 v0, p3

    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lco/vine/android/service/VineUploadService$ServiceAsyncTask;->getContext()Landroid/content/Context;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v11, v0, v5, v12, v13}, Lco/vine/android/util/MediaUtility;->getThumbnailUri(Lco/vine/android/util/VineProgressListener;Ljava/lang/String;Ljava/io/File;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 350
    .local v8, thumbnailUrl:Ljava/lang/String;
    if-nez v8, :cond_7

    .line 351
    new-instance v11, Ljava/lang/Exception;

    const-string v12, "Failed to upload thumbnail."

    invoke-direct {v11, v12}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v11

    .line 354
    :cond_7
    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v10, v11, v12

    const/4 v12, 0x1

    aput-object v8, v11, v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto/16 :goto_0
.end method
