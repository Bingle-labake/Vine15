.class Lco/vine/android/RecordingFragment$6;
.super Lco/vine/android/animation/SimpleAnimationListener;
.source "RecordingFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/RecordingFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/RecordingFragment;


# direct methods
.method constructor <init>(Lco/vine/android/RecordingFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 308
    iput-object p1, p0, Lco/vine/android/RecordingFragment$6;->this$0:Lco/vine/android/RecordingFragment;

    invoke-direct {p0}, Lco/vine/android/animation/SimpleAnimationListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 3
    .parameter "animation"

    .prologue
    const/4 v2, 0x0

    .line 311
    iget-object v0, p0, Lco/vine/android/RecordingFragment$6;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mGrid:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$700(Lco/vine/android/RecordingFragment;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 312
    iget-object v0, p0, Lco/vine/android/RecordingFragment$6;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mGridButton:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$400(Lco/vine/android/RecordingFragment;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 313
    iget-object v0, p0, Lco/vine/android/RecordingFragment$6;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 314
    iget-object v0, p0, Lco/vine/android/RecordingFragment$6;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mRecorder:Lco/vine/android/recorder/VineRecorder;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$600(Lco/vine/android/RecordingFragment;)Lco/vine/android/recorder/VineRecorder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lco/vine/android/recorder/VineRecorder;->setGridOn(Z)V

    .line 316
    :cond_0
    return-void
.end method
