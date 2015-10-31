.class public Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
.super Ljava/lang/Object;
.source "RecordConfigUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/RecordConfigUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecordConfig"
.end annotation


# static fields
.field private static final CAMERA_SWITCH_ENABLED:Z = true

.field private static final FLASH_SWITCH_ENABLED:Z = false

#the value of this static final field might be set in the static constructor
.field public static final HAS_GALAXY_FOCUS_PROBLEM:Z = false

.field private static final INITIAL_VIDEO_BUFFER_COUNT:I = 0x96

.field private static final INVALID_ASPECT_RATIO:F = 0.0f

.field private static final KEY_ASPECT_RATIO_OVERRIDE_bf:Ljava/lang/String; = "aspect_ratio_or_bf"

.field private static final KEY_ASPECT_RATIO_OVERRIDE_ff:Ljava/lang/String; = "aspect_ratio_or_ff"

.field private static final KEY_BUFFER_SIZE:Ljava/lang/String; = "bufferSize"

.field private static final KEY_CAMERA_SWITCH_ENABLED:Ljava/lang/String; = "cameraSwitchEnabled"

.field private static final KEY_FLASH_SWITCH_ENABLED:Ljava/lang/String; = "flashSwitchEnabled"

.field private static final KEY_FRAME_RATE:Ljava/lang/String; = "frameRate"

.field private static final KEY_MAX_DURATION:Ljava/lang/String; = "maxDuration"

.field private static final KEY_PREALLOCATE_BUFFER:Ljava/lang/String; = "preAllocateBuffer"

.field private static final KEY_PREF:Ljava/lang/String; = "RecordConfig"

.field private static final KEY_PREVIEW_HEIGHT:Ljava/lang/String; = "previewHeight"

.field private static final KEY_PREVIEW_WIDTH:Ljava/lang/String; = "previewWidth"

.field private static final KEY_PRE_RATIO:Ljava/lang/String; = "pre_ratio"

.field private static final KEY_PROCESS_ON_SD:Ljava/lang/String; = "processOnSD"

.field private static final KEY_RECORDING_ENABLED:Ljava/lang/String; = "recordingEnabled"

.field private static final KEY_TARGET_SIZE:Ljava/lang/String; = "targetSize"

.field private static final KEY_UPDATE_TIME:Ljava/lang/String; = "updateTime"

.field private static final KEY_ZOOM_ENABLED:Ljava/lang/String; = "zoomEnabled"

.field private static final PREVIEW_WIDTH:I = 0x280

.field private static final PRE_ALLOCATE_RATIO:F = 1.5f

#the value of this static final field might be set in the static constructor
.field private static final PROCESS_ON_SD_CARD:Z = false

.field private static final PROGRESS_MAX:I = 0x1770

.field public static final SHOULD_OVERRIDED_FRONTFACING_ASPECT_RATIO:Z = false

.field public static final SHOULD_OVERRIDE_BACKFACING_ASPECT_RATIO:Z = false

.field private static final SIX_SECONDS:F = 6000.0f

.field private static final TARGET_FRAME_RATE:I = 0x1e

.field private static final ZOOM_ENABLED:Z = true


# instance fields
.field public final backFacingAspectRatioOverride:F

.field public final bufferCount:I

.field public final cameraSwitchEnabled:Z

.field public final flashSwitchEnabled:Z

.field public final frontFacingAspectRatioOverride:F

.field public final highQuality:Z

.field public final maxDuration:I

.field public final preAllocRatio:D

.field public final preAllocateBuffer:Z

.field public final previewHeight:I

.field public final previewWidth:I

.field public final processDir:Ljava/io/File;

.field public final processOnSd:Z

.field public final recordingEnabled:Z

.field public final targetFrameRate:I

.field public final targetSize:I

