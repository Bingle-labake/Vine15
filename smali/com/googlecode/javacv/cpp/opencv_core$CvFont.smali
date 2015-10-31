.class public Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.super Lcom/googlecode/javacpp/Pointer;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CvFont"
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 3971
    invoke-static {}, Lcom/googlecode/javacpp/Loader;->load()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3972
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;->allocate()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 3973
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;->allocateArray(I)V

    return-void
.end method

.method public constructor <init>(IDDDII)V
    .locals 0
    .parameter "font_face"
    .parameter "hscale"
    .parameter "vscale"
    .parameter "shear"
    .parameter "thickness"
    .parameter "line_type"

    .prologue
    .line 3983
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    .line 3984
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;->allocate()V

    .line 3985
    invoke-static/range {p0 .. p9}, Lcom/googlecode/javacv/cpp/opencv_core;->cvInitFont(Lcom/googlecode/javacv/cpp/opencv_core$CvFont;IDDDII)V

    .line 3986
    return-void
.end method

.method public constructor <init>(IDI)V
    .locals 10
    .parameter "font_face"
    .parameter "scale"
    .parameter "thickness"

    .prologue
    .line 3987
    invoke-direct {p0}, Lcom/googlecode/javacpp/Pointer;-><init>()V

    .line 3988
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;->allocate()V

    .line 3989
    const-wide/16 v6, 0x0

    const/16 v9, 0x10

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p2

    move v8, p4

    invoke-static/range {v0 .. v9}, Lcom/googlecode/javacv/cpp/opencv_core;->cvInitFont(Lcom/googlecode/javacv/cpp/opencv_core$CvFont;IDDDII)V

    .line 3990
    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 3974
    invoke-direct {p0, p1}, Lcom/googlecode/javacpp/Pointer;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method


# virtual methods
.method public native ascii()Lcom/googlecode/javacpp/IntPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Const;
    .end annotation
.end method

.method public native ascii(Lcom/googlecode/javacpp/IntPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native color(Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native color()Lcom/googlecode/javacv/cpp/opencv_core$CvScalar;
    .annotation runtime Lcom/googlecode/javacpp/annotation/ByRef;
    .end annotation
.end method

.method public native cyrillic()Lcom/googlecode/javacpp/IntPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Const;
    .end annotation
.end method

.method public native cyrillic(Lcom/googlecode/javacpp/IntPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native dx()F
.end method

.method public native dx(F)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native font_face()I
.end method

.method public native font_face(I)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native greek()Lcom/googlecode/javacpp/IntPointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Const;
    .end annotation
.end method

.method public native greek(Lcom/googlecode/javacpp/IntPointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native hscale()F
.end method

.method public native hscale(F)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native line_type()I
.end method

.method public native line_type(I)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native nameFont()Lcom/googlecode/javacpp/BytePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "const char*"
        }
    .end annotation
.end method

.method public native nameFont(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 3970
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
    .locals 1
    .parameter "position"

    .prologue
    .line 3979
    invoke-super {p0, p1}, Lcom/googlecode/javacpp/Pointer;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$CvFont;

    return-object v0
.end method

.method public native shear()F
.end method

.method public native shear(F)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native thickness()I
.end method

.method public native thickness(I)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method

.method public native vscale()F
.end method

.method public native vscale(F)Lcom/googlecode/javacv/cpp/opencv_core$CvFont;
.end method
