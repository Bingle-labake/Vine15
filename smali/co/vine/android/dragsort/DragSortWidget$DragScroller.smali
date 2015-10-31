.class public Lco/vine/android/dragsort/DragSortWidget$DragScroller;
.super Ljava/lang/Object;
.source "DragSortWidget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/DragSortWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DragScroller"
.end annotation


# static fields
.field public static final LEFT:I = 0x0

.field public static final RIGHT:I = 0x1


# instance fields
.field private dt:F

.field private dx:I

.field private mAbort:Z

.field private mCurrTime:J

.field private mPrevTime:J

.field private mScrollSpeed:F

.field private mScrolling:Z

.field private scrollDir:I

.field private tStart:J

.field final synthetic this$0:Lco/vine/android/dragsort/DragSortWidget;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/DragSortWidget;)V
    .locals 1
    .parameter

    .prologue
    .line 681
    iput-object p1, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 696
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrollSpeed:F

    .line 698
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v9, 0x0

    .line 722
    iget-boolean v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mAbort:Z

    if-eqz v7, :cond_0

    .line 723
    iput-boolean v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    .line 783
    :goto_0
    return-void

    .line 727
    :cond_0
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewListPosition:I
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v5

    .line 729
    .local v5, oldHoverPosition:I
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    invoke-virtual {v7}, Lco/vine/android/dragsort/HorizontalListView;->getFirstVisiblePosition()I

    move-result v2

    .line 730
    .local v2, first:I
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    invoke-virtual {v7}, Lco/vine/android/dragsort/HorizontalListView;->getLastVisiblePosition()I

    move-result v3

    .line 731
    .local v3, last:I
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    invoke-virtual {v7}, Lco/vine/android/dragsort/HorizontalListView;->getCount()I

    move-result v0

    .line 732
    .local v0, count:I
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    invoke-virtual {v7}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v4

    .line 734
    .local v4, listWidth:I
    iget v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->scrollDir:I

    if-nez v7, :cond_5

    .line 735
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    invoke-virtual {v7, v9}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 736
    .local v6, v:Landroid/view/View;
    if-nez v6, :cond_1

    .line 737
    iput-boolean v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    goto :goto_0

    .line 740
    :cond_1
    if-nez v2, :cond_2

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v7

    if-nez v7, :cond_2

    .line 741
    iput-boolean v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    goto :goto_0

    .line 745
    :cond_2
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mTouchX:I
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$200(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v7

    iget-object v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v8}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v8

    invoke-virtual {v8}, Lco/vine/android/dragsort/HorizontalListView;->getLeft()I

    move-result v8

    sub-int v1, v7, v8

    .line 746
    .local v1, denominator:I
    if-gez v1, :cond_3

    .line 747
    const/4 v1, 0x0

    .line 749
    :cond_3
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mMaxScrollSpeed:F
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$300(Lco/vine/android/dragsort/DragSortWidget;)F

    move-result v7

    add-int/lit8 v8, v1, 0x1

    int-to-float v8, v8

    div-float/2addr v7, v8

    iput v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrollSpeed:F

    .line 768
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    iput-wide v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mCurrTime:J

    .line 769
    iget-wide v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mCurrTime:J

    iget-wide v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mPrevTime:J

    sub-long/2addr v7, v9

    long-to-float v7, v7

    iput v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->dt:F

    .line 771
    iget v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrollSpeed:F

    iget v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->dt:F

    mul-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    iput v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->dx:I

    .line 773
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    iget v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->dx:I

    iget v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->dx:I

    invoke-virtual {v7, v8, v9}, Lco/vine/android/dragsort/HorizontalListView;->scroll(II)Z

    .line 775
    iget-wide v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mCurrTime:J

    iput-wide v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mPrevTime:J

    .line 776
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #calls: Lco/vine/android/dragsort/DragSortWidget;->getClosestItemPosition()I
    invoke-static {v8}, Lco/vine/android/dragsort/DragSortWidget;->access$400(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v8

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewListPosition:I
    invoke-static {v7, v8}, Lco/vine/android/dragsort/DragSortWidget;->access$102(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 777
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewListPosition:I
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_4

    .line 778
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewListPosition:I
    invoke-static {v7, v5}, Lco/vine/android/dragsort/DragSortWidget;->access$102(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 780
    :cond_4
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mFloatViewListPosition:I
    invoke-static {v8}, Lco/vine/android/dragsort/DragSortWidget;->access$100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v8

    #calls: Lco/vine/android/dragsort/DragSortWidget;->dragFloatView(II)V
    invoke-static {v7, v5, v8}, Lco/vine/android/dragsort/DragSortWidget;->access$500(Lco/vine/android/dragsort/DragSortWidget;II)V

    .line 782
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v7, p0}, Lco/vine/android/dragsort/DragSortWidget;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 751
    .end local v1           #denominator:I
    .end local v6           #v:Landroid/view/View;
    :cond_5
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v7

    sub-int v8, v3, v2

    invoke-virtual {v7, v8}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 752
    .restart local v6       #v:Landroid/view/View;
    if-nez v6, :cond_6

    .line 753
    iput-boolean v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    goto/16 :goto_0

    .line 756
    :cond_6
    add-int/lit8 v7, v0, -0x1

    if-ne v3, v7, :cond_7

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v7

    if-gt v7, v4, :cond_7

    .line 757
    iput-boolean v9, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    goto/16 :goto_0

    .line 762
    :cond_7
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mTouchX:I
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$200(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v7

    sub-int v7, v4, v7

    iget-object v8, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v8}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v8

    invoke-virtual {v8}, Lco/vine/android/dragsort/HorizontalListView;->getLeft()I

    move-result v8

    add-int v1, v7, v8

    .line 763
    .restart local v1       #denominator:I
    if-gez v1, :cond_8

    .line 764
    const/4 v1, 0x0

    .line 766
    :cond_8
    iget-object v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mMaxScrollSpeed:F
    invoke-static {v7}, Lco/vine/android/dragsort/DragSortWidget;->access$300(Lco/vine/android/dragsort/DragSortWidget;)F

    move-result v7

    neg-float v7, v7

    add-int/lit8 v8, v1, 0x1

    int-to-float v8, v8

    div-float/2addr v7, v8

    iput v7, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrollSpeed:F

    goto/16 :goto_1
.end method

.method public startScrolling(I)V
    .locals 2
    .parameter "dir"

    .prologue
    .line 701
    iget-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    if-nez v0, :cond_0

    .line 702
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mAbort:Z

    .line 703
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    .line 704
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->tStart:J

    .line 705
    iget-wide v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->tStart:J

    iput-wide v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mPrevTime:J

    .line 706
    iput p1, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->scrollDir:I

    .line 707
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/DragSortWidget;->post(Ljava/lang/Runnable;)Z

    .line 709
    :cond_0
    return-void
.end method

.method public stopScrolling(Z)V
    .locals 1
    .parameter "now"

    .prologue
    .line 712
    if-eqz p1, :cond_0

    .line 713
    iget-object v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v0}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v0

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/HorizontalListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 714
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mScrolling:Z

    .line 718
    :goto_0
    return-void

    .line 716
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragScroller;->mAbort:Z

    goto :goto_0
.end method
