.class public Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvSize"
.end annotation


# static fields
.field public static final ZERO:Lcom/googlecode/javacv/cpp/opencv_core$CvSize;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2221
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    .line 2256
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    invoke-direct {v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;-><init>()V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->width(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->height(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    sput-object v0, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->ZERO:Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2222
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 2223
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    .line 2232
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    .line 2233
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->allocate()V

    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->width(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->height(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    .line 2234
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 2224
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native height()I
.end method

.method public native height(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2220
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
    .locals 1
    .parameter "position"

    .prologue
    .line 2229
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 2240
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->isNull()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2241
    invoke-super {p0}, Lcom/googlecode/javacpp/Pointer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2253
    :goto_0
    return-object v2

    .line 2243
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->capacity()I

    move-result v3

    if-nez v3, :cond_1

    .line 2244
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->width()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->height()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2246
    :cond_1
    const-string v2, ""

    .line 2247
    .local v2, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->position()I

    move-result v1

    .line 2248
    .local v1, p:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->capacity()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 2249
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    .line 2250
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string v3, "("

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->width()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->height()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2248
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2250
    :cond_2
    const-string v3, " ("

    goto :goto_2

    .line 2252
    :cond_3
    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvSize;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    goto :goto_0
.end method

.method public native width()I
.end method

.method public native width(I)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
.end method
