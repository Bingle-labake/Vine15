.class Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;
.super Landroid/support/v8/renderscript/ScriptIntrinsicBlend;
.source "ScriptIntrinsicBlendThunker.java"


# instance fields
.field mN:Landroid/renderscript/ScriptIntrinsicBlend;


# direct methods
.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicBlend;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 28
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;
    .locals 5
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 31
    move-object v2, p0

    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    move-object v1, p1

    .line 32
    check-cast v1, Landroid/support/v8/renderscript/ElementThunker;

    .line 34
    .local v1, et:Landroid/support/v8/renderscript/ElementThunker;
    new-instance v0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;

    const/4 v3, 0x0

    invoke-direct {v0, v3, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 35
    .local v0, blend:Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;
    iget-object v3, v2, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlend;

    move-result-object v3

    iput-object v3, v0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    .line 36
    return-object v0
.end method


# virtual methods
.method public forEachAdd(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 209
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 210
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 212
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachAdd(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 213
    return-void
.end method

.method public forEachClear(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 40
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 41
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 43
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachClear(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 44
    return-void
.end method

.method public forEachDst(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 66
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 67
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 69
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachDst(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 70
    return-void
.end method

.method public forEachDstAtop(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 170
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 171
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 173
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachDstAtop(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 174
    return-void
.end method

.method public forEachDstIn(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 118
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 119
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 121
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachDstIn(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 122
    return-void
.end method

.method public forEachDstOut(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 144
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 145
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 147
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachDstOut(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 148
    return-void
.end method

.method public forEachDstOver(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 92
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 93
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 95
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachDstOver(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 96
    return-void
.end method

.method public forEachMultiply(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 196
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 197
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 199
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachMultiply(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 200
    return-void
.end method

.method public forEachSrc(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 53
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 54
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 56
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSrc(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 57
    return-void
.end method

.method public forEachSrcAtop(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 157
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 158
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 160
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSrcAtop(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 161
    return-void
.end method

.method public forEachSrcIn(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 105
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 106
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 108
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSrcIn(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 109
    return-void
.end method

.method public forEachSrcOut(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 131
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 132
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 134
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSrcOut(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 135
    return-void
.end method

.method public forEachSrcOver(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 79
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 80
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 82
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSrcOver(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 83
    return-void
.end method

.method public forEachSubtract(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 222
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 223
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 225
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachSubtract(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 226
    return-void
.end method

.method public forEachXor(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 5
    .parameter "ain"
    .parameter "aout"

    .prologue
    .line 183
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .local v0, aint:Landroid/support/v8/renderscript/AllocationThunker;
    move-object v1, p2

    .line 184
    check-cast v1, Landroid/support/v8/renderscript/AllocationThunker;

    .line 186
    .local v1, aoutt:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/renderscript/ScriptIntrinsicBlend;->forEachXor(Landroid/renderscript/Allocation;Landroid/renderscript/Allocation;)V

    .line 187
    return-void
.end method

.method public getKernelIDAdd()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 216
    const/16 v1, 0x22

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 217
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDAdd()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 218
    return-object v0
.end method

.method public getKernelIDClear()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 47
    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 48
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDClear()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 49
    return-object v0
.end method

.method public getKernelIDDst()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 73
    const/4 v1, 0x2

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 74
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDDst()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 75
    return-object v0
.end method

.method public getKernelIDDstAtop()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 177
    const/16 v1, 0xa

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 178
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDDstAtop()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 179
    return-object v0
.end method

.method public getKernelIDDstIn()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 125
    const/4 v1, 0x6

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 126
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDDstIn()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 127
    return-object v0
.end method

.method public getKernelIDDstOut()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 151
    const/16 v1, 0x8

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 152
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDDstOut()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 153
    return-object v0
.end method

.method public getKernelIDDstOver()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 99
    const/4 v1, 0x4

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 100
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDDstOver()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 101
    return-object v0
.end method

.method public getKernelIDMultiply()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 203
    const/16 v1, 0xe

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 204
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDMultiply()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 205
    return-object v0
.end method

.method public getKernelIDSrc()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 60
    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 61
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSrc()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 62
    return-object v0
.end method

.method public getKernelIDSrcAtop()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 164
    const/16 v1, 0x9

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 165
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSrcAtop()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 166
    return-object v0
.end method

.method public getKernelIDSrcIn()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 112
    const/4 v1, 0x5

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 113
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSrcIn()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 114
    return-object v0
.end method

.method public getKernelIDSrcOut()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 138
    const/4 v1, 0x7

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 139
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSrcOut()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 140
    return-object v0
.end method

.method public getKernelIDSrcOver()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x3

    .line 86
    invoke-virtual {p0, v1, v1, v2, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 87
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSrcOver()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 88
    return-object v0
.end method

.method public getKernelIDSubtract()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 229
    const/16 v1, 0x23

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 230
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDSubtract()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 231
    return-object v0
.end method

.method public getKernelIDXor()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 190
    const/16 v1, 0xb

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2, v3, v3}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    .line 191
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    invoke-virtual {v1}, Landroid/renderscript/ScriptIntrinsicBlend;->getKernelIDXor()Landroid/renderscript/Script$KernelID;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 192
    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicBlend;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->getNObj()Landroid/renderscript/ScriptIntrinsicBlend;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptIntrinsicBlend;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicBlendThunker;->mN:Landroid/renderscript/ScriptIntrinsicBlend;

    return-object v0
.end method
