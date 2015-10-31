.class final Lco/vine/android/recorder/RecordingAnimations$1;
.super Lco/vine/android/animation/SimpleAnimationListener;
.source "RecordingAnimations.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/recorder/RecordingAnimations;->getFocusDismissAnimation(Landroid/widget/ImageView;)Landroid/view/animation/AlphaAnimation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$focusIndicator:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/widget/ImageView;)V
    .locals 0
    .parameter

    .prologue
    .line 22
    iput-object p1, p0, Lco/vine/android/recorder/RecordingAnimations$1;->val$focusIndicator:Landroid/widget/ImageView;

    invoke-direct {p0}, Lco/vine/android/animation/SimpleAnimationListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 26
    iget-object v0, p0, Lco/vine/android/recorder/RecordingAnimations$1;->val$focusIndicator:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 27
    iget-object v0, p0, Lco/vine/android/recorder/RecordingAnimations$1;->val$focusIndicator:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 29
    :cond_0
    return-void
.end method
