.class Landroid/support/v8/renderscript/AllocationThunker;
.super Landroid/support/v8/renderscript/Allocation;
.source "AllocationThunker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v8/renderscript/AllocationThunker$1;
    }
.end annotation


# static fields
.field static mBitmapOptions:Landroid/graphics/BitmapFactory$Options;


# instance fields
.field mN:Landroid/renderscript/Allocation;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 219
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sput-object v0, Landroid/support/v8/renderscript/AllocationThunker;->mBitmapOptions:Landroid/graphics/BitmapFactory$Options;

    .line 221
    sget-object v0, Landroid/support/v8/renderscript/AllocationThunker;->mBitmapOptions:Landroid/graphics/BitmapFactory$Options;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 222
    return-void
.end method

.method constructor <init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V
    .locals 1
    .parameter "rs"
    .parameter "t"
    .parameter "usage"
    .parameter "na"

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Landroid/support/v8/renderscript/Allocation;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;I)V

    .line 70
    iput-object p2, p0, Landroid/support/v8/renderscript/AllocationThunker;->mType:Landroid/support/v8/renderscript/Type;

    .line 71
    iput p3, p0, Landroid/support/v8/renderscript/AllocationThunker;->mUsage:I

    .line 72
    iput-object p4, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 73
    return-void
.end method

