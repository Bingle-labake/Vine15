.class public Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;
.source "ScriptIntrinsicYuvToRGBThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;


# direct methods
.method private constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 30
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 33
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v0, p1

    .line 34
    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 36
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v2, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 37
    .local v2, si:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    move-result-object v3

    iput-object v3, v2, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    .line 38
    return-object v2
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "aout"

    .prologue
    .line 48
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 49
    .local v0, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->forEach(Landroid/renderscript/Allocation;)V

    .line 50
    return-void
.end method

.method public getFieldID_Input()Landroid/support/v8/renderscript/Script$FieldID;
    .locals 3

    .prologue
    .line 59
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->createFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$FieldID;

    move-result-object v0

    .line 60
    .local v0, f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->getFieldID_Input()Landroid/renderscript/Script$FieldID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$FieldID;->mN:Landroid/renderscript/Script$FieldID;

    .line 61
    return-object v0
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 53
    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 54
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 55
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicYuvToRGB;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    return-object v0
.end method

.method public setInput(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "ain"

    .prologue
    .line 43
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 44
    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGBThunker;->mN:Landroid/renderscript/ScriptIntrinsicYuvToRGB;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicYuvToRGB;->setInput(Landroid/renderscript/Allocation;)V

    .line 45
    return-void
.end method
