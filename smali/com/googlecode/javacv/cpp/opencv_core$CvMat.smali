.class public Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.super Lcom/googlecode/javacv/cpp/opencv_core$CvArr;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvMat"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private byteBuffer:Ljava/nio/ByteBuffer;

.field private doubleBuffer:Ljava/nio/DoubleBuffer;

.field private floatBuffer:Ljava/nio/FloatBuffer;

.field private fullSize:I

.field private intBuffer:Ljava/nio/IntBuffer;

.field private shortBuffer:Ljava/nio/ShortBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1022
    const-class v0, Lcom/googlecode/javacv/cpp/opencv_core;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1023
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>()V

    .line 1179
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1181
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 1182
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    .line 1183
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    .line 1184
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 1185
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    .line 1023
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->allocate()V

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->zero()Lcom/googlecode/javacpp/Pointer;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .parameter "size"

    .prologue
    const/4 v1, 0x0

    .line 1024
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>()V

    .line 1179
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1181
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 1182
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    .line 1183
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    .line 1184
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 1185
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    .line 1024
    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->allocateArray(I)V

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->zero()Lcom/googlecode/javacpp/Pointer;

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 2
    .parameter "p"

    .prologue
    const/4 v1, 0x0

    .line 1025
    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    .line 1179
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1181
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 1182
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    .line 1183
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    .line 1184
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 1185
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    .line 1025
    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method

