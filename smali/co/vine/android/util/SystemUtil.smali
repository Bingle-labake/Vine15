.class public Lco/vine/android/util/SystemUtil;
.super Ljava/lang/Object;
.source "SystemUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/SystemUtil$PrefBooleanState;
    }
.end annotation


# static fields
.field private static MEMORY_RATIO:D = 0.0

.field private static final TARGET_KEY_SINGLE_PLAYER:I = 0x1

.field private static final TARGET_KEY_VIEW_SERVER:I = 0x0

.field private static final TARGET_PROCESS_DEFAULT:Ljava/lang/String; = null

.field private static final TARGET_PROCESS_RECORD:Ljava/lang/String; = ":record"

.field private static final TARGET_SINGLE_PLAYER:Ljava/lang/String; = ":record"

.field private static final TARGET_VIEW_SERVER:Ljava/lang/String;

.field private static mProcessName:Ljava/lang/String;

.field private static mSubProcessName:Ljava/lang/String;

.field private static final mTargetProcessInfo:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 29
    const-wide/high16 v0, -0x4010

    sput-wide v0, Lco/vine/android/util/SystemUtil;->MEMORY_RATIO:D

    .line 31
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lco/vine/android/util/SystemUtil;->mTargetProcessInfo:Landroid/util/SparseArray;

    .line 34
    const/4 v0, 0x0

    sput-object v0, Lco/vine/android/util/SystemUtil;->TARGET_PROCESS_DEFAULT:Ljava/lang/String;

    .line 37
    sget-object v0, Lco/vine/android/util/SystemUtil;->TARGET_PROCESS_DEFAULT:Ljava/lang/String;

    sput-object v0, Lco/vine/android/util/SystemUtil;->TARGET_VIEW_SERVER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    return-void
.end method

