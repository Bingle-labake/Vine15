.class Landroid/support/v8/renderscript/ScriptGroupThunker;
.super Landroid/support/v8/renderscript/ScriptGroup;
.source "ScriptGroupThunker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;
    }
.end annotation


# instance fields
.field mN:Landroid/renderscript/ScriptGroup;


# direct methods
.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptGroup;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 31
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptGroupThunker;->mN:Landroid/renderscript/ScriptGroup;

    invoke-virtual {v0}, Landroid/renderscript/ScriptGroup;->execute()V

    .line 45
    return-void
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0}, Landroid/support/v8/renderscript/ScriptGroupThunker;->getNObj()Landroid/renderscript/ScriptGroup;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/ScriptGroup;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptGroupThunker;->mN:Landroid/renderscript/ScriptGroup;

    return-object v0
.end method

.method public setInput(Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Allocation;)V
    .locals 4
    .parameter "s"
    .parameter "a"

    .prologue
    .line 34
    move-object v0, p2

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 35
    .local v0, at:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker;->mN:Landroid/renderscript/ScriptGroup;

    iget-object v2, p1, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/renderscript/ScriptGroup;->setInput(Landroid/renderscript/Script$KernelID;Landroid/renderscript/Allocation;)V

    .line 36
    return-void
.end method

.method public setOutput(Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Allocation;)V
    .locals 4
    .parameter "s"
    .parameter "a"

    .prologue
    .line 39
    move-object v0, p2

    check-cast v0, Landroid/support/v8/renderscript/AllocationThunker;

    .line 40
    .local v0, at:Landroid/support/v8/renderscript/AllocationThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker;->mN:Landroid/renderscript/ScriptGroup;

    iget-object v2, p1, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/AllocationThunker;->getNObj()Landroid/renderscript/Allocation;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/renderscript/ScriptGroup;->setOutput(Landroid/renderscript/Script$KernelID;Landroid/renderscript/Allocation;)V

    .line 41
    return-void
.end method
