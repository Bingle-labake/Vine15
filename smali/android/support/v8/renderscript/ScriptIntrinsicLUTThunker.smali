.class Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicLUT;
.source "ScriptIntrinsicLUTThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicLUT;


# direct methods
.method private constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 30
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;
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
    new-instance v2, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 37
    .local v2, si:Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicLUT;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicLUT;

    move-result-object v3

    iput-object v3, v2, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    .line 38
    return-object v2
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 58
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 59
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 60
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicLUT;->forEach(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 61
    return-void
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 64
    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 65
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicLUT;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 66
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicLUT;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicLUT;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicLUT;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    return-object v0
.end method

.method public setAlpha(II)V
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 54
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v0, p1, p2}, Landroid/renderscript/ScriptIntrinsicLUT;->setAlpha(II)V

    .line 55
    return-void
.end method

.method public setBlue(II)V
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 50
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v0, p1, p2}, Landroid/renderscript/ScriptIntrinsicLUT;->setBlue(II)V

    .line 51
    return-void
.end method

.method public setGreen(II)V
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 46
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v0, p1, p2}, Landroid/renderscript/ScriptIntrinsicLUT;->setGreen(II)V

    .line 47
    return-void
.end method

.method public setRed(II)V
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 42
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsicLUT;

    invoke-virtual {v0, p1, p2}, Landroid/renderscript/ScriptIntrinsicLUT;->setRed(II)V

    .line 43
    return-void
.end method
