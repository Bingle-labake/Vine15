.class Lco/vine/android/AbstractRecordingActivity$7;
.super Lco/vine/android/animation/SimpleAnimationListener;
.source "AbstractRecordingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/AbstractRecordingActivity;->hideDrafts(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/AbstractRecordingActivity;

.field final synthetic val$animate:Z


# direct methods
.method constructor <init>(Lco/vine/android/AbstractRecordingActivity;Z)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 776
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity$7;->this$0:Lco/vine/android/AbstractRecordingActivity;

    iput-boolean p2, p0, Lco/vine/android/AbstractRecordingActivity$7;->val$animate:Z

    invoke-direct {p0}, Lco/vine/android/animation/SimpleAnimationListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1
    .parameter "animation"

    .prologue
    .line 789
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$7;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #calls: Lco/vine/android/AbstractRecordingActivity;->hideDraftsInternal()V
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$700(Lco/vine/android/AbstractRecordingActivity;)V

    .line 790
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 2
    .parameter "animation"

    .prologue
    const/16 v1, 0x8

    .line 779
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity$7;->val$animate:Z

    if-eqz v0, :cond_0

    .line 780
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$7;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mDraftMaskParent:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$500(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 785
    :goto_0
    return-void

    .line 782
    :cond_0
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$7;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mDraftMaskParent:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$500(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 783
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity$7;->this$0:Lco/vine/android/AbstractRecordingActivity;

    #getter for: Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/AbstractRecordingActivity;->access$600(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
