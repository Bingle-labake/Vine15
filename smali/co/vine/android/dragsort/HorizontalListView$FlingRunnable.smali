.class Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;
.super Ljava/lang/Object;
.source "HorizontalListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlingRunnable"
.end annotation


# instance fields
.field private mLastFlingX:I

.field private mScreenWidth:I

.field private final mScroller:Landroid/widget/Scroller;

.field final synthetic this$0:Lco/vine/android/dragsort/HorizontalListView;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/HorizontalListView;)V
    .locals 2
    .parameter

    .prologue
    .line 1413
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1414
    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p1}, Lco/vine/android/dragsort/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1415
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 1445
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v6}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v0

    .line 1446
    .local v0, childCount:I
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$400(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v6

    if-eqz v6, :cond_0

    if-nez v0, :cond_1

    .line 1447
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->stop()V

    .line 1486
    :goto_0
    return-void

    .line 1451
    :cond_1
    iget-object v4, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    .line 1452
    .local v4, scroller:Landroid/widget/Scroller;
    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v2

    .line 1453
    .local v2, more:Z
    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrX()I

    move-result v5

    .line 1457
    .local v5, x:I
    iget v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mLastFlingX:I

    sub-int v1, v6, v5

    .line 1460
    .local v1, delta:I
    if-lez v1, :cond_2

    .line 1461
    iget v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScreenWidth:I

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1466
    :goto_1
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v6, v1, v1}, Lco/vine/android/dragsort/HorizontalListView;->scroll(II)Z

    move-result v3

    .line 1468
    .local v3, scrolledWithinBounds:Z
    if-eqz v2, :cond_5

    .line 1469
    if-eqz v3, :cond_3

    .line 1470
    iput v5, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mLastFlingX:I

    .line 1471
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v6, p0}, Lco/vine/android/dragsort/HorizontalListView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1463
    .end local v3           #scrolledWithinBounds:Z
    :cond_2
    iget v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScreenWidth:I

    neg-int v6, v6

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_1

    .line 1475
    .restart local v3       #scrolledWithinBounds:Z
    :cond_3
    if-lez v1, :cond_4

    .line 1476
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #calls: Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$1800(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v1

    .line 1480
    :goto_2
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v6, v1, v1}, Lco/vine/android/dragsort/HorizontalListView;->scroll(II)Z

    .line 1481
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->stop()V

    goto :goto_0

    .line 1478
    :cond_4
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #calls: Lco/vine/android/dragsort/HorizontalListView;->getOverflowRight()I
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$1900(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v6

    neg-int v1, v6

    goto :goto_2

    .line 1484
    :cond_5
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->stop()V

    goto :goto_0
.end method

.method public start(I)V
    .locals 9
    .parameter "initialVelocity"

    .prologue
    const v6, 0x7fffffff

    const/4 v2, 0x0

    .line 1418
    if-nez p1, :cond_0

    .line 1430
    :goto_0
    return-void

    .line 1419
    :cond_0
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v3, 0x4

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v0, v3}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1420
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v0

    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v0, v3

    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v0, v3

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScreenWidth:I

    .line 1423
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/HorizontalListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1425
    if-gez p1, :cond_1

    move v1, v6

    .line 1426
    .local v1, initialX:I
    :goto_1
    iput v1, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mLastFlingX:I

    .line 1427
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    move v3, p1

    move v4, v2

    move v5, v2

    move v7, v2

    move v8, v6

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 1429
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/HorizontalListView;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .end local v1           #initialX:I
    :cond_1
    move v1, v2

    .line 1425
    goto :goto_1
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 1433
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v0}, Lco/vine/android/dragsort/HorizontalListView;->access$000(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 1434
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v1, -0x1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1436
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/HorizontalListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1437
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1438
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    .line 1439
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 1442
    :cond_0
    return-void
.end method
