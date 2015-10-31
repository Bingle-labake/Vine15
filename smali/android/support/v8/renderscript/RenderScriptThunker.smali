.class Landroid/support/v8/renderscript/RenderScriptThunker;
.super Landroid/support/v8/renderscript/RenderScript;
.source "RenderScriptThunker.java"


# instance fields
.field mN:Landroid/renderscript/RenderScript;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "ctx"

    .prologue
    .line 44
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/RenderScript;-><init>(Landroid/content/Context;)V

    .line 45
    const/4 v0, 0x1

    sput-boolean v0, Landroid/support/v8/renderscript/RenderScriptThunker;->isNative:Z

    .line 46
    return-void
.end method

.method public static create(Landroid/content/Context;I)Landroid/support/v8/renderscript/RenderScript;
    .locals 2
    .parameter "ctx"
    .parameter "sdkVersion"

    .prologue
    .line 49
    new-instance v0, Landroid/support/v8/renderscript/RenderScriptThunker;

    invoke-direct {v0, p0}, Landroid/support/v8/renderscript/RenderScriptThunker;-><init>(Landroid/content/Context;)V

    .line 50
    .local v0, rs:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {p0, p1}, Landroid/renderscript/RenderScript;->create(Landroid/content/Context;I)Landroid/renderscript/RenderScript;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    .line 51
    return-object v0
.end method


# virtual methods
.method public contextDump()V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/renderscript/RenderScript;->contextDump()V

    .line 56
    return-void
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/renderscript/RenderScript;->destroy()V

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    .line 65
    return-void
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/renderscript/RenderScript;->finish()V

    .line 60
    return-void
.end method

.method public setPriority(Landroid/support/v8/renderscript/RenderScript$Priority;)V
    .locals 2
    .parameter "p"

    .prologue
    .line 39
    sget-object v0, Landroid/support/v8/renderscript/RenderScript$Priority;->LOW:Landroid/support/v8/renderscript/RenderScript$Priority;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    sget-object v1, Landroid/renderscript/RenderScript$Priority;->LOW:Landroid/renderscript/RenderScript$Priority;

    invoke-virtual {v0, v1}, Landroid/renderscript/RenderScript;->setPriority(Landroid/renderscript/RenderScript$Priority;)V

    .line 40
    :cond_0
    sget-object v0, Landroid/support/v8/renderscript/RenderScript$Priority;->NORMAL:Landroid/support/v8/renderscript/RenderScript$Priority;

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    sget-object v1, Landroid/renderscript/RenderScript$Priority;->NORMAL:Landroid/renderscript/RenderScript$Priority;

    invoke-virtual {v0, v1}, Landroid/renderscript/RenderScript;->setPriority(Landroid/renderscript/RenderScript$Priority;)V

    .line 41
    :cond_1
    return-void
.end method

.method validate()V
    .locals 2

    .prologue
    .line 33
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v1, "Calling RS with no Context active."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    return-void
.end method
