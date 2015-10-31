.class public Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvPoint3D32f"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1962
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1963
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 1964
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 1965
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method public varargs constructor <init>([D)V
    .locals 2
    .parameter "pts"

    .prologue
    .line 1978
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;-><init>([DII)V

    .line 1979
    return-void
.end method

.method public constructor <init>([DII)V
    .locals 1
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1974
    div-int/lit8 v0, p3, 0x3

    invoke-direct {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;-><init>(I)V

    .line 1975
    invoke-virtual {p0, p1, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    .line 1976
    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 2
    .parameter "pts"

    .prologue
    .line 1991
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->get([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public get([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 4
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1994
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    div-int/lit8 v1, p3, 0x3

    if-ge v0, v1, :cond_0

    .line 1995
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    .line 1996
    mul-int/lit8 v1, v0, 0x3

    add-int/2addr v1, p2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x()F

    move-result v2

    float-to-double v2, v2

    aput-wide v2, p1, v1

    .line 1997
    mul-int/lit8 v1, v0, 0x3

    add-int/2addr v1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y()F

    move-result v2

    float-to-double v2, v2

    aput-wide v2, p1, v1

    .line 1998
    mul-int/lit8 v1, v0, 0x3

    add-int/2addr v1, p2

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z()F

    move-result v2

    float-to-double v2, v2

    aput-wide v2, p1, v1

    .line 1994
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2000
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v1

    return-object v1
.end method

.method public get()[D
    .locals 2

    .prologue
    .line 1986
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->capacity:I

    if-nez v1, :cond_0

    const/4 v1, 0x3

    :goto_0
    new-array v0, v1, [D

    .line 1987
    .local v0, pts:[D
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->get([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    .line 1988
    return-object v0

    .line 1986
    .end local v0           #pts:[D
    :cond_0
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->capacity:I

    mul-int/lit8 v1, v1, 0x3

    goto :goto_0
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1961
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 1
    .parameter "position"

    .prologue
    .line 1970
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    return-object v0
.end method

.method public put(DDD)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "z"

    .prologue
    .line 2014
    double-to-float v0, p1

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    double-to-float v1, p3

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    double-to-float v1, p5

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 2
    .parameter "o"

    .prologue
    .line 2020
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->x()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->y()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 3
    .parameter "o"

    .prologue
    .line 2023
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 2
    .parameter "o"

    .prologue
    .line 2017
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public final varargs put([D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 2
    .parameter "pts"

    .prologue
    .line 2010
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public final put([DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
    .locals 8
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 2004
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    div-int/lit8 v0, p3, 0x3

    if-ge v7, v0, :cond_0

    .line 2005
    invoke-virtual {p0, v7}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    mul-int/lit8 v1, v7, 0x3

    add-int/2addr v1, p2

    aget-wide v1, p1, v1

    mul-int/lit8 v3, v7, 0x3

    add-int/2addr v3, p2

    add-int/lit8 v3, v3, 0x1

    aget-wide v3, p1, v3

    mul-int/lit8 v5, v7, 0x3

    add-int/2addr v5, p2

    add-int/lit8 v5, v5, 0x2

    aget-wide v5, p1, v5

    invoke-virtual/range {v0 .. v6}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->put(DDD)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    .line 2004
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 2007
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 2027
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->isNull()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2028
    invoke-super {p0}, Lcom/googlecode/javacpp/Pointer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2040
    :goto_0
    return-object v2

    .line 2030
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->capacity()I

    move-result v3

    if-nez v3, :cond_1

    .line 2031
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2033
    :cond_1
    const-string v2, ""

    .line 2034
    .local v2, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position()I

    move-result v1

    .line 2035
    .local v1, p:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->capacity()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 2036
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    .line 2037
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string v3, "("

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->x()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->y()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->z()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2035
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2037
    :cond_2
    const-string v3, " ("

    goto :goto_2

    .line 2039
    :cond_3
    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;

    goto/16 :goto_0
.end method

.method public native x()F
.end method

.method public native x(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
.end method

.method public native y()F
.end method

.method public native y(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
.end method

.method public native z()F
.end method

.method public native z(F)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint3D32f;
.end method
