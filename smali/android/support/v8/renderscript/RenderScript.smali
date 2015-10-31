.class public Landroid/support/v8/renderscript/RenderScript;
.super Ljava/lang/Object;
.source "RenderScript.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v8/renderscript/RenderScript$MessageThread;,
        Landroid/support/v8/renderscript/RenderScript$Priority;,
        Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;,
        Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;,
        Landroid/support/v8/renderscript/RenderScript$ContextType;
    }
.end annotation


# static fields
.field private static final CACHE_PATH:Ljava/lang/String; = "com.android.renderscript.cache"

.field static final DEBUG:Z = false

.field static final LOG_ENABLED:Z = false

.field static final LOG_TAG:Ljava/lang/String; = "RenderScript_jni"

.field static isNative:Z

.field static lock:Ljava/lang/Object;

.field static mCachePath:Ljava/lang/String;

.field static sInitialized:Z

.field private static thunk:I


# instance fields
.field private mApplicationContext:Landroid/content/Context;

.field mContext:I

.field mDev:I

.field mElement_ALLOCATION:Landroid/support/v8/renderscript/Element;

.field mElement_A_8:Landroid/support/v8/renderscript/Element;

.field mElement_BOOLEAN:Landroid/support/v8/renderscript/Element;

.field mElement_CHAR_2:Landroid/support/v8/renderscript/Element;

.field mElement_CHAR_3:Landroid/support/v8/renderscript/Element;

.field mElement_CHAR_4:Landroid/support/v8/renderscript/Element;

.field mElement_DOUBLE_2:Landroid/support/v8/renderscript/Element;

.field mElement_DOUBLE_3:Landroid/support/v8/renderscript/Element;

.field mElement_DOUBLE_4:Landroid/support/v8/renderscript/Element;

.field mElement_ELEMENT:Landroid/support/v8/renderscript/Element;

.field mElement_F32:Landroid/support/v8/renderscript/Element;

.field mElement_F64:Landroid/support/v8/renderscript/Element;

.field mElement_FLOAT_2:Landroid/support/v8/renderscript/Element;

.field mElement_FLOAT_3:Landroid/support/v8/renderscript/Element;

.field mElement_FLOAT_4:Landroid/support/v8/renderscript/Element;

.field mElement_I16:Landroid/support/v8/renderscript/Element;

.field mElement_I32:Landroid/support/v8/renderscript/Element;

.field mElement_I64:Landroid/support/v8/renderscript/Element;

.field mElement_I8:Landroid/support/v8/renderscript/Element;

.field mElement_INT_2:Landroid/support/v8/renderscript/Element;

.field mElement_INT_3:Landroid/support/v8/renderscript/Element;

.field mElement_INT_4:Landroid/support/v8/renderscript/Element;

.field mElement_LONG_2:Landroid/support/v8/renderscript/Element;

.field mElement_LONG_3:Landroid/support/v8/renderscript/Element;

.field mElement_LONG_4:Landroid/support/v8/renderscript/Element;

.field mElement_MATRIX_2X2:Landroid/support/v8/renderscript/Element;

.field mElement_MATRIX_3X3:Landroid/support/v8/renderscript/Element;

.field mElement_MATRIX_4X4:Landroid/support/v8/renderscript/Element;

.field mElement_RGBA_4444:Landroid/support/v8/renderscript/Element;

.field mElement_RGBA_5551:Landroid/support/v8/renderscript/Element;

.field mElement_RGBA_8888:Landroid/support/v8/renderscript/Element;

.field mElement_RGB_565:Landroid/support/v8/renderscript/Element;

.field mElement_RGB_888:Landroid/support/v8/renderscript/Element;

.field mElement_SAMPLER:Landroid/support/v8/renderscript/Element;

.field mElement_SCRIPT:Landroid/support/v8/renderscript/Element;

.field mElement_SHORT_2:Landroid/support/v8/renderscript/Element;

.field mElement_SHORT_3:Landroid/support/v8/renderscript/Element;

.field mElement_SHORT_4:Landroid/support/v8/renderscript/Element;

.field mElement_TYPE:Landroid/support/v8/renderscript/Element;

.field mElement_U16:Landroid/support/v8/renderscript/Element;

.field mElement_U32:Landroid/support/v8/renderscript/Element;

.field mElement_U64:Landroid/support/v8/renderscript/Element;

.field mElement_U8:Landroid/support/v8/renderscript/Element;

.field mElement_UCHAR_2:Landroid/support/v8/renderscript/Element;

.field mElement_UCHAR_3:Landroid/support/v8/renderscript/Element;

.field mElement_UCHAR_4:Landroid/support/v8/renderscript/Element;

.field mElement_UINT_2:Landroid/support/v8/renderscript/Element;

.field mElement_UINT_3:Landroid/support/v8/renderscript/Element;

.field mElement_UINT_4:Landroid/support/v8/renderscript/Element;

.field mElement_ULONG_2:Landroid/support/v8/renderscript/Element;

.field mElement_ULONG_3:Landroid/support/v8/renderscript/Element;

.field mElement_ULONG_4:Landroid/support/v8/renderscript/Element;

.field mElement_USHORT_2:Landroid/support/v8/renderscript/Element;

