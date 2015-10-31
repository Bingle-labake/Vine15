.class Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrix;
.source "ScriptIntrinsicColorMatrixThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;


# direct methods
.method private constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrix;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 30
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 33
    move-object v2, p0

    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v1, p1

    .line 34
    check-cast v1, Landroid/support/v8/renderscript/ElementThunker;

    .line 36
    .local v1, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;

    const/4 v3, 0x0

    invoke-direct {v0, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 37
    .local v0, cm:Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;
    iget-object v3, v2, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicColorMatrix;

    move-result-object v3

    iput-object v3, v0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    .line 38
    return-object v0
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 64
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 65
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 66
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->forEach(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 67
    return-void
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 70
    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 71
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->getKernelID()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 72
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicColorMatrix;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicColorMatrix;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicColorMatrix;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    return-object v0
.end method

.method public setColorMatrix(Landroid/support/v8/renderscript/Matrix3f;)V
    .locals 3
    .parameter "m"

    .prologue
    .line 47
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    new-instance v1, Landroid/renderscript/Matrix3f;

    invoke-virtual {p1}, Landroid/support/v8/renderscript/Matrix3f;->getArray()[F

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/renderscript/Matrix3f;-><init>([F)V

    invoke-virtual {v0, v1}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->setColorMatrix(Landroid/renderscript/Matrix3f;)V

    .line 48
    return-void
.end method

.method public setColorMatrix(Landroid/support/v8/renderscript/Matrix4f;)V
    .locals 3
    .parameter "m"

    .prologue
    .line 43
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    new-instance v1, Landroid/renderscript/Matrix4f;

    invoke-virtual {p1}, Landroid/support/v8/renderscript/Matrix4f;->getArray()[F

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/renderscript/Matrix4f;-><init>([F)V

    invoke-virtual {v0, v1}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->setColorMatrix(Landroid/renderscript/Matrix4f;)V

    .line 44
    return-void
.end method

.method public setGreyscale()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    invoke-virtual {v0}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->setGreyscale()V

    .line 52
    return-void
.end method

.method public setRGBtoYUV()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    invoke-virtual {v0}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->setRGBtoYUV()V

    .line 60
    return-void
.end method

.method public setYUVtoRGB()V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicColorMatrixThunker;->mN:Landroid/renderscript/ScriptIntrinsicColorMatrix;

    invoke-virtual {v0}, Landroid/renderscript/ScriptIntrinsicColorMatrix;->setYUVtoRGB()V

    .line 56
    return-void
.end method
