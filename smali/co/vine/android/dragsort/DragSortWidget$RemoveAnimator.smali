.class Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;
.super Lco/vine/android/animation/SmoothAnimator;
.source "DragSortWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/DragSortWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoveAnimator"
.end annotation


# instance fields
.field private mWidth:I

.field final synthetic this$0:Lco/vine/android/dragsort/DragSortWidget;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/DragSortWidget;FI)V
    .locals 0
    .parameter
    .parameter "smoothness"
    .parameter "duration"

    .prologue
    .line 925
    iput-object p1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    .line 926
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/animation/SmoothAnimator;-><init>(Landroid/view/View;FI)V

    .line 927
    return-void
.end method

.method static synthetic access$2700(Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 922
    iget v0, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mWidth:I

    return v0
.end method


# virtual methods
.method public onStart()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 931
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mSelectionPosition:I
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$2200(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v2

    #setter for: Lco/vine/android/dragsort/DragSortWidget;->mRemovePosition:I
    invoke-static {v1, v2}, Lco/vine/android/dragsort/DragSortWidget;->access$2102(Lco/vine/android/dragsort/DragSortWidget;I)I

    .line 932
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mRemovePosition:I
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$2100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v2

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->getFirstVisiblePosition()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 934
    .local v0, toMeasure:Landroid/view/View;
    if-eqz v0, :cond_1

    .line 935
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    iput v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mWidth:I

    .line 936
    if-eqz v0, :cond_0

    .line 937
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget v2, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mDurationF:F

    float-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 939
    :cond_0
    check-cast v0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;

    .end local v0           #toMeasure:Landroid/view/View;
    iput-boolean v4, v0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->hasTransientState:Z

    .line 946
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iput-boolean v4, v1, Lco/vine/android/dragsort/DragSortWidget;->mRemoving:Z

    .line 947
    :goto_0
    return-void

    .line 942
    .restart local v0       #toMeasure:Landroid/view/View;
    :cond_1
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #calls: Lco/vine/android/dragsort/DragSortWidget;->finishRemoveSelection()V
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2300(Lco/vine/android/dragsort/DragSortWidget;)V

    .line 943
    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->cancel()V

    goto :goto_0
.end method

.method public onStop()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 969
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mRemovePosition:I
    invoke-static {v2}, Lco/vine/android/dragsort/DragSortWidget;->access$2100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v2

    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->getFirstVisiblePosition()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 970
    .local v0, v:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 971
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 972
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 973
    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 974
    check-cast v0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;

    .end local v0           #v:Landroid/view/View;
    iput-boolean v4, v0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->hasTransientState:Z

    .line 976
    :cond_0
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #calls: Lco/vine/android/dragsort/DragSortWidget;->finishRemoveSelection()V
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2300(Lco/vine/android/dragsort/DragSortWidget;)V

    .line 977
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    iput-boolean v4, v1, Lco/vine/android/dragsort/DragSortWidget;->mRemoving:Z

    .line 978
    return-void
.end method

.method public onUpdate(FF)V
    .locals 6
    .parameter "frac"
    .parameter "smoothFrac"

    .prologue
    .line 951
    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mRemovePosition:I
    invoke-static {v4}, Lco/vine/android/dragsort/DragSortWidget;->access$2100(Lco/vine/android/dragsort/DragSortWidget;)I

    move-result v4

    iget-object v5, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v5}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/dragsort/HorizontalListView;->getFirstVisiblePosition()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 952
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 953
    const/high16 v3, 0x3f80

    sub-float v0, v3, p2

    .line 954
    .local v0, f:F
    iget v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mWidth:I

    int-to-float v3, v3

    mul-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iput v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mWidth:I

    .line 955
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 956
    .local v1, lp:Landroid/view/ViewGroup$LayoutParams;
    iget v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->mWidth:I

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 957
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 958
    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->forceLayout()V

    .line 964
    .end local v0           #f:F
    .end local v1           #lp:Landroid/view/ViewGroup$LayoutParams;
    :goto_0
    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mListView:Lco/vine/android/dragsort/HorizontalListView;
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$000(Lco/vine/android/dragsort/DragSortWidget;)Lco/vine/android/dragsort/HorizontalListView;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 965
    return-void

    .line 960
    :cond_0
    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #calls: Lco/vine/android/dragsort/DragSortWidget;->finishRemoveSelection()V
    invoke-static {v3}, Lco/vine/android/dragsort/DragSortWidget;->access$2300(Lco/vine/android/dragsort/DragSortWidget;)V

    .line 961
    iget-object v3, p0, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lco/vine/android/dragsort/DragSortWidget;->mRemoving:Z

    .line 962
    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$RemoveAnimator;->cancel()V

    goto :goto_0
.end method
