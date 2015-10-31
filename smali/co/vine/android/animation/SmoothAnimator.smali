.class public Lco/vine/android/animation/SmoothAnimator;
.super Ljava/lang/Object;
.source "SmoothAnimator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/animation/SmoothAnimator$AnimationListener;
    }
.end annotation


# instance fields
.field private mA:F

.field private mAlpha:F

.field private mB:F

.field private mC:F

.field private mCanceled:Z

.field private mD:F

.field protected mDurationF:F

.field private final mPoster:Landroid/view/View;

.field protected mStartTime:J


# direct methods
.method public constructor <init>(Landroid/view/View;FI)V
    .locals 4
    .parameter "poster"
    .parameter "smoothness"
    .parameter "duration"

    .prologue
    const/high16 v3, 0x4000

    const/high16 v2, 0x3f80

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lco/vine/android/animation/SmoothAnimator;->mPoster:Landroid/view/View;

    .line 30
    iput p2, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    .line 31
    int-to-float v0, p3

    iput v0, p0, Lco/vine/android/animation/SmoothAnimator;->mDurationF:F

    .line 32
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    mul-float/2addr v0, v3

    iget v1, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    sub-float v1, v2, v1

    mul-float/2addr v0, v1

    div-float v0, v2, v0

    iput v0, p0, Lco/vine/android/animation/SmoothAnimator;->mD:F

    iput v0, p0, Lco/vine/android/animation/SmoothAnimator;->mA:F

    .line 33
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    iget v1, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    sub-float/2addr v1, v2

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    iput v0, p0, Lco/vine/android/animation/SmoothAnimator;->mB:F

    .line 34
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    sub-float v0, v2, v0

    div-float v0, v2, v0

    iput v0, p0, Lco/vine/android/animation/SmoothAnimator;->mC:F

    .line 35
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/animation/SmoothAnimator;->mCanceled:Z

    .line 56
    return-void
.end method

.method public onCancel()V
    .locals 0

    .prologue
    .line 59
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 71
    return-void
.end method

.method public onUpdate(FF)V
    .locals 0
    .parameter "frac"
    .parameter "smoothFrac"

    .prologue
    .line 67
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    const/high16 v5, 0x3f80

    .line 75
    iget-boolean v1, p0, Lco/vine/android/animation/SmoothAnimator;->mCanceled:Z

    if-eqz v1, :cond_0

    .line 76
    invoke-virtual {p0}, Lco/vine/android/animation/SmoothAnimator;->onCancel()V

    .line 89
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lco/vine/android/animation/SmoothAnimator;->mStartTime:J

    sub-long/2addr v1, v3

    long-to-float v1, v1

    iget v2, p0, Lco/vine/android/animation/SmoothAnimator;->mDurationF:F

    div-float v0, v1, v2

    .line 82
    .local v0, fraction:F
    cmpl-float v1, v0, v5

    if-ltz v1, :cond_1

    .line 83
    invoke-virtual {p0, v5, v5}, Lco/vine/android/animation/SmoothAnimator;->onUpdate(FF)V

    .line 84
    invoke-virtual {p0}, Lco/vine/android/animation/SmoothAnimator;->onStop()V

    goto :goto_0

    .line 86
    :cond_1
    invoke-virtual {p0, v0}, Lco/vine/android/animation/SmoothAnimator;->transform(F)F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/animation/SmoothAnimator;->onUpdate(FF)V

    .line 87
    iget-object v1, p0, Lco/vine/android/animation/SmoothAnimator;->mPoster:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public start()V
    .locals 2

    .prologue
    .line 48
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/animation/SmoothAnimator;->mStartTime:J

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/animation/SmoothAnimator;->mCanceled:Z

    .line 50
    invoke-virtual {p0}, Lco/vine/android/animation/SmoothAnimator;->onStart()V

    .line 51
    iget-object v0, p0, Lco/vine/android/animation/SmoothAnimator;->mPoster:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 52
    return-void
.end method

.method public transform(F)F
    .locals 3
    .parameter "frac"

    .prologue
    const/high16 v2, 0x3f80

    .line 38
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 39
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mA:F

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    .line 43
    :goto_0
    return v0

    .line 40
    :cond_0
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mAlpha:F

    sub-float v0, v2, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 41
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mB:F

    iget v1, p0, Lco/vine/android/animation/SmoothAnimator;->mC:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    goto :goto_0

    .line 43
    :cond_1
    iget v0, p0, Lco/vine/android/animation/SmoothAnimator;->mD:F

    sub-float v1, p1, v2

    mul-float/2addr v0, v1

    sub-float v1, p1, v2

    mul-float/2addr v0, v1

    sub-float v0, v2, v0

    goto :goto_0
.end method
