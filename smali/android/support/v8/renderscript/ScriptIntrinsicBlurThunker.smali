.class Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicBlur;
.source "ScriptIntrinsicBlurThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicBlur;


# direct methods
.method protected constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicBlur;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 33
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 36
    move-object v2, p0

    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v1, p1

    .line 37
    check-cast v1, Landroid/support/v8/renderscript/ElementThunker;

    .line 39
    .local v1, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;

    const/4 v3, 0x0

    invoke-direct {v0, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 40
    .local v0, blur:Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;
    iget-object v3, v2, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicBlur;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object v3

    iput-object v3, v0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    .line 41
    return-object v0
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "aout"

    .prologue
    .line 54
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 55
    .local v0, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    if-eqz v0, :cond_0

    .line 56
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicBlur;->forEach(Landroid/renderscript/Allocation;)V

    .line 58
    :cond_0
    return-void
.end method

.method public getFieldID_Input()Landroid/support/v8/renderscript/Script$FieldID;
    .locals 3

    .prologue
    .line 67
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->createFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$FieldID;

    move-result-object v0

    .line 68
    .local v0, f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlur;->getFieldID_Input()Landroid/renderscript/Script$FieldID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$FieldID;->mN:Landroid/renderscript/Script$FieldID;

    .line 69
    return-object v0
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 61
    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 62
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlur;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 63
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicBlur;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    return-object v0
.end method

.method public setInput(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "ain"

    .prologue
    .line 45
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 46
    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsicBlur;->setInput(Landroid/renderscript/Allocation;)V

    .line 47
    return-void
.end method

.method public setRadius(F)V
    .locals 1
    .parameter "radius"

    .prologue
    .line 50
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlurThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlur;

    invoke-virtual {v0, p1}, Landroid/renderscript/ScriptIntrinsicBlur;->setRadius(F)V

    .line 51
    return-void
.end method
