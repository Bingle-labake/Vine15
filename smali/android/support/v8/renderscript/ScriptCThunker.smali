.class Landroid/support/v8/renderscript/ScriptCThunker;
.super Landroid/renderscript/ScriptC;
.source "ScriptCThunker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ScriptC"


# direct methods
.method protected constructor <init>(Landroid/support/v8/renderscript/RenderScriptThunker;Landroid/content/res/Resources;I)V
    .locals 1
    .parameter "rs"
    .parameter "resources"
    .parameter "resourceID"

    .prologue
    .line 39
    iget-object v0, p1, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-direct {p0, v0, p2, p3}, Landroid/renderscript/ScriptC;-><init>(Landroid/renderscript/RenderScript;Landroid/content/res/Resources;I)V

    .line 40
    return-void
.end method


# virtual methods
.method thunkBindAllocation(Landroid/support/v8/renderscript/Allocation;I)V
    .locals 1
    .parameter "va"
    .parameter "slot"

    .prologue
    .line 62
    const/4 v0, 0x0

    .line 63
    .local v0, nva:Landroid/renderscript/Allocation;
    if-eqz p1, :cond_0

    .line 64
    check-cast p1, Landroid/support/v8/renderscript/AllocationThunker;

    .end local p1
    iget-object v0, p1, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 66
    :cond_0
    invoke-virtual {p0, v0, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->bindAllocation(Landroid/renderscript/Allocation;I)V

    .line 67
    return-void
.end method

.method thunkCreateFieldID(ILandroid/support/v8/renderscript/Element;)Landroid/renderscript/Script$FieldID;
    .locals 2
    .parameter "slot"
    .parameter "e"

    .prologue
    .line 157
    move-object v0, p2

    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 158
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    invoke-virtual {v0}, Landroid/support/v8/renderscript/ElementThunker;->getNObj()Landroid/renderscript/Element;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Landroid/support/v8/renderscript/ScriptCThunker;->createFieldID(ILandroid/renderscript/Element;)Landroid/renderscript/Script$FieldID;

    move-result-object v1

    return-object v1
.end method

.method thunkCreateKernelID(IILandroid/support/v8/renderscript/Element;Landroid/support/v8/renderscript/Element;)Landroid/renderscript/Script$KernelID;
    .locals 3
    .parameter "slot"
    .parameter "sig"
    .parameter "ein"
    .parameter "eout"

    .prologue
    .line 45
    const/4 v0, 0x0

    .line 46
    .local v0, nein:Landroid/renderscript/Element;
    const/4 v1, 0x0

    .line 47
    .local v1, neout:Landroid/renderscript/Element;
    if-eqz p3, :cond_0

    .line 48
    check-cast p3, Landroid/support/v8/renderscript/ElementThunker;

    .end local p3
    iget-object v0, p3, Landroid/support/v8/renderscript/ElementThunker;->mN:Landroid/renderscript/Element;

    .line 50
    :cond_0
    if-eqz p4, :cond_1

    .line 51
    check-cast p4, Landroid/support/v8/renderscript/ElementThunker;

    .end local p4
    iget-object v1, p4, Landroid/support/v8/renderscript/ElementThunker;->mN:Landroid/renderscript/Element;

    .line 53
    :cond_1
    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/support/v8/renderscript/ScriptCThunker;->createKernelID(IILandroid/renderscript/Element;Landroid/renderscript/Element;)Landroid/renderscript/Script$KernelID;

    move-result-object v2

    return-object v2
.end method

.method thunkForEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;)V
    .locals 4
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "v"

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 81
    .local v1, nin:Landroid/renderscript/Allocation;
    const/4 v2, 0x0

    .line 82
    .local v2, nout:Landroid/renderscript/Allocation;
    const/4 v0, 0x0

    .line 83
    .local v0, nfp:Landroid/renderscript/FieldPacker;
    if-eqz p2, :cond_0

    .line 84
    check-cast p2, Landroid/support/v8/renderscript/AllocationThunker;

    .end local p2
    iget-object v1, p2, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 86
    :cond_0
    if-eqz p3, :cond_1

    .line 87
    check-cast p3, Landroid/support/v8/renderscript/AllocationThunker;

    .end local p3
    iget-object v2, p3, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 89
    :cond_1
    if-eqz p4, :cond_2

    .line 90
    new-instance v0, Landroid/renderscript/FieldPacker;

    .end local v0           #nfp:Landroid/renderscript/FieldPacker;
    invoke-virtual {p4}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .line 92
    .restart local v0       #nfp:Landroid/renderscript/FieldPacker;
    :cond_2
    invoke-virtual {p0, p1, v1, v2, v0}, Landroid/support/v8/renderscript/ScriptCThunker;->forEach(ILandroid/renderscript/Allocation;Landroid/renderscript/Allocation;Landroid/renderscript/FieldPacker;)V

    .line 93
    return-void