.field mElement_USHORT_3:Landroid/support/v8/renderscript/Element;

.field mElement_USHORT_4:Landroid/support/v8/renderscript/Element;

.field mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

.field mMessageCallback:Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;

.field mMessageThread:Landroid/support/v8/renderscript/RenderScript$MessageThread;

.field mSampler_CLAMP_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_CLAMP_LINEAR_MIP_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_CLAMP_NEAREST:Landroid/support/v8/renderscript/Sampler;

.field mSampler_MIRRORED_REPEAT_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_MIRRORED_REPEAT_LINEAR_MIP_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_MIRRORED_REPEAT_NEAREST:Landroid/support/v8/renderscript/Sampler;

.field mSampler_WRAP_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_WRAP_LINEAR_MIP_LINEAR:Landroid/support/v8/renderscript/Sampler;

.field mSampler_WRAP_NEAREST:Landroid/support/v8/renderscript/Sampler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v8/renderscript/RenderScript;->lock:Ljava/lang/Object;

    .line 71
    sput-boolean v1, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    .line 73
    sput v1, Landroid/support/v8/renderscript/RenderScript;->thunk:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "ctx"

    .prologue
    const/4 v0, 0x0

    .line 884
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 694
    iput-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mMessageCallback:Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;

    .line 749
    iput-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    .line 885
    if-eqz p1, :cond_0

    .line 886
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mApplicationContext:Landroid/content/Context;

    .line 888
    :cond_0
    return-void
.end method

.method public static create(Landroid/content/Context;)Landroid/support/v8/renderscript/RenderScript;
    .locals 1
    .parameter "ctx"

    .prologue
    .line 951
    sget-object v0, Landroid/support/v8/renderscript/RenderScript$ContextType;->NORMAL:Landroid/support/v8/renderscript/RenderScript$ContextType;

    invoke-static {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->create(Landroid/content/Context;Landroid/support/v8/renderscript/RenderScript$ContextType;)Landroid/support/v8/renderscript/RenderScript;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/content/Context;I)Landroid/support/v8/renderscript/RenderScript;
    .locals 1
    .parameter "ctx"
    .parameter "sdkVersion"

    .prologue
    .line 903
    sget-object v0, Landroid/support/v8/renderscript/RenderScript$ContextType;->NORMAL:Landroid/support/v8/renderscript/RenderScript$ContextType;

    invoke-static {p0, p1, v0}, Landroid/support/v8/renderscript/RenderScript;->create(Landroid/content/Context;ILandroid/support/v8/renderscript/RenderScript$ContextType;)Landroid/support/v8/renderscript/RenderScript;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/content/Context;ILandroid/support/v8/renderscript/RenderScript$ContextType;)Landroid/support/v8/renderscript/RenderScript;
    .locals 6
    .parameter "ctx"
    .parameter "sdkVersion"
    .parameter "ct"

    .prologue
    .line 914
    new-instance v1, Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {v1, p0}, Landroid/support/v8/renderscript/RenderScript;-><init>(Landroid/content/Context;)V

    .line 916
    .local v1, rs:Landroid/support/v8/renderscript/RenderScript;
    invoke-static {}, Landroid/support/v8/renderscript/RenderScript;->shouldThunk()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 917
    const-string v2, "RenderScript_jni"

    const-string v3, "RS native mode"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 918
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/RenderScriptThunker;->create(Landroid/content/Context;I)Landroid/support/v8/renderscript/RenderScript;

    move-result-object v1

    .line 941
    .end local v1           #rs:Landroid/support/v8/renderscript/RenderScript;
    :goto_0
    return-object v1

    .line 920
    .restart local v1       #rs:Landroid/support/v8/renderscript/RenderScript;
    :cond_0
    sget-object v3, Landroid/support/v8/renderscript/RenderScript;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 921
    :try_start_0
    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->sInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    .line 923
    :try_start_1
    const-string v2, "RSSupport"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 924
    const-string v2, "rsjni"

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 925
    const/4 v2, 0x1

    sput-boolean v2, Landroid/support/v8/renderscript/RenderScript;->sInitialized:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0

    .line 931
    :cond_1
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 933
    const-string v2, "RenderScript_jni"

    const-string v3, "RS compat mode"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 934
    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->nDeviceCreate()I

    move-result v2

    iput v2, v1, Landroid/support/v8/renderscript/RenderScript;->mDev:I

    .line 935
    iget v2, v1, Landroid/support/v8/renderscript/RenderScript;->mDev:I

    const/4 v3, 0x0

    iget v4, p2, Landroid/support/v8/renderscript/RenderScript$ContextType;->mID:I

    invoke-virtual {v1, v2, v3, p1, v4}, Landroid/support/v8/renderscript/RenderScript;->nContextCreate(IIII)I

    move-result v2

    iput v2, v1, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    .line 936
    iget v2, v1, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    if-nez v2, :cond_2

    .line 937
    new-instance v2, Landroid/support/v8/renderscript/RSDriverException;

    const-string v3, "Failed to create RS context."

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSDriverException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 926
    :catch_0
    move-exception v0

    .line 927
    .local v0, e:Ljava/lang/UnsatisfiedLinkError;
    :try_start_3
    const-string v2, "RenderScript_jni"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error loading RS jni library: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    new-instance v2, Landroid/support/v8/renderscript/RSRuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error loading RS jni library: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 931
    .end local v0           #e:Ljava/lang/UnsatisfiedLinkError;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 939
    :cond_2
    new-instance v2, Landroid/support/v8/renderscript/RenderScript$MessageThread;

    invoke-direct {v2, v1}, Landroid/support/v8/renderscript/RenderScript$MessageThread;-><init>(Landroid/support/v8/renderscript/RenderScript;)V

    iput-object v2, v1, Landroid/support/v8/renderscript/RenderScript;->mMessageThread:Landroid/support/v8/renderscript/RenderScript$MessageThread;

    .line 940
    iget-object v2, v1, Landroid/support/v8/renderscript/RenderScript;->mMessageThread:Landroid/support/v8/renderscript/RenderScript$MessageThread;

    invoke-virtual {v2}, Landroid/support/v8/renderscript/RenderScript$MessageThread;->start()V

    goto :goto_0
