.class Landroid/support/v8/renderscript/RenderScript$2;
.super Landroid/renderscript/RenderScript$RSErrorHandler;
.source "RenderScript.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v8/renderscript/RenderScript;->setErrorHandler(Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v8/renderscript/RenderScript;


# direct methods
.method constructor <init>(Landroid/support/v8/renderscript/RenderScript;)V
    .locals 0
    .parameter

    .prologue
    .line 756
    iput-object p1, p0, Landroid/support/v8/renderscript/RenderScript$2;->this$0:Landroid/support/v8/renderscript/RenderScript;

    invoke-direct {p0}, Landroid/renderscript/RenderScript$RSErrorHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 758
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript$2;->this$0:Landroid/support/v8/renderscript/RenderScript;

    iget-object v0, v0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    iget-object v1, p0, Landroid/support/v8/renderscript/RenderScript$2;->mErrorMessage:Ljava/lang/String;

    iput-object v1, v0, Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;->mErrorMessage:Ljava/lang/String;

    .line 759
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript$2;->this$0:Landroid/support/v8/renderscript/RenderScript;

    iget-object v0, v0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    iget v1, p0, Landroid/support/v8/renderscript/RenderScript$2;->mErrorNum:I

    iput v1, v0, Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;->mErrorNum:I

    .line 760
    iget-object v0, p0, Landroid/support/v8/renderscript/RenderScript$2;->this$0:Landroid/support/v8/renderscript/RenderScript;

    iget-object v0, v0, Landroid/support/v8/renderscript/RenderScript;->mErrorCallback:Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;

    invoke-virtual {v0}, Landroid/support/v8/renderscript/RenderScript$RSErrorHandler;->run()V

    .line 761
    return-void
.end method
