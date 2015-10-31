.class public Lco/vine/android/recorder/RecordConfigUtils;
.super Ljava/lang/Object;
.source "RecordConfigUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field public static final AUDIO_BUFFER_SIZE:I = 0x0

.field public static final AUDIO_CONTAINER_FORMAT:Ljava/lang/String; = "mp4"

.field public static final AUDIO_FORMAT:I = 0x10

#the value of this static final field might be set in the static constructor
.field public static final AUDIO_RUNNABLE_SAMPLE_SIZE:I = 0x0

.field public static final AUDIO_SAMPLE_PER_MS_MAX:I = 0x30

.field public static final AUDIO_SAMPLE_PER_NS_EXACT:D = 0.0441

.field public static final AUDIO_SAMPLE_RATE_HZ:I = 0xac44

.field public static final DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config; = null

.field public static final DEFAULT_TARGET_SIZE:I = 0x1e0

.field public static final EDITING_THUMBNAIL_SIZE_DP:I = 0x40

.field public static final FOLDER_AUDIO:Ljava/lang/String; = "audio"

.field public static final FOLDER_RAW:Ljava/lang/String; = "raw"

.field public static final FOLDER_ROOT_PROCESS:Ljava/lang/String; = "process"

.field private static final FOLDER_ROOT_PROCESS_DEBUG:Ljava/io/File; = null

.field private static final FOLDER_ROOT_SAVE:Ljava/lang/String; = null

.field public static final FOLDER_ROOT_TO_UPLOAD:Ljava/lang/String; = "upload"

.field public static final HIGHEST_PROFILE:I = 0x4

.field public static final MAX_DRAFTS:I = 0x9

.field public static final N_AUDIO_CHANNELS:I = 0x1

.field public static final N_IMAGE_CHANNELS:I = 0x4

.field public static final PROGRESS_THRESHOLD:I = 0x3e8

.field public static final PROGRESS_TIMER_SLEEP:I = 0x23

.field private static final UPLOAD_IMAGE_EXTENSION:Ljava/lang/String; = "_image"

.field public static final VIDEO_BIT_RATE:I = 0xf4240

.field public static final VIDEO_CONTAINER_FORMAT:Ljava/lang/String; = "mp4"

.field private static mGenericConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 186
    const v0, 0xac44

    const/16 v1, 0x10

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v0

    sput v0, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_BUFFER_SIZE:I

    .line 188
    sget v0, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_BUFFER_SIZE:I

    if-lez v0, :cond_0

    sget v0, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_BUFFER_SIZE:I

    :goto_0
    sput v0, Lco/vine/android/recorder/RecordConfigUtils;->AUDIO_RUNNABLE_SAMPLE_SIZE:I

    .line 190
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    sput-object v0, Lco/vine/android/recorder/RecordConfigUtils;->DEFAULT_BITMAP_CONFIG:Landroid/graphics/Bitmap$Config;

    .line 200
    new-instance v0, Ljava/io/File;

    sget-object v1, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, "Vine"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/recorder/RecordConfigUtils;->FOLDER_ROOT_SAVE:Ljava/lang/String;

    .line 202
    new-instance v0, Ljava/io/File;

    sget-object v1, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    const-string v2, "vine_capture"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lco/vine/android/recorder/RecordConfigUtils;->FOLDER_ROOT_PROCESS_DEBUG:Ljava/io/File;

    return-void

    .line 188
    :cond_0
    const/16 v0, 0x1e00

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method static synthetic access$000()Ljava/io/File;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->FOLDER_ROOT_PROCESS_DEBUG:Ljava/io/File;

    return-object v0
.end method

