.class public Landroid/support/v8/renderscript/Allocation;
.super Landroid/support/v8/renderscript/BaseObj;
.source "Allocation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v8/renderscript/Allocation$1;,
        Landroid/support/v8/renderscript/Allocation$MipmapControl;
    }
.end annotation


# static fields
.field public static final USAGE_GRAPHICS_TEXTURE:I = 0x2

.field public static final USAGE_IO_INPUT:I = 0x20

.field public static final USAGE_IO_OUTPUT:I = 0x40

.field public static final USAGE_SCRIPT:I = 0x1

.field public static final USAGE_SHARED:I = 0x80

.field static mBitmapOptions:Landroid/graphics/BitmapFactory$Options;


# instance fields
.field mAdaptedAllocation:Landroid/support/v8/renderscript/Allocation;

.field mBitmap:Landroid/graphics/Bitmap;

.field mConstrainedFace:Z

.field mConstrainedLOD:Z

.field mConstrainedY:Z

.field mConstrainedZ:Z

.field mCurrentCount:I

.field mCurrentDimX:I

.field mCurrentDimY:I

.field mCurrentDimZ:I

.field mReadAllowed:Z

.field mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

.field mSelectedLOD:I

.field mSelectedY:I

.field mSelectedZ:I

.field mType:Landroid/support/v8/renderscript/Type;

.field mUsage:I

.field mWriteAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 1171
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sput-object v0, Landroid/support/v8/renderscript/Allocation;->mBitmapOptions:Landroid/graphics/BitmapFactory$Options;

    .line 1173
    sget-object v0, Landroid/support/v8/renderscript/Allocation;->mBitmapOptions:Landroid/graphics/BitmapFactory$Options;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 1174
    return-void
.end method

.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V
    .locals 2
    .parameter "id"
    .parameter "rs"
    .parameter "t"
    .parameter "usage"

    .prologue
    const/4 v0, 0x1

    .line 218
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/BaseObj;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 69
    iput-boolean v0, p0, Landroid/support/v8/renderscript/Allocation;->mReadAllowed:Z

    .line 70
    iput-boolean v0, p0, Landroid/support/v8/renderscript/Allocation;->mWriteAllowed:Z

    .line 74
    sget-object v0, Landroid/support/v8/renderscript/Type$CubemapFace;->POSITIVE_X:Landroid/support/v8/renderscript/Type$CubemapFace;

    iput-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    .line 219
    and-int/lit16 v0, p4, -0xe4

    if-eqz v0, :cond_0

    .line 224
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Unknown usage specified."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :cond_0
    and-int/lit8 v0, p4, 0x20

    if-eqz v0, :cond_1

    .line 228
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v8/renderscript/Allocation;->mWriteAllowed:Z

    .line 230
    and-int/lit8 v0, p4, -0x24

    if-eqz v0, :cond_1

    .line 233
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Invalid usage combination."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_1
    iput-object p3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    .line 238
    iput p4, p0, Landroid/support/v8/renderscript/Allocation;->mUsage:I

    .line 240
    if-eqz p3, :cond_2

    .line 241
    invoke-direct {p0, p3}, Landroid/support/v8/renderscript/Allocation;->updateCacheInfo(Landroid/support/v8/renderscript/Type;)V

    .line 243
    :cond_2
    return-void
.end method

