.class public Landroid/support/v8/renderscript/ScriptIntrinsicLUT;
.super Landroid/support/v8/renderscript/ScriptIntrinsic;
.source "ScriptIntrinsicLUT.java"


# instance fields
.field private final mCache:[B

.field private mDirty:Z

.field private final mMatrix:Landroid/support/v8/renderscript/Matrix4f;

.field private mTables:Landroid/support/v8/renderscript/Allocation;


# direct methods
.method protected constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 1
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsic;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 28
    new-instance v0, Landroid/support/v8/renderscript/Matrix4f;

    invoke-direct {v0}, Landroid/support/v8/renderscript/Matrix4f;-><init>()V

    iput-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mMatrix:Landroid/support/v8/renderscript/Matrix4f;

    .line 30
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 35
    return-void
.end method

.method public static create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicLUT;
    .locals 7
    .parameter "rs"
    .parameter "e"

    .prologue
    .line 48
    sget-boolean v4, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v4, :cond_0

    move-object v2, p0

    .line 49
    check-cast v2, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 50
    .local v2, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    invoke-static {p0, p1}, Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;->create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicLUTThunker;

    move-result-object v3

    .line 64
    .end local v2           #rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    :goto_0
    return-object v3

    .line 53
    :cond_0
    const/4 v4, 0x3

    invoke-virtual {p1, p0}, Landroid/support/v8/renderscript/Element;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Landroid/support/v8/renderscript/RenderScript;->nScriptIntrinsicCreate(II)I

    move-result v1

    .line 55
    .local v1, id:I
    new-instance v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;

    invoke-direct {v3, v1, p0}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 56
    .local v3, si:Landroid/support/v8/renderscript/ScriptIntrinsicLUT;
    invoke-static {p0}, Landroid/support/v8/renderscript/Element;->U8(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v4

    const/16 v5, 0x400

    invoke-static {p0, v4, v5}, Landroid/support/v8/renderscript/Allocation;->createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v4

    iput-object v4, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mTables:Landroid/support/v8/renderscript/Allocation;

    .line 57
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_1
    const/16 v4, 0x100

    if-ge v0, v4, :cond_1

    .line 58
    iget-object v4, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    int-to-byte v5, v0

    aput-byte v5, v4, v0

    .line 59
    iget-object v4, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v5, v0, 0x100

    int-to-byte v6, v0

    aput-byte v6, v4, v5

    .line 60
    iget-object v4, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v5, v0, 0x200

    int-to-byte v6, v0

    aput-byte v6, v4, v5

    .line 61
    iget-object v4, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v5, v0, 0x300

    int-to-byte v6, v0

    aput-byte v6, v4, v5

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 63
    :cond_1
    const/4 v4, 0x0

    iget-object v5, v3, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mTables:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {v3, v4, v5}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->setVar(ILandroid/support/v8/renderscript/BaseObj;)V

    goto :goto_0
.end method

.method private validate(II)V
    .locals 2
    .parameter "index"
    .parameter "value"

    .prologue
    const/16 v0, 0xff

    .line 69
    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    .line 70
    :cond_0
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Index out of range (0-255)."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    if-ltz p2, :cond_2

    if-le p2, v0, :cond_3

    .line 73
    :cond_2
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "Value out of range (0-255)."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_3
    return-void
.end method


# virtual methods
.method public forEach(Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;)V
    .locals 3
    .parameter "ain"
    .parameter "aout"

    .prologue
    const/4 v2, 0x0

    .line 134
    iget-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    if-eqz v0, :cond_0

    .line 135
    iput-boolean v2, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 136
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mTables:Landroid/support/v8/renderscript/Allocation;

    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/Allocation;->copyFromUnchecked([B)V

    .line 138
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v2, p1, p2, v0}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V

    .line 139
    return-void
.end method

.method public getKernelID()Landroid/support/v8/renderscript/Script$KernelID;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 147
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1, v2, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;

    move-result-object v0

    return-object v0
.end method

.method public setAlpha(II)V
    .locals 3
    .parameter "index"
    .parameter "value"

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->validate(II)V

    .line 121
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v1, p1, 0x300

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 122
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 123
    return-void
.end method

.method public setBlue(II)V
    .locals 3
    .parameter "index"
    .parameter "value"

    .prologue
    .line 108
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->validate(II)V

    .line 109
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v1, p1, 0x200

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 111
    return-void
.end method

.method public setGreen(II)V
    .locals 3
    .parameter "index"
    .parameter "value"

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->validate(II)V

    .line 97
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    add-int/lit16 v1, p1, 0x100

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 98
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 99
    return-void
.end method

.method public setRed(II)V
    .locals 2
    .parameter "index"
    .parameter "value"

    .prologue
    .line 84
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->validate(II)V

    .line 85
    iget-object v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mCache:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v8/renderscript/ScriptIntrinsicLUT;->mDirty:Z

    .line 87
    return-void
.end method