.end method

.method thunkForEach(ILandroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/Allocation;Landroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Script$LaunchOptions;)V
    .locals 6
    .parameter "slot"
    .parameter "ain"
    .parameter "aout"
    .parameter "v"
    .parameter "sc"

    .prologue
    .line 97
    const/4 v5, 0x0

    .line 98
    .local v5, lo:Landroid/renderscript/Script$LaunchOptions;
    if-eqz p5, :cond_2

    .line 99
    new-instance v5, Landroid/renderscript/Script$LaunchOptions;

    .end local v5           #lo:Landroid/renderscript/Script$LaunchOptions;
    invoke-direct {v5}, Landroid/renderscript/Script$LaunchOptions;-><init>()V

    .line 100
    .restart local v5       #lo:Landroid/renderscript/Script$LaunchOptions;
    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getXEnd()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getXStart()I

    move-result v0

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getXEnd()I

    move-result v1

    invoke-virtual {v5, v0, v1}, Landroid/renderscript/Script$LaunchOptions;->setX(II)Landroid/renderscript/Script$LaunchOptions;

    .line 101
    :cond_0
    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getYEnd()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getYStart()I

    move-result v0

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getYEnd()I

    move-result v1

    invoke-virtual {v5, v0, v1}, Landroid/renderscript/Script$LaunchOptions;->setY(II)Landroid/renderscript/Script$LaunchOptions;

    .line 102
    :cond_1
    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getZEnd()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getZStart()I

    move-result v0

    invoke-virtual {p5}, Landroid/support/v8/renderscript/Script$LaunchOptions;->getZEnd()I

    move-result v1

    invoke-virtual {v5, v0, v1}, Landroid/renderscript/Script$LaunchOptions;->setZ(II)Landroid/renderscript/Script$LaunchOptions;

    .line 105
    :cond_2
    const/4 v2, 0x0

    .line 106
    .local v2, nin:Landroid/renderscript/Allocation;
    const/4 v3, 0x0

    .line 107
    .local v3, nout:Landroid/renderscript/Allocation;
    const/4 v4, 0x0

    .line 108
    .local v4, nfp:Landroid/renderscript/FieldPacker;
    if-eqz p2, :cond_3

    .line 109
    check-cast p2, Landroid/support/v8/renderscript/AllocationThunker;

    .end local p2
    iget-object v2, p2, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 111
    :cond_3
    if-eqz p3, :cond_4

    .line 112
    check-cast p3, Landroid/support/v8/renderscript/AllocationThunker;

    .end local p3
    iget-object v3, p3, Landroid/support/v8/renderscript/AllocationThunker;->mN:Landroid/renderscript/Allocation;

    .line 114
    :cond_4
    if-eqz p4, :cond_5

    .line 115
    new-instance v4, Landroid/renderscript/FieldPacker;

    .end local v4           #nfp:Landroid/renderscript/FieldPacker;
    invoke-virtual {p4}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v0

    invoke-direct {v4, v0}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .restart local v4       #nfp:Landroid/renderscript/FieldPacker;
    :cond_5
    move-object v0, p0

    move v1, p1

    .line 117
    invoke-virtual/range {v0 .. v5}, Landroid/support/v8/renderscript/ScriptCThunker;->forEach(ILandroid/renderscript/Allocation;Landroid/renderscript/Allocation;Landroid/renderscript/FieldPacker;Landroid/renderscript/Script$LaunchOptions;)V

    .line 118
    return-void
