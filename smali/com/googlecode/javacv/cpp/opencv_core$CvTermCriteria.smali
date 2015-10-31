.class public Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvTermCriteria"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1735
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1736
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 1737
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(IID)V
    .locals 1
    .parameter "type"
    .parameter "max_iter"
    .parameter "epsilon"

    .prologue
    .line 1746
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    .line 1747
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->allocate()V

    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->type(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->max_iter(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->epsilon(D)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;

    .line 1748
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 1738
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native epsilon()D
.end method

.method public native epsilon(D)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;
.end method

.method public native max_iter()I
.end method

.method public native max_iter(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1734
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;
    .locals 1
    .parameter "position"

    .prologue
    .line 1743
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;

    return-object v0
.end method

.method public native type()I
.end method

.method public native type(I)Lcom/googlecode/javacv/cpp/opencv_core$CvTermCriteria;
.end method
