.class public Landroid/support/v8/renderscript/Script;
.super Landroid/support/v8/renderscript/BaseObj;
.source "Script.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v8/renderscript/Script$LaunchOptions;,
        Landroid/support/v8/renderscript/Script$FieldBase;,
        Landroid/support/v8/renderscript/Script$Builder;,
        Landroid/support/v8/renderscript/Script$FieldID;,
        Landroid/support/v8/renderscript/Script$KernelID;
    }
.end annotation


# instance fields
.field private final mFIDs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v8/renderscript/Script$FieldID;",
            ">;"
        }
    .end annotation
.end field

.field private final mKIDs:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v8/renderscript/Script$KernelID;",
            ">;"
        }
    .end annotation
.end field

.field mT:Landroid/support/v8/renderscript/ScriptCThunker;


# direct methods
.method constructor <init>(ILandroid/support/v8/renderscript/RenderScript;)V
    .locals 1
    .parameter "id"
    .parameter "rs"

    .prologue
    .line 292
    invoke-direct {p0, p1, p2}, Landroid/support/v8/renderscript/BaseObj;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 54
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v8/renderscript/Script;->mKIDs:Landroid/util/SparseArray;

    .line 114
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroid/support/v8/renderscript/Script;->mFIDs:Landroid/util/SparseArray;

    .line 293
    return-void
.end method


# virtual methods
.method public bindAllocation(Landroid/support/v8/renderscript/Allocation;I)V
    .locals 3
    .parameter "va"
    .parameter "slot"

    .prologue
    .line 191
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkBindAllocation(Landroid/support/v8/renderscript/Allocation;I)V

    .line 202
    :goto_0
    return-void

    .line 196
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 197
    if-eqz p1, :cond_1

    .line 198
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p1, v2}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    invoke-virtual {v0, v1, v2, p2}, Landroid/support/v8/renderscript/RenderScript;->nScriptBindAllocation(III)V

    goto :goto_0

    .line 200
    :cond_1
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p2}, Landroid/support/v8/renderscript/RenderScript;->nScriptBindAllocation(III)V

    goto :goto_0
.end method

