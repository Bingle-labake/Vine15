.class public Lco/vine/android/widget/DragUpToDeleteContainer;
.super Landroid/widget/RelativeLayout;
.source "DragUpToDeleteContainer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;,
        Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;,
        Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;
    }
.end annotation


# static fields
.field private static final ALPHA_AT_TOP:I = 0x4d

.field private static final DESTROY_TIME:I = 0x15e

.field private static final DROP_TIME:I = 0x96

.field private static final SMOOTHNESS:F = 0.05f


# instance fields
.field private mCurY:F

.field private mDestroying:Z

.field private mDownX:F

.field private mDownY:F

.field private mDragBitmap:Landroid/graphics/Bitmap;

.field private mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

.field private mDragView:Landroid/widget/ImageView;

.field private mDragViewAlpha:F

.field private final mDragViewDestroyAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;

.field private final mDragViewDropAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;

.field private mDragViewHeight:I

.field private mDragViewWidth:I

.field private mDragViewX:I

.field private mDragViewY:I

.field private mDropping:Z

.field private mLockAlpha:Z

.field private final mTouchSlop:I

.field private mViewToPickUp:Landroid/view/View;

.field private mYOffsetFromTouch:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/widget/DragUpToDeleteContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/widget/DragUpToDeleteContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const v2, 0x3d4ccccd

    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mLockAlpha:Z

    .line 57
    new-instance v0, Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;

    const/16 v1, 0x15e

    invoke-direct {v0, p0, v2, v1}, Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;-><init>(Lco/vine/android/widget/DragUpToDeleteContainer;FI)V

    iput-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewDestroyAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;

    .line 58
    new-instance v0, Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;

    const/16 v1, 0x96

    invoke-direct {v0, p0, v2, v1}, Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;-><init>(Lco/vine/android/widget/DragUpToDeleteContainer;FI)V

    iput-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewDropAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;

    .line 59
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mTouchSlop:I

    .line 60
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/widget/DragUpToDeleteContainer;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    return v0
.end method