.method public static createCubemapFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Allocation;
    .locals 2
    .parameter "rs"
    .parameter "b"

    .prologue
    .line 1438
    sget-object v0, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1}, Landroid/support/v8/renderscript/Allocation;->createCubemapFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createCubemapFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 10
    .parameter "rs"
    .parameter "b"
    .parameter "mips"
    .parameter "usage"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1392
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1394
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 1395
    .local v1, height:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 1397
    .local v6, width:I
    rem-int/lit8 v9, v6, 0x6

    if-eqz v9, :cond_0

    .line 1398
    new-instance v7, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v8, "Cubemap height must be multiple of 6"

    invoke-direct {v7, v8}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1400
    :cond_0
    div-int/lit8 v9, v6, 0x6

    if-eq v9, v1, :cond_1

    .line 1401
    new-instance v7, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v8, "Only square cube map faces supported"

    invoke-direct {v7, v8}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1403
    :cond_1
    add-int/lit8 v9, v1, -0x1

    and-int/2addr v9, v1

    if-nez v9, :cond_2

    move v3, v7

    .line 1404
    .local v3, isPow2:Z
    :goto_0
    if-nez v3, :cond_3

    .line 1405
    new-instance v7, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v8, "Only power of 2 cube faces supported"

    invoke-direct {v7, v8}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .end local v3           #isPow2:Z
    :cond_2
    move v3, v8

    .line 1403
    goto :goto_0

    .line 1408
    .restart local v3       #isPow2:Z
    :cond_3
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/Allocation;->elementFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Element;

    move-result-object v0

    .line 1409
    .local v0, e:Landroid/support/v8/renderscript/Element;
    new-instance v5, Landroid/support/v8/renderscript/Type$Builder;

    invoke-direct {v5, p0, v0}, Landroid/support/v8/renderscript/Type$Builder;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 1410
    .local v5, tb:Landroid/support/v8/renderscript/Type$Builder;
    invoke-virtual {v5, v1}, Landroid/support/v8/renderscript/Type$Builder;->setX(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 1411
    invoke-virtual {v5, v1}, Landroid/support/v8/renderscript/Type$Builder;->setY(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 1412
    invoke-virtual {v5, v7}, Landroid/support/v8/renderscript/Type$Builder;->setFaces(Z)Landroid/support/v8/renderscript/Type$Builder;

    .line 1413
    sget-object v9, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_FULL:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    if-ne p2, v9, :cond_4

    :goto_1
    invoke-virtual {v5, v7}, Landroid/support/v8/renderscript/Type$Builder;->setMipmaps(Z)Landroid/support/v8/renderscript/Type$Builder;

    .line 1414
    invoke-virtual {v5}, Landroid/support/v8/renderscript/Type$Builder;->create()Landroid/support/v8/renderscript/Type;

    move-result-object v4

    .line 1416
    .local v4, t:Landroid/support/v8/renderscript/Type;
    invoke-virtual {v4, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v7

    iget v8, p2, Landroid/support/v8/renderscript/Allocation$MipmapControl;->mID:I

    invoke-virtual {p0, v7, v8, p1, p3}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCubeCreateFromBitmap(IILandroid/graphics/Bitmap;I)I

    move-result v2

    .line 1417
    .local v2, id:I
    if-nez v2, :cond_5

    .line 1418
    new-instance v7, Landroid/support/v8/renderscript/RSRuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Load failed for bitmap "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " element "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .end local v2           #id:I
    .end local v4           #t:Landroid/support/v8/renderscript/Type;
    :cond_4
    move v7, v8

    .line 1413
    goto :goto_1

    .line 1420
    .restart local v2       #id:I
    .restart local v4       #t:Landroid/support/v8/renderscript/Type;
    :cond_5
    new-instance v7, Landroid/support/v8/renderscript/Allocation;

    invoke-direct {v7, v2, p0, v4, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    return-object v7
.end method

.method public static createCubemapFromCubeFaces(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Allocation;
    .locals 9
    .parameter "rs"
    .parameter "xpos"
    .parameter "xneg"
    .parameter "ypos"
    .parameter "yneg"
    .parameter "zpos"
    .parameter "zneg"

    .prologue
    .line 1536
    sget-object v7, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    const/4 v8, 0x2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v8}, Landroid/support/v8/renderscript/Allocation;->createCubemapFromCubeFaces(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createCubemapFromCubeFaces(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 1
    .parameter "rs"
    .parameter "xpos"
    .parameter "xneg"
    .parameter "ypos"
    .parameter "yneg"
    .parameter "zpos"
    .parameter "zneg"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 1509
    const/4 v0, 0x0

    return-object v0
.end method

.method public static createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Allocation;
    .locals 2
    .parameter "rs"
    .parameter "b"

    .prologue
    .line 1370
    sget-object v0, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    const/16 v1, 0x83

    invoke-static {p0, p1, v0, v1}, Landroid/support/v8/renderscript/Allocation;->createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 10
    .parameter "rs"
    .parameter "b"
    .parameter "mips"
    .parameter "usage"

    .prologue
    const/4 v9, 0x0

    .line 1315
    sget-boolean v6, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v6, :cond_0

    move-object v4, p0

    .line 1316
    check-cast v4, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 1317
    .local v4, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {v4, p1, p2, p3}, Landroid/support/v8/renderscript/AllocationThunker;->createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    .line 1354
    .end local v4           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v0

    .line 1319
    :cond_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1322
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v6

    if-nez v6, :cond_2

    .line 1323
    and-int/lit16 v6, p3, 0x80

    if-eqz v6, :cond_1

    .line 1324
    new-instance v6, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v7, "USAGE_SHARED cannot be used with a Bitmap that has a null config."

    invoke-direct {v6, v7}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1326
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 1327
    .local v3, newBitmap:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1328
    .local v1, c:Landroid/graphics/Canvas;
    const/4 v6, 0x0

    invoke-virtual {v1, p1, v9, v9, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1329
    invoke-static {p0, v3, p2, p3}, Landroid/support/v8/renderscript/Allocation;->createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    goto :goto_0

    .line 1332
    .end local v1           #c:Landroid/graphics/Canvas;
    .end local v3           #newBitmap:Landroid/graphics/Bitmap;
    :cond_2
    invoke-static {p0, p1, p2}, Landroid/support/v8/renderscript/Allocation;->typeFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/support/v8/renderscript/Type;

    move-result-object v5

    .line 1335
    .local v5, t:Landroid/support/v8/renderscript/Type;
    sget-object v6, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    if-ne p2, v6, :cond_4

    invoke-virtual {v5}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v6

    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->RGBA_8888(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/support/v8/renderscript/Element;->isCompatible(Landroid/support/v8/renderscript/Element;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x83

    if-ne p3, v6, :cond_4

    .line 1338
    invoke-virtual {v5, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v6

    iget v7, p2, Landroid/support/v8/renderscript/Allocation$MipmapControl;->mID:I

    invoke-virtual {p0, v6, v7, p1, p3}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCreateBitmapBackedAllocation(IILandroid/graphics/Bitmap;I)I

    move-result v2

    .line 1339
    .local v2, id:I
    if-nez v2, :cond_3

    .line 1340
    new-instance v6, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v7, "Load failed."

    invoke-direct {v6, v7}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1344
    :cond_3
    new-instance v0, Landroid/support/v8/renderscript/Allocation;

    invoke-direct {v0, v2, p0, v5, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    .line 1345
    .local v0, alloc:Landroid/support/v8/renderscript/Allocation;
    invoke-direct {v0, p1}, Landroid/support/v8/renderscript/Allocation;->setBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1350
    .end local v0           #alloc:Landroid/support/v8/renderscript/Allocation;
    .end local v2           #id:I
    :cond_4
    invoke-virtual {v5, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v6

    iget v7, p2, Landroid/support/v8/renderscript/Allocation$MipmapControl;->mID:I

    invoke-virtual {p0, v6, v7, p1, p3}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCreateFromBitmap(IILandroid/graphics/Bitmap;I)I

    move-result v2

    .line 1351
    .restart local v2       #id:I
    if-nez v2, :cond_5

    .line 1352
    new-instance v6, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v7, "Load failed."

    invoke-direct {v6, v7}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1354
    :cond_5
    new-instance v0, Landroid/support/v8/renderscript/Allocation;

    invoke-direct {v0, v2, p0, v5, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    goto/16 :goto_0
.end method

.method public static createFromBitmapResource(Landroid/support/v8/renderscript/RenderScript;Landroid/content/res/Resources;I)Landroid/support/v8/renderscript/Allocation;
    .locals 2
    .parameter "rs"
    .parameter "res"
    .parameter "id"

    .prologue
    .line 1589
    sget-object v0, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    const/4 v1, 0x3

    invoke-static {p0, p1, p2, v0, v1}, Landroid/support/v8/renderscript/Allocation;->createFromBitmapResource(Landroid/support/v8/renderscript/RenderScript;Landroid/content/res/Resources;ILandroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createFromBitmapResource(Landroid/support/v8/renderscript/RenderScript;Landroid/content/res/Resources;ILandroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 4
    .parameter "rs"
    .parameter "res"
    .parameter "id"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 1562
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1563
    and-int/lit16 v2, p4, 0xe0

    if-eqz v2, :cond_0

    .line 1564
    new-instance v2, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v3, "Unsupported usage specified."

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1566
    :cond_0
    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1567
    .local v1, b:Landroid/graphics/Bitmap;
    invoke-static {p0, v1, p3, p4}, Landroid/support/v8/renderscript/Allocation;->createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    .line 1568
    .local v0, alloc:Landroid/support/v8/renderscript/Allocation;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 1569
    return-object v0
.end method

.method public static createFromString(Landroid/support/v8/renderscript/RenderScript;Ljava/lang/String;I)Landroid/support/v8/renderscript/Allocation;
    .locals 5
    .parameter "rs"
    .parameter "str"
    .parameter "usage"

    .prologue
    .line 1606
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1607
    const/4 v1, 0x0

    .line 1609
    .local v1, allocArray:[B
    :try_start_0
    const-string v3, "UTF-8"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 1610
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->U8(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v3

    array-length v4, v1

    invoke-static {p0, v3, v4, p2}, Landroid/support/v8/renderscript/Allocation;->createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;II)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    .line 1611
    .local v0, alloc:Landroid/support/v8/renderscript/Allocation;
    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/Allocation;->copyFrom([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1612
    return-object v0

    .line 1614
    .end local v0           #alloc:Landroid/support/v8/renderscript/Allocation;
    :catch_0
    move-exception v2

    .line 1615
    .local v2, e:Ljava/lang/Exception;
    new-instance v3, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v4, "Could not convert string to utf-8."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;I)Landroid/support/v8/renderscript/Allocation;
    .locals 1
    .parameter "rs"
    .parameter "e"
    .parameter "count"

    .prologue
    .line 1269
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Landroid/support/v8/renderscript/Allocation;->createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;II)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;II)Landroid/support/v8/renderscript/Allocation;
    .locals 7
    .parameter "rs"
    .parameter "e"
    .parameter "count"
    .parameter "usage"

    .prologue
    .line 1243
    sget-boolean v4, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v4, :cond_0

    move-object v2, p0

    .line 1244
    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 1245
    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {p0, p1, p2, p3}, Landroid/support/v8/renderscript/AllocationThunker;->createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;II)Landroid/support/v8/renderscript/Allocation;

    move-result-object v4

    .line 1256
    .end local v2           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v4

    .line 1247
    :cond_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1248
    new-instance v0, Landroid/support/v8/renderscript/Type$Builder;

    invoke-direct {v0, p0, p1}, Landroid/support/v8/renderscript/Type$Builder;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 1249
    .local v0, b:Landroid/support/v8/renderscript/Type$Builder;
    invoke-virtual {v0, p2}, Landroid/support/v8/renderscript/Type$Builder;->setX(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 1250
    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type$Builder;->create()Landroid/support/v8/renderscript/Type;

    move-result-object v3

    .line 1252
    .local v3, t:Landroid/support/v8/renderscript/Type;
    invoke-virtual {v3, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    sget-object v5, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    iget v5, v5, Landroid/support/v8/renderscript/Allocation$MipmapControl;->mID:I

    const/4 v6, 0x0

    invoke-virtual {p0, v4, v5, p3, v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCreateTyped(IIII)I

    move-result v1

    .line 1253
    .local v1, id:I
    if-nez v1, :cond_1

    .line 1254
    new-instance v4, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v5, "Allocation creation failed."

    invoke-direct {v4, v5}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1256
    :cond_1
    new-instance v4, Landroid/support/v8/renderscript/Allocation;

    invoke-direct {v4, v1, p0, v3, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    goto :goto_0
.end method

.method public static createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;)Landroid/support/v8/renderscript/Allocation;
    .locals 2
    .parameter "rs"
    .parameter "type"

    .prologue
    .line 1227
    sget-object v0, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Landroid/support/v8/renderscript/Allocation;->createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)Landroid/support/v8/renderscript/Allocation;
    .locals 1
    .parameter "rs"
    .parameter "type"
    .parameter "usage"

    .prologue
    .line 1214
    sget-object v0, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    invoke-static {p0, p1, v0, p2}, Landroid/support/v8/renderscript/Allocation;->createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public static createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 5
    .parameter "rs"
    .parameter "type"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 1187
    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 1188
    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 1189
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {v1, p1, p2, p3}, Landroid/support/v8/renderscript/AllocationThunker;->createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v2

    .line 1199
    .end local v1           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v2

    .line 1191
    :cond_0
    invoke-virtual {p0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1192
    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    if-nez v2, :cond_1

    .line 1193
    new-instance v2, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v3, "Bad Type"

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1195
    :cond_1
    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    iget v3, p2, Landroid/support/v8/renderscript/Allocation$MipmapControl;->mID:I

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v3, p3, v4}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCreateTyped(IIII)I

    move-result v0

    .line 1196
    .local v0, id:I
    if-nez v0, :cond_2

    .line 1197
    new-instance v2, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v3, "Allocation creation failed."

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1199
    :cond_2
    new-instance v2, Landroid/support/v8/renderscript/Allocation;

    invoke-direct {v2, v0, p0, p1, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    goto :goto_0
.end method

.method private data1DChecks(IIII)V
    .locals 3
    .parameter "off"
    .parameter "count"
    .parameter "len"
    .parameter "dataSize"

    .prologue
    .line 665
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 666
    if-gez p1, :cond_0

    .line 667
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Offset must be >= 0."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 669
    :cond_0
    const/4 v0, 0x1

    if-ge p2, v0, :cond_1

    .line 670
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Count must be >= 1."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 672
    :cond_1
    add-int v0, p1, p2

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    if-le v0, v1, :cond_2

    .line 673
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Overflow, Available count "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", got "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " at offset "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 676
    :cond_2
    if-ge p3, p4, :cond_3

    .line 677
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Array too small for allocation type."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 679
    :cond_3
    return-void
.end method

.method static elementFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Element;
    .locals 4
    .parameter "rs"
    .parameter "b"

    .prologue
    .line 1273
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    .line 1274
    .local v0, bc:Landroid/graphics/Bitmap$Config;
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_0

    .line 1275
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->A_8(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    .line 1284
    :goto_0
    return-object v1

    .line 1277
    :cond_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_1

    .line 1278
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->RGBA_4444(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    goto :goto_0

    .line 1280
    :cond_1
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_2

    .line 1281
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->RGBA_8888(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    goto :goto_0

    .line 1283
    :cond_2
    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_3

    .line 1284
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->RGB_565(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    goto :goto_0

    .line 1286
    :cond_3
    new-instance v1, Landroid/support/v8/renderscript/RSInvalidStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad bitmap type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getIDSafe()I
    .locals 2

    .prologue
    .line 162
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mAdaptedAllocation:Landroid/support/v8/renderscript/Allocation;

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mAdaptedAllocation:Landroid/support/v8/renderscript/Allocation;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v0

    .line 165
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v0

    goto :goto_0
.end method

.method private setBitmap(Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "b"

    .prologue
    .line 214
    iput-object p1, p0, Landroid/support/v8/renderscript/Allocation;->mBitmap:Landroid/graphics/Bitmap;

    .line 215
    return-void
.end method

.method static typeFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/support/v8/renderscript/Type;
    .locals 3
    .parameter "rs"
    .parameter "b"
    .parameter "mip"

    .prologue
    .line 1291
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/Allocation;->elementFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;)Landroid/support/v8/renderscript/Element;

    move-result-object v0

    .line 1292
    .local v0, e:Landroid/support/v8/renderscript/Element;
    new-instance v1, Landroid/support/v8/renderscript/Type$Builder;

    invoke-direct {v1, p0, v0}, Landroid/support/v8/renderscript/Type$Builder;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 1293
    .local v1, tb:Landroid/support/v8/renderscript/Type$Builder;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v8/renderscript/Type$Builder;->setX(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 1294
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v8/renderscript/Type$Builder;->setY(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 1295
    sget-object v2, Landroid/support/v8/renderscript/Allocation$MipmapControl;->MIPMAP_FULL:Landroid/support/v8/renderscript/Allocation$MipmapControl;

    if-ne p2, v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v1, v2}, Landroid/support/v8/renderscript/Type$Builder;->setMipmaps(Z)Landroid/support/v8/renderscript/Type$Builder;

    .line 1296
    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type$Builder;->create()Landroid/support/v8/renderscript/Type;

    move-result-object v2

    return-object v2

    .line 1295
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private updateCacheInfo(Landroid/support/v8/renderscript/Type;)V
    .locals 3
    .parameter "t"

    .prologue
    const/4 v2, 0x1

    .line 201
    invoke-virtual {p1}, Landroid/support/v8/renderscript/Type;->getX()I

    move-result v0

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    .line 202
    invoke-virtual {p1}, Landroid/support/v8/renderscript/Type;->getY()I

    move-result v0

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    .line 203
    invoke-virtual {p1}, Landroid/support/v8/renderscript/Type;->getZ()I

    move-result v0

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    .line 204
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    .line 205
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-le v0, v2, :cond_0

    .line 206
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    mul-int/2addr v0, v1

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    .line 208
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-le v0, v2, :cond_1

    .line 209
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    mul-int/2addr v0, v1

    iput v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    .line 211
    :cond_1
    return-void
.end method

.method private validate2DRange(IIII)V
    .locals 2
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"

    .prologue
    .line 821
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mAdaptedAllocation:Landroid/support/v8/renderscript/Allocation;

    if-eqz v0, :cond_1

    .line 835
    :cond_0
    return-void

    .line 825
    :cond_1
    if-ltz p1, :cond_2

    if-gez p2, :cond_3

    .line 826
    :cond_2
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Offset cannot be negative."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 828
    :cond_3
    if-ltz p4, :cond_4

    if-gez p3, :cond_5

    .line 829
    :cond_4
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Height or width cannot be negative."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 831
    :cond_5
    add-int v0, p1, p3

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    if-gt v0, v1, :cond_6

    add-int v0, p2, p4

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-le v0, v1, :cond_0

    .line 832
    :cond_6
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Updated region larger than allocation."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validate3DRange(IIIIII)V
    .locals 2
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"

    .prologue
    .line 972
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mAdaptedAllocation:Landroid/support/v8/renderscript/Allocation;

    if-eqz v0, :cond_1

    .line 986
    :cond_0
    return-void

    .line 976
    :cond_1
    if-ltz p1, :cond_2

    if-ltz p2, :cond_2

    if-gez p3, :cond_3

    .line 977
    :cond_2
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Offset cannot be negative."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 979
    :cond_3
    if-ltz p5, :cond_4

    if-ltz p4, :cond_4

    if-gez p6, :cond_5

    .line 980
    :cond_4
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Height or width cannot be negative."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 982
    :cond_5
    add-int v0, p1, p4

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    if-gt v0, v1, :cond_6

    add-int v0, p2, p5

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-gt v0, v1, :cond_6

    add-int v0, p3, p6

    iget v1, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-le v0, v1, :cond_0

    .line 983
    :cond_6
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Updated region larger than allocation."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validateBitmapFormat(Landroid/graphics/Bitmap;)V
    .locals 4
    .parameter "b"

    .prologue
    const/4 v3, 0x2

    .line 377
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    .line 378
    .local v0, bc:Landroid/graphics/Bitmap$Config;
    if-nez v0, :cond_0

    .line 379
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v2, "Bitmap has an unsupported format for this operation"

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 381
    :cond_0
    sget-object v1, Landroid/support/v8/renderscript/Allocation$1;->$SwitchMap$android$graphics$Bitmap$Config:[I

    invoke-virtual {v0}, Landroid/graphics/Bitmap$Config;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 423
    :cond_1
    return-void

    .line 383
    :pswitch_0
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    iget-object v1, v1, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    sget-object v2, Landroid/support/v8/renderscript/Element$DataKind;->PIXEL_A:Landroid/support/v8/renderscript/Element$DataKind;

    if-eq v1, v2, :cond_1

    .line 384
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Allocation kind is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes, passed bitmap was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 392
    :pswitch_1
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    iget-object v1, v1, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    sget-object v2, Landroid/support/v8/renderscript/Element$DataKind;->PIXEL_RGBA:Landroid/support/v8/renderscript/Element$DataKind;

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    .line 394
    :cond_2
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Allocation kind is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes, passed bitmap was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 402
    :pswitch_2
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    iget-object v1, v1, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    sget-object v2, Landroid/support/v8/renderscript/Element$DataKind;->PIXEL_RGB:Landroid/support/v8/renderscript/Element$DataKind;

    if-ne v1, v2, :cond_3

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v1

    if-eq v1, v3, :cond_1

    .line 404
    :cond_3
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Allocation kind is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes, passed bitmap was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 412
    :pswitch_3
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    iget-object v1, v1, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    sget-object v2, Landroid/support/v8/renderscript/Element$DataKind;->PIXEL_RGBA:Landroid/support/v8/renderscript/Element$DataKind;

    if-ne v1, v2, :cond_4

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v1

    if-eq v1, v3, :cond_1

    .line 414
    :cond_4
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Allocation kind is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mKind:Landroid/support/v8/renderscript/Element$DataKind;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    iget-object v3, v3, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes, passed bitmap was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 381
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private validateBitmapSize(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "b"

    .prologue
    .line 426
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 427
    :cond_0
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Cannot update allocation from bitmap, sizes mismatch"

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    :cond_1
    return-void
.end method

.method private validateIsFloat32()V
    .locals 3

    .prologue
    .line 273
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->FLOAT_32:Landroid/support/v8/renderscript/Element$DataType;

    if-ne v0, v1, :cond_0

    .line 274
    return-void

    .line 276
    :cond_0
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "32 bit float source does not match allocation type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v2, v2, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v2, v2, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validateIsInt16()V
    .locals 3

    .prologue
    .line 255
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->SIGNED_16:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->UNSIGNED_16:Landroid/support/v8/renderscript/Element$DataType;

    if-ne v0, v1, :cond_1

    .line 257
    :cond_0
    return-void

    .line 259
    :cond_1
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "16 bit integer source does not match allocation type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v2, v2, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v2, v2, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validateIsInt32()V
    .locals 3

    .prologue
    .line 246
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->SIGNED_32:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->UNSIGNED_32:Landroid/support/v8/renderscript/Element$DataType;

    if-ne v0, v1, :cond_1

    .line 248
    :cond_0
    return-void

    .line 250
    :cond_1
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "32 bit integer source does not match allocation type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v2, v2, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v2, v2, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validateIsInt8()V
    .locals 3

    .prologue
    .line 264
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->SIGNED_8:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->UNSIGNED_8:Landroid/support/v8/renderscript/Element$DataType;

    if-ne v0, v1, :cond_1

    .line 266
    :cond_0
    return-void

    .line 268
    :cond_1
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "8 bit integer source does not match allocation type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v2, v2, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v2, v2, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private validateIsObject()V
    .locals 3

    .prologue
    .line 281
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->RS_ELEMENT:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->RS_TYPE:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->RS_ALLOCATION:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->RS_SAMPLER:Landroid/support/v8/renderscript/Element$DataType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    sget-object v1, Landroid/support/v8/renderscript/Element$DataType;->RS_SCRIPT:Landroid/support/v8/renderscript/Element$DataType;

    if-ne v0, v1, :cond_1

    .line 286
    :cond_0
    return-void

    .line 288
    :cond_1
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Object source does not match allocation type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v2, v2, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v2, v2, Landroid/support/v8/renderscript/Element;->mType:Landroid/support/v8/renderscript/Element$DataType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public copy1DRangeFrom(IILandroid/support/v8/renderscript/Allocation;I)V
    .locals 14
    .parameter "off"
    .parameter "count"
    .parameter "data"
    .parameter "dataOff"

    .prologue
    .line 814
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    const/4 v4, 0x0

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v6, v3, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    const/4 v8, 0x1

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v9

    const/4 v11, 0x0

    move-object/from16 v0, p3

    iget v12, v0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p3

    iget-object v3, v0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v13, v3, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    move v3, p1

    move/from16 v7, p2

    move/from16 v10, p4

    invoke-virtual/range {v1 .. v13}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIIIIIIII)V

    .line 818
    return-void
.end method

.method public copy1DRangeFrom(II[B)V
    .locals 0
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 786
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt8()V

    .line 787
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[B)V

    .line 788
    return-void
.end method

.method public copy1DRangeFrom(II[F)V
    .locals 0
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 800
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsFloat32()V

    .line 801
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[F)V

    .line 802
    return-void
.end method

.method public copy1DRangeFrom(II[I)V
    .locals 0
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 758
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt32()V

    .line 759
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[I)V

    .line 760
    return-void
.end method

.method public copy1DRangeFrom(II[S)V
    .locals 0
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 772
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt16()V

    .line 773
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[S)V

    .line 774
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[B)V
    .locals 7
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 730
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v0

    mul-int v6, v0, p2

    .line 731
    .local v6, dataSize:I
    array-length v0, p3

    invoke-direct {p0, p1, p2, v0, v6}, Landroid/support/v8/renderscript/Allocation;->data1DChecks(IIII)V

    .line 732
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move v2, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData1D(IIII[BI)V

    .line 733
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[F)V
    .locals 7
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 743
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v0

    mul-int v6, v0, p2

    .line 744
    .local v6, dataSize:I
    array-length v0, p3

    mul-int/lit8 v0, v0, 0x4

    invoke-direct {p0, p1, p2, v0, v6}, Landroid/support/v8/renderscript/Allocation;->data1DChecks(IIII)V

    .line 745
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move v2, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData1D(IIII[FI)V

    .line 746
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[I)V
    .locals 7
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 704
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v0

    mul-int v6, v0, p2

    .line 705
    .local v6, dataSize:I
    array-length v0, p3

    mul-int/lit8 v0, v0, 0x4

    invoke-direct {p0, p1, p2, v0, v6}, Landroid/support/v8/renderscript/Allocation;->data1DChecks(IIII)V

    .line 706
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move v2, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData1D(IIII[II)V

    .line 707
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[S)V
    .locals 7
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 717
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v0

    mul-int v6, v0, p2

    .line 718
    .local v6, dataSize:I
    array-length v0, p3

    mul-int/lit8 v0, v0, 0x2

    invoke-direct {p0, p1, p2, v0, v6}, Landroid/support/v8/renderscript/Allocation;->data1DChecks(IIII)V

    .line 719
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move v2, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData1D(IIII[SI)V

    .line 720
    return-void
.end method

.method public copy2DRangeFrom(IIIILandroid/support/v8/renderscript/Allocation;II)V
    .locals 14
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"
    .parameter "dataXoff"
    .parameter "dataYoff"

    .prologue
    .line 940
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 941
    invoke-direct/range {p0 .. p4}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 942
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v6, v3, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v0, p5

    invoke-virtual {v0, v3}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v9

    move-object/from16 v0, p5

    iget v12, v0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p5

    iget-object v3, v0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v13, v3, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    move v3, p1

    move/from16 v4, p2

    move/from16 v7, p3

    move/from16 v8, p4

    move/from16 v10, p6

    move/from16 v11, p7

    invoke-virtual/range {v1 .. v13}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIIIIIIII)V

    .line 946
    return-void
.end method

.method public copy2DRangeFrom(IIII[B)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 877
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt8()V

    .line 878
    invoke-virtual/range {p0 .. p5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[B)V

    .line 879
    return-void
.end method

.method public copy2DRangeFrom(IIII[F)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 922
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsFloat32()V

    .line 923
    invoke-virtual/range {p0 .. p5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[F)V

    .line 924
    return-void
.end method

.method public copy2DRangeFrom(IIII[I)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 907
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt32()V

    .line 908
    invoke-virtual/range {p0 .. p5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[I)V

    .line 909
    return-void
.end method

.method public copy2DRangeFrom(IIII[S)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 892
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt16()V

    .line 893
    invoke-virtual/range {p0 .. p5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[S)V

    .line 894
    return-void
.end method

.method public copy2DRangeFrom(IILandroid/graphics/Bitmap;)V
    .locals 9
    .parameter "xoff"
    .parameter "yoff"
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 958
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 959
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    if-nez v0, :cond_0

    .line 960
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 961
    .local v8, newBitmap:Landroid/graphics/Bitmap;
    new-instance v7, Landroid/graphics/Canvas;

    invoke-direct {v7, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 962
    .local v7, c:Landroid/graphics/Canvas;
    const/4 v0, 0x0

    invoke-virtual {v7, p3, v3, v3, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 963
    invoke-virtual {p0, p1, p2, v8}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IILandroid/graphics/Bitmap;)V

    .line 969
    .end local v7           #c:Landroid/graphics/Canvas;
    .end local v8           #newBitmap:Landroid/graphics/Bitmap;
    :goto_0
    return-void

    .line 966
    :cond_0
    invoke-direct {p0, p3}, Landroid/support/v8/renderscript/Allocation;->validateBitmapFormat(Landroid/graphics/Bitmap;)V

    .line 967
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 968
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v5, v2, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    move v2, p1

    move v3, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIILandroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method copy2DRangeFromUnchecked(IIII[B)V
    .locals 10
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 838
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 839
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 840
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v5, v2, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    array-length v9, p5

    move v2, p1

    move v3, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    invoke-virtual/range {v0 .. v9}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIII[BI)V

    .line 842
    return-void
.end method

.method copy2DRangeFromUnchecked(IIII[F)V
    .locals 10
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 859
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 860
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 861
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v5, v2, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    array-length v2, p5

    mul-int/lit8 v9, v2, 0x4

    move v2, p1

    move v3, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    invoke-virtual/range {v0 .. v9}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIII[FI)V

    .line 863
    return-void
.end method

.method copy2DRangeFromUnchecked(IIII[I)V
    .locals 10
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 852
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 853
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 854
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v5, v2, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    array-length v2, p5

    mul-int/lit8 v9, v2, 0x4

    move v2, p1

    move v3, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    invoke-virtual/range {v0 .. v9}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIII[II)V

    .line 856
    return-void
.end method

.method copy2DRangeFromUnchecked(IIII[S)V
    .locals 10
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 845
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 846
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/Allocation;->validate2DRange(IIII)V

    .line 847
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedFace:Landroid/support/v8/renderscript/Type$CubemapFace;

    iget v5, v2, Landroid/support/v8/renderscript/Type$CubemapFace;->mID:I

    array-length v2, p5

    mul-int/lit8 v9, v2, 0x2

    move v2, p1

    move v3, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    invoke-virtual/range {v0 .. v9}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData2D(IIIIIII[SI)V

    .line 849
    return-void
.end method

.method public copy3DRangeFrom(IIIIIILandroid/support/v8/renderscript/Allocation;III)V
    .locals 15
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"
    .parameter "dataXoff"
    .parameter "dataYoff"
    .parameter "dataZoff"

    .prologue
    .line 1096
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1097
    invoke-direct/range {p0 .. p6}, Landroid/support/v8/renderscript/Allocation;->validate3DRange(IIIIII)V

    .line 1098
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v0, p7

    invoke-virtual {v0, v3}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v10

    move-object/from16 v0, p7

    iget v14, v0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    invoke-virtual/range {v1 .. v14}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData3D(IIIIIIIIIIIII)V

    .line 1101
    return-void
.end method

.method public copy3DRangeFrom(IIIIII[B)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1047
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt8()V

    .line 1048
    invoke-virtual/range {p0 .. p7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[B)V

    .line 1049
    return-void
.end method

.method public copy3DRangeFrom(IIIIII[F)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1074
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsFloat32()V

    .line 1075
    invoke-virtual/range {p0 .. p7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[F)V

    .line 1076
    return-void
.end method

.method public copy3DRangeFrom(IIIIII[I)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1065
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt32()V

    .line 1066
    invoke-virtual/range {p0 .. p7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[I)V

    .line 1067
    return-void
.end method

.method public copy3DRangeFrom(IIIIII[S)V
    .locals 0
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1056
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt16()V

    .line 1057
    invoke-virtual/range {p0 .. p7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[S)V

    .line 1058
    return-void
.end method

.method copy3DRangeFromUnchecked(IIIIII[B)V
    .locals 12
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 993
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 994
    invoke-direct/range {p0 .. p6}, Landroid/support/v8/renderscript/Allocation;->validate3DRange(IIIIII)V

    .line 995
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p7

    array-length v11, v0

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v1 .. v11}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData3D(IIIIIIII[BI)V

    .line 997
    return-void
.end method

.method copy3DRangeFromUnchecked(IIIIII[F)V
    .locals 12
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1026
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1027
    invoke-direct/range {p0 .. p6}, Landroid/support/v8/renderscript/Allocation;->validate3DRange(IIIIII)V

    .line 1028
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p7

    array-length v3, v0

    mul-int/lit8 v11, v3, 0x4

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v1 .. v11}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData3D(IIIIIIII[FI)V

    .line 1030
    return-void
.end method

.method copy3DRangeFromUnchecked(IIIIII[I)V
    .locals 12
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1015
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1016
    invoke-direct/range {p0 .. p6}, Landroid/support/v8/renderscript/Allocation;->validate3DRange(IIIIII)V

    .line 1017
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p7

    array-length v3, v0

    mul-int/lit8 v11, v3, 0x4

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v1 .. v11}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData3D(IIIIIIII[II)V

    .line 1019
    return-void
.end method

.method copy3DRangeFromUnchecked(IIIIII[S)V
    .locals 12
    .parameter "xoff"
    .parameter "yoff"
    .parameter "zoff"
    .parameter "w"
    .parameter "h"
    .parameter "d"
    .parameter "data"

    .prologue
    .line 1004
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1005
    invoke-direct/range {p0 .. p6}, Landroid/support/v8/renderscript/Allocation;->validate3DRange(IIIIII)V

    .line 1006
    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v2

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    move-object/from16 v0, p7

    array-length v3, v0

    mul-int/lit8 v11, v3, 0x2

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-virtual/range {v1 .. v11}, Landroid/support/v8/renderscript/RenderScript;->nAllocationData3D(IIIIIIII[SI)V

    .line 1008
    return-void
.end method

.method public copyFrom(Landroid/graphics/Bitmap;)V
    .locals 6
    .parameter "b"

    .prologue
    const/4 v5, 0x0

    .line 586
    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v2}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 587
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    if-nez v2, :cond_0

    .line 588
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 589
    .local v1, newBitmap:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 590
    .local v0, c:Landroid/graphics/Canvas;
    const/4 v2, 0x0

    invoke-virtual {v0, p1, v5, v5, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 591
    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->copyFrom(Landroid/graphics/Bitmap;)V

    .line 597
    .end local v0           #c:Landroid/graphics/Canvas;
    .end local v1           #newBitmap:Landroid/graphics/Bitmap;
    :goto_0
    return-void

    .line 594
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/Allocation;->validateBitmapSize(Landroid/graphics/Bitmap;)V

    .line 595
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/Allocation;->validateBitmapFormat(Landroid/graphics/Bitmap;)V

    .line 596
    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v3}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v3

    invoke-virtual {v2, v3, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCopyFromBitmap(ILandroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public copyFrom(Landroid/support/v8/renderscript/Allocation;)V
    .locals 8
    .parameter "a"

    .prologue
    const/4 v1, 0x0

    .line 606
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 607
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {p1}, Landroid/support/v8/renderscript/Allocation;->getType()Landroid/support/v8/renderscript/Type;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v8/renderscript/Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 608
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Types of allocations must match."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 610
    :cond_0
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    move v6, v1

    move v7, v1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IIIILandroid/support/v8/renderscript/Allocation;II)V

    .line 611
    return-void
.end method

.method public copyFrom([B)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 544
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 545
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 546
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFrom(IIIIII[B)V

    .line 552
    :goto_0
    return-void

    .line 547
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 548
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IIII[B)V

    goto :goto_0

    .line 550
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFrom(II[B)V

    goto :goto_0
.end method

.method public copyFrom([F)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 562
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 563
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 564
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFrom(IIIIII[F)V

    .line 570
    :goto_0
    return-void

    .line 565
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 566
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IIII[F)V

    goto :goto_0

    .line 568
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFrom(II[F)V

    goto :goto_0
.end method

.method public copyFrom([I)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 508
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 509
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 510
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFrom(IIIIII[I)V

    .line 516
    :goto_0
    return-void

    .line 511
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 512
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IIII[I)V

    goto :goto_0

    .line 514
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFrom(II[I)V

    goto :goto_0
.end method

.method public copyFrom([Landroid/support/v8/renderscript/BaseObj;)V
    .locals 5
    .parameter "d"

    .prologue
    .line 363
    iget-object v2, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v2}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 364
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsObject()V

    .line 365
    array-length v2, p1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    if-eq v2, v3, :cond_0

    .line 366
    new-instance v2, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Array size mismatch, allocation sizeX = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", array length = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 369
    :cond_0
    array-length v2, p1

    new-array v1, v2, [I

    .line 370
    .local v1, i:[I
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 371
    aget-object v2, p1, v0

    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v2, v3}, Landroid/support/v8/renderscript/BaseObj;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    aput v2, v1, v0

    .line 370
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 373
    :cond_1
    const/4 v2, 0x0

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v2, v3, v1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[I)V

    .line 374
    return-void
.end method

.method public copyFrom([S)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 526
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 527
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 528
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFrom(IIIIII[S)V

    .line 534
    :goto_0
    return-void

    .line 529
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 530
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFrom(IIII[S)V

    goto :goto_0

    .line 532
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFrom(II[S)V

    goto :goto_0
.end method

.method public copyFromUnchecked([B)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 473
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 474
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 475
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[B)V

    .line 481
    :goto_0
    return-void

    .line 476
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 477
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[B)V

    goto :goto_0

    .line 479
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[B)V

    goto :goto_0
.end method

.method public copyFromUnchecked([F)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 490
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 491
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 492
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[F)V

    .line 498
    :goto_0
    return-void

    .line 493
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 494
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[F)V

    goto :goto_0

    .line 496
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[F)V

    goto :goto_0
.end method

.method public copyFromUnchecked([I)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 439
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 440
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 441
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[I)V

    .line 447
    :goto_0
    return-void

    .line 442
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 443
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[I)V

    goto :goto_0

    .line 445
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[I)V

    goto :goto_0
.end method

.method public copyFromUnchecked([S)V
    .locals 8
    .parameter "d"

    .prologue
    const/4 v1, 0x0

    .line 456
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 457
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    if-lez v0, :cond_0

    .line 458
    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v5, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    iget v6, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimZ:I

    move-object v0, p0

    move v2, v1

    move v3, v1

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/support/v8/renderscript/Allocation;->copy3DRangeFromUnchecked(IIIIII[S)V

    .line 464
    :goto_0
    return-void

    .line 459
    :cond_0
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    if-lez v0, :cond_1

    .line 460
    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimX:I

    iget v4, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentDimY:I

    move-object v0, p0

    move v2, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/Allocation;->copy2DRangeFromUnchecked(IIII[S)V

    goto :goto_0

    .line 462
    :cond_1
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mCurrentCount:I

    invoke-virtual {p0, v1, v0, p1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[S)V

    goto :goto_0
.end method

.method public copyTo(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "b"

    .prologue
    .line 1111
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1112
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/Allocation;->validateBitmapFormat(Landroid/graphics/Bitmap;)V

    .line 1113
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/Allocation;->validateBitmapSize(Landroid/graphics/Bitmap;)V

    .line 1114
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationCopyToBitmap(ILandroid/graphics/Bitmap;)V

    .line 1115
    return-void
.end method

.method public copyTo([B)V
    .locals 2
    .parameter "d"

    .prologue
    .line 1125
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt8()V

    .line 1126
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1127
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationRead(I[B)V

    .line 1128
    return-void
.end method

.method public copyTo([F)V
    .locals 2
    .parameter "d"

    .prologue
    .line 1164
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsFloat32()V

    .line 1165
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1166
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationRead(I[F)V

    .line 1167
    return-void
.end method

.method public copyTo([I)V
    .locals 2
    .parameter "d"

    .prologue
    .line 1151
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt32()V

    .line 1152
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1153
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationRead(I[I)V

    .line 1154
    return-void
.end method

.method public copyTo([S)V
    .locals 2
    .parameter "d"

    .prologue
    .line 1138
    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->validateIsInt16()V

    .line 1139
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 1140
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationRead(I[S)V

    .line 1141
    return-void
.end method

.method public generateMipmaps()V
    .locals 2

    .prologue
    .line 692
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationGenerateMipmaps(I)V

    .line 693
    return-void
.end method

.method public getBytesSize()I
    .locals 2

    .prologue
    .line 197
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type;->getCount()I

    move-result v0

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public getElement()Landroid/support/v8/renderscript/Element;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v0

    return-object v0
.end method

.method public getType()Landroid/support/v8/renderscript/Type;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    return-object v0
.end method

.method public getUsage()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mUsage:I

    return v0
.end method

.method public ioReceive()V
    .locals 2

    .prologue
    .line 349
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mUsage:I

    and-int/lit8 v0, v0, 0x20

    if-nez v0, :cond_0

    .line 350
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Can only receive if IO_INPUT usage specified."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 353
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 354
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationIoReceive(I)V

    .line 355
    return-void
.end method

.method public ioSend()V
    .locals 2

    .prologue
    .line 327
    iget v0, p0, Landroid/support/v8/renderscript/Allocation;->mUsage:I

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_0

    .line 328
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Can only send buffer if IO_OUTPUT usage specified."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 331
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 332
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationIoSend(I)V

    .line 333
    return-void
.end method

.method public ioSendOutput()V
    .locals 0

    .prologue
    .line 340
    invoke-virtual {p0}, Landroid/support/v8/renderscript/Allocation;->ioSend()V

    .line 341
    return-void
.end method

.method public setFromFieldPacker(IILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 8
    .parameter "xoff"
    .parameter "component_number"
    .parameter "fp"

    .prologue
    .line 643
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 644
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mElements:[Landroid/support/v8/renderscript/Element;

    array-length v0, v0

    if-lt p2, v0, :cond_0

    .line 645
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Component_number "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " out of range."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 647
    :cond_0
    if-gez p1, :cond_1

    .line 648
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Offset must be >= 0."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 651
    :cond_1
    invoke-virtual {p3}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v5

    .line 652
    .local v5, data:[B
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mElements:[Landroid/support/v8/renderscript/Element;

    aget-object v0, v0, p2

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v7

    .line 653
    .local v7, eSize:I
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v0, v0, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    iget-object v0, v0, Landroid/support/v8/renderscript/Element;->mArraySizes:[I

    aget v0, v0, p2

    mul-int/2addr v7, v0

    .line 655
    array-length v0, v5

    if-eq v0, v7, :cond_2

    .line 656
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Field packer sizelength "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, v5

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " does not match component size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 660
    :cond_2
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    iget v3, p0, Landroid/support/v8/renderscript/Allocation;->mSelectedLOD:I

    array-length v6, v5

    move v2, p1

    move v4, p2

    invoke-virtual/range {v0 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nAllocationElementData1D(IIII[BI)V

    .line 662
    return-void
.end method

.method public setFromFieldPacker(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 6
    .parameter "xoff"
    .parameter "fp"

    .prologue
    .line 622
    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 623
    iget-object v3, p0, Landroid/support/v8/renderscript/Allocation;->mType:Landroid/support/v8/renderscript/Type;

    iget-object v3, v3, Landroid/support/v8/renderscript/Type;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v3}, Landroid/support/v8/renderscript/Element;->getBytesSize()I

    move-result v2

    .line 624
    .local v2, eSize:I
    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v1

    .line 626
    .local v1, data:[B
    array-length v3, v1

    div-int v0, v3, v2

    .line 627
    .local v0, count:I
    mul-int v3, v2, v0

    array-length v4, v1

    if-eq v3, v4, :cond_0

    .line 628
    new-instance v3, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Field packer length "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " not divisible by element size "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 631
    :cond_0
    invoke-virtual {p0, p1, v0, v1}, Landroid/support/v8/renderscript/Allocation;->copy1DRangeFromUnchecked(II[B)V

    .line 632
    return-void
.end method

.method public syncAll(I)V
    .locals 2
    .parameter "srcLocation"

    .prologue
    .line 308
    packed-switch p1, :pswitch_data_0

    .line 313
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Source must be exactly one usage type."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 315
    :pswitch_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 316
    iget-object v0, p0, Landroid/support/v8/renderscript/Allocation;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/support/v8/renderscript/Allocation;->getIDSafe()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nAllocationSyncAll(II)V

    .line 317
    return-void

    .line 308
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
