.class Landroid/support/v8/renderscript/ElementThunker$BuilderThunker;
.super Ljava/lang/Object;
.source "ElementThunker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v8/renderscript/ElementThunker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BuilderThunker"
.end annotation


# instance fields
.field mN:Landroid/renderscript/Element$Builder;


# direct methods
.method public constructor <init>(Landroid/support/v8/renderscript/RenderScript;)V
    .locals 3
    .parameter "rs"

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v0, p1

    .line 237
    check-cast v0, Landroid/support/v8/renderscript/RenderScriptThunker;

    .line 238
    .local v0, rst:Landroid/support/v8/renderscript/RenderScriptThunker;
    new-instance v1, Landroid/renderscript/Element$Builder;

    iget-object v2, v0, Landroid/support/v8/renderscript/RenderScriptThunker;->mN:Landroid/renderscript/RenderScript;

    invoke-direct {v1, v2}, Landroid/renderscript/Element$Builder;-><init>(Landroid/renderscript/RenderScript;)V

    iput-object v1, p0, Landroid/support/v8/renderscript/ElementThunker$BuilderThunker;->mN:Landroid/renderscript/Element$Builder;

    .line 239
    return-void
.end method


# virtual methods
.method public add(Landroid/support/v8/renderscript/Element;Ljava/lang/String;I)V
    .locals 3
    .parameter "e"
    .parameter "name"
    .parameter "arraySize"

    .prologue
    .line 242
    move-object v0, p1

    check-cast v0, Landroid/support/v8/renderscript/ElementThunker;

    .line 243
    .local v0, et:Landroid/support/v8/renderscript/ElementThunker;
    iget-object v1, p0, Landroid/support/v8/renderscript/ElementThunker$BuilderThunker;->mN:Landroid/renderscript/Element$Builder;

    iget-object v2, v0, Landroid/support/v8/renderscript/ElementThunker;->mN:Landroid/renderscript/Element;

    invoke-virtual {v1, v2, p2, p3}, Landroid/renderscript/Element$Builder;->add(Landroid/renderscript/Element;Ljava/lang/String;I)Landroid/renderscript/Element$Builder;

    .line 244
    return-void
.end method

.method public create(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;
    .locals 2
    .parameter "rs"

    .prologue
    .line 247
    iget-object v1, p0, Landroid/support/v8/renderscript/ElementThunker$BuilderThunker;->mN:Landroid/renderscript/Element$Builder;

    invoke-virtual {v1}, Landroid/renderscript/Element$Builder;->create()Landroid/renderscript/Element;

    move-result-object v0

    .line 248
    .local v0, e:Landroid/renderscript/Element;
    new-instance v1, Landroid/support/v8/renderscript/ElementThunker;

    invoke-direct {v1, p1, v0}, Landroid/support/v8/renderscript/ElementThunker;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/renderscript/Element;)V

    return-object v1
.end method