.field public final zoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 52
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "GT-I9505"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "GT-I9506"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "GT-I9500"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SGH-I337"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SGH-M919"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SCH-I545"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SPH-L720"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "GT-I9508"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SHV-E300"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SCH-R970"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "SM-N900"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "LG-D801"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->HAS_GALAXY_FOCUS_PROBLEM:Z

    .line 67
    sget-boolean v0, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    sput-boolean v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->PROCESS_ON_SD_CARD:Z

    return-void

    .line 52
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 11
    .parameter "context"

    .prologue
    const/16 v10, 0x1e0

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    invoke-static {p1, v4}, Lco/vine/android/util/SystemUtil;->getMemoryRatio(Landroid/content/Context;Z)D

    move-result-wide v1

    .line 119
    .local v1, memRatio:D
    const-wide/high16 v6, 0x3ff0

    cmpl-double v6, v1, v6

    if-ltz v6, :cond_1

    move v0, v4

    .line 122
    .local v0, defaultRecordingEnabled:Z
    :goto_0
    iput-boolean v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->highQuality:Z

    .line 124
    const-string v6, "RecordConfig"

    invoke-virtual {p1, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 125
    .local v3, sp:Landroid/content/SharedPreferences;
    const-wide/high16 v6, 0x4000

    cmpl-double v6, v1, v6

    if-ltz v6, :cond_2

    const-string v6, "pre_ratio"

    const/high16 v7, 0x3fc0

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v6

    float-to-double v6, v6

    :goto_1
    iput-wide v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    .line 126
    const-string v6, "preAllocateBuffer"

    invoke-interface {v3, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocateBuffer:Z

    .line 127
    const-string v6, "recordingEnabled"

    invoke-interface {v3, v6, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->recordingEnabled:Z

    .line 128
    const-string v6, "zoomEnabled"

    invoke-interface {v3, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->zoomEnabled:Z

    .line 129
    sget-boolean v6, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->PROCESS_ON_SD_CARD:Z

    if-nez v6, :cond_0

    const-string v6, "processOnSD"

    sget-boolean v7, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->PROCESS_ON_SD_CARD:Z

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_3

    :cond_0
    const-string v6, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v6, v4

    :goto_2
    iput-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processOnSd:Z

    .line 130
    iget-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processOnSd:Z

    if-eqz v6, :cond_4

    invoke-static {}, Lco/vine/android/recorder/RecordConfigUtils;->access$000()Ljava/io/File;

    move-result-object v6

    :goto_3
    iput-object v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processDir:Ljava/io/File;

    .line 131
    const-string v6, "cameraSwitchEnabled"

    invoke-interface {v3, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasFrontFacingCamera()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v6

    if-eqz v6, :cond_5

    move v6, v4

    :goto_4
    iput-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->cameraSwitchEnabled:Z

    .line 132
    const-string v6, "flashSwitchEnabled"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    iput-boolean v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->flashSwitchEnabled:Z

    .line 133
    const-string v5, "frameRate"

    const/16 v6, 0x1e

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    .line 134
    const-string v5, "targetSize"

    invoke-interface {v3, v5, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetSize:I

    .line 135
    const-string v5, "previewWidth"

    const/16 v6, 0x280

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    iget-boolean v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->highQuality:Z

    if-eqz v5, :cond_6

    move v5, v4

    :goto_5
    div-int v5, v6, v5

    iput v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    .line 136
    const-string v5, "previewHeight"

    invoke-interface {v3, v5, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    iget-boolean v6, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->highQuality:Z

    if-eqz v6, :cond_7

    :goto_6
    div-int v4, v5, v4

    iput v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    .line 138
    const-string v4, "maxDuration"

    const/16 v5, 0x1770

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    .line 139
    const-string v4, "bufferSize"

    const/16 v5, 0x96

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-float v5, v5

    const v6, 0x45bb8000

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->bufferCount:I

    .line 140
    const-string v4, "aspect_ratio_or_ff"

    invoke-interface {v3, v4, v9}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v4

    iput v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->frontFacingAspectRatioOverride:F

    .line 141
    const-string v4, "aspect_ratio_or_bf"

    invoke-interface {v3, v4, v9}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v4

    iput v4, p0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->backFacingAspectRatioOverride:F

    .line 142
    return-void

    .end local v0           #defaultRecordingEnabled:Z
    .end local v3           #sp:Landroid/content/SharedPreferences;
    :cond_1
    move v0, v5

    .line 119
    goto/16 :goto_0

    .line 125
    .restart local v0       #defaultRecordingEnabled:Z
    .restart local v3       #sp:Landroid/content/SharedPreferences;
    :cond_2
    const-wide v6, 0x3fe999999999999aL

    goto/16 :goto_1

    :cond_3
    move v6, v5

    .line 129
    goto/16 :goto_2

    .line 130
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    goto/16 :goto_3

    :cond_5
    move v6, v5

    .line 131
    goto :goto_4

    :cond_6
    move v5, v8

    .line 135
    goto :goto_5

    :cond_7
    move v4, v8

    .line 136
    goto :goto_6
.end method

.method public static needsUpdate(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "RecordConfig"

    invoke-virtual {p0, v3, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "updateTime"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/32 v3, 0x493e0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static declared-synchronized update(Landroid/content/Context;Lorg/json/JSONObject;)Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .locals 7
    .parameter "context"
    .parameter "config"

    .prologue
    .line 149
    const-class v3, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    monitor-enter v3

    :try_start_0
    const-string v2, "Update config: {}."

    invoke-static {v2, p1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 150
    new-instance v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V

    .line 151
    .local v1, oldConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    const-string v2, "RecordConfig"

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 152
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v2, "preAllocateBuffer"

    const-string v4, "preAllocateBuffer"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocateBuffer:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 153
    const-string v2, "recordingEnabled"

    const-string v4, "recordingEnabled"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->recordingEnabled:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 154
    const-string v2, "zoomEnabled"

    const-string v4, "zoomEnabled"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->zoomEnabled:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 155
    const-string v2, "cameraSwitchEnabled"

    const-string v4, "cameraSwitchEnabled"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->cameraSwitchEnabled:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 156
    const-string v2, "flashSwitchEnabled"

    const-string v4, "flashSwitchEnabled"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->flashSwitchEnabled:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 157
    const-string v2, "processOnSD"

    const-string v4, "processOnSD"

    iget-boolean v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->processOnSd:Z

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 158
    const-string v2, "frameRate"

    const-string v4, "frameRate"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetFrameRate:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 159
    const-string v2, "targetSize"

    const-string v4, "targetSize"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->targetSize:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 160
    const-string v2, "previewWidth"

    const-string v4, "previewWidth"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewWidth:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 161
    const-string v2, "previewHeight"

    const-string v4, "previewHeight"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->previewHeight:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 162
    const-string v2, "bufferSize"

    const-string v4, "bufferSize"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->bufferCount:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 163
    const-string v2, "maxDuration"

    const-string v4, "maxDuration"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 164
    const-string v2, "pre_ratio"

    const-string v4, "pre_ratio"

    iget-wide v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->preAllocRatio:D

    invoke-virtual {p1, v4, v5, v6}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 165
    const-string v2, "aspect_ratio_or_ff"

    const-string v4, "aspect_ratio_or_ff"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->frontFacingAspectRatioOverride:F

    float-to-double v5, v5

    invoke-virtual {p1, v4, v5, v6}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 166
    const-string v2, "aspect_ratio_or_bf"

    const-string v4, "aspect_ratio_or_bf"

    iget v5, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->backFacingAspectRatioOverride:F

    float-to-double v5, v5

    invoke-virtual {p1, v4, v5, v6}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 167
    const-string v2, "updateTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-interface {v0, v2, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 168
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 169
    new-instance v2, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    invoke-direct {v2, p0}, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v3

    return-object v2

    .line 149
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #oldConfig:Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method
