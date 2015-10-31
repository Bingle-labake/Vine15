.class Lco/vine/android/recorder/VineRecorder$8;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/VineRecorder;->animateEditModeControlsIn()V
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
    .line 622
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const-wide/16 v6, 0xfa

    const/4 v5, 0x0

    const/high16 v4, 0x3f80

    const/4 v3, 0x0

    .line 625
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2400(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 626
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2400(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 627
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2400(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 628
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2400(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 630
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 631
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 632
    .local v0, thumbnailListHeight:I
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    neg-int v2, v0

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 633
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleY(F)V

    .line 634
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 635
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder$8;->this$0:Lco/vine/android/recorder/VineRecorder;

    #getter for: Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;
    invoke-static {v1}, Lco/vine/android/recorder/VineRecorder;->access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 638
    .end local v0           #thumbnailListHeight:I
    :cond_1
    return-void
.end method