.method public static create(II)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "rows"
    .parameter "cols"

    .prologue
    .line 1045
    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public static create(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "rows"
    .parameter "cols"
    .parameter "type"

    .prologue
    .line 1034
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCreateMat(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    .line 1035
    .local v0, m:Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    if-eqz v0, :cond_0

    .line 1036
    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->size()I

    move-result v1

    iput v1, v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1037
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$CvMat;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 1039
    :cond_0
    return-object v0
.end method

.method public static create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 1042
    invoke-static {p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAKETYPE(II)I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->create(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public static createHeader(II)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "rows"
    .parameter "cols"

    .prologue
    .line 1060
    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createHeader(IIII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public static createHeader(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "rows"
    .parameter "cols"
    .parameter "type"

    .prologue
    .line 1049
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCreateMatHeader(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    .line 1050
    .local v0, m:Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    if-eqz v0, :cond_0

    .line 1051
    invoke-virtual {v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->size()I

    move-result v1

    iput v1, v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1052
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$CvMat;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 1054
    :cond_0
    return-object v0
.end method

.method public static createHeader(IIII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 1057
    invoke-static {p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAKETYPE(II)I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createHeader(III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public static createHeaderThreadLocal(II)Ljava/lang/ThreadLocal;
    .locals 2
    .parameter "rows"
    .parameter "cols"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1084
    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createHeaderThreadLocal(IIII)Ljava/lang/ThreadLocal;

    move-result-object v0

    return-object v0
.end method

.method public static createHeaderThreadLocal(III)Ljava/lang/ThreadLocal;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1076
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$2;-><init>(III)V

    return-object v0
.end method

.method public static createHeaderThreadLocal(IIII)Ljava/lang/ThreadLocal;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "depth"
    .parameter "channels"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1081
    invoke-static {p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAKETYPE(II)I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createHeaderThreadLocal(III)Ljava/lang/ThreadLocal;

    move-result-object v0

    return-object v0
.end method

.method public static createThreadLocal(II)Ljava/lang/ThreadLocal;
    .locals 2
    .parameter "rows"
    .parameter "cols"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1072
    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createThreadLocal(IIII)Ljava/lang/ThreadLocal;

    move-result-object v0

    return-object v0
.end method

.method public static createThreadLocal(III)Ljava/lang/ThreadLocal;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1064
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$1;-><init>(III)V

    return-object v0
.end method

.method public static createThreadLocal(IIII)Ljava/lang/ThreadLocal;
    .locals 1
    .parameter "rows"
    .parameter "cols"
    .parameter "depth"
    .parameter "channels"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)",
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/googlecode/javacv/cpp/opencv_core$CvMat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1069
    invoke-static {p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAKETYPE(II)I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->createThreadLocal(III)Ljava/lang/ThreadLocal;

    move-result-object v0

    return-object v0
.end method

.method private fullSize()I
    .locals 1

    .prologue
    .line 1180
    iget v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->size()I

    move-result v0

    iput v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    goto :goto_0
.end method


# virtual methods
.method public asIplImage()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1

    .prologue
    .line 1396
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    invoke-direct {v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;-><init>()V

    .line 1397
    .local v0, image:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    invoke-static {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core;->cvGetImage(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 1398
    return-object v0
.end method

.method public channels()I
    .locals 1

    .prologue
    .line 1132
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAT_CN(I)I

    move-result v0

    return v0
.end method

.method public clone()Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2

    .prologue
    .line 1088
    invoke-static {p0}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCloneMat(Lcom/googlecode/javacv/cpp/opencv_core$CvMat;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    .line 1089
    .local v0, m:Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    if-eqz v0, :cond_0

    .line 1090
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat$ReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$CvMat;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 1092
    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 1022
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->clone()Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public native cols()I
.end method

.method public native cols(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public cvSize()Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
    .locals 2

    .prologue
    .line 1168
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v1

    invoke-static {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core;->cvSize(II)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    return-object v0
.end method

.method public native data_db()Lcom/googlecode/javacpp/DoublePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "data.db"
        }
    .end annotation
.end method

.method public native data_db(Lcom/googlecode/javacpp/DoublePointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public native data_fl()Lcom/googlecode/javacpp/FloatPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "data.fl"
        }
    .end annotation
.end method

.method public native data_fl(Lcom/googlecode/javacpp/FloatPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public native data_i()Lcom/googlecode/javacpp/IntPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "data.i"
        }
    .end annotation
.end method

.method public native data_i(Lcom/googlecode/javacpp/IntPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public native data_ptr()Lcom/googlecode/javacpp/BytePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "uchar*"
        }
    .end annotation

    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "data.ptr"
        }
    .end annotation
.end method

.method public native data_ptr(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public native data_s()Lcom/googlecode/javacpp/ShortPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "data.s"
        }
    .end annotation
.end method

.method public native data_s(Lcom/googlecode/javacpp/ShortPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public depth()I
    .locals 1

    .prologue
    .line 1129
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAT_DEPTH(I)I

    move-result v0

    return v0
.end method

.method public elemSize()I
    .locals 1

    .prologue
    .line 1141
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->depth()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1149
    sget-boolean v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1143
    :pswitch_0
    const/4 v0, 0x1

    .line 1151
    :goto_0
    return v0

    .line 1145
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 1147
    :pswitch_2
    const/4 v0, 0x4

    goto :goto_0

    .line 1148
    :pswitch_3
    const/16 v0, 0x8

    goto :goto_0

    .line 1151
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public empty()Z
    .locals 1

    .prologue
    .line 1160
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->length()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get(I)D
    .locals 2
    .parameter "i"

    .prologue
    .line 1223
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->depth()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1231
    sget-boolean v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1224
    :pswitch_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-double v0, v0

    .line 1233
    :goto_0
    return-wide v0

    .line 1225
    :pswitch_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    int-to-double v0, v0

    goto :goto_0

    .line 1226
    :pswitch_2
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    int-to-double v0, v0

    goto :goto_0

    .line 1227
    :pswitch_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ShortBuffer;->get(I)S

    move-result v0

    int-to-double v0, v0

    goto :goto_0

    .line 1228
    :pswitch_4
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/IntBuffer;->get(I)I

    move-result v0

    int-to-double v0, v0

    goto :goto_0

    .line 1229
    :pswitch_5
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->get(I)F

    move-result v0

    float-to-double v0, v0

    goto :goto_0

    .line 1230
    :pswitch_6
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/DoubleBuffer;->get(I)D

    move-result-wide v0

    goto :goto_0

    .line 1233
    :cond_0
    const-wide/high16 v0, 0x7ff8

    goto :goto_0

    .line 1223
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public get(II)D
    .locals 2
    .parameter "i"
    .parameter "j"

    .prologue
    .line 1236
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v0

    mul-int/2addr v0, p1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v1

    div-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v1

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public get(III)D
    .locals 2
    .parameter "i"
    .parameter "j"
    .parameter "k"

    .prologue
    .line 1240
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v0

    mul-int/2addr v0, p1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v1

    div-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v1

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    add-int/2addr v0, p3

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get(I)D

    move-result-wide v0

    return-wide v0
.end method

.method public get(I[D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "index"
    .parameter "vv"

    .prologue
    .line 1292
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get(I[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized get(I[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 9
    .parameter "index"
    .parameter "vv"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1243
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->depth()I

    move-result v1

    .line 1244
    .local v1, d:I
    packed-switch v1, :pswitch_data_0

    .line 1287
    sget-boolean v6, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    if-nez v6, :cond_2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1243
    .end local v1           #d:I
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1247
    .restart local v1       #d:I
    :pswitch_0
    :try_start_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1248
    .local v0, bb:Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1249
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, p4, :cond_2

    .line 1250
    if-nez v1, :cond_0

    .line 1251
    add-int v6, v3, p3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v7

    and-int/lit16 v7, v7, 0xff

    int-to-double v7, v7

    aput-wide v7, p2, v6

    .line 1249
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1253
    :cond_0
    add-int v6, v3, p3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v7

    int-to-double v7, v7

    aput-wide v7, p2, v6

    goto :goto_1

    .line 1259
    .end local v0           #bb:Ljava/nio/ByteBuffer;
    .end local v3           #i:I
    :pswitch_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v5

    .line 1260
    .local v5, sb:Ljava/nio/ShortBuffer;
    invoke-virtual {v5, p1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 1261
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_2
    if-ge v3, p4, :cond_2

    .line 1262
    const/4 v6, 0x2

    if-ne v1, v6, :cond_1

    .line 1263
    add-int v6, v3, p3

    invoke-virtual {v5}, Ljava/nio/ShortBuffer;->get()S

    move-result v7

    const v8, 0xffff

    and-int/2addr v7, v8

    int-to-double v7, v7

    aput-wide v7, p2, v6

    .line 1261
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1265
    :cond_1
    add-int v6, v3, p3

    invoke-virtual {v5}, Ljava/nio/ShortBuffer;->get()S

    move-result v7

    int-to-double v7, v7

    aput-wide v7, p2, v6

    goto :goto_3

    .line 1270
    .end local v3           #i:I
    .end local v5           #sb:Ljava/nio/ShortBuffer;
    :pswitch_2
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v4

    .line 1271
    .local v4, ib:Ljava/nio/IntBuffer;
    invoke-virtual {v4, p1}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 1272
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_4
    if-ge v3, p4, :cond_2

    .line 1273
    add-int v6, v3, p3

    invoke-virtual {v4}, Ljava/nio/IntBuffer;->get()I

    move-result v7

    int-to-double v7, v7

    aput-wide v7, p2, v6

    .line 1272
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 1277
    .end local v3           #i:I
    .end local v4           #ib:Ljava/nio/IntBuffer;
    :pswitch_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v2

    .line 1278
    .local v2, fb:Ljava/nio/FloatBuffer;
    invoke-virtual {v2, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1279
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_5
    if-ge v3, p4, :cond_2

    .line 1280
    add-int v6, v3, p3

    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->get()F

    move-result v7

    float-to-double v7, v7

    aput-wide v7, p2, v6

    .line 1279
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 1284
    .end local v2           #fb:Ljava/nio/FloatBuffer;
    .end local v3           #i:I
    :pswitch_4
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    .line 1285
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v6

    invoke-virtual {v6, p2, p3, p4}, Ljava/nio/DoubleBuffer;->get([DII)Ljava/nio/DoubleBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1289
    :cond_2
    monitor-exit p0

    return-object p0

    .line 1244
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 1
    .parameter "vv"

    .prologue
    .line 1295
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get(I[D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public get()[D
    .locals 3

    .prologue
    .line 1298
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v2

    div-int/2addr v1, v2

    new-array v0, v1, [D

    .line 1299
    .local v0, vv:[D
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    .line 1300
    return-object v0
.end method

.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .prologue
    .line 1187
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 1188
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->data_ptr()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/BytePointer;->capacity(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/BytePointer;->asBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 1190
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1191
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getDoubleBuffer()Ljava/nio/DoubleBuffer;
    .locals 2

    .prologue
    .line 1215
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    if-nez v0, :cond_0

    .line 1216
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->data_db()Lcom/googlecode/javacpp/DoublePointer;

    move-result-object v0

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/DoublePointer;->capacity(I)Lcom/googlecode/javacpp/DoublePointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/DoublePointer;->asBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    .line 1218
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    .line 1219
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    return-object v0
.end method

.method public getFloatBuffer()Ljava/nio/FloatBuffer;
    .locals 2

    .prologue
    .line 1208
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    if-nez v0, :cond_0

    .line 1209
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->data_fl()Lcom/googlecode/javacpp/FloatPointer;

    move-result-object v0

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/FloatPointer;->capacity(I)Lcom/googlecode/javacpp/FloatPointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/FloatPointer;->asBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 1211
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1212
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getIntBuffer()Ljava/nio/IntBuffer;
    .locals 2

    .prologue
    .line 1201
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    if-nez v0, :cond_0

    .line 1202
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->data_i()Lcom/googlecode/javacpp/IntPointer;

    move-result-object v0

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/IntPointer;->capacity(I)Lcom/googlecode/javacpp/IntPointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/IntPointer;->asBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    .line 1204
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 1205
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    return-object v0
.end method

.method public getShortBuffer()Ljava/nio/ShortBuffer;
    .locals 2

    .prologue
    .line 1194
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    if-nez v0, :cond_0

    .line 1195
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->data_s()Lcom/googlecode/javacpp/ShortPointer;

    move-result-object v0

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/ShortPointer;->capacity(I)Lcom/googlecode/javacpp/ShortPointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/ShortPointer;->asBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    .line 1197
    :cond_0
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 1198
    iget-object v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    return-object v0
.end method

.method public native hdr_refcount()I
.end method

.method public native hdr_refcount(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public isContinuous()Z
    .locals 1

    .prologue
    .line 1138
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_IS_MAT_CONT(I)Z

    move-result v0

    return v0
.end method

.method public length()I
    .locals 2

    .prologue
    .line 1154
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public nChannels()I
    .locals 1

    .prologue
    .line 1135
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAT_CN(I)I

    move-result v0

    return v0
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1022
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 1
    .parameter "position"

    .prologue
    .line 1030
    invoke-super {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    return-object v0
.end method

.method public put(ID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "i"
    .parameter "v"

    .prologue
    .line 1304
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->depth()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1312
    sget-boolean v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1306
    :pswitch_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    double-to-int v1, p2

    int-to-byte v1, v1

    invoke-virtual {v0, p1, v1}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 1314
    :cond_0
    :goto_0
    return-object p0

    .line 1308
    :pswitch_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    double-to-int v1, p2

    int-to-short v1, v1

    invoke-virtual {v0, p1, v1}, Ljava/nio/ShortBuffer;->put(IS)Ljava/nio/ShortBuffer;

    goto :goto_0

    .line 1309
    :pswitch_2
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    double-to-int v1, p2

    invoke-virtual {v0, p1, v1}, Ljava/nio/IntBuffer;->put(II)Ljava/nio/IntBuffer;

    goto :goto_0

    .line 1310
    :pswitch_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    double-to-float v1, p2

    invoke-virtual {v0, p1, v1}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    goto :goto_0

    .line 1311
    :pswitch_4
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/DoubleBuffer;->put(ID)Ljava/nio/DoubleBuffer;

    goto :goto_0

    .line 1304
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public put(IID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "i"
    .parameter "j"
    .parameter "v"

    .prologue
    .line 1317
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v0

    mul-int/2addr v0, p1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v1

    div-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v1

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    invoke-virtual {p0, v0, p3, p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(ID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public put(IIID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "i"
    .parameter "j"
    .parameter "k"
    .parameter "v"

    .prologue
    .line 1320
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v0

    mul-int/2addr v0, p1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v1

    div-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v1

    mul-int/2addr v1, p2

    add-int/2addr v0, v1

    add-int/2addr v0, p3

    invoke-virtual {p0, v0, p4, p5}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(ID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized put(IIILcom/googlecode/javacv/cpp/opencv_core$CvMat;III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 13
    .parameter "dsti"
    .parameter "dstj"
    .parameter "dstk"
    .parameter "mat"
    .parameter "srci"
    .parameter "srcj"
    .parameter "srck"

    .prologue
    .line 1375
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v2

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v2

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v2

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->type()I

    move-result v2

    if-ne v1, v2, :cond_1

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    if-nez p3, :cond_1

    if-nez p5, :cond_1

    if-nez p6, :cond_1

    if-nez p7, :cond_1

    .line 1377
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1378
    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 1379
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1392
    :cond_0
    monitor-exit p0

    return-object p0

    .line 1381
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v2

    sub-int v2, v2, p5

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 1382
    .local v12, w:I
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v1

    sub-int/2addr v1, p2

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v2

    sub-int v2, v2, p6

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 1383
    .local v8, h:I
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v1

    sub-int v1, v1, p3

    invoke-virtual/range {p4 .. p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v2

    sub-int v2, v2, p7

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 1384
    .local v7, d:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    if-ge v9, v12, :cond_0

    .line 1385
    const/4 v10, 0x0

    .local v10, j:I
    :goto_1
    if-ge v10, v8, :cond_3

    .line 1386
    const/4 v11, 0x0

    .local v11, k:I
    :goto_2
    if-ge v11, v7, :cond_2

    .line 1387
    add-int v2, v9, p1

    add-int v3, v10, p2

    add-int v4, v11, p3

    add-int v1, v9, p5

    add-int v5, v10, p6

    add-int v6, v11, p7

    move-object/from16 v0, p4

    invoke-virtual {v0, v1, v5, v6}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->get(III)D

    move-result-wide v5

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(IIID)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1386
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 1385
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 1384
    .end local v11           #k:I
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1375
    .end local v7           #d:I
    .end local v8           #h:I
    .end local v9           #i:I
    .end local v10           #j:I
    .end local v12           #w:I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public varargs put(I[D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 2
    .parameter "index"
    .parameter "vv"

    .prologue
    .line 1364
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(I[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized put(I[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 8
    .parameter "index"
    .parameter "vv"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1323
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->depth()I

    move-result v6

    packed-switch v6, :pswitch_data_0

    .line 1359
    sget-boolean v6, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->$assertionsDisabled:Z

    if-nez v6, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1323
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1326
    :pswitch_0
    :try_start_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1327
    .local v0, bb:Ljava/nio/ByteBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 1328
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, p4, :cond_0

    .line 1329
    add-int v6, v3, p3

    aget-wide v6, p2, v6

    double-to-int v6, v6

    int-to-byte v6, v6

    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 1328
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1334
    .end local v0           #bb:Ljava/nio/ByteBuffer;
    .end local v3           #i:I
    :pswitch_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v5

    .line 1335
    .local v5, sb:Ljava/nio/ShortBuffer;
    invoke-virtual {v5, p1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 1336
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_1
    if-ge v3, p4, :cond_0

    .line 1337
    add-int v6, v3, p3

    aget-wide v6, p2, v6

    double-to-int v6, v6

    int-to-short v6, v6

    invoke-virtual {v5, v6}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 1336
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1341
    .end local v3           #i:I
    .end local v5           #sb:Ljava/nio/ShortBuffer;
    :pswitch_2
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v4

    .line 1342
    .local v4, ib:Ljava/nio/IntBuffer;
    invoke-virtual {v4, p1}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 1343
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_2
    if-ge v3, p4, :cond_0

    .line 1344
    add-int v6, v3, p3

    aget-wide v6, p2, v6

    double-to-int v6, v6

    invoke-virtual {v4, v6}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 1343
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1348
    .end local v3           #i:I
    .end local v4           #ib:Ljava/nio/IntBuffer;
    :pswitch_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v2

    .line 1349
    .local v2, fb:Ljava/nio/FloatBuffer;
    invoke-virtual {v2, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 1350
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_3
    if-ge v3, p4, :cond_0

    .line 1351
    add-int v6, v3, p3

    aget-wide v6, p2, v6

    double-to-float v6, v6

    invoke-virtual {v2, v6}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 1350
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1355
    .end local v2           #fb:Ljava/nio/FloatBuffer;
    .end local v3           #i:I
    :pswitch_4
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v1

    .line 1356
    .local v1, db:Ljava/nio/DoubleBuffer;
    invoke-virtual {v1, p1}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    .line 1357
    invoke-virtual {v1, p2, p3, p4}, Ljava/nio/DoubleBuffer;->put([DII)Ljava/nio/DoubleBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1361
    .end local v1           #db:Ljava/nio/DoubleBuffer;
    :cond_0
    monitor-exit p0

    return-object p0

    .line 1323
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvMat;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 8
    .parameter "mat"

    .prologue
    const/4 v1, 0x0

    .line 1371
    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v4, p1

    move v5, v1

    move v6, v1

    move v7, v1

    invoke-virtual/range {v0 .. v7}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(IIILcom/googlecode/javacv/cpp/opencv_core$CvMat;III)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public varargs put([D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 1
    .parameter "vv"

    .prologue
    .line 1367
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->put(I[D)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    move-result-object v0

    return-object v0
.end method

.method public native raw_type()I
    .annotation runtime Lcom/googlecode/javacpp/annotation/Name;
        value = {
            "type"
        }
    .end annotation
.end method

.method public native raw_type(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public native refcount()Lcom/googlecode/javacpp/IntPointer;
.end method

.method public native refcount(Lcom/googlecode/javacpp/IntPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public release()V
    .locals 0

    .prologue
    .line 1096
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->deallocate()V

    .line 1097
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1171
    const/4 v0, 0x0

    iput v0, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->fullSize:I

    .line 1172
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 1173
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->shortBuffer:Ljava/nio/ShortBuffer;

    .line 1174
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->intBuffer:Ljava/nio/IntBuffer;

    .line 1175
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 1176
    iput-object v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->doubleBuffer:Ljava/nio/DoubleBuffer;

    .line 1177
    return-void
.end method

.method public native rows()I
.end method

.method public native rows(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public size()I
    .locals 4

    .prologue
    .line 1164
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v0

    .line 1165
    .local v0, rows:I
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->elemSize()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v2

    mul-int/2addr v2, v1

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->step()I

    move-result v1

    add-int/lit8 v3, v0, -0x1

    mul-int/2addr v1, v3

    :goto_0
    add-int/2addr v1, v2

    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public native step()I
.end method

.method public native step(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1402
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(I)Ljava/lang/String;
    .locals 9
    .parameter "indent"

    .prologue
    const/4 v8, 0x1

    .line 1405
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "[ "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1406
    .local v4, s:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->channels()I

    move-result v0

    .line 1407
    .local v0, channels:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v6

    if-ge v1, v6, :cond_7

    .line 1408
    const/4 v2, 0x0

    .local v2, j:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v6

    if-ge v2, v6, :cond_5

    .line 1409
    invoke-static {p0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvGet2D(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;II)Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;

    move-result-object v5

    .line 1410
    .local v5, v:Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;
    if-le v0, v8, :cond_0

    .line 1411
    const-string v6, "("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1413
    :cond_0
    const/4 v3, 0x0

    .local v3, k:I
    :goto_2
    if-ge v3, v0, :cond_2

    .line 1414
    invoke-virtual {v5, v3}, Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;->val(I)D

    move-result-wide v6

    double-to-float v6, v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 1415
    add-int/lit8 v6, v0, -0x1

    if-ge v3, v6, :cond_1

    .line 1416
    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1413
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1419
    :cond_2
    if-le v0, v8, :cond_3

    .line 1420
    const-string v6, ")"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1422
    :cond_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v2, v6, :cond_4

    .line 1423
    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1408
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1426
    .end local v3           #k:I
    .end local v5           #v:Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;
    :cond_5
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v1, v6, :cond_6

    .line 1427
    const-string v6, "\n  "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1428
    const/4 v2, 0x0

    :goto_3
    if-ge v2, p1, :cond_6

    .line 1429
    const/16 v6, 0x20

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1428
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1407
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1433
    .end local v2           #j:I
    :cond_7
    const-string v6, " ]"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1434
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public total()I
    .locals 2

    .prologue
    .line 1157
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->rows()I

    move-result v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->cols()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public type()I
    .locals 1

    .prologue
    .line 1123
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->raw_type()I

    move-result v0

    invoke-static {v0}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAT_TYPE(I)I

    move-result v0

    return v0
.end method

.method public type(II)V
    .locals 2
    .parameter "depth"
    .parameter "cn"

    .prologue
    .line 1126
    invoke-static {p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core;->CV_MAKETYPE(II)I

    move-result v0

    const/high16 v1, 0x4242

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;->raw_type(I)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    .line 1127
    return-void
.end method
