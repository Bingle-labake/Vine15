.class Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;
.super Lco/vine/android/animation/SmoothAnimator;
.source "DragSortWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/DragSortWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentViewPickUpAnimator"
.end annotation


# instance fields
.field private mFloatViewStartHeight:I

.field private mFloatViewStartWidth:I

.field private mHeightDelta:I

.field private mWidthDelta:I

.field private mXOffsetRatio:F

.field private mYOffsetRatio:F

.field final synthetic this$0:Lco/vine/android/dragsort/DragSortWidget;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/DragSortWidget;FI)V
    .locals 0
    .parameter
    .parameter "smoothness"
    .parameter "duration"

    .prologue
    .line 872
    iput-object p1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    .line 873
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/animation/SmoothAnimator;-><init>(Landroid/view/View;FI)V

    .line 874
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f80

    .line 878
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartWidth:I

    .line 879
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartHeight:I

    .line 881
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartWidth:I

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewWidth:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1402(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 882
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartHeight:I

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewHeight:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1502(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 884
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mTouchX:I
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$200(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v1

    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mXOffsetFromTouch:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1602(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 885
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mTouchY:I
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1800(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v1

    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mYOffsetFromTouch:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1702(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 887
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-eqz v0, :cond_0

    .line 888
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mXOffsetFromTouch:I
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1600(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mXOffsetRatio:F

    .line 891
    :cond_0
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-eqz v0, :cond_1

    .line 892
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mYOffsetFromTouch:I
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1700(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mContentViewBounds:Landroid/graphics/Rect;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1300(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    div-float/2addr v0, v1

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mYOffsetRatio:F

    .line 895
    :cond_1
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewWidth:I
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1400(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v0

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewDefaultSize:I
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1900(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mWidthDelta:I

    .line 896
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewHeight:I
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$1500(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v0

    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewDefaultSize:I
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$1900(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mHeightDelta:I

    .line 898
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    const/4 v1, 0x1

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mPickingUpContent:Z
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2002(Lco/vine/android/dragsort/DragSortWidget;Z)Z

    .line 899
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0}, Lco/vine/android/dragsort/DragSortWidget;->invalidate()V

    .line 900
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 917
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    const/4 v1, 0x0

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mPickingUpContent:Z
    invoke-static {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2002(Lco/vine/android/dragsort/DragSortWidget;Z)Z

    .line 918
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0}, Lco/vine/android/dragsort/DragSortWidget;->invalidate()V

    .line 919
    return-void
.end method

.method public onUpdate(FF)V
    .locals 5
    .parameter "frac"
    .parameter "smoothFrac"

    .prologue
    .line 904
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartWidth:I

    int-to-float v3, v3

    iget v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mWidthDelta:I

    int-to-float v4, v4

    mul-float/2addr v4, p2

    sub-float/2addr v3, v4

    float-to-int v3, v3

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewWidth:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1402(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 905
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mFloatViewStartHeight:I

    int-to-float v3, v3

    iget v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mHeightDelta:I

    int-to-float v4, v4

    mul-float/2addr v4, p2

    sub-float/2addr v3, v4

    float-to-int v3, v3

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewHeight:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1502(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 906
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mXOffsetFromTouch:I
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$1600(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v0

    .line 907
    .local v0, oldXOffset:I
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mYOffsetFromTouch:I
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$1700(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v1

    .line 908
    .local v1, oldYOffset:I
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewWidth:I
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1400(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mXOffsetRatio:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mXOffsetFromTouch:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1602(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 909
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewHeight:I
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1500(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->mYOffsetRatio:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mYOffsetFromTouch:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$1702(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 910
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewX:I
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$700(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v3

    add-int/2addr v3, v0

    iget-object v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mXOffsetFromTouch:I
    invoke-static {v4}, Lco/vine/android/dragsort/DragSortWidget;->access$1600(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v4

    sub-int/2addr v3, v4

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewX:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$702(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 911
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewY:I
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$800(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v3

    add-int/2addr v3, v1

    iget-object v4, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mYOffsetFromTouch:I
    invoke-static {v4}, Lco/vine/android/dragsort/DragSortWidget;->access$1700(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v4

    sub-int/2addr v3, v4

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewY:I
    invoke-static {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->access$802(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 912
    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$ContentViewPickUpAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v2}, Lco/vine/android/dragsort/DragSortWidget;->invalidate()V

    .line 913
    return-void
.end method