.end method

.method public static create(Landroid/content/Context;Landroid/support/v8/renderscript/RenderScript$ContextType;)Landroid/support/v8/renderscript/RenderScript;
    .locals 2
    .parameter "ctx"
    .parameter "ct"

    .prologue
    .line 964
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v0, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 965
    .local v0, v:I
    invoke-static {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->create(Landroid/content/Context;ILandroid/support/v8/renderscript/RenderScript$ContextType;)Landroid/support/v8/renderscript/RenderScript;

    move-result-object v1

    return-object v1
.end method

.method public static setupDiskCache(Ljava/io/File;)V
    .locals 2
    .parameter "cacheDir"

    .prologue
    .line 107
    new-instance v0, Ljava/io/File;

    const-string v1, "com.android.renderscript.cache"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 108
    .local v0, f:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Landroid/support/v8/renderscript/RenderScript;->mCachePath:Ljava/lang/String;

    .line 109
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 110
    return-void
.end method

.method static shouldThunk()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 79
    sget v2, Landroid/support/v8/renderscript/RenderScript;->thunk:I

    if-nez v2, :cond_0

    .line 80
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x12

    if-lt v2, v3, :cond_1

    const-string v2, "debug.rs.forcecompat"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_1

    .line 82
    sput v0, Landroid/support/v8/renderscript/RenderScript;->thunk:I

    .line 87
    :cond_0
    :goto_0
    sget v2, Landroid/support/v8/renderscript/RenderScript;->thunk:I

    if-ne v2, v0, :cond_2

    .line 90
    :goto_1
    return v0

    .line 84
    :cond_1
    const/4 v2, -0x1

    sput v2, Landroid/support/v8/renderscript/RenderScript;->thunk:I

    goto :goto_0

    :cond_2
    move v0, v1

    .line 90
    goto :goto_1
.end method


# virtual methods
.method public contextDump()V
    .locals 1

    .prologue
    .line 974
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 975
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->nContextDump(I)V

    .line 976
    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 994
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 995
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->nContextDeinitToClient(I)V

    .line 996
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mMessageThread:Landroid/support/v8/renderscript/RenderScript$MessageThread;

    iput-boolean v1, v0, Landroid/support/v8/renderscript/RenderScript$MessageThread;->mRun:Z

    .line 998
    :try_start_0
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mMessageThread:Landroid/support/v8/renderscript/RenderScript$MessageThread;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript$MessageThread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1002
    :goto_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->nContextDestroy()V

    .line 1003
    iput v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    .line 1005
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mDev:I

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->nDeviceDestroy(I)V

    .line 1006
    iput v1, p0, Landroid/support/v8/renderscript/RenderScript;->mDev:I

    .line 1007
    return-void

    .line 999
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public finish()V
    .locals 0

    .prologue
    .line 984
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->nContextFinish()V

    .line 985
    return-void
.end method

.method public final getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 896
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getErrorHandler()Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;
    .locals 1

    .prologue
    .line 767
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    return-object v0
.end method

.method public getMessageHandler()Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;
    .locals 1

    .prologue
    .line 713
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript;->mMessageCallback:Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;

    return-object v0
.end method

.method isAlive()Z
    .locals 1

    .prologue
    .line 1010
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method declared-synchronized nAllocationCopyFromBitmap(ILandroid/graphics/Bitmap;)V
    .locals 1
    .parameter "alloc"
    .parameter "bmp"

    .prologue
    .line 284
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 285
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCopyFromBitmap(IILandroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    monitor-exit p0

    return-void

    .line 284
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCopyToBitmap(ILandroid/graphics/Bitmap;)V
    .locals 1
    .parameter "alloc"
    .parameter "bmp"

    .prologue
    .line 255
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 256
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCopyToBitmap(IILandroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 257
    monitor-exit p0

    return-void

    .line 255
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCreateBitmapBackedAllocation(IILandroid/graphics/Bitmap;I)I
    .locals 6
    .parameter "type"
    .parameter "mip"
    .parameter "bmp"
    .parameter "usage"

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 233
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCreateBitmapBackedAllocation(IIILandroid/graphics/Bitmap;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCreateBitmapRef(ILandroid/graphics/Bitmap;)I
    .locals 1
    .parameter "type"
    .parameter "bmp"

    .prologue
    .line 244
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 245
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCreateBitmapRef(IILandroid/graphics/Bitmap;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 244
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCreateFromAssetStream(III)I
    .locals 1
    .parameter "mips"
    .parameter "assetStream"
    .parameter "usage"

    .prologue
    .line 249
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 250
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCreateFromAssetStream(IIII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 249
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCreateFromBitmap(IILandroid/graphics/Bitmap;I)I
    .locals 6
    .parameter "type"
    .parameter "mip"
    .parameter "bmp"
    .parameter "usage"

    .prologue
    .line 226
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 227
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCreateFromBitmap(IIILandroid/graphics/Bitmap;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 226
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCreateTyped(IIII)I
    .locals 6
    .parameter "type"
    .parameter "mip"
    .parameter "usage"
    .parameter "pointer"

    .prologue
    .line 221
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 222
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCreateTyped(IIIII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 221
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationCubeCreateFromBitmap(IILandroid/graphics/Bitmap;I)I
    .locals 6
    .parameter "type"
    .parameter "mip"
    .parameter "bmp"
    .parameter "usage"

    .prologue
    .line 239
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 240
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationCubeCreateFromBitmap(IIILandroid/graphics/Bitmap;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData1D(IIII[BI)V
    .locals 8
    .parameter "id"
    .parameter "off"
    .parameter "mip"
    .parameter "count"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 301
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 302
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData1D(IIIII[BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 303
    monitor-exit p0

    return-void

    .line 301
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData1D(IIII[FI)V
    .locals 8
    .parameter "id"
    .parameter "off"
    .parameter "mip"
    .parameter "count"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 306
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 307
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData1D(IIIII[FI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    monitor-exit p0

    return-void

    .line 306
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData1D(IIII[II)V
    .locals 8
    .parameter "id"
    .parameter "off"
    .parameter "mip"
    .parameter "count"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 291
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 292
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData1D(IIIII[II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    monitor-exit p0

    return-void

    .line 291
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData1D(IIII[SI)V
    .locals 8
    .parameter "id"
    .parameter "off"
    .parameter "mip"
    .parameter "count"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 296
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 297
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData1D(IIIII[SI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    monitor-exit p0

    return-void

    .line 296
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIIIIIIIII)V
    .locals 14
    .parameter "dstAlloc"
    .parameter "dstXoff"
    .parameter "dstYoff"
    .parameter "dstMip"
    .parameter "dstFace"
    .parameter "width"
    .parameter "height"
    .parameter "srcAlloc"
    .parameter "srcXoff"
    .parameter "srcYoff"
    .parameter "srcMip"
    .parameter "srcFace"

    .prologue
    .line 327
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 328
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    invoke-virtual/range {v0 .. v13}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIIIIIIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    monitor-exit p0

    return-void

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIIII[BI)V
    .locals 11
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "mip"
    .parameter "face"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 338
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 339
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIIII[BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    monitor-exit p0

    return-void

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIIII[FI)V
    .locals 11
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "mip"
    .parameter "face"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 353
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 354
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIIII[FI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 355
    monitor-exit p0

    return-void

    .line 353
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIIII[II)V
    .locals 11
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "mip"
    .parameter "face"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 348
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 349
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIIII[II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    monitor-exit p0

    return-void

    .line 348
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIIII[SI)V
    .locals 11
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "mip"
    .parameter "face"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 343
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 344
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIIII[SI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 345
    monitor-exit p0

    return-void

    .line 343
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData2D(IIIIILandroid/graphics/Bitmap;)V
    .locals 8
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "mip"
    .parameter "face"
    .parameter "b"

    .prologue
    .line 358
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 359
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData2D(IIIIIILandroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    monitor-exit p0

    return-void

    .line 358
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData3D(IIIIIIIIIIIII)V
    .locals 15
    .parameter "dstAlloc"
    .parameter "dstXoff"
    .parameter "dstYoff"
    .parameter "dstZoff"
    .parameter "dstMip"
    .parameter "width"
    .parameter "height"
    .parameter "depth"
    .parameter "srcAlloc"
    .parameter "srcXoff"
    .parameter "srcYoff"
    .parameter "srcZoff"
    .parameter "srcMip"

    .prologue
    .line 373
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 374
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    move/from16 v14, p13

    invoke-virtual/range {v0 .. v14}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData3D(IIIIIIIIIIIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 378
    monitor-exit p0

    return-void

    .line 373
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData3D(IIIIIIII[BI)V
    .locals 12
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "mip"
    .parameter "w"
    .parameter "h"
    .parameter "depth"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 382
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 383
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData3D(IIIIIIIII[BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    monitor-exit p0

    return-void

    .line 382
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData3D(IIIIIIII[FI)V
    .locals 12
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "mip"
    .parameter "w"
    .parameter "h"
    .parameter "depth"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 397
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 398
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData3D(IIIIIIIII[FI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 399
    monitor-exit p0

    return-void

    .line 397
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData3D(IIIIIIII[II)V
    .locals 12
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "mip"
    .parameter "w"
    .parameter "h"
    .parameter "depth"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 392
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 393
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData3D(IIIIIIIII[II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 394
    monitor-exit p0

    return-void

    .line 392
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationData3D(IIIIIIII[SI)V
    .locals 12
    .parameter "id"
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "mip"
    .parameter "w"
    .parameter "h"
    .parameter "depth"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 387
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 388
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationData3D(IIIIIIIII[SI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    monitor-exit p0

    return-void

    .line 387
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationElementData1D(IIII[BI)V
    .locals 8
    .parameter "id"
    .parameter "xoff"
    .parameter "mip"
    .parameter "compIdx"
    .parameter "d"
    .parameter "sizeBytes"

    .prologue
    .line 312
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 313
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationElementData1D(IIIII[BI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 314
    monitor-exit p0

    return-void

    .line 312
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationGenerateMipmaps(I)V
    .locals 1
    .parameter "alloc"

    .prologue
    .line 279
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 280
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationGenerateMipmaps(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    monitor-exit p0

    return-void

    .line 279
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationGetType(I)I
    .locals 1
    .parameter "id"

    .prologue
    .line 424
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 425
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationGetType(II)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 424
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationIoReceive(I)V
    .locals 1
    .parameter "alloc"

    .prologue
    .line 272
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 273
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationIoReceive(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 274
    monitor-exit p0

    return-void

    .line 272
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationIoSend(I)V
    .locals 1
    .parameter "alloc"

    .prologue
    .line 267
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 268
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationIoSend(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    monitor-exit p0

    return-void

    .line 267
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationRead(I[B)V
    .locals 1
    .parameter "id"
    .parameter "d"

    .prologue
    .line 404
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 405
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationRead(II[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    monitor-exit p0

    return-void

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationRead(I[F)V
    .locals 1
    .parameter "id"
    .parameter "d"

    .prologue
    .line 419
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 420
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationRead(II[F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 421
    monitor-exit p0

    return-void

    .line 419
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationRead(I[I)V
    .locals 1
    .parameter "id"
    .parameter "d"

    .prologue
    .line 414
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 415
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationRead(II[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 416
    monitor-exit p0

    return-void

    .line 414
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationRead(I[S)V
    .locals 1
    .parameter "id"
    .parameter "d"

    .prologue
    .line 409
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 410
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationRead(II[S)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 411
    monitor-exit p0

    return-void

    .line 409
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationResize1D(II)V
    .locals 1
    .parameter "id"
    .parameter "dimX"

    .prologue
    .line 430
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 431
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationResize1D(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    monitor-exit p0

    return-void

    .line 430
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationResize2D(III)V
    .locals 1
    .parameter "id"
    .parameter "dimX"
    .parameter "dimY"

    .prologue
    .line 435
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 436
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationResize2D(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 437
    monitor-exit p0

    return-void

    .line 435
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nAllocationSyncAll(II)V
    .locals 1
    .parameter "alloc"
    .parameter "src"

    .prologue
    .line 262
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 263
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnAllocationSyncAll(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    monitor-exit p0

    return-void

    .line 262
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nContextCreate(IIII)I
    .locals 1
    .parameter "dev"
    .parameter "ver"
    .parameter "sdkVer"
    .parameter "contextType"

    .prologue
    .line 147
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/RenderScript;->rsnContextCreate(IIII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method native nContextDeinitToClient(I)V
.end method

.method declared-synchronized nContextDestroy()V
    .locals 1

    .prologue
    .line 151
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 152
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->rsnContextDestroy(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    monitor-exit p0

    return-void

    .line 151
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nContextDump(I)V
    .locals 1
    .parameter "bits"

    .prologue
    .line 161
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 162
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnContextDump(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    monitor-exit p0

    return-void

    .line 161
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nContextFinish()V
    .locals 1

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 167
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->rsnContextFinish(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    monitor-exit p0

    return-void

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method native nContextGetErrorMessage(I)Ljava/lang/String;
.end method

.method native nContextGetUserMessage(I[I)I
.end method

.method native nContextInitToClient(I)V
.end method

.method native nContextPeekMessage(I[I)I
.end method

.method declared-synchronized nContextSendMessage(I[I)V
    .locals 1
    .parameter "id"
    .parameter "data"

    .prologue
    .line 172
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 173
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnContextSendMessage(II[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    monitor-exit p0

    return-void

    .line 172
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nContextSetPriority(I)V
    .locals 1
    .parameter "p"

    .prologue
    .line 156
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 157
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnContextSetPriority(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    monitor-exit p0

    return-void

    .line 156
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method native nDeviceCreate()I
.end method

.method native nDeviceDestroy(I)V
.end method

.method native nDeviceSetConfig(III)V
.end method

.method declared-synchronized nElementCreate(IIZI)I
    .locals 6
    .parameter "type"
    .parameter "kind"
    .parameter "norm"
    .parameter "vecSize"

    .prologue
    .line 188
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 189
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnElementCreate(IIIZI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 188
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nElementCreate2([I[Ljava/lang/String;[I)I
    .locals 1
    .parameter "elements"
    .parameter "names"
    .parameter "arraySizes"

    .prologue
    .line 193
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 194
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnElementCreate2(I[I[Ljava/lang/String;[I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 193
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nElementGetNativeData(I[I)V
    .locals 1
    .parameter "id"
    .parameter "elementData"

    .prologue
    .line 198
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 199
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnElementGetNativeData(II[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    monitor-exit p0

    return-void

    .line 198
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nElementGetSubElements(I[I[Ljava/lang/String;[I)V
    .locals 6
    .parameter "id"
    .parameter "IDs"
    .parameter "names"
    .parameter "arraySizes"

    .prologue
    .line 204
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 205
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnElementGetSubElements(II[I[Ljava/lang/String;[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    monitor-exit p0

    return-void

    .line 204
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nObjDestroy(I)V
    .locals 1
    .parameter "id"

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    if-eqz v0, :cond_0

    .line 182
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnObjDestroy(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    :cond_0
    monitor-exit p0

    return-void

    .line 181
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nSamplerCreate(IIIIIF)I
    .locals 8
    .parameter "magFilter"
    .parameter "minFilter"
    .parameter "wrapS"
    .parameter "wrapT"
    .parameter "wrapR"
    .parameter "aniso"

    .prologue
    .line 575
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 576
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/RenderScript;->rsnSamplerCreate(IIIIIIF)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 575
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptBindAllocation(III)V
    .locals 1
    .parameter "script"
    .parameter "alloc"
    .parameter "slot"

    .prologue
    .line 441
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 442
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptBindAllocation(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 443
    monitor-exit p0

    return-void

    .line 441
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptCCreate(Ljava/lang/String;Ljava/lang/String;[BI)I
    .locals 6
    .parameter "resName"
    .parameter "cacheDir"
    .parameter "script"
    .parameter "length"

    .prologue
    .line 525
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 526
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptCCreate(ILjava/lang/String;Ljava/lang/String;[BI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 525
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptFieldIDCreate(II)I
    .locals 1
    .parameter "sid"
    .parameter "slot"

    .prologue
    .line 543
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 544
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptFieldIDCreate(III)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 543
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptForEach(IIII[B)V
    .locals 7
    .parameter "id"
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "params"

    .prologue
    .line 461
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 462
    if-nez p5, :cond_0

    .line 463
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptForEach(IIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 467
    :goto_0
    monitor-exit p0

    return-void

    .line 465
    :cond_0
    :try_start_1
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptForEach(IIIII[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 461
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptForEachClipped(IIII[BIIIIII)V
    .locals 13
    .parameter "id"
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "params"
    .parameter "xstart"
    .parameter "xend"
    .parameter "ystart"
    .parameter "yend"
    .parameter "zstart"
    .parameter "zend"

    .prologue
    .line 471
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 472
    if-nez p5, :cond_0

    .line 473
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptForEachClipped(IIIIIIIIIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 477
    :goto_0
    monitor-exit p0

    return-void

    .line 475
    :cond_0
    :try_start_1
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    invoke-virtual/range {v0 .. v12}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptForEachClipped(IIIII[BIIIIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 471
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptGroupCreate([I[I[I[I[I)I
    .locals 7
    .parameter "kernels"
    .parameter "src"
    .parameter "dstk"
    .parameter "dstf"
    .parameter "types"

    .prologue
    .line 549
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 550
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptGroupCreate(I[I[I[I[I[I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 549
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptGroupExecute(I)V
    .locals 1
    .parameter "group"

    .prologue
    .line 567
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 568
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptGroupExecute(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    monitor-exit p0

    return-void

    .line 567
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptGroupSetInput(III)V
    .locals 1
    .parameter "group"
    .parameter "kernel"
    .parameter "alloc"

    .prologue
    .line 555
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 556
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptGroupSetInput(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 557
    monitor-exit p0

    return-void

    .line 555
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptGroupSetOutput(III)V
    .locals 1
    .parameter "group"
    .parameter "kernel"
    .parameter "alloc"

    .prologue
    .line 561
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 562
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptGroupSetOutput(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 563
    monitor-exit p0

    return-void

    .line 561
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptIntrinsicCreate(II)I
    .locals 1
    .parameter "id"
    .parameter "eid"

    .prologue
    .line 531
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 532
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptIntrinsicCreate(III)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 531
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptInvoke(II)V
    .locals 1
    .parameter "id"
    .parameter "slot"

    .prologue
    .line 451
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 452
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptInvoke(III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    monitor-exit p0

    return-void

    .line 451
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptInvokeV(II[B)V
    .locals 1
    .parameter "id"
    .parameter "slot"
    .parameter "params"

    .prologue
    .line 481
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 482
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptInvokeV(III[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 483
    monitor-exit p0

    return-void

    .line 481
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptKernelIDCreate(III)I
    .locals 1
    .parameter "sid"
    .parameter "slot"
    .parameter "sig"

    .prologue
    .line 537
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 538
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptKernelIDCreate(IIII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 537
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetTimeZone(I[B)V
    .locals 1
    .parameter "script"
    .parameter "timeZone"

    .prologue
    .line 446
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 447
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetTimeZone(II[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 448
    monitor-exit p0

    return-void

    .line 446
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarD(IID)V
    .locals 6
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 501
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 502
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarD(IIID)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 503
    monitor-exit p0

    return-void

    .line 501
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarF(IIF)V
    .locals 1
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 496
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 497
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarF(IIIF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 498
    monitor-exit p0

    return-void

    .line 496
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarI(III)V
    .locals 1
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 486
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 487
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarI(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 488
    monitor-exit p0

    return-void

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarJ(IIJ)V
    .locals 6
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 491
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 492
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarJ(IIIJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 493
    monitor-exit p0

    return-void

    .line 491
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarObj(III)V
    .locals 1
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 518
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 519
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarObj(IIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 520
    monitor-exit p0

    return-void

    .line 518
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarV(II[B)V
    .locals 1
    .parameter "id"
    .parameter "slot"
    .parameter "val"

    .prologue
    .line 506
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 507
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarV(III[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 508
    monitor-exit p0

    return-void

    .line 506
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nScriptSetVarVE(II[BI[I)V
    .locals 7
    .parameter "id"
    .parameter "slot"
    .parameter "val"
    .parameter "e"
    .parameter "dims"

    .prologue
    .line 513
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 514
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->rsnScriptSetVarVE(III[BI[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 515
    monitor-exit p0

    return-void

    .line 513
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nTypeCreate(IIIIZZI)I
    .locals 9
    .parameter "eid"
    .parameter "x"
    .parameter "y"
    .parameter "z"
    .parameter "mips"
    .parameter "faces"
    .parameter "yuv"

    .prologue
    .line 210
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 211
    iget v1, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-virtual/range {v0 .. v8}, Landroid/support/v8/renderscript/RenderScript;->rsnTypeCreate(IIIIIZZI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized nTypeGetNativeData(I[I)V
    .locals 1
    .parameter "id"
    .parameter "typeData"

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 216
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->rsnTypeGetNativeData(II[I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    monitor-exit p0

    return-void

    .line 215
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method native rsnAllocationCopyFromBitmap(IILandroid/graphics/Bitmap;)V
.end method

.method native rsnAllocationCopyToBitmap(IILandroid/graphics/Bitmap;)V
.end method

.method native rsnAllocationCreateBitmapBackedAllocation(IIILandroid/graphics/Bitmap;I)I
.end method

.method native rsnAllocationCreateBitmapRef(IILandroid/graphics/Bitmap;)I
.end method

.method native rsnAllocationCreateFromAssetStream(IIII)I
.end method

.method native rsnAllocationCreateFromBitmap(IIILandroid/graphics/Bitmap;I)I
.end method

.method native rsnAllocationCreateTyped(IIIII)I
.end method

.method native rsnAllocationCubeCreateFromBitmap(IIILandroid/graphics/Bitmap;I)I
.end method

.method native rsnAllocationData1D(IIIII[BI)V
.end method

.method native rsnAllocationData1D(IIIII[FI)V
.end method

.method native rsnAllocationData1D(IIIII[II)V
.end method

.method native rsnAllocationData1D(IIIII[SI)V
.end method

.method native rsnAllocationData2D(IIIIIIIIIIIII)V
.end method

.method native rsnAllocationData2D(IIIIIIII[BI)V
.end method

.method native rsnAllocationData2D(IIIIIIII[FI)V
.end method

.method native rsnAllocationData2D(IIIIIIII[II)V
.end method

.method native rsnAllocationData2D(IIIIIIII[SI)V
.end method

.method native rsnAllocationData2D(IIIIIILandroid/graphics/Bitmap;)V
.end method

.method native rsnAllocationData3D(IIIIIIIIIIIIII)V
.end method

.method native rsnAllocationData3D(IIIIIIIII[BI)V
.end method

.method native rsnAllocationData3D(IIIIIIIII[FI)V
.end method

.method native rsnAllocationData3D(IIIIIIIII[II)V
.end method

.method native rsnAllocationData3D(IIIIIIIII[SI)V
.end method

.method native rsnAllocationElementData1D(IIIII[BI)V
.end method

.method native rsnAllocationGenerateMipmaps(II)V
.end method

.method native rsnAllocationGetType(II)I
.end method

.method native rsnAllocationIoReceive(II)V
.end method

.method native rsnAllocationIoSend(II)V
.end method

.method native rsnAllocationRead(II[B)V
.end method

.method native rsnAllocationRead(II[F)V
.end method

.method native rsnAllocationRead(II[I)V
.end method

.method native rsnAllocationRead(II[S)V
.end method

.method native rsnAllocationResize1D(III)V
.end method

.method native rsnAllocationResize2D(IIII)V
.end method

.method native rsnAllocationSyncAll(III)V
.end method

.method native rsnContextCreate(IIII)I
.end method

.method native rsnContextDestroy(I)V
.end method

.method native rsnContextDump(II)V
.end method

.method native rsnContextFinish(I)V
.end method

.method native rsnContextSendMessage(II[I)V
.end method

.method native rsnContextSetPriority(II)V
.end method

.method native rsnElementCreate(IIIZI)I
.end method

.method native rsnElementCreate2(I[I[Ljava/lang/String;[I)I
.end method

.method native rsnElementGetNativeData(II[I)V
.end method

.method native rsnElementGetSubElements(II[I[Ljava/lang/String;[I)V
.end method

.method native rsnObjDestroy(II)V
.end method

.method native rsnSamplerCreate(IIIIIIF)I
.end method

.method native rsnScriptBindAllocation(IIII)V
.end method

.method native rsnScriptCCreate(ILjava/lang/String;Ljava/lang/String;[BI)I
.end method

.method native rsnScriptFieldIDCreate(III)I
.end method

.method native rsnScriptForEach(IIIII)V
.end method

.method native rsnScriptForEach(IIIII[B)V
.end method

.method native rsnScriptForEachClipped(IIIIIIIIIII)V
.end method

.method native rsnScriptForEachClipped(IIIII[BIIIIII)V
.end method

.method native rsnScriptGroupCreate(I[I[I[I[I[I)I
.end method

.method native rsnScriptGroupExecute(II)V
.end method

.method native rsnScriptGroupSetInput(IIII)V
.end method

.method native rsnScriptGroupSetOutput(IIII)V
.end method

.method native rsnScriptIntrinsicCreate(III)I
.end method

.method native rsnScriptInvoke(III)V
.end method

.method native rsnScriptInvokeV(III[B)V
.end method

.method native rsnScriptKernelIDCreate(IIII)I
.end method

.method native rsnScriptSetTimeZone(II[B)V
.end method

.method native rsnScriptSetVarD(IIID)V
.end method

.method native rsnScriptSetVarF(IIIF)V
.end method

.method native rsnScriptSetVarI(IIII)V
.end method

.method native rsnScriptSetVarJ(IIIJ)V
.end method

.method native rsnScriptSetVarObj(IIII)V
.end method

.method native rsnScriptSetVarV(III[B)V
.end method

.method native rsnScriptSetVarVE(III[BI[I)V
.end method

.method native rsnTypeCreate(IIIIIZZI)I
.end method

.method native rsnTypeGetNativeData(II[I)V
.end method

.method safeID(Landroid/support/v8/renderscript/BaseObj;)I
    .locals 1
    .parameter "o"

    .prologue
    .line 1014
    if-eqz p1, :cond_0

    .line 1015
    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/BaseObj;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v0

    .line 1017
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public sendMessage(I[I)V
    .locals 0
    .parameter "id"
    .parameter "data"

    .prologue
    .line 726
    invoke-virtual {p0, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->nContextSendMessage(I[I)V

    .line 727
    return-void
.end method

.method public setErrorHandler(Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 752
    iput-object p1, p0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    .line 753
    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 754
    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 755
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    new-instance v0, Landroid/support/v8/renderscript/RenderScript$2;

    invoke-direct {v0, p0}, Landroid/support/v8/renderscript/RenderScript$2;-><init>(Landroid/support/v8/renderscript/RenderScript;)V

    .line 763
    .local v0, newmsg:Landroid/renderscript/RenderScript$RSErrorHandler;
    iget-object v2, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v2, v0}, Landroid/renderscript/RenderScript;->setErrorHandler(Landroid/renderscript/RenderScript$RSErrorHandler;)V

    .line 765
    .end local v0           #newmsg:Landroid/renderscript/RenderScript$RSErrorHandler;
    .end local v1           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :cond_0
    return-void
.end method

.method public setMessageHandler(Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 697
    iput-object p1, p0, Landroid/support/v8/renderscript/RenderScript;->mMessageCallback:Landroid/support/v8/renderscript/RenderScript$RSMessageHandler;

    .line 698
    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 699
    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 700
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    new-instance v0, Landroid/support/v8/renderscript/RenderScript$1;

    invoke-direct {v0, p0}, Landroid/support/v8/renderscript/RenderScript$1;-><init>(Landroid/support/v8/renderscript/RenderScript;)V

    .line 709
    .local v0, newmsg:Landroid/renderscript/RenderScript$RSMessageHandler;
    iget-object v2, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v2, v0}, Landroid/renderscript/RenderScript;->setMessageHandler(Landroid/renderscript/RenderScript$RSMessageHandler;)V

    .line 711
    .end local v0           #newmsg:Landroid/renderscript/RenderScript$RSMessageHandler;
    .end local v1           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :cond_0
    return-void
.end method

.method public setPriority(Landroid/support/v8/renderscript/RenderScript$Priority;)V
    .locals 1
    .parameter "p"

    .prologue
    .line 798
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 799
    iget v0, p1, Landroid/support/v8/renderscript/RenderScript$Priority;->mID:I

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/RenderScript;->nContextSetPriority(I)V

    .line 800
    return-void
.end method

.method validate()V
    .locals 2

    .prologue
    .line 786
    iget v0, p0, Landroid/support/v8/renderscript/RenderScript;->mContext:I

    if-nez v0, :cond_0

    .line 787
    new-instance v0, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v1, "Calling RS with no Context active."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 789
    :cond_0
    return-void
.end method