.end method

.method thunkInvoke(I)V
    .locals 0
    .parameter "slot"

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Landroid/support/v8/renderscript/ScriptCThunker;->invoke(I)V

    .line 59
    return-void
.end method

.method thunkInvoke(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 2
    .parameter "slot"
    .parameter "v"

    .prologue
    .line 74
    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .line 76
    .local v0, nfp:Landroid/renderscript/FieldPacker;
    invoke-virtual {p0, p1, v0}, Landroid/support/v8/renderscript/ScriptCThunker;->invoke(ILandroid/renderscript/FieldPacker;)V

    .line 77
    return-void
.end method

.method thunkSetTimeZone(Ljava/lang/String;)V
    .locals 0
    .parameter "timeZone"

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Landroid/support/v8/renderscript/ScriptCThunker;->setTimeZone(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method thunkSetVar(ID)V
    .locals 0
    .parameter "index"
    .parameter "v"

    .prologue
    .line 124
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(ID)V

    .line 125
    return-void
.end method

.method thunkSetVar(IF)V
    .locals 0
    .parameter "index"
    .parameter "v"

    .prologue
    .line 121
    invoke-virtual {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(IF)V

    .line 122
    return-void
.end method

.method thunkSetVar(II)V
    .locals 0
    .parameter "index"
    .parameter "v"

    .prologue
    .line 127
    invoke-virtual {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(II)V

    .line 128
    return-void
.end method

.method thunkSetVar(IJ)V
    .locals 0
    .parameter "index"
    .parameter "v"

    .prologue
    .line 130
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(IJ)V

    .line 131
    return-void
.end method

.method thunkSetVar(ILandroid/support/v8/renderscript/BaseObj;)V
    .locals 1
    .parameter "index"
    .parameter "o"

    .prologue
    .line 137
    if-nez p2, :cond_0

    .line 138
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(II)V

    .line 142
    :goto_0
    return-void

    .line 141
    :cond_0
    invoke-virtual {p2}, Landroid/support/v8/renderscript/BaseObj;->getNObj()Landroid/renderscript/BaseObj;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(ILandroid/renderscript/BaseObj;)V

    goto :goto_0
.end method

.method thunkSetVar(ILandroid/support/v8/renderscript/FieldPacker;)V
    .locals 2
    .parameter "index"
    .parameter "v"

    .prologue
    .line 144
    new-instance v0, Landroid/renderscript/FieldPacker;

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .line 146
    .local v0, nfp:Landroid/renderscript/FieldPacker;
    invoke-virtual {p0, p1, v0}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(ILandroid/renderscript/FieldPacker;)V

    .line 147
    return-void
.end method

.method thunkSetVar(ILandroid/support/v8/renderscript/FieldPacker;Landroid/support/v8/renderscript/Element;[I)V
    .locals 3
    .parameter "index"
    .parameter "v"
    .parameter "e"
    .parameter "dims"

    .prologue
    .line 150
    new-instance v1, Landroid/renderscript/FieldPacker;

    invoke-virtual {p2}, Landroid/support/v8/renderscript/FieldPacker;->getData()[B

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/renderscript/FieldPacker;-><init>([B)V

    .local v1, nfp:Landroid/renderscript/FieldPacker;
    move-object v0, p3

    .line 152
    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 153
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    iget-object v2, v0, Landroid/support/v8/renderscript/ElementThunker;->mN:Landroid/renderscript/Element;

    invoke-virtual {p0, p1, v1, v2, p4}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(ILandroid/renderscript/FieldPacker;Landroid/renderscript/Element;[I)V

    .line 154
    return-void
.end method

.method thunkSetVar(IZ)V
    .locals 0
    .parameter "index"
    .parameter "v"

    .prologue
    .line 133
    invoke-virtual {p0, p1, p2}, Landroid/support/v8/renderscript/ScriptCThunker;->setVar(IZ)V

    .line 134
    return-void
.end method
