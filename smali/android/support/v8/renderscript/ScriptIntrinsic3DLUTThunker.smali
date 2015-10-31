.class Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;
.source "ScriptIntrinsic3DLUTThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsic3DLUT;


# direct methods
.method private constructor <init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V
    .locals 0
    .parameter "id"
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUT;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 34
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 37
    move-object v2, p0

    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v0, p1

    .line 38
    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 40
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v1, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 41
    .local v1, lut:Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;
    iget-object v3, v2, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsic3DLUT;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsic3DLUT;

    move-result-object v3

    iput-object v3, v1, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsic3DLUT;

    .line 42
    return-object v1
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 59
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 60
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 61
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsic3DLUT;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsic3DLUT;->forEach(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 62
    return-void
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 70
    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 71
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsic3DLUT;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsic3DLUT;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 72
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 25
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->getNObj()Landroid/renderscript/ScriptIntrinsic3DLUT;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 25
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->getNObj()Landroid/renderscript/ScriptIntrinsic3DLUT;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsic3DLUT;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsic3DLUT;

    return-object v0
.end method

.method public setLUT(Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "lut"

    .prologue
    .line 46
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 47
    .local v0, lutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsic3DLUTThunker;->mN:Landroid/renderscript/ScriptIntrinsic3DLUT;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/renderscript/ScriptIntrinsic3DLUT;->setLUT(Landroid/renderscript/Allocation;)V

    .line 48
    return-void
.end method
