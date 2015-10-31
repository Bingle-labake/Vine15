.class public final Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;
.super Ljava/lang/Object;
.source "ScriptGroupThunker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v8/renderscript/ScriptGroupThunker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field bN:Landroid/renderscript/ScriptGroup$Builder;

.field mRS:Landroid/support/v8/renderscript/RenderScript;


# direct methods
.method constructor <init>(Landroid/support/v8/renderscript/RenderScript;)V
    .locals 3
    .parameter "rs"

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v0, p1

    .line 54
    check-cast v0, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 55
    .local v0, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    iput-object p1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    .line 56
    new-instance v1, Landroid/renderscript/ScriptGroup$Builder;

    iget-object v2, v0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-direct {v1, v2}, Landroid/renderscript/ScriptGroup$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    iput-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->bN:Landroid/renderscript/ScriptGroup$Builder;

    .line 57
    return-void
.end method


# virtual methods
.method public addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$FieldID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;
    .locals 5
    .parameter "t"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 65
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/TypeThunker;

    .line 66
    .local v0, tt:Landroid/support/v8/renderscript/TypeThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->bN:Landroid/renderscript/ScriptGroup$Builder;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/TypeThunker;->getNObj()Landroid/renderscript/Type;

    move-result-object v2

    iget-object v3, p2, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    iget-object v4, p3, Landroid/support/v8/renderscript/Script$FieldID;->mN:Landroid/renderscript/Script$FieldID;

    invoke-virtual {v1, v2, v3, v4}, Landroid/renderscript/ScriptGroup$Builder;->addConnection(Landroid/renderscript/Type;Landroid/renderscript/Script$KernelID;Landroid/renderscript/Script$FieldID;)Landroid/renderscript/ScriptGroup$Builder;

    .line 67
    return-object p0
.end method

.method public addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;
    .locals 5
    .parameter "t"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 71
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/TypeThunker;

    .line 72
    .local v0, tt:Landroid/support/v8/renderscript/TypeThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->bN:Landroid/renderscript/ScriptGroup$Builder;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/TypeThunker;->getNObj()Landroid/renderscript/Type;

    move-result-object v2

    iget-object v3, p2, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    iget-object v4, p3, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    invoke-virtual {v1, v2, v3, v4}, Landroid/renderscript/ScriptGroup$Builder;->addConnection(Landroid/renderscript/Type;Landroid/renderscript/Script$KernelID;Landroid/renderscript/Script$KernelID;)Landroid/renderscript/ScriptGroup$Builder;

    .line 73
    return-object p0
.end method

.method public addKernel(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;
    .locals 2
    .parameter "k"

    .prologue
    .line 60
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->bN:Landroid/renderscript/ScriptGroup$Builder;

    iget-object v1, p1, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    invoke-virtual {v0, v1}, Landroid/renderscript/ScriptGroup$Builder;->addKernel(Landroid/renderscript/Script$KernelID;)Landroid/renderscript/ScriptGroup$Builder;

    .line 61
    return-object p0
.end method

.method public create()Landroid/support/v8/renderscript/ScriptGroupThunker;
    .locals 3

    .prologue
    .line 79
    new-instance v0, Landroid/support/v8/renderscript/ScriptGroupThunker;

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {v0, v1, v2}, Landroid/support/v8/renderscript/ScriptGroupThunker;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 80
    .local v0, sg:Landroid/support/v8/renderscript/ScriptGroupThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->bN:Landroid/renderscript/ScriptGroup$Builder;

    invoke-virtual {v1}, Landroid/renderscript/ScriptGroup$Builder;->create()Landroid/renderscript/ScriptGroup;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/ScriptGroupThunker;->mN:Landroid/renderscript/ScriptGroup;

    .line 81
    return-object v0
.end method
