.class public Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;
.super Landroid/support/v8/renderscript/ScriptIntrinsic;
.source "ScriptIntrinsic3DLUT.java"


# instance fields
.field private mElement:Landroid/support/v8/renderscript/Element;

.field private mLUT:Landroid/support/v8/renderscript/Allocation;


# direct methods
.method protected constructor <init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V
    .locals 0
    .parameter "id"
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsic;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 36
    iput-object p3, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->mElement:Landroid/support/v8/renderscript/Element;

    .line 37
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;
    .locals 4
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 50
    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 51
    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 52
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;

    move-result-object v2

    .line 60
    .end local v1           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v2

    .line 54
    :cond_0
    const/16 v2, 0x8

    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/Element;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v8/renderscript/RenderScript;->nScriptIntrinsicCreate(II)I

    move-result v0

    .line 56
    .local v0, id:I
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->U8_4(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/support/v8/renderscript/Element;->isCompatible(Landroid/support/v8/renderscript/Element;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 57
    new-instance v2, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v3, "Element must be compatible with uchar4."

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 60
    :cond_1
    new-instance v2, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;

    invoke-direct {v2, v0, p0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    goto :goto_0
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 2
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 96
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, p2, v1}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V

    .line 97
    return-void
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 105
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    return-object v0
.end method

.method public setLUT(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "lut"

    .prologue
    .line 73
    invoke-virtual {p1}, Landroid/support/v8/renderscript/Allocation;->getType()Landroid/support/v8/renderscript/Type;

    move-result-object v0

    .line 75
    .local v0, t:Landroid/support/v8/renderscript/Type;
    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type;->getZ()I

    move-result v1

    if-nez v1, :cond_0

    .line 76
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v2, "LUT must be 3d."

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_0
    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type;->getElement()Landroid/support/v8/renderscript/Element;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->mElement:Landroid/support/v8/renderscript/Element;

    invoke-virtual {v1, v2}, Landroid/support/v8/renderscript/Element;->isCompatible(Landroid/support/v8/renderscript/Element;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 80
    new-instance v1, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v2, "LUT element type must match."

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    :cond_1
    iput-object p1, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->mLUT:Landroid/support/v8/renderscript/Allocation;

    .line 84
    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->mLUT:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {p0, v1, v2}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;->setVar(ILandroid/support/v8/renderscript/BaseObj;)V

    .line 85
    return-void
.end method
