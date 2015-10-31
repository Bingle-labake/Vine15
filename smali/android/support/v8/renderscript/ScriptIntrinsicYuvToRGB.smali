.class public Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;
.super Landroid/support/v8/renderscript/ScriptIntrinsic;
.source "ScriptIntrinsicYuvToRGB.java"


# instance fields
.field private mInput:Landroid/support/v8/renderscript/Allocation;


# direct methods
.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsic;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 32
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 45
    sget-boolean v3, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v3, :cond_0

    move-object v1, p0

    .line 46
    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 47
    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;

    move-result-object v2

    .line 53
    .end local v1           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v2

    .line 51
    :cond_0
    const/4 v3, 0x6

    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/Element;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Landroid/support/v8/renderscript/RenderScript;->nScriptIntrinsicCreate(II)I

    move-result v0

    .line 52
    .local v0, id:I
    new-instance v2, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;

    invoke-direct {v2, v0, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 53
    .local v2, si:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;
    goto :goto_0
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;)V
    .locals 2
    .parameter "aout"

    .prologue
    const/4 v1, 0x0

    .line 74
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1, p1, v1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V

    .line 75
    return-void
.end method

.method public getFieldID_Input()Landroid/support/v8/renderscript/Script$FieldID;
    .locals 2

    .prologue
    .line 92
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->createFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$FieldID;

    move-result-object v0

    return-object v0
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 83
    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    return-object v0
.end method

.method public setInput(Landroid/support/v8/renderscript/Allocation;)V
    .locals 1
    .parameter "ain"

    .prologue
    .line 63
    iput-object p1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->mInput:Landroid/support/v8/renderscript/Allocation;

    .line 64
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->setVar(ILandroid/support/v8/renderscript/BaseObj;)V

    .line 65
    return-void
.end method