.method public static copyForUpload(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "dir"
    .parameter "path"
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 291
    .local v0, actualFile:Ljava/io/File;
    invoke-static {p0, p2}, Lco/vine/android/recorder/RecordConfigUtils;->getUploadFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 292
    .local v1, finalName:Ljava/io/File;
    invoke-static {v0, v1}, Lorg/apache/commons/io/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 293
    return-object v1
.end method

.method public static copySilently(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .parameter "from"
    .parameter "to"

    .prologue
    .line 261
    :try_start_0
    invoke-static {p0, p1}, Lorg/apache/commons/io/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 262
    :catch_0
    move-exception v0

    .line 263
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Failed to copy"

    invoke-static {v1, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 264
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static deleteNonFolders(Ljava/io/File;)V
    .locals 5
    .parameter "f"

    .prologue
    .line 241
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 242
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .local v0, arr$:[Ljava/io/File;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 243
    .local v1, c:Ljava/io/File;
    invoke-static {v1}, Lco/vine/android/recorder/RecordConfigUtils;->deleteNonFolders(Ljava/io/File;)V

    .line 242
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 246
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #c:Ljava/io/File;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :cond_0
    return-void
.end method

.method public static deletePreProcess(Ljava/io/File;)V
    .locals 2
    .parameter "root"

    .prologue
    .line 237
    new-instance v0, Ljava/io/File;

    const-string v1, "process"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->deleteNonFolders(Ljava/io/File;)V

    .line 238
    return-void
.end method

.method public static declared-synchronized getCameraRollFile(Landroid/content/Context;J)Ljava/io/File;
    .locals 13
    .parameter "context"
    .parameter "startTime"

    .prologue
    const/4 v11, 0x0

    .line 308
    const-class v12, Lco/vine/android/recorder/RecordConfigUtils;

    monitor-enter v12

    const/4 v9, 0x0

    .line 309
    .local v9, mediaStorageDir:Ljava/io/File;
    :try_start_0
    const-string v0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 310
    new-instance v10, Ljava/io/File;

    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->FOLDER_ROOT_SAVE:Ljava/lang/String;

    invoke-direct {v10, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v9           #mediaStorageDir:Ljava/io/File;
    .local v10, mediaStorageDir:Ljava/io/File;
    move-object v9, v10

    .line 323
    .end local v10           #mediaStorageDir:Ljava/io/File;
    .restart local v9       #mediaStorageDir:Ljava/io/File;
    :cond_0
    :goto_0
    if-nez v9, :cond_2

    move-object v0, v11

    .line 335
    :goto_1
    monitor-exit v12

    return-object v0

    .line 313
    :cond_1
    const/4 v0, 0x3

    :try_start_1
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "_data"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "datetaken"

    aput-object v1, v2, v0

    .line 314
    .local v2, projection:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "datetaken DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 315
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    new-instance v10, Ljava/io/File;

    new-instance v0, Ljava/io/File;

    const-string v1, "_data"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    const-string v1, "Vine"

    invoke-direct {v10, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v9           #mediaStorageDir:Ljava/io/File;
    .restart local v10       #mediaStorageDir:Ljava/io/File;
    move-object v9, v10

    .end local v10           #mediaStorageDir:Ljava/io/File;
    .restart local v9       #mediaStorageDir:Ljava/io/File;
    goto :goto_0

    .line 318
    .end local v2           #projection:[Ljava/lang/String;
    .end local v6           #cursor:Landroid/database/Cursor;
    :catch_0
    move-exception v7

    .line 319
    .local v7, e:Ljava/lang/Exception;
    :try_start_2
    const-string v0, "Failed to get internal path"

    invoke-static {v0, v7}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 308
    .end local v7           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    monitor-exit v12

    throw v0

    .line 327
    :cond_2
    :try_start_3
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    .line 328
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_3

    .line 329
    const-string v0, "Failed to make dirs."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 330
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Failed to make directories. You will be doomed."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    move-object v0, v11

    .line 331
    goto :goto_1

    .line 334
    :cond_3
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy_MM_dd_HH_mm_sss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 335
    .local v8, fileName:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "mp4"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1
.end method

.method public static getFrameInfoPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 285
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".info"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getGenericConfig(Landroid/content/Context;)Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .locals 1
    .parameter "context"

    .prologue
    .line 38
    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->mGenericConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v0, p0}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/recorder/RecordConfigUtils;->mGenericConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    .line 41
    :cond_0
    sget-object v0, Lco/vine/android/recorder/RecordConfigUtils;->mGenericConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    return-object v0
.end method

.method public static getMaxAudioBufferSize(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)I
    .locals 4
    .parameter "config"

    .prologue
    .line 211
    iget v0, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    mul-int/lit8 v0, v0, 0x30

    int-to-double v0, v0

    const-wide v2, 0x3ff199999999999aL

    mul-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public static declared-synchronized getPreProcessFile(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "config"
    .parameter "folder"
    .parameter "id"
    .parameter "extension"

    .prologue
    .line 352
    const-class v1, Lco/vine/android/recorder/RecordConfigUtils;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processDir:Ljava/io/File;

    invoke-static {v0, p1, p2, p3}, Lco/vine/android/recorder/RecordConfigUtils;->getPreProcessFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getPreProcessFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .parameter "dir"
    .parameter "folder"
    .parameter "id"
    .parameter "extension"

    .prologue
    .line 340
    const-class v2, Lco/vine/android/recorder/RecordConfigUtils;

    monitor-enter v2

    :try_start_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    const-string v3, "process"

    invoke-direct {v1, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 341
    .local v0, mediaStorageDir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 342
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 343
    const-string v1, "Failed to make dirs."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 344
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "Failed to make directories. You will be doomed."

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    .end local v0           #mediaStorageDir:Ljava/io/File;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 347
    .restart local v0       #mediaStorageDir:Ljava/io/File;
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p3, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "."

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v2

    return-object v3

    :cond_1
    :try_start_2
    const-string v1, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public static getThumbnailPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_image"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeStampInNsFromSampleCounted(I)I
    .locals 4
    .parameter "currentCount"

    .prologue
    .line 215
    int-to-double v0, p0

    const-wide v2, 0x3fa694467381d7dcL

    div-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method private static declared-synchronized getUploadFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .parameter "root"
    .parameter "fileName"

    .prologue
    .line 297
    const-class v2, Lco/vine/android/recorder/RecordConfigUtils;

    monitor-enter v2

    :try_start_0
    new-instance v0, Ljava/io/File;

    const-string v1, "upload"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 298
    .local v0, mediaStorageDir:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 299
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 300
    const-string v1, "Failed to make dirs: {},"

    invoke-static {v1, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 301
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "Failed to make directories. You will be doomed."

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    .end local v0           #mediaStorageDir:Ljava/io/File;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 304
    .restart local v0       #mediaStorageDir:Ljava/io/File;
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v2

    return-object v1
.end method

.method public static getVideoBufferMax(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)I
    .locals 4
    .parameter "config"

    .prologue
    .line 219
    const-wide v0, 0x4130c8e000000000L

    iget v2, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-double v2, v2

    mul-double/2addr v0, v2

    const-wide v2, 0x408f400000000000L

    div-double/2addr v0, v2

    double-to-int v0, v0

    return v0
.end method

.method public static isDefaultFrontFacing()Z
    .locals 1

    .prologue
    .line 249
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static loadWasEverSuccessful(Landroid/content/Context;)Z
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    .line 270
    const-class v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "canLoad"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static newViewRecorder(Ljava/lang/String;II)Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .locals 1
    .parameter "output"
    .parameter "frameRate"
    .parameter "targetSize"

    .prologue
    const/4 v0, 0x0

    .line 233
    invoke-static {p0, p1, p2, v0, v0}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;IILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v0

    return-object v0
.end method

.method public static newViewRecorder(Ljava/lang/String;IILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .locals 7
    .parameter "output"
    .parameter "frameRate"
    .parameter "targetSize"
    .parameter "videoPacket"
    .parameter "audioPacket"

    .prologue
    .line 223
    new-instance v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    const/4 v4, 0x1

    move-object v1, p0

    move v2, p2

    move v3, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;-><init>(Ljava/lang/String;IIILcom/googlecode/javacv/cpp/avcodec$AVPacket;Lcom/googlecode/javacv/cpp/avcodec$AVPacket;)V

    .line 224
    .local v0, recorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setVideoCodec(I)V

    .line 225
    const v1, 0x15002

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setAudioCodec(I)V

    .line 226
    const-string v1, "mp4"

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFormat(Ljava/lang/String;)V

    .line 227
    const v1, 0xac44

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setSampleRate(I)V

    .line 228
    int-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->setFrameRate(D)V

    .line 229
    return-object v0
.end method

.method public static setLoadWasEverSuccessful(Landroid/content/Context;Z)V
    .locals 2
    .parameter "context"
    .parameter "canLoad"

    .prologue
    .line 274
    if-nez p0, :cond_0

    .line 278
    :goto_0
    return-void

    .line 277
    :cond_0
    const-class v0, Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "canLoad"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