.method static synthetic access$002(Lco/vine/android/widget/DragUpToDeleteContainer;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    return p1
.end method

.method static synthetic access$100(Lco/vine/android/widget/DragUpToDeleteContainer;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewHeight:I

    return v0
.end method

.method static synthetic access$1000(Lco/vine/android/widget/DragUpToDeleteContainer;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewX:I

    return v0
.end method

.method static synthetic access$1002(Lco/vine/android/widget/DragUpToDeleteContainer;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewX:I

    return p1
.end method

.method static synthetic access$202(Lco/vine/android/widget/DragUpToDeleteContainer;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput-boolean p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDestroying:Z

    return p1
.end method

.method static synthetic access$302(Lco/vine/android/widget/DragUpToDeleteContainer;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    return p1
.end method

.method static synthetic access$400(Lco/vine/android/widget/DragUpToDeleteContainer;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 20
    invoke-direct {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->destroyDragView()V

    return-void
.end method

.method static synthetic access$500(Lco/vine/android/widget/DragUpToDeleteContainer;)Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    return-object v0
.end method

.method static synthetic access$602(Lco/vine/android/widget/DragUpToDeleteContainer;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    iput-boolean p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDropping:Z

    return p1
.end method

.method static synthetic access$700(Lco/vine/android/widget/DragUpToDeleteContainer;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$800(Lco/vine/android/widget/DragUpToDeleteContainer;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    return v0
.end method

.method static synthetic access$900(Lco/vine/android/widget/DragUpToDeleteContainer;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    return v0
.end method

.method private createDragView()V
    .locals 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 143
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    if-nez v2, :cond_0

    .line 168
    :goto_0
    return-void

    .line 147
    :cond_0
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    const/high16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/view/View;->setDrawingCacheQuality(I)V

    .line 148
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 149
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragBitmap:Landroid/graphics/Bitmap;

    .line 151
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    if-nez v2, :cond_1

    .line 152
    new-instance v2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    .line 154
    :cond_1
    const/high16 v2, 0x437f

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    .line 156
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    iget-object v3, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 157
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    iget-object v5, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    new-array v1, v7, [I

    .line 159
    .local v1, myPosition:[I
    new-array v0, v7, [I

    .line 160
    .local v0, itsPosition:[I
    invoke-virtual {p0, v1}, Lco/vine/android/widget/DragUpToDeleteContainer;->getLocationInWindow([I)V

    .line 161
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 162
    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    aget v3, v0, v6

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aget v3, v1, v6

    int-to-float v3, v3

    add-float/2addr v2, v3

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    .line 164
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewWidth:I

    .line 165
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewHeight:I

    .line 167
    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mCurY:F

    iget v3, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    goto :goto_0
.end method

.method private destroyDragView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 133
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    iput-object v1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragBitmap:Landroid/graphics/Bitmap;

    .line 138
    iput-object v1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    .line 140
    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .parameter "canvas"

    .prologue
    const/4 v8, 0x0

    const/4 v1, 0x0

    .line 172
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 173
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    .line 174
    iget-boolean v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDestroying:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mLockAlpha:Z

    if-nez v0, :cond_0

    .line 175
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    sub-float/2addr v0, v2

    float-to-int v7, v0

    .line 176
    .local v7, dragViewStartY:I
    const/high16 v0, 0x3f80

    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    int-to-float v2, v2

    mul-float/2addr v0, v2

    int-to-float v2, v7

    div-float/2addr v0, v2

    const/high16 v2, 0x4332

    mul-float/2addr v0, v2

    const/high16 v2, 0x429a

    add-float/2addr v0, v2

    iput v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    .line 178
    .end local v7           #dragViewStartY:I
    :cond_0
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 179
    iput v1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    .line 181
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 182
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewX:I

    int-to-float v0, v0

    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    int-to-float v2, v2

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 183
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewWidth:I

    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewHeight:I

    invoke-virtual {p1, v8, v8, v0, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 184
    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewWidth:I

    int-to-float v3, v0

    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewHeight:I

    int-to-float v4, v0

    iget v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewAlpha:F

    float-to-int v5, v0

    const/16 v6, 0x1f

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    .line 186
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    iget v1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewWidth:I

    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewHeight:I

    invoke-virtual {v0, v8, v8, v1, v2}, Landroid/widget/ImageView;->layout(IIII)V

    .line 187
    iget-object v0, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragView:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->draw(Landroid/graphics/Canvas;)V

    .line 188
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 189
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 191
    :cond_2
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 70
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 94
    :cond_0
    :goto_0
    :pswitch_0
    return v2

    .line 72
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    .line 73
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iput v3, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownX:F

    goto :goto_0

    .line 76
    :pswitch_2
    iget v3, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mTouchSlop:I

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownX:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mTouchSlop:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_0

    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mCurY:F

    .line 78
    const/4 v1, 0x1

    .line 79
    .local v1, canPickUp:Z
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    if-eqz v2, :cond_1

    .line 80
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    invoke-interface {v2}, Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;->prepareForPickup()Z

    move-result v1

    .line 82
    :cond_1
    if-eqz v1, :cond_3

    .line 83
    invoke-direct {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->createDragView()V

    .line 84
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    if-eqz v2, :cond_2

    .line 85
    iget-object v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    invoke-interface {v2}, Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;->viewPickedUp()V

    .line 87
    :cond_2
    invoke-virtual {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->invalidate()V

    .line 89
    :cond_3
    const/4 v2, 0x1

    goto :goto_0

    .line 70
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .parameter "event"

    .prologue
    const/4 v3, 0x1

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 101
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 125
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 103
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mCurY:F

    .line 104
    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mCurY:F

    iget v5, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    sub-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    .line 105
    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDownY:F

    iget v5, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mYOffsetFromTouch:F

    sub-float/2addr v4, v5

    float-to-int v2, v4

    .line 106
    .local v2, startY:I
    iget v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    if-le v4, v2, :cond_1

    .end local v2           #startY:I
    :goto_1
    iput v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    .line 107
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    if-eqz v4, :cond_0

    .line 108
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    iget v5, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    invoke-interface {v4, v5}, Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;->viewMoved(I)Z

    move-result v4

    iput-boolean v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mLockAlpha:Z

    .line 110
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->invalidate()V

    goto :goto_0

    .line 106
    .restart local v2       #startY:I
    :cond_1
    iget v2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    goto :goto_1

    .line 113
    .end local v2           #startY:I
    :pswitch_1
    const/4 v1, 0x0

    .line 114
    .local v1, delete:Z
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    if-eqz v4, :cond_2

    .line 115
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    iget v5, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewY:I

    invoke-interface {v4, v5}, Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;->viewDropped(I)Z

    move-result v1

    .line 117
    :cond_2
    if-eqz v1, :cond_3

    .line 118
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewDestroyAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;

    invoke-virtual {v4}, Lco/vine/android/widget/DragUpToDeleteContainer$DragViewDestroyAnimator;->start()V

    .line 122
    :goto_2
    invoke-virtual {p0}, Lco/vine/android/widget/DragUpToDeleteContainer;->invalidate()V

    goto :goto_0

    .line 120
    :cond_3
    iget-object v4, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewDropAnimator:Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;

    invoke-virtual {v4}, Lco/vine/android/widget/DragUpToDeleteContainer$DropAnimator;->start()V

    goto :goto_2

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setInteractionListner(Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;)V
    .locals 0
    .parameter "dragUpListener"

    .prologue
    .line 129
    iput-object p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragUpListener:Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;

    .line 130
    return-void
.end method

.method public setView(Landroid/view/View;I)V
    .locals 0
    .parameter "v"
    .parameter "leftMargin"

    .prologue
    .line 63
    iput-object p1, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mViewToPickUp:Landroid/view/View;

    .line 64
    iput p2, p0, Lco/vine/android/widget/DragUpToDeleteContainer;->mDragViewX:I

    .line 65
    return-void
.end method