.method protected createFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$FieldID;
    .locals 5
    .parameter "slot"
    .parameter "e"

    .prologue
    .line 127
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    sget-boolean v3, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 128
    new-instance v0, Landroid/support/v8/renderscript/Script$FieldID;

    const/4 v3, 0x0

    iget-object v4, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {v0, v3, v4, p0, p1}, Landroid/support/v8/renderscript/Script$FieldID;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Script;I)V

    .line 129
    .local v0, f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v3, :cond_0

    .line 130
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v3, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkCreateFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v3

    iput-object v3, v0, Landroid/support/v8/renderscript/Script$FieldID;->mN:Landroid/renderscript/Script$FieldID;

    .line 132
    :cond_0
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mFIDs:Landroid/util/SparseArray;

    invoke-virtual {v3, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object v1, v0

    .line 147
    .end local v0           #f:Landroid/support/v8/renderscript/Script$FieldID;
    .local v1, f:Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 135
    .end local v1           #f:Ljava/lang/Object;
    :cond_1
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mFIDs:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v8/renderscript/Script$FieldID;

    .line 136
    .restart local v0       #f:Landroid/support/v8/renderscript/Script$FieldID;
    if-eqz v0, :cond_2

    move-object v1, v0

    .line 137
    .restart local v1       #f:Ljava/lang/Object;
    goto :goto_0

    .line 140
    .end local v1           #f:Ljava/lang/Object;
    :cond_2
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v4, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v4}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    invoke-virtual {v3, v4, p1}, Landroid/support/v8/renderscript/RenderScript;->nScriptFieldIDCreate(II)I

    move-result v2

    .line 141
    .local v2, id:I
    if-nez v2, :cond_3

    .line 142
    new-instance v3, Landroid/support/v8/renderscript/RSDriverException;

    const-string v4, "Failed to create FieldID"

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSDriverException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 145
    :cond_3
    new-instance v0, Landroid/support/v8/renderscript/Script$FieldID;

    .end local v0           #f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {v0, v2, v3, p0, p1}, Landroid/support/v8/renderscript/Script$FieldID;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Script;I)V

    .line 146
    .restart local v0       #f:Landroid/support/v8/renderscript/Script$FieldID;
    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mFIDs:Landroid/util/SparseArray;

    invoke-virtual {v3, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object v1, v0

    .line 147
    .restart local v1       #f:Ljava/lang/Object;
    goto :goto_0
.end method

.method protected createKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/Script$KernelID;
    .locals 7
    .parameter "slot"
    .parameter "sig"
    .parameter "ein"
    .parameter "eout"

    .prologue
    .line 67
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mKIDs:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v8/renderscript/Script$KernelID;

    .line 68
    .local v0, k:Landroid/support/v8/renderscript/Script$KernelID;
    if-eqz v0, :cond_0

    move-object v6, v0

    .line 92
    .end local v0           #k:Landroid/support/v8/renderscript/Script$KernelID;
    .local v6, k:Ljava/lang/Object;
    :goto_0
    return-object v6

    .line 74
    .end local v6           #k:Ljava/lang/Object;
    .restart local v0       #k:Landroid/support/v8/renderscript/Script$KernelID;
    :cond_0
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    sget-boolean v2, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 75
    new-instance v0, Landroid/support/v8/renderscript/Script$KernelID;

    .end local v0           #k:Landroid/support/v8/renderscript/Script$KernelID;
    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object v3, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/v8/renderscript/Script$KernelID;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Script;II)V

    .line 76
    .restart local v0       #k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v2, :cond_1

    .line 77
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkCreateKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/renderscript/Script$KernelID;

    move-result-object v2

    iput-object v2, v0, Landroid/support/v8/renderscript/Script$KernelID;->mN:Landroid/renderscript/Script$KernelID;

    .line 79
    :cond_1
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mKIDs:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object v6, v0

    .line 80
    .restart local v6       #k:Ljava/lang/Object;
    goto :goto_0

    .line 84
    .end local v6           #k:Ljava/lang/Object;
    :cond_2
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v3, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v3}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v3

    invoke-virtual {v2, v3, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->nScriptKernelIDCreate(III)I

    move-result v1

    .line 85
    .local v1, id:I
    if-nez v1, :cond_3

    .line 86
    new-instance v2, Landroid/support/v8/renderscript/RSDriverException;

    const-string v3, "Failed to create KernelID"

    invoke-direct {v2, v3}, Landroid/support/v8/renderscript/RSDriverException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 89
    :cond_3
    new-instance v0, Landroid/support/v8/renderscript/Script$KernelID;

    .end local v0           #k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object v3, p0

    move v4, p1

    move v5, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/v8/renderscript/Script$KernelID;-><init>(ILandroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Script;II)V

    .line 91
    .restart local v0       #k:Landroid/support/v8/renderscript/Script$KernelID;
    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mKIDs:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object v6, v0

    .line 92
    .restart local v6       #k:Ljava/lang/Object;
    goto :goto_0
.end method

.method protected forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V
    .locals 6
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "v"

    .prologue
    .line 228
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkForEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V

    .line 250
    :goto_0
    return-void

    .line 233
    :cond_0
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 234
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "At least one of ain or aout is required to be non-null."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_1
    const/4 v3, 0x0

    .line 238
    .local v3, in_id:I
    if-eqz p2, :cond_2

    .line 239
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p2, v0}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v3

    .line 241
    :cond_2
    const/4 v4, 0x0

    .line 242
    .local v4, out_id:I
    if-eqz p3, :cond_3

    .line 243
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p3, v0}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    .line 245
    :cond_3
    const/4 v5, 0x0

    .line 246
    .local v5, params:[B
    if-eqz p4, :cond_4

    .line 247
    invoke-virtual {p4}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v5

    .line 249
    :cond_4
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->nScriptForEach(IIII[B)V

    goto :goto_0
.end method

.method protected forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Script$LaunchOptions;)V
    .locals 12
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "v"
    .parameter "sc"

    .prologue
    .line 262
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 263
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkForEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Script$LaunchOptions;)V

    .line 289
    :goto_0
    return-void

    .line 267
    :cond_0
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 268
    new-instance v0, Landroid/support/v8/renderscript/RSIllegalArgumentException;

    const-string v1, "At least one of ain or aout is required to be non-null."

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/RSIllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_1
    if-nez p5, :cond_2

    .line 273
    invoke-virtual/range {p0 .. p4}, Landroid/support/v8/renderscript/Script;->forEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V

    goto :goto_0

    .line 276
    :cond_2
    const/4 v3, 0x0

    .line 277
    .local v3, in_id:I
    if-eqz p2, :cond_3

    .line 278
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p2, v0}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v3

    .line 280
    :cond_3
    const/4 v4, 0x0

    .line 281
    .local v4, out_id:I
    if-eqz p3, :cond_4

    .line 282
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p3, v0}, Landroid/support/v8/renderscript/Allocation;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    .line 284
    :cond_4
    const/4 v5, 0x0

    .line 285
    .local v5, params:[B
    if-eqz p4, :cond_5

    .line 286
    invoke-virtual/range {p4 .. p4}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v5

    .line 288
    :cond_5
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->xstart:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$000(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v6

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->xend:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$100(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v7

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->ystart:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$200(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v8

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->yend:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$300(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v9

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->zstart:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$400(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v10

    #getter for: Landroid/support/v8/renderscript/Script$LaunchOptions;->zend:I
    invoke-static/range {p5 .. p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->access$500(Landroid/support/v8/renderscript/Script$LaunchOptions;)I

    move-result v11

    move v2, p1

    invoke-virtual/range {v0 .. v11}, Landroid/support/v8/renderscript/RenderScript;->nScriptForEachClipped(IIII[BIIIIII)V

    goto :goto_0
.end method

.method bridge synthetic getNObj()Landroid/renderscript/BaseObj;
    .locals 1

    .prologue
    .line 25
    invoke-virtual {p0}, Landroid/support/v8/renderscript/Script;->getNObj()Landroid/renderscript/Script;

    move-result-object v0

    return-object v0
.end method

.method getNObj()Landroid/renderscript/Script;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    return-object v0
.end method

.method protected invoke(I)V
    .locals 2
    .parameter "slot"

    .prologue
    .line 157
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkInvoke(I)V

    .line 163
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nScriptInvoke(II)V

    goto :goto_0
.end method

.method protected invoke(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 3
    .parameter "slot"
    .parameter "v"

    .prologue
    .line 172
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkInvoke(ILandroid/support/v8/renderscript/FieldPacker;)V

    .line 182
    :goto_0
    return-void

    .line 177
    :cond_0
    if-eqz p2, :cond_1

    .line 178
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Landroid/support/v8/renderscript/RenderScript;->nScriptInvokeV(II[B)V

    goto :goto_0

    .line 180
    :cond_1
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v8/renderscript/RenderScript;->nScriptInvoke(II)V

    goto :goto_0
.end method

.method public setTimeZone(Ljava/lang/String;)V
    .locals 4
    .parameter "timeZone"

    .prologue
    .line 205
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v1, :cond_0

    .line 206
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v1, p1}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetTimeZone(Ljava/lang/String;)V

    .line 216
    :goto_0
    return-void

    .line 210
    :cond_0
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/RenderScript;->validate()V

    .line 212
    :try_start_0
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v2}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    const-string v3, "UTF-8"

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetTimeZone(I[B)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setVar(ID)V
    .locals 2
    .parameter "index"
    .parameter "v"

    .prologue
    .line 317
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 318
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(ID)V

    .line 323
    :goto_0
    return-void

    .line 322
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarD(IID)V

    goto :goto_0
.end method

.method public setVar(IF)V
    .locals 2
    .parameter "index"
    .parameter "v"

    .prologue
    .line 302
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(IF)V

    .line 308
    :goto_0
    return-void

    .line 307
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarF(IIF)V

    goto :goto_0
.end method

.method public setVar(II)V
    .locals 2
    .parameter "index"
    .parameter "v"

    .prologue
    .line 332
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 333
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(II)V

    .line 338
    :goto_0
    return-void

    .line 337
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1, p2}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarI(III)V

    goto :goto_0
.end method

.method public setVar(IJ)V
    .locals 2
    .parameter "index"
    .parameter "v"

    .prologue
    .line 347
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 348
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(IJ)V

    .line 353
    :goto_0
    return-void

    .line 352
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {v0, v1, p1, p2, p3}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarJ(IIJ)V

    goto :goto_0
.end method

.method public setVar(ILandroid/support/v8/renderscript/BaseObj;)V
    .locals 3
    .parameter "index"
    .parameter "o"

    .prologue
    .line 377
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(ILandroid/support/v8/renderscript/BaseObj;)V

    .line 383
    :goto_0
    return-void

    .line 382
    :cond_0
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    if-nez p2, :cond_1

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1, v2, p1, v0}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarObj(III)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p2, v0}, Landroid/support/v8/renderscript/BaseObj;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v0

    goto :goto_1
.end method

.method public setVar(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 3
    .parameter "index"
    .parameter "v"

    .prologue
    .line 392
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 393
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(ILandroid/support/v8/renderscript/FieldPacker;)V

    .line 398
    :goto_0
    return-void

    .line 397
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v2

    invoke-virtual {v0, v1, p1, v2}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarV(II[B)V

    goto :goto_0
.end method

.method public setVar(ILandroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Element;[I)V
    .locals 6
    .parameter "index"
    .parameter "v"
    .parameter "e"
    .parameter "dims"

    .prologue
    .line 409
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 410
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(ILandroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Element;[I)V

    .line 415
    :goto_0
    return-void

    .line 414
    :cond_0
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v1}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v3

    iget-object v2, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p3, v2}, Landroid/support/v8/renderscript/Element;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v4

    move v2, p1

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarVE(II[BI[I)V

    goto :goto_0
.end method

.method public setVar(IZ)V
    .locals 3
    .parameter "index"
    .parameter "v"

    .prologue
    .line 362
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    if-eqz v0, :cond_0

    .line 363
    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mT:Landroid/support/v8/renderscript/ScriptCThunker;

    invoke-virtual {v0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->thunkSetVar(IZ)V

    .line 368
    :goto_0
    return-void

    .line 367
    :cond_0
    iget-object v1, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    iget-object v0, p0, Landroid/support/v8/renderscript/Script;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual {p0, v0}, Landroid/support/v8/renderscript/Script;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v2

    if-eqz p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v2, p1, v0}, Landroid/support/v8/renderscript/RenderScript;->nScriptSetVarI(III)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
