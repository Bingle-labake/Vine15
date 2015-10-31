.class public Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.super Lcom/googlecode/javacpp/Pointer;
.source "avcodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/avcodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AVPacket"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacv/cpp/avcodec$AVPacket$Destruct_AVPacket;
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1315
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1316
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 1317
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 1318
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native buf(Lcom/googlecode/javacv/cpp/avutil$AVBufferRef;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native buf()Lcom/googlecode/javacv/cpp/avutil$AVBufferRef;
.end method

.method public native convergence_duration()J
.end method

.method public native convergence_duration(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native data()Lcom/googlecode/javacpp/BytePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "uint8_t*"
        }
    .end annotation
.end method

.method public native data(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native destruct()Lcom/googlecode/javacv/cpp/avcodec$AVPacket$Destruct_AVPacket;
.end method

.method public native destruct(Lcom/googlecode/javacv/cpp/avcodec$AVPacket$Destruct_AVPacket;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native dts()J
.end method

.method public native dts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native duration()I
.end method

.method public native duration(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native flags()I
.end method

.method public native flags(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native pos()J
.end method

.method public native pos(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1314
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;->position(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
    .locals 1
    .parameter "position"

    .prologue
    .line 1322
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/avcodec$AVPacket;

    return-object v0
.end method

.method public native priv()Lcom/googlecode/javacpp/Pointer;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public native priv(Lcom/googlecode/javacpp/Pointer;)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native pts()J
.end method

.method public native pts(J)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native side_data_elems()I
.end method

.method public native side_data_elems(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native size()I
.end method

.method public native size(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method

.method public native stream_index()I
.end method

.method public native stream_index(I)Lcom/googlecode/javacv/cpp/avcodec$AVPacket;
.end method
