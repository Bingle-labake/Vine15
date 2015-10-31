.class public Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvPoint"
.end annotation


# static fields
.field public static final ZERO:Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1760
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    .line 1861
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    invoke-direct {v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;-><init>()V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    sput-object v0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->ZERO:Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1761
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->allocate()V

    return-void
.end method

.method public varargs constructor <init>(B[D)V
    .locals 2
    .parameter "shift"
    .parameter "pts"

    .prologue
    .line 1783
    const/4 v0, 0x0

    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;-><init>(B[DII)V

    .line 1784
    return-void
.end method

.method public constructor <init>(B[DII)V
    .locals 1
    .parameter "shift"
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1779
    div-int/lit8 v0, p4, 0x2

    invoke-direct {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;-><init>(I)V

    .line 1780
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put(B[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1781
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 1762
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 1763
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method public varargs constructor <init>([I)V
    .locals 2
    .parameter "pts"

    .prologue
    .line 1776
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;-><init>([III)V

    .line 1777
    return-void
.end method

.method public constructor <init>([III)V
    .locals 1
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1772
    div-int/lit8 v0, p3, 0x2

    invoke-direct {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;-><init>(I)V

    .line 1773
    invoke-virtual {p0, p1, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1774
    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public get([I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 2
    .parameter "pts"

    .prologue
    .line 1795
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->get([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public get([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 3
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1798
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    div-int/lit8 v1, p3, 0x2

    if-ge v0, v1, :cond_0

    .line 1799
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1800
    mul-int/lit8 v1, v0, 0x2

    add-int/2addr v1, p2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v2

    aput v2, p1, v1

    .line 1801
    mul-int/lit8 v1, v0, 0x2

    add-int/2addr v1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v2

    aput v2, p1, v1

    .line 1798
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1803
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v1

    return-object v1
.end method

.method public get()[I
    .locals 2

    .prologue
    .line 1790
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->capacity:I

    if-nez v1, :cond_0

    const/4 v1, 0x2

    :goto_0
    new-array v0, v1, [I

    .line 1791
    .local v0, pts:[I
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->get([I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1792
    return-object v0

    .line 1790
    .end local v0           #pts:[I
    :cond_0
    iget v1, p0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->capacity:I

    mul-int/lit8 v1, v1, 0x2

    goto :goto_0
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 1759
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 1
    .parameter "position"

    .prologue
    .line 1768
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    return-object v0
.end method

.method public put(BLcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 3
    .parameter "shift"
    .parameter "o"

    .prologue
    const/4 v2, 0x1

    .line 1833
    invoke-virtual {p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->x()F

    move-result v0

    shl-int v1, v2, p1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1834
    invoke-virtual {p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;->y()F

    move-result v0

    shl-int v1, v2, p1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1835
    return-object p0
.end method

.method public put(BLcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 5
    .parameter "shift"
    .parameter "o"

    .prologue
    const/4 v4, 0x1

    .line 1838
    invoke-virtual {p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->x()D

    move-result-wide v0

    shl-int v2, v4, p1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1839
    invoke-virtual {p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D64f;->y()D

    move-result-wide v0

    shl-int v2, v4, p1

    int-to-double v2, v2

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1840
    return-object p0
.end method

.method public final varargs put(B[D)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 2
    .parameter "shift"
    .parameter "pts"

    .prologue
    .line 1823
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put(B[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public final put(B[DII)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 6
    .parameter "shift"
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1816
    new-array v0, p4, [I

    .line 1817
    .local v0, a:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, p4, :cond_0

    .line 1818
    add-int v2, p3, v1

    aget-wide v2, p2, v2

    const/4 v4, 0x1

    shl-int/2addr v4, p1

    int-to-double v4, v4

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    aput v2, v0, v1

    .line 1817
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1820
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p4}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v2

    return-object v2
.end method

.method public put(II)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1827
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public put(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 2
    .parameter "o"

    .prologue
    .line 1830
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public final varargs put([I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 2
    .parameter "pts"

    .prologue
    .line 1813
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v0

    return-object v0
.end method

.method public final put([III)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
    .locals 4
    .parameter "pts"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1807
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    div-int/lit8 v1, p3, 0x2

    if-ge v0, v1, :cond_0

    .line 1808
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v1

    mul-int/lit8 v2, v0, 0x2

    add-int/2addr v2, p2

    aget v2, p1, v2

    mul-int/lit8 v3, v0, 0x2

    add-int/2addr v3, p2

    add-int/lit8 v3, v3, 0x1

    aget v3, p1, v3

    invoke-virtual {v1, v2, v3}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->put(II)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1807
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1810
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1844
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->isNull()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1845
    invoke-super {p0}, Lcom/googlecode/javacpp/Pointer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1857
    :goto_0
    return-object v2

    .line 1847
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->capacity()I

    move-result v3

    if-nez v3, :cond_1

    .line 1848
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1850
    :cond_1
    const-string v2, ""

    .line 1851
    .local v2, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position()I

    move-result v1

    .line 1852
    .local v1, p:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->capacity()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 1853
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    .line 1854
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string v3, "("

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->x()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->y()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1852
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1854
    :cond_2
    const-string v3, " ("

    goto :goto_2

    .line 1856
    :cond_3
    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;

    goto :goto_0
.end method

.method public native x()I
.end method

.method public native x(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
.end method

.method public native y()I
.end method

.method public native y(I)Lcom/googlecode/javacv/cpp/opencv_core$CvPoint;
.end method
