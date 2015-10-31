.class Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3;
.source "ScriptIntrinsicConvolve3x3Thunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;


# direct methods
.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 31
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 34
    move-object v1, p0

    check-cast v1, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v1, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v0, p1

    .line 35
    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 37
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v2, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 38
    .local v2, si:Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;
    iget-object v3, v1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    move-result-object v3

    iput-object v3, v2, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    .line 39
    return-object v2
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "aout"

    .prologue
    .line 52
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 53
    .local v0, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->forEach(Landroid/renderscript/Allocation;)V

    .line 55
    return-void
.end method

.method public getFieldID_Input()Landroid/support/v8/renderscript/Script$FieldID;
    .locals 3

    .prologue
    .line 64
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->createFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$FieldID;

    move-result-object v0

    .line 65
    .local v0, f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->getFieldID_Input()Landroid/renderscript/Script$FieldID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$FieldID;->mN:Landroid/renderscript/Script$FieldID;

    .line 66
    return-object v0
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 58
    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 59
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 60
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->getNObj()Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->getNObj()Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicConvolve3x3;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    return-object v0
.end method

.method public setCoefficients([F)V
    .locals 1
    .parameter "v"

    .prologue
    .line 48
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    invoke-virtual {v0, p1}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->setCoefficients([F)V

    .line 49
    return-void
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
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicConvolve3x3Thunker;->mN:Landroid/renderscript/ScriptIntrinsicConvolve3x3;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicConvolve3x3;->setInput(Landroid/renderscript/Allocation;)V

    .line 45
    return-void
.end method
