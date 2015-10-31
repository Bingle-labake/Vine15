.class Lco/vine/android/recorder/VineRecorder$7;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->animateCaptureControlsIn()V
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
    .line 549
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const-wide/16 v5, 0xfa

    const/4 v4, 0x0

    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    .line 552
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2000(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 553
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2000(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 554
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2000(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 555
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2000(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 557
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2100(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 558
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2100(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 559
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2100(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 560
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2100(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 562
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 563
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2300(Lco/vine/android/recorder/VineRecorder;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/ProgressView;->setTranslationY(F)V

    .line 564
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lco/vine/android/recorder/ProgressView;->setScaleY(F)V

    .line 565
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v0

    invoke-virtual {v0, v4}, Lco/vine/android/recorder/ProgressView;->setVisibility(I)V

    .line 566
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder$7;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;
    invoke-static {v0}, Lco/vine/android/recorder/VineRecorder;->access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 569
    :cond_2
    return-void
.end method
