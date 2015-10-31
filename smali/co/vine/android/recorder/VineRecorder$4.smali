.class Lco/vine/android/recorder/VineRecorder$4;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/recorder/VineRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/recorder/VineRecorder;


# direct methods
.method constructor <init>(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter

    .prologue
    .line 225
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 228
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFocusView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFocusView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->canChangeFocus()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFocusEnabledDrawable:I
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$600(Lco/vine/android/recorder/VineRecorder;)I

    move-result v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 231
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder;->setAutoFocusing(Z)V

    .line 232
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$800(Lco/vine/android/recorder/VineRecorder;)Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 233
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$800(Lco/vine/android/recorder/VineRecorder;)Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$900(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 235
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1000(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/ToggleButton;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 236
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$1000(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/ToggleButton;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mIsGridOn:Z
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$1100(Lco/vine/android/recorder/VineRecorder;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 238
    :cond_2
    return-void

    .line 229
    :cond_3
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$4;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mFocusDisabledDrawable:I
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$700(Lco/vine/android/recorder/VineRecorder;)I

    move-result v0

    goto :goto_0
.end method