.method static convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;
    .locals 2
    .parameter "mc"

    .prologue
    .line 40
    sget-object v0, Landroid/support/v8/renderscript/AllocationThunker$1;->$SwitchMap$android$support$v8$renderscript$Allocation$MipmapControl:[I

    invoke-virtual {p0}, Landroid/support/v8/renderscript/Allocation$MipmapControl;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 48
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 42
    :pswitch_0
    sget-object v0, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/renderscript/Allocation$MipmapControl;

    goto :goto_0

    .line 44
    :pswitch_1
    sget-object v0, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_FULL:Landroid/renderscript/Allocation$MipmapControl;

    goto :goto_0

    .line 46
    :pswitch_2
    sget-object v0, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_ON_SYNC_TO_TEXTURE:Landroid/renderscript/Allocation$MipmapControl;

    goto :goto_0

    .line 40
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static createCubemapFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 5
    .parameter "rs"
    .parameter "b"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 251
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 252
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-static {p2}, Landroid/support/v8/renderscript/AllocationThunker;->convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;

    move-result-object v4

    invoke-static {v3, p1, v4, p3}, Landroid/renderscript/Allocation;->createCubemapFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 255
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v2, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 256
    .local v2, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v3, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v3, p0, v2, p3, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v3
.end method

.method public static createCubemapFromCubeFaces(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 13
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
    .line 268
    move-object v11, p0

    check-cast v11, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 269
    .local v11, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iget-object v1, v11, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-static/range {p7 .. p7}, Landroid/support/v8/renderscript/AllocationThunker;->convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;

    move-result-object v8

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v9, p8

    invoke-static/range {v1 .. v9}, Landroid/renderscript/Allocation;->createCubemapFromCubeFaces(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v10

    .line 273
    .local v10, a:Landroid/renderscript/Allocation;
    new-instance v12, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v10}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v1

    invoke-direct {v12, p0, v1}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 274
    .local v12, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v1, Landroid/support/v8/renderscript/AllocationThunker;

    move/from16 v0, p8

    invoke-direct {v1, p0, v12, v0, v10}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v1
.end method

.method public static createFromBitmap(Landroid/support/v8/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 5
    .parameter "rs"
    .parameter "b"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 239
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 240
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-static {p2}, Landroid/support/v8/renderscript/AllocationThunker;->convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;

    move-result-object v4

    invoke-static {v3, p1, v4, p3}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 243
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v2, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 245
    .local v2, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v3, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v3, p0, v2, p3, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v3
.end method

.method public static createFromBitmapResource(Landroid/support/v8/renderscript/RenderScript;Landroid/content/res/Resources;ILandroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 5
    .parameter "rs"
    .parameter "res"
    .parameter "id"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 283
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 284
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-static {p3}, Landroid/support/v8/renderscript/AllocationThunker;->convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;

    move-result-object v4

    invoke-static {v3, p1, p2, v4, p4}, Landroid/renderscript/Allocation;->createFromBitmapResource(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;ILandroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 287
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v2, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 288
    .local v2, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v3, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v3, p0, v2, p4, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v3
.end method

.method public static createFromString(Landroid/support/v8/renderscript/RenderScript;Ljava/lang/String;I)Landroid/support/v8/renderscript/Allocation;
    .locals 4
    .parameter "rs"
    .parameter "str"
    .parameter "usage"

    .prologue
    .line 294
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 295
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-static {v3, p1, p2}, Landroid/renderscript/Allocation;->createFromString(Landroid/renderscript/RenderScript;Ljava/lang/String;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 298
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v2, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 299
    .local v2, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v3, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v3, p0, v2, p2, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v3
.end method

.method public static createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;II)Landroid/support/v8/renderscript/Allocation;
    .locals 6
    .parameter "rs"
    .parameter "e"
    .parameter "count"
    .parameter "usage"

    .prologue
    .line 304
    move-object v2, p0

    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v1, p1

    .line 305
    check-cast v1, Landroid/support/v8/renderscript/ElementThunker;

    .line 306
    .local v1, et:Landroid/support/v8/renderscript/ElementThunker;
    iget-object v5, v2, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {p1}, Landroid/support/v8/renderscript/Element;->getNObj()Landroid/renderscript/BaseObj;

    move-result-object v4

    check-cast v4, Landroid/renderscript/Element;

    invoke-static {v5, v4, p2, p3}, Landroid/renderscript/Allocation;->createSized(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;II)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 308
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v3, Landroid/support/v8/renderscript/TypeThunker;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Landroid/support/v8/renderscript/TypeThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Type;)V

    .line 309
    .local v3, tt:Landroid/support/v8/renderscript/TypeThunker;
    new-instance v4, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v4, p0, v3, p3, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v4
.end method

.method public static createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Allocation$MipmapControl;I)Landroid/support/v8/renderscript/Allocation;
    .locals 6
    .parameter "rs"
    .parameter "type"
    .parameter "mips"
    .parameter "usage"

    .prologue
    .line 225
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v2, p1

    .line 226
    check-cast v2, Landroid/support/v8/renderscript/TypeThunker;

    .line 228
    .local v2, tt:Landroid/support/v8/renderscript/TypeThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    iget-object v4, v2, Landroid/support/v8/renderscript/TypeThunker;->mN:Landroid/renderscript/Type;

    invoke-static {p2}, Landroid/support/v8/renderscript/AllocationThunker;->convertMipmapControl(Landroid/support/v8/renderscript/Allocation$MipmapControl;)Landroid/renderscript/Allocation$MipmapControl;

    move-result-object v5

    invoke-static {v3, v4, v5, p3}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v0

    .line 232
    .local v0, a:Landroid/renderscript/Allocation;
    new-instance v3, Landroid/support/v8/renderscript/AllocationThunker;

    invoke-direct {v3, p0, p1, p3, v0}, Landroid/support/v8/renderscript/AllocationThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;ILandroid/renderscript/Allocation;)V

    return-object v3
.end method


# virtual methods
.method public copy1DRangeFrom(IILandroid/support/v8/renderscript/Allocation;I)V
    .locals 3
    .parameter "off"
    .parameter "count"
    .parameter "data"
    .parameter "dataOff"

    .prologue
    .line 174
    move-object v0, p3

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 175
    .local v0, at:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    iget-object v2, v0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p1, p2, v2, p4}, Landroid/renderscript/Allocation;->copy1DRangeFrom(IILandroid/renderscript/Allocation;I)V

    .line 176
    return-void
.end method

.method public copy1DRangeFrom(II[B)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 167
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFrom(II[B)V

    .line 168
    return-void
.end method

.method public copy1DRangeFrom(II[F)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 170
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFrom(II[F)V

    .line 171
    return-void
.end method

.method public copy1DRangeFrom(II[I)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 161
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFrom(II[I)V

    .line 162
    return-void
.end method

.method public copy1DRangeFrom(II[S)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 164
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFrom(II[S)V

    .line 165
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[B)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 154
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFromUnchecked(II[B)V

    .line 155
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[F)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 157
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFromUnchecked(II[F)V

    .line 158
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[I)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 148
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFromUnchecked(II[I)V

    .line 149
    return-void
.end method

.method public copy1DRangeFromUnchecked(II[S)V
    .locals 1
    .parameter "off"
    .parameter "count"
    .parameter "d"

    .prologue
    .line 151
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy1DRangeFromUnchecked(II[S)V

    .line 152
    return-void
.end method

.method public copy2DRangeFrom(IIIILandroid/support/v8/renderscript/Allocation;II)V
    .locals 9
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"
    .parameter "dataXoff"
    .parameter "dataYoff"

    .prologue
    .line 193
    move-object v8, p5

    check-cast v8, Landroid/support/v8/renderscript/AllocationThunker;

    .line 194
    .local v8, at:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    iget-object v5, v8, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v6, p6

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v7}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IIIILandroid/renderscript/Allocation;II)V

    .line 195
    return-void
.end method

.method public copy2DRangeFrom(IIII[B)V
    .locals 6
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 179
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IIII[B)V

    .line 180
    return-void
.end method

.method public copy2DRangeFrom(IIII[F)V
    .locals 6
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 188
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IIII[F)V

    .line 189
    return-void
.end method

.method public copy2DRangeFrom(IIII[I)V
    .locals 6
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 185
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IIII[I)V

    .line 186
    return-void
.end method

.method public copy2DRangeFrom(IIII[S)V
    .locals 6
    .parameter "xoff"
    .parameter "yoff"
    .parameter "w"
    .parameter "h"
    .parameter "data"

    .prologue
    .line 182
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IIII[S)V

    .line 183
    return-void
.end method

.method public copy2DRangeFrom(IILandroid/graphics/Bitmap;)V
    .locals 1
    .parameter "xoff"
    .parameter "yoff"
    .parameter "data"

    .prologue
    .line 197
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1, p2, p3}, Landroid/renderscript/Allocation;->copy2DRangeFrom(IILandroid/graphics/Bitmap;)V

    .line 198
    return-void
.end method

.method public copyFrom(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 124
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFrom(Landroid/graphics/Bitmap;)V

    .line 125
    return-void
.end method

.method public copyFrom(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "a"

    .prologue
    .line 127
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 128
    .local v0, at:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    iget-object v2, v0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v1, v2}, Landroid/renderscript/Allocation;->copyFrom(Landroid/renderscript/Allocation;)V

    .line 129
    return-void
.end method

.method public copyFrom([B)V
    .locals 1
    .parameter "d"

    .prologue
    .line 118
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFrom([B)V

    .line 119
    return-void
.end method

.method public copyFrom([F)V
    .locals 1
    .parameter "d"

    .prologue
    .line 121
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFrom([F)V

    .line 122
    return-void
.end method

.method public copyFrom([I)V
    .locals 1
    .parameter "d"

    .prologue
    .line 112
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFrom([I)V

    .line 113
    return-void
.end method

.method public copyFrom([Landroid/support/v8/renderscript/BaseObj;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 88
    if-nez p1, :cond_0

    .line 96
    :goto_0
    return-void

    .line 91
    :cond_0
    array-length v2, p1

    new-array v0, v2, [Landroid/renderscript/BaseObj;

    .line 92
    .local v0, dN:[Landroid/renderscript/BaseObj;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 93
    aget-object v2, p1, v1

    invoke-virtual {v2}, Landroid/support/v8/renderscript/BaseObj;->getNObj()Landroid/renderscript/BaseObj;

    move-result-object v2

    aput-object v2, v0, v1

    .line 92
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 95
    :cond_1
    iget-object v2, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v2, v0}, Landroid/renderscript/Allocation;->copyFrom([Landroid/renderscript/BaseObj;)V

    goto :goto_0
.end method

.method public copyFrom([S)V
    .locals 1
    .parameter "d"

    .prologue
    .line 115
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFrom([S)V

    .line 116
    return-void
.end method

.method public copyFromUnchecked([B)V
    .locals 1
    .parameter "d"

    .prologue
    .line 105
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFromUnchecked([B)V

    .line 106
    return-void
.end method

.method public copyFromUnchecked([F)V
    .locals 1
    .parameter "d"

    .prologue
    .line 108
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFromUnchecked([F)V

    .line 109
    return-void
.end method

.method public copyFromUnchecked([I)V
    .locals 1
    .parameter "d"

    .prologue
    .line 99
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFromUnchecked([I)V

    .line 100
    return-void
.end method

.method public copyFromUnchecked([S)V
    .locals 1
    .parameter "d"

    .prologue
    .line 102
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyFromUnchecked([S)V

    .line 103
    return-void
.end method

.method public copyTo(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 202
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V

    .line 203
    return-void
.end method

.method public copyTo([B)V
    .locals 1
    .parameter "d"

    .prologue
    .line 205
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo([B)V

    .line 206
    return-void
.end method

.method public copyTo([F)V
    .locals 1
    .parameter "d"

    .prologue
    .line 214
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo([F)V

    .line 215
    return-void
.end method

.method public copyTo([I)V
    .locals 1
    .parameter "d"

    .prologue
    .line 211
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo([I)V

    .line 212
    return-void
.end method

.method public copyTo([S)V
    .locals 1
    .parameter "d"

    .prologue
    .line 208
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->copyTo([S)V

    .line 209
    return-void
.end method

.method public generateMipmaps()V
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->generateMipmaps()V

    .line 145
    return-void
.end method

.method public getBytesSize()I
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getBytesSize()I

    move-result v0

    return v0
.end method

.method public getElement()Landroid/support/v8/renderscript/Element;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Landroid/support/v8/renderscript/AllocationThunker;->getType()Landroid/support/v8/renderscript/Type;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/Allocation;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v0

    return-object v0
.end method

.method public getType()Landroid/support/v8/renderscript/Type;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v8/renderscript/TypeThunker;->find(Landroid/renderscript/Type;)Landroid/support/v8/renderscript/Type;

    move-result-object v0

    return-object v0
.end method

.method public getUsage()I
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->getUsage()I

    move-result v0

    return v0
.end method

.method public ioReceive()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->ioReceive()V

    .line 85
    return-void
.end method

.method public ioSend()V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0}, Landroid/renderscript/Allocation;->ioSend()V

    .line 81
    return-void
.end method

.method public setFromFieldPacker(IILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 2
    .parameter "xoff"
    .parameter "component_number"
    .parameter "fp"

    .prologue
    .line 138
    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p3}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .line 140
    .local v0, nfp:Landroid/renderscript/FieldPacker;
    iget-object v1, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p1, p2, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(IILandroid/renderscript/FieldPacker;)V

    .line 141
    return-void
.end method

.method public setFromFieldPacker(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 2
    .parameter "xoff"
    .parameter "fp"

    .prologue
    .line 133
    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .line 135
    .local v0, nfp:Landroid/renderscript/FieldPacker;
    iget-object v1, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v1, p1, v0}, Landroid/renderscript/Allocation;->setFromFieldPacker(ILandroid/renderscript/FieldPacker;)V

    .line 136
    return-void
.end method

.method public syncAll(I)V
    .locals 1
    .parameter "srcLocation"

    .prologue
    .line 76
    iget-object v0, p0, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/renderscript/Allocation;->syncAll(I)V

    .line 77
    return-void
.end method
