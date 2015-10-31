.class public Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvPoint2D64f"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 2049
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2050
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 2051
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 2052
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method public varargs constructor <init>([D)V
    .locals 2
    .parameter "pts"

    .prologue
    .line 2065
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;-><init>([DII)V

    .line 2066
    return-void
.end method

.method public constructor <init>([DII)V
    .locals 1
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 2061
    div-int/lit8 v0, p3, 0x2

    invoke-direct {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;-><init>(I)V

    .line 2062
    invoke-virtual {p0, p1, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    .line 2063
    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 2
    .parameter "pts"

    .prologue
    .line 2077
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->get([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public get([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 4
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 2080
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    div-int/lit8 v1, p3, 0x2

    if-ge v0, v1, :cond_0

    .line 2081
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    .line 2082
    mul-int/lit8 v1, v0, 0x2

    add-int/2addr v1, p2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v2

    aput-wide v2, p1, v1

    .line 2083
    mul-int/lit8 v1, v0, 0x2

    add-int/2addr v1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v2

    aput-wide v2, p1, v1

    .line 2080
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2085
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v1

    return-object v1
.end method

.method public get()[D
    .locals 2

    .prologue
    .line 2072
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->capacity:I

    if-nez v1, :cond_0

    const/4 v1, 0x2

    :goto_0
    new-array v0, v1, [D

    .line 2073
    .local v0, pts:[D
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    .line 2074
    return-object v0

    .line 2072
    .end local v0           #pts:[D
    :cond_0
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->capacity:I

    mul-int/lit8 v1, v1, 0x2

    goto :goto_0
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2048
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 1
    .parameter "position"

    .prologue
    .line 2057
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    return-object v0
.end method

.method public put(DD)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 2099
    invoke-virtual {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 3
    .parameter "o"

    .prologue
    .line 2105
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->x()F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->y()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 3
    .parameter "o"

    .prologue
    .line 2108
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 3
    .parameter "o"

    .prologue
    .line 2102
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v0

    int-to-double v0, v0

    invoke-virtual {p0, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v1

    int-to-double v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public final varargs put([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 2
    .parameter "pts"

    .prologue
    .line 2095
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v0

    return-object v0
.end method

.method public final put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
    .locals 6
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 2089
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    div-int/lit8 v1, p3, 0x2

    if-ge v0, v1, :cond_0

    .line 2090
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v1

    mul-int/lit8 v2, v0, 0x2

    add-int/2addr v2, p2

    aget-wide v2, p1, v2

    mul-int/lit8 v4, v0, 0x2

    add-int/2addr v4, p2

    add-int/lit8 v4, v4, 0x1

    aget-wide v4, p1, v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->put(DD)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    .line 2089
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2092
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 2112
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->isNull()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2113
    invoke-super {p0}, Lcom/googlecode/javacpp/Pointer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2125
    :goto_0
    return-object v2

    .line 2115
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->capacity()I

    move-result v3

    if-nez v3, :cond_1

    .line 2116
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v4

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v4

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2118
    :cond_1
    const-string v2, ""

    .line 2119
    .local v2, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position()I

    move-result v1

    .line 2120
    .local v1, p:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->capacity()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 2121
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    .line 2122
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string v3, "("

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v4

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v4

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2120
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2122
    :cond_2
    const-string v3, " ("

    goto :goto_2

    .line 2124
    :cond_3
    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;

    goto/16 :goto_0
.end method

.method public native x()D
.end method

.method public native x(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
.end method

.method public native y()D
.end method

.method public native y(D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;
.end method
