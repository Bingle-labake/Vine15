.class public final Landroid/support/v8/renderscript/ScriptGroup$Builder;
.super Ljava/lang/Object;
.source "ScriptGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v8/renderscript/ScriptGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mKernelCount:I

.field private mLines:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;",
            ">;"
        }
    .end annotation
.end field

.field private mNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v8/renderscript/ScriptGroup$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mRS:Landroid/support/v8/renderscript/RenderScript;

.field private mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;


# direct methods
.method public constructor <init>(Landroid/support/v8/renderscript/RenderScript;)V
    .locals 1
    .parameter "rs"

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    .line 185
    sget-boolean v0, Landroid/support/v8/renderscript/RenderScript;->isNative:Z

    if-eqz v0, :cond_0

    .line 186
    new-instance v0, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    invoke-direct {v0, p1}, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;-><init>(Landroid/support/v8/renderscript/RenderScript;)V

    iput-object v0, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    .line 188
    :cond_0
    iput-object p1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    .line 189
    return-void
.end method

.method private findNode(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Node;
    .locals 4
    .parameter "k"

    .prologue
    .line 269
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 270
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v8/renderscript/ScriptGroup$Node;

    .line 271
    .local v2, n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    const/4 v1, 0x0

    .local v1, ct2:I
    :goto_1
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mKernels:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 272
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mKernels:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne p1, v3, :cond_0

    .line 277
    .end local v1           #ct2:I
    .end local v2           #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :goto_2
    return-object v2

    .line 271
    .restart local v1       #ct2:I
    .restart local v2       #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 269
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 277
    .end local v1           #ct2:I
    .end local v2           #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;
    .locals 2
    .parameter "s"

    .prologue
    .line 260
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 261
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$Node;

    iget-object v1, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mScript:Landroid/support/v8/renderscript/Script;

    if-ne p1, v1, :cond_0

    .line 262
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$Node;

    .line 265
    :goto_1
    return-object v1

    .line 260
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 265
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private mergeDAGs(II)V
    .locals 2
    .parameter "valueUsed"
    .parameter "valueKilled"

    .prologue
    .line 214
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 215
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$Node;

    iget v1, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    if-ne v1, p2, :cond_0

    .line 216
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$Node;

    iput p1, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    .line 214
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 218
    :cond_1
    return-void
.end method

.method private validateCycle(Landroid/support/v8/renderscript/ScriptGroup$Node;Landroid/support/v8/renderscript/ScriptGroup$Node;)V
    .locals 5
    .parameter "target"
    .parameter "original"

    .prologue
    .line 194
    const/4 v1, 0x0

    .local v1, ct:I
    :goto_0
    iget-object v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 195
    iget-object v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    .line 196
    .local v0, cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    if-eqz v3, :cond_1

    .line 197
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    iget-object v3, v3, Landroid/support/v8/renderscript/Script$KernelID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 198
    .local v2, tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    invoke-virtual {v2, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 199
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "Loops in group not allowed."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 201
    :cond_0
    invoke-direct {p0, v2, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateCycle(Landroid/support/v8/renderscript/ScriptGroup$Node;Landroid/support/v8/renderscript/ScriptGroup$Node;)V

    .line 203
    .end local v2           #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_1
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    if-eqz v3, :cond_3

    .line 204
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    iget-object v3, v3, Landroid/support/v8/renderscript/Script$FieldID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 205
    .restart local v2       #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    invoke-virtual {v2, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 206
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "Loops in group not allowed."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 208
    :cond_2
    invoke-direct {p0, v2, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateCycle(Landroid/support/v8/renderscript/ScriptGroup$Node;Landroid/support/v8/renderscript/ScriptGroup$Node;)V

    .line 194
    .end local v2           #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 211
    .end local v0           #cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    :cond_4
    return-void
.end method

.method private validateDAG()V
    .locals 5

    .prologue
    .line 242
    const/4 v0, 0x0

    .local v0, ct:I
    :goto_0
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_2

    .line 243
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v8/renderscript/ScriptGroup$Node;

    .line 244
    .local v2, n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mInputs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 245
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    .line 246
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "Groups cannot contain unconnected scripts"

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 248
    :cond_0
    add-int/lit8 v3, v0, 0x1

    invoke-direct {p0, v2, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateDAGRecurse(Landroid/support/v8/renderscript/ScriptGroup$Node;I)V

    .line 242
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    .end local v2           #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_2
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v8/renderscript/ScriptGroup$Node;

    iget v1, v3, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    .line 252
    .local v1, dagNumber:I
    const/4 v0, 0x0

    :goto_1
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 253
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v8/renderscript/ScriptGroup$Node;

    iget v3, v3, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    if-eq v3, v1, :cond_3

    .line 254
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "Multiple DAGs in group not allowed."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 252
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 257
    :cond_4
    return-void
.end method

.method private validateDAGRecurse(Landroid/support/v8/renderscript/ScriptGroup$Node;I)V
    .locals 4
    .parameter "n"
    .parameter "dagNumber"

    .prologue
    .line 222
    iget v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    if-eqz v3, :cond_1

    iget v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    if-eq v3, p2, :cond_1

    .line 223
    iget v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    invoke-direct {p0, v3, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mergeDAGs(II)V

    .line 239
    :cond_0
    return-void

    .line 227
    :cond_1
    iput p2, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    .line 228
    const/4 v1, 0x0

    .local v1, ct:I
    :goto_0
    iget-object v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 229
    iget-object v3, p1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    .line 230
    .local v0, cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    if-eqz v3, :cond_2

    .line 231
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    iget-object v3, v3, Landroid/support/v8/renderscript/Script$KernelID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 232
    .local v2, tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    invoke-direct {p0, v2, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateDAGRecurse(Landroid/support/v8/renderscript/ScriptGroup$Node;I)V

    .line 234
    .end local v2           #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_2
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    if-eqz v3, :cond_3

    .line 235
    iget-object v3, v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    iget-object v3, v3, Landroid/support/v8/renderscript/Script$FieldID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 236
    .restart local v2       #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    invoke-direct {p0, v2, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateDAGRecurse(Landroid/support/v8/renderscript/ScriptGroup$Node;I)V

    .line 228
    .end local v2           #tn:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$FieldID;)Landroid/support/v8/renderscript/ScriptGroup$Builder;
    .locals 5
    .parameter "t"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 330
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    if-eqz v3, :cond_0

    .line 331
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    invoke-virtual {v3, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$FieldID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    .line 352
    :goto_0
    return-object p0

    .line 335
    :cond_0
    invoke-direct {p0, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v1

    .line 336
    .local v1, nf:Landroid/support/v8/renderscript/ScriptGroup$Node;
    if-nez v1, :cond_1

    .line 337
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "From script not found."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 340
    :cond_1
    iget-object v3, p3, Landroid/support/v8/renderscript/Script$FieldID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 341
    .local v2, nt:Landroid/support/v8/renderscript/ScriptGroup$Node;
    if-nez v2, :cond_2

    .line 342
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "To script not found."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 345
    :cond_2
    new-instance v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    invoke-direct {v0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;-><init>(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$FieldID;)V

    .line 346
    .local v0, cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    new-instance v4, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    invoke-direct {v4, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;-><init>(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$FieldID;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    iget-object v3, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 349
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mInputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    invoke-direct {p0, v1, v1}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateCycle(Landroid/support/v8/renderscript/ScriptGroup$Node;Landroid/support/v8/renderscript/ScriptGroup$Node;)V

    goto :goto_0
.end method

.method public addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Builder;
    .locals 5
    .parameter "t"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 370
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    if-eqz v3, :cond_0

    .line 371
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    invoke-virtual {v3, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->addConnection(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    .line 392
    :goto_0
    return-object p0

    .line 375
    :cond_0
    invoke-direct {p0, p2}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v1

    .line 376
    .local v1, nf:Landroid/support/v8/renderscript/ScriptGroup$Node;
    if-nez v1, :cond_1

    .line 377
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "From script not found."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 380
    :cond_1
    invoke-direct {p0, p3}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v2

    .line 381
    .local v2, nt:Landroid/support/v8/renderscript/ScriptGroup$Node;
    if-nez v2, :cond_2

    .line 382
    new-instance v3, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v4, "To script not found."

    invoke-direct {v3, v4}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 385
    :cond_2
    new-instance v0, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    invoke-direct {v0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;-><init>(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$KernelID;)V

    .line 386
    .local v0, cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    iget-object v3, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    new-instance v4, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    invoke-direct {v4, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;-><init>(Landroid/support/v8/renderscript/Type;Landroid/support/v8/renderscript/Script$KernelID;Landroid/support/v8/renderscript/Script$KernelID;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    iget-object v3, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    iget-object v3, v2, Landroid/support/v8/renderscript/ScriptGroup$Node;->mInputs:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    invoke-direct {p0, v1, v1}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateCycle(Landroid/support/v8/renderscript/ScriptGroup$Node;Landroid/support/v8/renderscript/ScriptGroup$Node;)V

    goto :goto_0
.end method

.method public addKernel(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Builder;
    .locals 3
    .parameter "k"

    .prologue
    .line 289
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    if-eqz v1, :cond_1

    .line 290
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    invoke-virtual {v1, p1}, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->addKernel(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    .line 312
    :cond_0
    :goto_0
    return-object p0

    .line 294
    :cond_1
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_2

    .line 295
    new-instance v1, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v2, "Kernels may not be added once connections exist."

    invoke-direct {v1, v2}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 300
    :cond_2
    invoke-direct {p0, p1}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script$KernelID;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v1

    if-nez v1, :cond_0

    .line 304
    iget v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mKernelCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mKernelCount:I

    .line 305
    iget-object v1, p1, Landroid/support/v8/renderscript/Script$KernelID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {p0, v1}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->findNode(Landroid/support/v8/renderscript/Script;)Landroid/support/v8/renderscript/ScriptGroup$Node;

    move-result-object v0

    .line 306
    .local v0, n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    if-nez v0, :cond_3

    .line 308
    new-instance v0, Landroid/support/v8/renderscript/ScriptGroup$Node;

    .end local v0           #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    iget-object v1, p1, Landroid/support/v8/renderscript/Script$KernelID;->mScript:Landroid/support/v8/renderscript/Script;

    invoke-direct {v0, v1}, Landroid/support/v8/renderscript/ScriptGroup$Node;-><init>(Landroid/support/v8/renderscript/Script;)V

    .line 309
    .restart local v0       #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    iget-object v1, p0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 311
    :cond_3
    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mKernels:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public create()Landroid/support/v8/renderscript/ScriptGroup;
    .locals 22

    .prologue
    .line 405
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    if-eqz v1, :cond_1

    .line 406
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mT:Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;

    invoke-virtual {v1}, Landroid/support/v8/renderscript/ScriptGroupThunker$Builder;->create()Landroid/support/v8/renderscript/ScriptGroupThunker;

    move-result-object v20

    .line 488
    :cond_0
    return-object v20

    .line 409
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 410
    new-instance v1, Landroid/support/v8/renderscript/RSInvalidStateException;

    const-string v21, "Empty script groups are not allowed"

    move-object/from16 v0, v21

    invoke-direct {v1, v0}, Landroid/support/v8/renderscript/RSInvalidStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 414
    :cond_2
    const/4 v8, 0x0

    .local v8, ct:I
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v8, v1, :cond_3

    .line 415
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$Node;

    const/16 v21, 0x0

    move/from16 v0, v21

    iput v0, v1, Landroid/support/v8/renderscript/ScriptGroup$Node;->dagNumber:I

    .line 414
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 417
    :cond_3
    invoke-direct/range {p0 .. p0}, Landroid/support/v8/renderscript/ScriptGroup$Builder;->validateDAG()V

    .line 419
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v16, inputs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/support/v8/renderscript/ScriptGroup$IO;>;"
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 422
    .local v19, outputs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/support/v8/renderscript/ScriptGroup$IO;>;"
    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mKernelCount:I

    new-array v2, v1, [I

    .line 423
    .local v2, kernels:[I
    const/4 v14, 0x0

    .line 424
    .local v14, idx:I
    const/4 v8, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v8, v1, :cond_b

    .line 425
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Landroid/support/v8/renderscript/ScriptGroup$Node;

    .line 426
    .local v18, n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    const/4 v9, 0x0

    .local v9, ct2:I
    :goto_2
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mKernels:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v9, v1, :cond_a

    .line 427
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mKernels:Ljava/util/ArrayList;

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/support/v8/renderscript/Script$KernelID;

    .line 428
    .local v17, kid:Landroid/support/v8/renderscript/Script$KernelID;
    add-int/lit8 v15, v14, 0x1

    .end local v14           #idx:I
    .local v15, idx:I
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/Script$KernelID;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    aput v1, v2, v14

    .line 430
    const/4 v11, 0x0

    .line 431
    .local v11, hasInput:Z
    const/4 v12, 0x0

    .line 432
    .local v12, hasOutput:Z
    const/4 v10, 0x0

    .local v10, ct3:I
    :goto_3
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mInputs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v10, v1, :cond_5

    .line 433
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mInputs:Ljava/util/ArrayList;

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    iget-object v1, v1, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    move-object/from16 v0, v17

    if-ne v1, v0, :cond_4

    .line 434
    const/4 v11, 0x1

    .line 432
    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 437
    :cond_5
    const/4 v10, 0x0

    :goto_4
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v10, v1, :cond_7

    .line 438
    move-object/from16 v0, v18

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Node;->mOutputs:Ljava/util/ArrayList;

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    iget-object v1, v1, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mFrom:Landroid/support/v8/renderscript/Script$KernelID;

    move-object/from16 v0, v17

    if-ne v1, v0, :cond_6

    .line 439
    const/4 v12, 0x1

    .line 437
    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 442
    :cond_7
    if-nez v11, :cond_8

    .line 443
    new-instance v1, Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v0, v17

    invoke-direct {v1, v0}, Landroid/support/v8/renderscript/ScriptGroup$IO;-><init>(Landroid/support/v8/renderscript/Script$KernelID;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 445
    :cond_8
    if-nez v12, :cond_9

    .line 446
    new-instance v1, Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v0, v17

    invoke-direct {v1, v0}, Landroid/support/v8/renderscript/ScriptGroup$IO;-><init>(Landroid/support/v8/renderscript/Script$KernelID;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 426
    :cond_9
    add-int/lit8 v9, v9, 0x1

    move v14, v15

    .end local v15           #idx:I
    .restart local v14       #idx:I
    goto/16 :goto_2

    .line 424
    .end local v10           #ct3:I
    .end local v11           #hasInput:Z
    .end local v12           #hasOutput:Z
    .end local v17           #kid:Landroid/support/v8/renderscript/Script$KernelID;
    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 451
    .end local v9           #ct2:I
    .end local v18           #n:Landroid/support/v8/renderscript/ScriptGroup$Node;
    :cond_b
    move-object/from16 v0, p0

    iget v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mKernelCount:I

    if-eq v14, v1, :cond_c

    .line 452
    new-instance v1, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v21, "Count mismatch, should not happen."

    move-object/from16 v0, v21

    invoke-direct {v1, v0}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 455
    :cond_c
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v3, v1, [I

    .line 456
    .local v3, src:[I
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v4, v1, [I

    .line 457
    .local v4, dstk:[I
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v5, v1, [I

    .line 458
    .local v5, dstf:[I
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v6, v1, [I

    .line 460
    .local v6, types:[I
    const/4 v8, 0x0

    :goto_5
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v8, v1, :cond_f

    .line 461
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mLines:Ljava/util/ArrayList;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;

    .line 462
    .local v7, cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mFrom:Landroid/support/v8/renderscript/Script$KernelID;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Landroid/support/v8/renderscript/Script$KernelID;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    aput v1, v3, v8

    .line 463
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    if-eqz v1, :cond_d

    .line 464
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToK:Landroid/support/v8/renderscript/Script$KernelID;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Landroid/support/v8/renderscript/Script$KernelID;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    aput v1, v4, v8

    .line 466
    :cond_d
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    if-eqz v1, :cond_e

    .line 467
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mToF:Landroid/support/v8/renderscript/Script$FieldID;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Landroid/support/v8/renderscript/Script$FieldID;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    aput v1, v5, v8

    .line 469
    :cond_e
    iget-object v1, v7, Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;->mAllocationType:Landroid/support/v8/renderscript/Type;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Landroid/support/v8/renderscript/Type;->getID(Landroid/support/v8/renderscript/RenderScript;)I

    move-result v1

    aput v1, v6, v8

    .line 460
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 472
    .end local v7           #cl:Landroid/support/v8/renderscript/ScriptGroup$ConnectLine;
    :cond_f
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    invoke-virtual/range {v1 .. v6}, Landroid/support/v8/renderscript/RenderScript;->nScriptGroupCreate([I[I[I[I[I)I

    move-result v13

    .line 473
    .local v13, id:I
    if-nez v13, :cond_10

    .line 474
    new-instance v1, Landroid/support/v8/renderscript/RSRuntimeException;

    const-string v21, "Object creation error, should not happen."

    move-object/from16 v0, v21

    invoke-direct {v1, v0}, Landroid/support/v8/renderscript/RSRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 477
    :cond_10
    new-instance v20, Landroid/support/v8/renderscript/ScriptGroup;

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup$Builder;->mRS:Landroid/support/v8/renderscript/RenderScript;

    move-object/from16 v0, v20

    invoke-direct {v0, v13, v1}, Landroid/support/v8/renderscript/ScriptGroup;-><init>(ILandroid/support/v8/renderscript/RenderScript;)V

    .line 478
    .local v20, sg:Landroid/support/v8/renderscript/ScriptGroup;
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v0, v20

    iput-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup;->mOutputs:[Landroid/support/v8/renderscript/ScriptGroup$IO;

    .line 479
    const/4 v8, 0x0

    :goto_6
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v8, v1, :cond_11

    .line 480
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup;->mOutputs:[Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$IO;

    aput-object v1, v21, v8

    .line 479
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 483
    :cond_11
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v0, v20

    iput-object v1, v0, Landroid/support/v8/renderscript/ScriptGroup;->mInputs:[Landroid/support/v8/renderscript/ScriptGroup$IO;

    .line 484
    const/4 v8, 0x0

    :goto_7
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v8, v1, :cond_0

    .line 485
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/support/v8/renderscript/ScriptGroup;->mInputs:[Landroid/support/v8/renderscript/ScriptGroup$IO;

    move-object/from16 v21, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v8/renderscript/ScriptGroup$IO;

    aput-object v1, v21, v8

    .line 484
    add-int/lit8 v8, v8, 0x1

    goto :goto_7
.end method
