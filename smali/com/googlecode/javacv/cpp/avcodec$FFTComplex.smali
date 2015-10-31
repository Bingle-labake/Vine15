.class public Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;
.super Lcom/googlecode/javacpp/Pointer;
.source "avcodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/avcodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FFTComplex"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 5687
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5688
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 5689
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 5690
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native im()F
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "FFTSample"
        }
    .end annotation
.end method

.method public native im(F)Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 5686
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;->position(I)Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;
    .locals 1
    .parameter "position"

    .prologue
    .line 5694
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;

    return-object v0
.end method

.method public native re()F
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "FFTSample"
        }
    .end annotation
.end method

.method public native re(F)Lcom/googlecode/javacv/cpp/avcodec$FFTComplex;
.end method
