.class Lco/vine/android/RecordingFragment$3;
.super Ljava/lang/Object;
.source "RecordingFragment.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/RecordingFragment;
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
    .line 104
    iput-object p1, p0, Lco/vine/android/RecordingFragment$3;->this$0:Lco/vine/android/RecordingFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "v"
    .parameter "event"

    .prologue
    .line 106
    iget-object v0, p0, Lco/vine/android/RecordingFragment$3;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mFadeOut:Landroid/view/animation/Animation;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$300(Lco/vine/android/RecordingFragment;)Landroid/view/animation/Animation;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/RecordingFragment$3;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mFadeOutListener:Landroid/view/animation/Animation$AnimationListener;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$200(Lco/vine/android/RecordingFragment;)Landroid/view/animation/Animation$AnimationListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 107
    iget-object v0, p0, Lco/vine/android/RecordingFragment$3;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mNoDraftsOverlay:Landroid/view/View;
    invoke-static {v0}, Lco/vine/android/RecordingFragment;->access$100(Lco/vine/android/RecordingFragment;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/RecordingFragment$3;->this$0:Lco/vine/android/RecordingFragment;

    #getter for: Lco/vine/android/RecordingFragment;->mFadeOut:Landroid/view/animation/Animation;
    invoke-static {v1}, Lco/vine/android/RecordingFragment;->access$300(Lco/vine/android/RecordingFragment;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 108
    const/4 v0, 0x1

    return v0
.end method