.method public static getMemoryRatio(Landroid/content/Context;Z)D
    .locals 5
    .parameter "context"
    .parameter "isLargeMemoryClassEnabled"

    .prologue
    .line 59
    sget-wide v1, Lco/vine/android/util/SystemUtil;->MEMORY_RATIO:D

    const-wide/high16 v3, -0x4010

    cmpl-double v1, v1, v3

    if-nez v1, :cond_0

    .line 60
    const/4 v0, 0x0

    .line 62
    .local v0, mem:I
    if-nez p1, :cond_1

    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v1, v2, :cond_1

    .line 63
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->getMemoryRatioForLargeMemoryClass(Landroid/content/Context;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 70
    :goto_0
    if-nez v0, :cond_2

    const-wide/high16 v1, 0x3ff0

    :goto_1
    sput-wide v1, Lco/vine/android/util/SystemUtil;->MEMORY_RATIO:D

    .line 72
    .end local v0           #mem:I
    :cond_0
    sget-wide v1, Lco/vine/android/util/SystemUtil;->MEMORY_RATIO:D

    :goto_2
    return-wide v1

    .line 65
    .restart local v0       #mem:I
    :cond_1
    :try_start_1
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {v1}, Landroid/app/ActivityManager;->getMemoryClass()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    int-to-double v1, v1

    goto :goto_2

    .line 70
    :cond_2
    int-to-double v1, v0

    const-wide/high16 v3, 0x4060

    div-double/2addr v1, v3

    goto :goto_1

    .line 67
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static getMemoryRatioForLargeMemoryClass(Landroid/content/Context;)I
    .locals 1
    .parameter "context"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 55
    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result v0

    return v0
.end method

.method public static getVideoUrlFromResource(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2
    .parameter "context"
    .parameter "res"

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized initProcessName(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    .line 76
    const-class v6, Lco/vine/android/util/SystemUtil;

    monitor-enter v6

    :try_start_0
    sget-object v5, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;

    if-nez v5, :cond_2

    .line 77
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;

    .line 78
    const-string v5, "activity"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 79
    .local v0, am:Landroid/app/ActivityManager;
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    .line 80
    .local v4, procInfos:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    if-eqz v4, :cond_1

    .line 81
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 82
    .local v3, procInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    iget v7, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v5, v7, :cond_0

    .line 83
    iget-object v5, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    sput-object v5, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 76
    .end local v0           #am:Landroid/app/ActivityManager;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #procInfo:Landroid/app/ActivityManager$RunningAppProcessInfo;
    .end local v4           #procInfos:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5

    .line 87
    .restart local v0       #am:Landroid/app/ActivityManager;
    .restart local v4       #procInfos:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_1
    :try_start_1
    sget-object v5, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;

    const/16 v7, 0x3a

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 88
    .local v2, index:I
    const/4 v5, -0x1

    if-eq v2, v5, :cond_3

    .line 89
    sget-object v5, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lco/vine/android/util/SystemUtil;->mSubProcessName:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .end local v0           #am:Landroid/app/ActivityManager;
    .end local v2           #index:I
    .end local v4           #procInfos:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_2
    :goto_1
    monitor-exit v6

    return-void

    .line 91
    .restart local v0       #am:Landroid/app/ActivityManager;
    .restart local v2       #index:I
    .restart local v4       #procInfos:Ljava/util/List;,"Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    :cond_3
    :try_start_2
    const-string v5, ""

    sput-object v5, Lco/vine/android/util/SystemUtil;->mSubProcessName:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public static isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;
    .locals 3
    .parameter "context"

    .prologue
    .line 115
    const-string v1, "normalVideoTestPlayable"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 116
    .local v0, sharedPref:Landroid/content/SharedPreferences;
    const-string v1, "normalVideoTestPlayable"

    sget-object v2, Lco/vine/android/util/SystemUtil$PrefBooleanState;->UNKNOWN:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    invoke-virtual {v2}, Lco/vine/android/util/SystemUtil$PrefBooleanState;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/SystemUtil$PrefBooleanState;->valueOf(Ljava/lang/String;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v1

    return-object v1
.end method

.method public static isSinglePlayerEnabled(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    const/4 v0, 0x1

    .line 50
    sget-boolean v1, Lcom/edisonwang/android/slog/SLog;->sIsAmazon:Z

    if-nez v1, :cond_0

    const-string v1, ":record"

    invoke-static {p0, v0, v1}, Lco/vine/android/util/SystemUtil;->isTargetProcess(Landroid/content/Context;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isTargetProcess(Landroid/content/Context;ILjava/lang/String;)Z
    .locals 3
    .parameter "context"
    .parameter "targetKey"
    .parameter "targetProcess"

    .prologue
    .line 126
    sget-object v1, Lco/vine/android/util/SystemUtil;->mTargetProcessInfo:Landroid/util/SparseArray;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 127
    .local v0, oldInfo:Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 128
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->initProcessName(Landroid/content/Context;)V

    .line 129
    if-nez p2, :cond_1

    .line 130
    invoke-static {}, Lcom/edisonwang/android/slog/SLog;->getAuthority()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lco/vine/android/util/SystemUtil;->mProcessName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 134
    :goto_0
    sget-object v1, Lco/vine/android/util/SystemUtil;->mTargetProcessInfo:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 135
    const-string v1, "Is target process for {} a {}: {}."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2, p2, v0}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 132
    :cond_1
    sget-object v1, Lco/vine/android/util/SystemUtil;->mSubProcessName:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public static isViewServerEnabled(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 46
    sget-boolean v1, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v1, :cond_0

    sget-object v1, Lco/vine/android/util/SystemUtil;->TARGET_VIEW_SERVER:Ljava/lang/String;

    invoke-static {p0, v0, v1}, Lco/vine/android/util/SystemUtil;->isTargetProcess(Landroid/content/Context;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static quietlyEnsureParentExists(Ljava/io/File;)V
    .locals 4
    .parameter "f"

    .prologue
    .line 142
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 143
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 144
    .local v1, parent:Ljava/io/File;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 145
    new-instance v2, Lco/vine/android/VineException;

    const-string v3, "Invalid folder, but we caught it."

    invoke-direct {v2, v3}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 146
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .end local v1           #parent:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Lco/vine/android/VineException;

    const-string v3, "Failed to make parent folder."

    invoke-direct {v2, v3}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static setNormalVideoPlayable(Landroid/content/Context;Z)V
    .locals 3
    .parameter "context"
    .parameter "isPlayable"

    .prologue
    .line 120
    const-string v0, "normalVideoTestPlayable"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "normalVideoTestPlayable"

    if-eqz p1, :cond_0

    sget-object v0, Lco/vine/android/util/SystemUtil$PrefBooleanState;->TRUE:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    :goto_0
    invoke-virtual {v0}, Lco/vine/android/util/SystemUtil$PrefBooleanState;->name()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 123
    return-void

    .line 120
    :cond_0
    sget-object v0, Lco/vine/android/util/SystemUtil$PrefBooleanState;->FALSE:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    goto :goto_0
.end method
