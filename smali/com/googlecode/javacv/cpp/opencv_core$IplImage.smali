.class public Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.super Lcom/googlecode/javacv/cpp/opencv_core$CvArr;
.source "opencv_core.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javacv/cpp/opencv_core;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IplImage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/googlecode/javacv/cpp/opencv_core$IplImage$HeaderReleaseDeallocator;,
        Lcom/googlecode/javacv/cpp/opencv_core$IplImage$ReleaseDeallocator;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final gamma22:[B

.field public static final gamma22inv:[B


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/16 v8, 0x100

    const-wide v6, 0x406fe00000000000L

    .line 379
    const-class v1, Lcom/googlecode/javacv/cpp/opencv_core;

    invoke-virtual {v1}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    sput-boolean v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    .line 532
    new-array v1, v8, [B

    sput-object v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22:[B

    .line 533
    new-array v1, v8, [B

    sput-object v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22inv:[B

    .line 535
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v8, :cond_1

    .line 536
    sget-object v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22:[B

    int-to-double v2, v0

    div-double/2addr v2, v6

    const-wide v4, 0x400199999999999aL

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 537
    sget-object v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22inv:[B

    int-to-double v2, v0

    div-double/2addr v2, v6

    const-wide v4, 0x3fdd1745d1745d17L

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    mul-double/2addr v2, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 535
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 379
    .end local v0           #i:I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 539
    .restart local v0       #i:I
    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 380
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>()V

    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->allocate()V

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->zero()Lcom/googlecode/javacpp/Pointer;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "size"

    .prologue
    .line 381
    invoke-direct {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>()V

    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->allocateArray(I)V

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->zero()Lcom/googlecode/javacpp/Pointer;

    return-void
.end method

.method public constructor <init>(Lcom/googlecode/javacpp/Pointer;)V
    .locals 0
    .parameter "p"

    .prologue
    .line 382
    invoke-direct {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;-><init>(Lcom/googlecode/javacpp/Pointer;)V

    return-void
.end method

.method private native allocate()V
.end method

.method private native allocateArray(I)V
.end method

.method public static create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 398
    invoke-static {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core;->cvSize(II)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    return-object v0
.end method

.method public static create(IIIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "depth"
    .parameter "channels"
    .parameter "origin"

    .prologue
    .line 408
    invoke-static {p0, p1, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 409
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {v0, p4}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 412
    :cond_0
    return-object v0
.end method

.method public static create(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 2
    .parameter "size"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 391
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCreateImage(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 392
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 393
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$ReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$ReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 395
    :cond_0
    return-object v0
.end method

.method public static create(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;III)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "size"
    .parameter "depth"
    .parameter "channels"
    .parameter "origin"

    .prologue
    .line 401
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 402
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 403
    invoke-virtual {v0, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 405
    :cond_0
    return-object v0
.end method

.method public static createCompatible(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "template"

    .prologue
    .line 441
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->createIfNotCompatible(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    return-object v0
.end method

.method public static createHeader(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 423
    invoke-static {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core;->cvSize(II)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    invoke-static {v0, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->createHeader(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    return-object v0
.end method

.method public static createHeader(IIIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "depth"
    .parameter "channels"
    .parameter "origin"

    .prologue
    .line 433
    invoke-static {p0, p1, p2, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->createHeader(IIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 434
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 435
    invoke-virtual {v0, p4}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 437
    :cond_0
    return-object v0
.end method

.method public static createHeader(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 2
    .parameter "size"
    .parameter "depth"
    .parameter "channels"

    .prologue
    .line 416
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCreateImageHeader(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 417
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 418
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$HeaderReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$HeaderReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 420
    :cond_0
    return-object v0
.end method

.method public static createHeader(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;III)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "size"
    .parameter "depth"
    .parameter "channels"
    .parameter "origin"

    .prologue
    .line 426
    invoke-static {p0, p1, p2}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->createHeader(Lcom/googlecode/javacv/cpp/opencv_core$CvSize;II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 427
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 428
    invoke-virtual {v0, p3}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 430
    :cond_0
    return-object v0
.end method

.method public static createIfNotCompatible(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 5
    .parameter "image"
    .parameter "template"

    .prologue
    .line 444
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->nChannels()I

    move-result v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->nChannels()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 446
    :cond_0
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v0

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v1

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v2

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->nChannels()I

    move-result v3

    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin()I

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->create(IIIII)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object p0

    .line 449
    :cond_1
    invoke-virtual {p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    .line 450
    return-object p0
.end method

.method public static decodeGamma22(I)I
    .locals 2
    .parameter "value"

    .prologue
    .line 541
    sget-object v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22:[B

    and-int/lit16 v1, p0, 0xff

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public static encodeGamma22(I)I
    .locals 2
    .parameter "value"

    .prologue
    .line 544
    sget-object v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22inv:[B

    and-int/lit16 v1, p0, 0xff

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public static flipCopyWithGamma(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IZDZI)V
    .locals 14
    .parameter "srcBuf"
    .parameter "srcStep"
    .parameter "dstBuf"
    .parameter "dstStep"
    .parameter "signed"
    .parameter "gamma"
    .parameter "flip"
    .parameter "channels"

    .prologue
    .line 548
    sget-boolean v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v10, :cond_0

    move-object/from16 v0, p2

    if-ne p0, v0, :cond_0

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 549
    :cond_0
    move/from16 v0, p3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 550
    .local v7, w:I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    .local v6, srcLine:I
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 551
    .local v3, dstLine:I
    move/from16 v0, p8

    new-array v2, v0, [B

    .line 552
    .local v2, buffer:[B
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    if-ge v6, v10, :cond_12

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    if-ge v3, v10, :cond_12

    .line 553
    if-eqz p7, :cond_1

    .line 554
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    sub-int/2addr v10, v6

    sub-int/2addr v10, p1

    invoke-virtual {p0, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 558
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 559
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 560
    if-eqz p4, :cond_7

    .line 561
    const/4 v10, 0x1

    move/from16 v0, p8

    if-le v0, v10, :cond_5

    .line 562
    const/4 v8, 0x0

    .local v8, x:I
    :goto_2
    if-ge v8, v7, :cond_11

    .line 563
    const/4 v9, 0x0

    .local v9, z:I
    :goto_3
    move/from16 v0, p8

    if-ge v9, v0, :cond_3

    .line 564
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    .line 566
    .local v4, in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_2

    .line 567
    int-to-byte v5, v4

    .line 571
    .local v5, out:B
    :goto_4
    aput-byte v5, v2, v9

    .line 563
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 556
    .end local v4           #in:I
    .end local v5           #out:B
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_1
    invoke-virtual {p0, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 569
    .restart local v4       #in:I
    .restart local v8       #x:I
    .restart local v9       #z:I
    :cond_2
    int-to-double v10, v4

    const-wide v12, 0x405fc00000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x405fc00000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-byte v5, v10

    .restart local v5       #out:B
    goto :goto_4

    .line 573
    .end local v4           #in:I
    .end local v5           #out:B
    :cond_3
    add-int/lit8 v9, p8, -0x1

    :goto_5
    if-ltz v9, :cond_4

    .line 574
    aget-byte v10, v2, v9

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 573
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 562
    :cond_4
    add-int v8, v8, p8

    goto :goto_2

    .line 578
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_5
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_6
    if-ge v8, v7, :cond_11

    .line 579
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v4

    .line 581
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_6

    .line 582
    int-to-byte v5, v4

    .line 586
    .restart local v5       #out:B
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 578
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 584
    .end local v5           #out:B
    :cond_6
    int-to-double v10, v4

    const-wide v12, 0x405fc00000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x405fc00000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-byte v5, v10

    .restart local v5       #out:B
    goto :goto_7

    .line 590
    .end local v4           #in:I
    .end local v5           #out:B
    .end local v8           #x:I
    :cond_7
    const/4 v10, 0x1

    move/from16 v0, p8

    if-le v0, v10, :cond_d

    .line 591
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_8
    if-ge v8, v7, :cond_11

    .line 592
    const/4 v9, 0x0

    .restart local v9       #z:I
    :goto_9
    move/from16 v0, p8

    if-ge v9, v0, :cond_b

    .line 594
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    and-int/lit16 v4, v10, 0xff

    .line 595
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_8

    .line 596
    int-to-byte v5, v4

    .line 604
    .restart local v5       #out:B
    :goto_a
    aput-byte v5, v2, v9

    .line 592
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 597
    .end local v5           #out:B
    :cond_8
    const-wide v10, 0x400199999999999aL

    cmpl-double v10, p5, v10

    if-nez v10, :cond_9

    .line 598
    sget-object v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22:[B

    aget-byte v5, v10, v4

    .restart local v5       #out:B
    goto :goto_a

    .line 599
    .end local v5           #out:B
    :cond_9
    const-wide v10, 0x3fdd1745d1745d17L

    cmpl-double v10, p5, v10

    if-nez v10, :cond_a

    .line 600
    sget-object v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22inv:[B

    aget-byte v5, v10, v4

    .restart local v5       #out:B
    goto :goto_a

    .line 602
    .end local v5           #out:B
    :cond_a
    int-to-double v10, v4

    const-wide v12, 0x406fe00000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x406fe00000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-byte v5, v10

    .restart local v5       #out:B
    goto :goto_a

    .line 606
    .end local v4           #in:I
    .end local v5           #out:B
    :cond_b
    add-int/lit8 v9, p8, -0x1

    :goto_b
    if-ltz v9, :cond_c

    .line 607
    aget-byte v10, v2, v9

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 606
    add-int/lit8 v9, v9, -0x1

    goto :goto_b

    .line 591
    :cond_c
    add-int v8, v8, p8

    goto :goto_8

    .line 611
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_d
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_c
    if-ge v8, v7, :cond_11

    .line 613
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    and-int/lit16 v4, v10, 0xff

    .line 614
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_e

    .line 615
    int-to-byte v5, v4

    .line 623
    .restart local v5       #out:B
    :goto_d
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 611
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 616
    .end local v5           #out:B
    :cond_e
    const-wide v10, 0x400199999999999aL

    cmpl-double v10, p5, v10

    if-nez v10, :cond_f

    .line 617
    sget-object v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22:[B

    aget-byte v5, v10, v4

    .restart local v5       #out:B
    goto :goto_d

    .line 618
    .end local v5           #out:B
    :cond_f
    const-wide v10, 0x3fdd1745d1745d17L

    cmpl-double v10, p5, v10

    if-nez v10, :cond_10

    .line 619
    sget-object v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->gamma22inv:[B

    aget-byte v5, v10, v4

    .restart local v5       #out:B
    goto :goto_d

    .line 621
    .end local v5           #out:B
    :cond_10
    int-to-double v10, v4

    const-wide v12, 0x406fe00000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x406fe00000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-byte v5, v10

    .restart local v5       #out:B
    goto :goto_d

    .line 627
    .end local v4           #in:I
    .end local v5           #out:B
    :cond_11
    add-int/2addr v6, p1

    .line 628
    add-int v3, v3, p3

    goto/16 :goto_0

    .line 630
    .end local v8           #x:I
    :cond_12
    return-void
.end method

.method public static flipCopyWithGamma(Ljava/nio/DoubleBuffer;ILjava/nio/DoubleBuffer;IDZI)V
    .locals 14
    .parameter "srcBuf"
    .parameter "srcStep"
    .parameter "dstBuf"
    .parameter "dstStep"
    .parameter "gamma"
    .parameter "flip"
    .parameter "channels"

    .prologue
    .line 802
    sget-boolean v12, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v12, :cond_0

    move-object/from16 v0, p2

    if-ne p0, v0, :cond_0

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 803
    :cond_0
    move/from16 v0, p3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 804
    .local v9, w:I
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->position()I

    move-result v8

    .local v8, srcLine:I
    invoke-virtual/range {p2 .. p2}, Ljava/nio/DoubleBuffer;->position()I

    move-result v3

    .line 805
    .local v3, dstLine:I
    move/from16 v0, p7

    new-array v2, v0, [D

    .line 806
    .local v2, buffer:[D
    :goto_0
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->capacity()I

    move-result v12

    if-ge v8, v12, :cond_8

    invoke-virtual/range {p2 .. p2}, Ljava/nio/DoubleBuffer;->capacity()I

    move-result v12

    if-ge v3, v12, :cond_8

    .line 807
    if-eqz p6, :cond_1

    .line 808
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->capacity()I

    move-result v12

    sub-int/2addr v12, v8

    sub-int/2addr v12, p1

    invoke-virtual {p0, v12}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    .line 812
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    .line 813
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->remaining()I

    move-result v12

    invoke-static {v9, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    invoke-virtual/range {p2 .. p2}, Ljava/nio/DoubleBuffer;->remaining()I

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 814
    const/4 v12, 0x1

    move/from16 v0, p7

    if-le v0, v12, :cond_5

    .line 815
    const/4 v10, 0x0

    .local v10, x:I
    :goto_2
    if-ge v10, v9, :cond_7

    .line 816
    const/4 v11, 0x0

    .local v11, z:I
    :goto_3
    move/from16 v0, p7

    if-ge v11, v0, :cond_3

    .line 817
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->get()D

    move-result-wide v4

    .line 819
    .local v4, in:D
    const-wide/high16 v12, 0x3ff0

    cmpl-double v12, p4, v12

    if-nez v12, :cond_2

    .line 820
    move-wide v6, v4

    .line 824
    .local v6, out:D
    :goto_4
    aput-wide v6, v2, v11

    .line 816
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 810
    .end local v4           #in:D
    .end local v6           #out:D
    .end local v10           #x:I
    .end local v11           #z:I
    :cond_1
    invoke-virtual {p0, v8}, Ljava/nio/DoubleBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 822
    .restart local v4       #in:D
    .restart local v10       #x:I
    .restart local v11       #z:I
    :cond_2
    move-wide/from16 v0, p4

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    .restart local v6       #out:D
    goto :goto_4

    .line 826
    .end local v4           #in:D
    .end local v6           #out:D
    :cond_3
    add-int/lit8 v11, p7, -0x1

    :goto_5
    if-ltz v11, :cond_4

    .line 827
    aget-wide v12, v2, v11

    move-object/from16 v0, p2

    invoke-virtual {v0, v12, v13}, Ljava/nio/DoubleBuffer;->put(D)Ljava/nio/DoubleBuffer;

    .line 826
    add-int/lit8 v11, v11, -0x1

    goto :goto_5

    .line 815
    :cond_4
    add-int v10, v10, p7

    goto :goto_2

    .line 831
    .end local v10           #x:I
    .end local v11           #z:I
    :cond_5
    const/4 v10, 0x0

    .restart local v10       #x:I
    :goto_6
    if-ge v10, v9, :cond_7

    .line 832
    invoke-virtual {p0}, Ljava/nio/DoubleBuffer;->get()D

    move-result-wide v4

    .line 834
    .restart local v4       #in:D
    const-wide/high16 v12, 0x3ff0

    cmpl-double v12, p4, v12

    if-nez v12, :cond_6

    .line 835
    move-wide v6, v4

    .line 839
    .restart local v6       #out:D
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v0, v6, v7}, Ljava/nio/DoubleBuffer;->put(D)Ljava/nio/DoubleBuffer;

    .line 831
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 837
    .end local v6           #out:D
    :cond_6
    move-wide/from16 v0, p4

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    .restart local v6       #out:D
    goto :goto_7

    .line 842
    .end local v4           #in:D
    .end local v6           #out:D
    :cond_7
    add-int/2addr v8, p1

    .line 843
    add-int v3, v3, p3

    goto/16 :goto_0

    .line 845
    .end local v10           #x:I
    :cond_8
    return-void
.end method

.method public static flipCopyWithGamma(Ljava/nio/FloatBuffer;ILjava/nio/FloatBuffer;IDZI)V
    .locals 12
    .parameter "srcBuf"
    .parameter "srcStep"
    .parameter "dstBuf"
    .parameter "dstStep"
    .parameter "gamma"
    .parameter "flip"
    .parameter "channels"

    .prologue
    .line 756
    sget-boolean v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v10, :cond_0

    if-ne p0, p2, :cond_0

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 757
    :cond_0
    invoke-static {p1, p3}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 758
    .local v7, w:I
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->position()I

    move-result v6

    .local v6, srcLine:I
    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->position()I

    move-result v3

    .line 759
    .local v3, dstLine:I
    move/from16 v0, p7

    new-array v2, v0, [F

    .line 760
    .local v2, buffer:[F
    :goto_0
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->capacity()I

    move-result v10

    if-ge v6, v10, :cond_8

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->capacity()I

    move-result v10

    if-ge v3, v10, :cond_8

    .line 761
    if-eqz p6, :cond_1

    .line 762
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->capacity()I

    move-result v10

    sub-int/2addr v10, v6

    sub-int/2addr v10, p1

    invoke-virtual {p0, v10}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 766
    :goto_1
    invoke-virtual {p2, v3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 767
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->remaining()I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->remaining()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 768
    const/4 v10, 0x1

    move/from16 v0, p7

    if-le v0, v10, :cond_5

    .line 769
    const/4 v8, 0x0

    .local v8, x:I
    :goto_2
    if-ge v8, v7, :cond_7

    .line 770
    const/4 v9, 0x0

    .local v9, z:I
    :goto_3
    move/from16 v0, p7

    if-ge v9, v0, :cond_3

    .line 771
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->get()F

    move-result v4

    .line 773
    .local v4, in:F
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p4, v10

    if-nez v10, :cond_2

    .line 774
    move v5, v4

    .line 778
    .local v5, out:F
    :goto_4
    aput v5, v2, v9

    .line 770
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 764
    .end local v4           #in:F
    .end local v5           #out:F
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_1
    invoke-virtual {p0, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 776
    .restart local v4       #in:F
    .restart local v8       #x:I
    .restart local v9       #z:I
    :cond_2
    float-to-double v10, v4

    move-wide/from16 v0, p4

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    double-to-float v5, v10

    .restart local v5       #out:F
    goto :goto_4

    .line 780
    .end local v4           #in:F
    .end local v5           #out:F
    :cond_3
    add-int/lit8 v9, p7, -0x1

    :goto_5
    if-ltz v9, :cond_4

    .line 781
    aget v10, v2, v9

    invoke-virtual {p2, v10}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 780
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 769
    :cond_4
    add-int v8, v8, p7

    goto :goto_2

    .line 785
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_5
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_6
    if-ge v8, v7, :cond_7

    .line 786
    invoke-virtual {p0}, Ljava/nio/FloatBuffer;->get()F

    move-result v4

    .line 788
    .restart local v4       #in:F
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p4, v10

    if-nez v10, :cond_6

    .line 789
    move v5, v4

    .line 793
    .restart local v5       #out:F
    :goto_7
    invoke-virtual {p2, v5}, Ljava/nio/FloatBuffer;->put(F)Ljava/nio/FloatBuffer;

    .line 785
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 791
    .end local v5           #out:F
    :cond_6
    float-to-double v10, v4

    move-wide/from16 v0, p4

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    double-to-float v5, v10

    .restart local v5       #out:F
    goto :goto_7

    .line 796
    .end local v4           #in:F
    .end local v5           #out:F
    :cond_7
    add-int/2addr v6, p1

    .line 797
    add-int/2addr v3, p3

    goto/16 :goto_0

    .line 799
    .end local v8           #x:I
    :cond_8
    return-void
.end method

.method public static flipCopyWithGamma(Ljava/nio/IntBuffer;ILjava/nio/IntBuffer;IDZI)V
    .locals 14
    .parameter "srcBuf"
    .parameter "srcStep"
    .parameter "dstBuf"
    .parameter "dstStep"
    .parameter "gamma"
    .parameter "flip"
    .parameter "channels"

    .prologue
    .line 710
    sget-boolean v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v10, :cond_0

    move-object/from16 v0, p2

    if-ne p0, v0, :cond_0

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 711
    :cond_0
    move/from16 v0, p3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 712
    .local v7, w:I
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->position()I

    move-result v6

    .local v6, srcLine:I
    invoke-virtual/range {p2 .. p2}, Ljava/nio/IntBuffer;->position()I

    move-result v3

    .line 713
    .local v3, dstLine:I
    move/from16 v0, p7

    new-array v2, v0, [I

    .line 714
    .local v2, buffer:[I
    :goto_0
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->capacity()I

    move-result v10

    if-ge v6, v10, :cond_8

    invoke-virtual/range {p2 .. p2}, Ljava/nio/IntBuffer;->capacity()I

    move-result v10

    if-ge v3, v10, :cond_8

    .line 715
    if-eqz p6, :cond_1

    .line 716
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->capacity()I

    move-result v10

    sub-int/2addr v10, v6

    sub-int/2addr v10, p1

    invoke-virtual {p0, v10}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 720
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 721
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->remaining()I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-virtual/range {p2 .. p2}, Ljava/nio/IntBuffer;->remaining()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 722
    const/4 v10, 0x1

    move/from16 v0, p7

    if-le v0, v10, :cond_5

    .line 723
    const/4 v8, 0x0

    .local v8, x:I
    :goto_2
    if-ge v8, v7, :cond_7

    .line 724
    const/4 v9, 0x0

    .local v9, z:I
    :goto_3
    move/from16 v0, p7

    if-ge v9, v0, :cond_3

    .line 725
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->get()I

    move-result v4

    .line 727
    .local v4, in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p4, v10

    if-nez v10, :cond_2

    .line 728
    move v5, v4

    .line 732
    .local v5, out:I
    :goto_4
    aput v5, v2, v9

    .line 724
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 718
    .end local v4           #in:I
    .end local v5           #out:I
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_1
    invoke-virtual {p0, v6}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 730
    .restart local v4       #in:I
    .restart local v8       #x:I
    .restart local v9       #z:I
    :cond_2
    int-to-double v10, v4

    const-wide v12, 0x41dfffffffc00000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p4

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x41dfffffffc00000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v5, v10

    .restart local v5       #out:I
    goto :goto_4

    .line 734
    .end local v4           #in:I
    .end local v5           #out:I
    :cond_3
    add-int/lit8 v9, p7, -0x1

    :goto_5
    if-ltz v9, :cond_4

    .line 735
    aget v10, v2, v9

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 734
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 723
    :cond_4
    add-int v8, v8, p7

    goto :goto_2

    .line 739
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_5
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_6
    if-ge v8, v7, :cond_7

    .line 740
    invoke-virtual {p0}, Ljava/nio/IntBuffer;->get()I

    move-result v4

    .line 742
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p4, v10

    if-nez v10, :cond_6

    .line 743
    move v5, v4

    .line 747
    .restart local v5       #out:I
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 739
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 745
    .end local v5           #out:I
    :cond_6
    int-to-double v10, v4

    const-wide v12, 0x41dfffffffc00000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p4

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x41dfffffffc00000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v5, v10

    .restart local v5       #out:I
    goto :goto_7

    .line 750
    .end local v4           #in:I
    .end local v5           #out:I
    :cond_7
    add-int/2addr v6, p1

    .line 751
    add-int v3, v3, p3

    goto/16 :goto_0

    .line 753
    .end local v8           #x:I
    :cond_8
    return-void
.end method

.method public static flipCopyWithGamma(Ljava/nio/ShortBuffer;ILjava/nio/ShortBuffer;IZDZI)V
    .locals 14
    .parameter "srcBuf"
    .parameter "srcStep"
    .parameter "dstBuf"
    .parameter "dstStep"
    .parameter "signed"
    .parameter "gamma"
    .parameter "flip"
    .parameter "channels"

    .prologue
    .line 633
    sget-boolean v10, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v10, :cond_0

    move-object/from16 v0, p2

    if-ne p0, v0, :cond_0

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 634
    :cond_0
    move/from16 v0, p3

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 635
    .local v7, w:I
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->position()I

    move-result v6

    .local v6, srcLine:I
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ShortBuffer;->position()I

    move-result v3

    .line 636
    .local v3, dstLine:I
    move/from16 v0, p8

    new-array v2, v0, [S

    .line 637
    .local v2, buffer:[S
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v10

    if-ge v6, v10, :cond_e

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v10

    if-ge v3, v10, :cond_e

    .line 638
    if-eqz p7, :cond_1

    .line 639
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v10

    sub-int/2addr v10, v6

    sub-int/2addr v10, p1

    invoke-virtual {p0, v10}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 643
    :goto_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 644
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v10

    invoke-static {v7, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    invoke-virtual/range {p2 .. p2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 645
    if-eqz p4, :cond_7

    .line 646
    const/4 v10, 0x1

    move/from16 v0, p8

    if-le v0, v10, :cond_5

    .line 647
    const/4 v8, 0x0

    .local v8, x:I
    :goto_2
    if-ge v8, v7, :cond_d

    .line 648
    const/4 v9, 0x0

    .local v9, z:I
    :goto_3
    move/from16 v0, p8

    if-ge v9, v0, :cond_3

    .line 649
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->get()S

    move-result v4

    .line 651
    .local v4, in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_2

    .line 652
    int-to-short v5, v4

    .line 656
    .local v5, out:S
    :goto_4
    aput-short v5, v2, v9

    .line 648
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 641
    .end local v4           #in:I
    .end local v5           #out:S
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_1
    invoke-virtual {p0, v6}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 654
    .restart local v4       #in:I
    .restart local v8       #x:I
    .restart local v9       #z:I
    :cond_2
    int-to-double v10, v4

    const-wide v12, 0x40dfffc000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x40dfffc000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-short v5, v10

    .restart local v5       #out:S
    goto :goto_4

    .line 658
    .end local v4           #in:I
    .end local v5           #out:S
    :cond_3
    add-int/lit8 v9, p8, -0x1

    :goto_5
    if-ltz v9, :cond_4

    .line 659
    aget-short v10, v2, v9

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 658
    add-int/lit8 v9, v9, -0x1

    goto :goto_5

    .line 647
    :cond_4
    add-int v8, v8, p8

    goto :goto_2

    .line 663
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_5
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_6
    if-ge v8, v7, :cond_d

    .line 664
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->get()S

    move-result v4

    .line 666
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_6

    .line 667
    int-to-short v5, v4

    .line 671
    .restart local v5       #out:S
    :goto_7
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 663
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 669
    .end local v5           #out:S
    :cond_6
    int-to-double v10, v4

    const-wide v12, 0x40dfffc000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x40dfffc000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-short v5, v10

    .restart local v5       #out:S
    goto :goto_7

    .line 675
    .end local v4           #in:I
    .end local v5           #out:S
    .end local v8           #x:I
    :cond_7
    const/4 v10, 0x1

    move/from16 v0, p8

    if-le v0, v10, :cond_b

    .line 676
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_8
    if-ge v8, v7, :cond_d

    .line 677
    const/4 v9, 0x0

    .restart local v9       #z:I
    :goto_9
    move/from16 v0, p8

    if-ge v9, v0, :cond_9

    .line 678
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->get()S

    move-result v4

    .line 680
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_8

    .line 681
    int-to-short v5, v4

    .line 685
    .restart local v5       #out:S
    :goto_a
    aput-short v5, v2, v9

    .line 677
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 683
    .end local v5           #out:S
    :cond_8
    int-to-double v10, v4

    const-wide v12, 0x40efffe000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x40efffe000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-short v5, v10

    .restart local v5       #out:S
    goto :goto_a

    .line 687
    .end local v4           #in:I
    .end local v5           #out:S
    :cond_9
    add-int/lit8 v9, p8, -0x1

    :goto_b
    if-ltz v9, :cond_a

    .line 688
    aget-short v10, v2, v9

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 687
    add-int/lit8 v9, v9, -0x1

    goto :goto_b

    .line 676
    :cond_a
    add-int v8, v8, p8

    goto :goto_8

    .line 692
    .end local v8           #x:I
    .end local v9           #z:I
    :cond_b
    const/4 v8, 0x0

    .restart local v8       #x:I
    :goto_c
    if-ge v8, v7, :cond_d

    .line 693
    invoke-virtual {p0}, Ljava/nio/ShortBuffer;->get()S

    move-result v10

    const v11, 0xffff

    and-int v4, v10, v11

    .line 695
    .restart local v4       #in:I
    const-wide/high16 v10, 0x3ff0

    cmpl-double v10, p5, v10

    if-nez v10, :cond_c

    .line 696
    int-to-short v5, v4

    .line 700
    .restart local v5       #out:S
    :goto_d
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 692
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 698
    .end local v5           #out:S
    :cond_c
    int-to-double v10, v4

    const-wide v12, 0x40efffe000000000L

    div-double/2addr v10, v12

    move-wide/from16 v0, p5

    invoke-static {v10, v11, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    const-wide v12, 0x40efffe000000000L

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->round(D)J

    move-result-wide v10

    long-to-int v10, v10

    int-to-short v5, v10

    .restart local v5       #out:S
    goto :goto_d

    .line 704
    .end local v4           #in:I
    .end local v5           #out:S
    :cond_d
    add-int/2addr v6, p1

    .line 705
    add-int v3, v3, p3

    goto/16 :goto_0

    .line 707
    .end local v8           #x:I
    :cond_e
    return-void
.end method


# virtual methods
.method public native BorderConst(I)I
.end method

.method public native BorderConst(II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native BorderMode(I)I
.end method

.method public native BorderMode(II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native ID()I
.end method

.method public native ID(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native align()I
.end method

.method public native align(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native alphaChannel()I
.end method

.method public native alphaChannel(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public applyGamma(D)V
    .locals 9
    .parameter "gamma"

    .prologue
    .line 847
    const-wide/high16 v0, 0x3ff0

    cmpl-double v0, p1, v0

    if-nez v0, :cond_1

    .line 875
    :cond_0
    :goto_0
    return-void

    .line 850
    :cond_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 873
    sget-boolean v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 852
    :sswitch_0
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v5, p1

    invoke-static/range {v0 .. v8}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IZDZI)V

    goto :goto_0

    .line 855
    :sswitch_1
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    const/4 v4, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v5, p1

    invoke-static/range {v0 .. v8}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IZDZI)V

    goto :goto_0

    .line 858
    :sswitch_2
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v5, p1

    invoke-static/range {v0 .. v8}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/ShortBuffer;ILjava/nio/ShortBuffer;IZDZI)V

    goto :goto_0

    .line 861
    :sswitch_3
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    const/4 v4, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v5, p1

    invoke-static/range {v0 .. v8}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/ShortBuffer;ILjava/nio/ShortBuffer;IZDZI)V

    goto :goto_0

    .line 864
    :sswitch_4
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    div-int/lit8 v3, v3, 0x4

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v7}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/FloatBuffer;ILjava/nio/FloatBuffer;IDZI)V

    goto/16 :goto_0

    .line 867
    :sswitch_5
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    div-int/lit8 v1, v1, 0x4

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    div-int/lit8 v3, v3, 0x4

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v7}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/FloatBuffer;ILjava/nio/FloatBuffer;IDZI)V

    goto/16 :goto_0

    .line 870
    :sswitch_6
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v1

    div-int/lit8 v1, v1, 0x8

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->widthStep()I

    move-result v3

    div-int/lit8 v3, v3, 0x8

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v7}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->flipCopyWithGamma(Ljava/nio/DoubleBuffer;ILjava/nio/DoubleBuffer;IDZI)V

    goto/16 :goto_0

    .line 850
    :sswitch_data_0
    .sparse-switch
        -0x7ffffff8 -> :sswitch_1
        -0x7ffffff0 -> :sswitch_3
        -0x7fffffe0 -> :sswitch_4
        0x8 -> :sswitch_0
        0x10 -> :sswitch_2
        0x20 -> :sswitch_5
        0x40 -> :sswitch_6
    .end sparse-switch
.end method

.method public asCvMat()Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    .locals 3

    .prologue
    .line 878
    new-instance v0, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    invoke-direct {v0}, Lcom/googlecode/javacv/cpp/opencv_core$CvMat;-><init>()V

    .line 879
    .local v0, mat:Lcom/googlecode/javacv/cpp/opencv_core$CvMat;
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/googlecode/javacv/cpp/opencv_core;->cvGetMat(Lcom/googlecode/javacv/cpp/opencv_core$CvArr;Lcom/googlecode/javacv/cpp/opencv_core$CvMat;[II)Lcom/googlecode/javacv/cpp/opencv_core$CvMat;

    .line 880
    return-object v0
.end method

.method public native channelSeq(I)I
.end method

.method public native channelSeq(II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public clone()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 2

    .prologue
    .line 455
    invoke-static {p0}, Lcom/googlecode/javacv/cpp/opencv_core;->cvCloneImage(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    .line 456
    .local v0, i:Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    if-eqz v0, :cond_0

    .line 457
    new-instance v1, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$ReleaseDeallocator;

    invoke-direct {v1, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage$ReleaseDeallocator;-><init>(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    invoke-virtual {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->deallocator(Lcom/googlecode/javacpp/Pointer$Deallocator;)Lcom/googlecode/javacpp/Pointer;

    .line 459
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
    .line 379
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->clone()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    return-object v0
.end method

.method public native colorModel(I)I
.end method

.method public native colorModel(II)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public cvSize()Lcom/googlecode/javacv/cpp/opencv_core$CvSize;
    .locals 2

    .prologue
    .line 518
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v1

    invoke-static {v0, v1}, Lcom/googlecode/javacv/cpp/opencv_core;->cvSize(II)Lcom/googlecode/javacv/cpp/opencv_core$CvSize;

    move-result-object v0

    return-object v0
.end method

.method public native dataOrder()I
.end method

.method public native dataOrder(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native depth()I
.end method

.method public native depth(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 525
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getByteBuffer(I)Ljava/nio/ByteBuffer;
    .locals 2
    .parameter "index"

    .prologue
    .line 520
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->imageData()Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/googlecode/javacpp/BytePointer;->position(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->imageSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/googlecode/javacpp/BytePointer;->capacity(I)Lcom/googlecode/javacpp/BytePointer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/googlecode/javacpp/BytePointer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getDoubleBuffer()Ljava/nio/DoubleBuffer;
    .locals 1

    .prologue
    .line 529
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getDoubleBuffer(I)Ljava/nio/DoubleBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getDoubleBuffer(I)Ljava/nio/DoubleBuffer;
    .locals 1
    .parameter "index"

    .prologue
    .line 524
    mul-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asDoubleBuffer()Ljava/nio/DoubleBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getFloatBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .prologue
    .line 528
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getFloatBuffer(I)Ljava/nio/FloatBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getFloatBuffer(I)Ljava/nio/FloatBuffer;
    .locals 1
    .parameter "index"

    .prologue
    .line 523
    mul-int/lit8 v0, p1, 0x4

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getIntBuffer()Ljava/nio/IntBuffer;
    .locals 1

    .prologue
    .line 527
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getIntBuffer(I)Ljava/nio/IntBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getIntBuffer(I)Ljava/nio/IntBuffer;
    .locals 1
    .parameter "index"

    .prologue
    .line 522
    mul-int/lit8 v0, p1, 0x4

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getShortBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    .prologue
    .line 526
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getShortBuffer(I)Ljava/nio/ShortBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getShortBuffer(I)Ljava/nio/ShortBuffer;
    .locals 1
    .parameter "index"

    .prologue
    .line 521
    mul-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->getByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    return-object v0
.end method

.method public native height()I
.end method

.method public native height(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public highValue()D
    .locals 3

    .prologue
    .line 503
    const-wide/16 v0, 0x0

    .line 504
    .local v0, highValue:D
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 513
    sget-boolean v2, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 505
    :sswitch_0
    const-wide v0, 0x406fe00000000000L

    .line 515
    :cond_0
    :goto_0
    return-wide v0

    .line 506
    :sswitch_1
    const-wide v0, 0x40efffe000000000L

    goto :goto_0

    .line 507
    :sswitch_2
    const-wide v0, 0x405fc00000000000L

    goto :goto_0

    .line 508
    :sswitch_3
    const-wide v0, 0x40dfffc000000000L

    goto :goto_0

    .line 509
    :sswitch_4
    const-wide v0, 0x41dfffffffc00000L

    goto :goto_0

    .line 512
    :sswitch_5
    const-wide/high16 v0, 0x3ff0

    goto :goto_0

    .line 504
    :sswitch_data_0
    .sparse-switch
        -0x7ffffff8 -> :sswitch_2
        -0x7ffffff0 -> :sswitch_3
        -0x7fffffe0 -> :sswitch_4
        0x1 -> :sswitch_5
        0x8 -> :sswitch_0
        0x10 -> :sswitch_1
        0x20 -> :sswitch_5
        0x40 -> :sswitch_5
    .end sparse-switch
.end method

.method public native imageData()Lcom/googlecode/javacpp/BytePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "char*"
        }
    .end annotation
.end method

.method public native imageData(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native imageData(Ljava/nio/ByteBuffer;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .parameter
        .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
            value = {
                "char*"
            }
        .end annotation
    .end parameter
    .annotation runtime Lcom/googlecode/javacpp/annotation/MemberSetter;
    .end annotation
.end method

.method public native imageDataOrigin()Lcom/googlecode/javacpp/BytePointer;
    .annotation runtime Lcom/googlecode/javacpp/annotation/Cast;
        value = {
            "char*"
        }
    .end annotation
.end method

.method public native imageDataOrigin(Lcom/googlecode/javacpp/BytePointer;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native imageId()Lcom/googlecode/javacpp/Pointer;
.end method

.method public native imageId(Lcom/googlecode/javacpp/Pointer;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native imageSize()I
.end method

.method public native imageSize(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native maskROI()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native maskROI(Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native nChannels()I
.end method

.method public native nChannels(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native nSize()I
.end method

.method public native nSize(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native origin()I
.end method

.method public native origin(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public bridge synthetic position(I)Lcom/googlecode/javacpp/Pointer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 379
    invoke-virtual {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->position(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v0

    return-object v0
.end method

.method public position(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
    .locals 1
    .parameter "position"

    .prologue
    .line 387
    invoke-super {p0, p1}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;->position(I)Lcom/googlecode/javacpp/Pointer;

    move-result-object v0

    check-cast v0, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    return-object v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 463
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->deallocate()V

    .line 464
    return-void
.end method

.method public native roi(Lcom/googlecode/javacv/cpp/opencv_core$IplROI;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native roi()Lcom/googlecode/javacv/cpp/opencv_core$IplROI;
.end method

.method public native tileInfo(Lcom/googlecode/javacv/cpp/opencv_core$IplTileInfo;)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native tileInfo()Lcom/googlecode/javacv/cpp/opencv_core$IplTileInfo;
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 884
    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->isNull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 885
    invoke-super {p0}, Lcom/googlecode/javacv/cpp/opencv_core$CvArr;->toString()Ljava/lang/String;

    move-result-object v0

    .line 887
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IplImage[width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->width()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->height()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",depth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->depth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",nChannels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/googlecode/javacv/cpp/opencv_core$IplImage;->nChannels()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public native width()I
.end method

.method public native width(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method

.method public native widthStep()I
.end method

.method public native widthStep(I)Lcom/googlecode/javacv/cpp/opencv_core$IplImage;
.end method
