.class public Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvBox2D"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 2304
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 2305
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 2306
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 2307
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;F)V
    .locals 1
    .parameter "center"
    .parameter "size"
    .parameter "angle"

    .prologue
    .line 2315
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    .line 2316
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->allocate()V

    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->center(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->size(Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->angle(F)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    .line 2317
    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native angle()F
.end method

.method public native angle(F)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;
.end method

.method public native center(Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;
.end method

.method public native center()Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;
    .annotation runtime Lcom/googlecode/javacpp/annotation/ByRef;
    .end annotation
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2303
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;
    .locals 1
    .parameter "position"

    .prologue
    .line 2312
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    return-object v0
.end method

.method public native size(Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;
.end method

.method public native size()Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;
    .annotation runtime Lcom/googlecode/javacpp/annotation/ByRef;
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 2324
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->isNull()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2325
    invoke-super {p0}, Lcom/googlecode/javacpp/Pointer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2337
    :goto_0
    return-object v2

    .line 2327
    :cond_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->capacity()I

    move-result v3

    if-nez v3, :cond_1

    .line 2328
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->center()Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->size()Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->angle()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 2330
    :cond_1
    const-string v2, ""

    .line 2331
    .local v2, s:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->position()I

    move-result v1

    .line 2332
    .local v1, p:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->capacity()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 2333
    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    .line 2334
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_2

    const-string v3, "("

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->center()Lcom/googlecode/javacv/cpp/opencv_core$CvPoint2D32f;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->size()Lcom/googlecode/javacv/cpp/opencv_core$CvSize2D32f;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->angle()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2332
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2334
    :cond_2
    const-string v3, " ("

    goto :goto_2

    .line 2336
    :cond_3
    invoke-virtual {p0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvBox2D;

    goto/16 :goto_0
.end method
