.class public Lco/vine/android/recorder/RsYuv;
.super Ljava/lang/Object;
.source "RsYuv.java"


# instance fields
.field private mAllocationIn:Landroid/support/v8/renderscript/Allocation;

.field private mAllocationOut:Landroid/support/v8/renderscript/Allocation;

.field private mYuv:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;


# direct methods
.method public constructor <init>(Landroid/support/v8/renderscript/RenderScript;II)V
    .locals 5
    .parameter "rs"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {p1}, Landroid/support/v8/renderscript/Element;->RGBA_8888(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->create(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/RsYuv;->mYuv:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;

    .line 33
    new-instance v0, Landroid/support/v8/renderscript/Type$Builder;

    invoke-static {p1}, Landroid/support/v8/renderscript/Element;->RGBA_8888(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/support/v8/renderscript/Type$Builder;-><init>(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;)V

    .line 34
    .local v0, tb:Landroid/support/v8/renderscript/Type$Builder;
    invoke-virtual {v0, p2}, Landroid/support/v8/renderscript/Type$Builder;->setX(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 35
    invoke-virtual {v0, p3}, Landroid/support/v8/renderscript/Type$Builder;->setY(I)Landroid/support/v8/renderscript/Type$Builder;

    .line 37
    invoke-virtual {v0}, Landroid/support/v8/renderscript/Type$Builder;->create()Landroid/support/v8/renderscript/Type;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/support/v8/renderscript/Allocation;->createTyped(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Type;)Landroid/support/v8/renderscript/Allocation;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/RsYuv;->mAllocationOut:Landroid/support/v8/renderscript/Allocation;

    .line 38
    invoke-static {p1}, Landroid/support/v8/renderscript/Element;->U8(Landroid/support/v8/renderscript/RenderScript;)Landroid/support/v8/renderscript/Element;

    move-result-object v1

    mul-int v2, p3, p2

    div-int/lit8 v3, p3, 0x2

    div-int/lit8 v4, p2, 0x2

    mul-int/2addr v3, v4

    mul-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    invoke-static {p1, v1, v2}, Landroid/support/v8/renderscript/Allocation;->createSized(Landroid/support/v8/renderscript/RenderScript;Landroid/support/v8/renderscript/Element;I)Landroid/support/v8/renderscript/Allocation;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/RsYuv;->mAllocationIn:Landroid/support/v8/renderscript/Allocation;

    .line 40
    iget-object v1, p0, Lco/vine/android/recorder/RsYuv;->mYuv:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;

    iget-object v2, p0, Lco/vine/android/recorder/RsYuv;->mAllocationIn:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {v1, v2}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->setInput(Landroid/support/v8/renderscript/Allocation;)V

    .line 41
    return-void
.end method


# virtual methods
.method public execute([BLandroid/graphics/Bitmap;)V
    .locals 2
    .parameter "yuv"
    .parameter "b"

    .prologue
    .line 44
    iget-object v0, p0, Lco/vine/android/recorder/RsYuv;->mAllocationIn:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {v0, p1}, Landroid/support/v8/renderscript/Allocation;->copyFrom([B)V

    .line 45
    iget-object v0, p0, Lco/vine/android/recorder/RsYuv;->mYuv:Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;

    iget-object v1, p0, Lco/vine/android/recorder/RsYuv;->mAllocationOut:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {v0, v1}, Landroid/support/v8/renderscript/ScriptIntrinsicYuvToRGB;->forEach(Landroid/support/v8/renderscript/Allocation;)V

    .line 46
    iget-object v0, p0, Lco/vine/android/recorder/RsYuv;->mAllocationOut:Landroid/support/v8/renderscript/Allocation;

    invoke-virtual {v0, p2}, Landroid/support/v8/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V

    .line 47
    return-void
.end method
