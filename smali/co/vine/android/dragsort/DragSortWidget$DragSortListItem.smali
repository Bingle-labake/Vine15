.class public Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;
.super Landroid/view/ViewGroup;
.source "DragSortWidget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/DragSortWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DragSortListItem"
.end annotation


# instance fields
.field public hasTransientState:Z

.field final synthetic this$0:Lco/vine/android/dragsort/DragSortWidget;


# direct methods
.method public constructor <init>(Lco/vine/android/dragsort/DragSortWidget;Landroid/content/Context;)V
    .locals 3
    .parameter
    .parameter "context"

    .prologue
    .line 1058
    iput-object p1, p0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    .line 1059
    invoke-direct {p0, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 1057
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->hasTransientState:Z

    .line 1060
    new-instance v0, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1063
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 1066
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1067
    .local v1, v:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 1068
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 1069
    .local v0, bd:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :cond_0

    .line 1070
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    .line 1073
    .end local v0           #bd:Landroid/graphics/drawable/BitmapDrawable;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onLayout(ZIIII)V
    .locals 5
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    const/4 v4, 0x0

    .line 1078
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mActivatedDrawable:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2400(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1079
    iget-object v1, p0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->this$0:Lco/vine/android/dragsort/DragSortWidget;

    #getter for: Lco/vine/android/dragsort/DragSortWidget;->mActivatedDrawable:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lco/vine/android/dragsort/DragSortWidget;->access$2400(Lco/vine/android/dragsort/DragSortWidget;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1081
    :cond_0
    invoke-virtual {p0, v4}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1082
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_1

    .line 1083
    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v4, v4, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 1085
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v6, 0x0

    .line 1090
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 1091
    .local v1, height:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 1093
    .local v3, width:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 1095
    .local v4, widthMode:I
    invoke-virtual {p0, v6}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1096
    .local v0, child:Landroid/view/View;
    if-nez v0, :cond_0

    .line 1097
    invoke-virtual {p0, v6, v6}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->setMeasuredDimension(II)V

    .line 1117
    :goto_0
    return-void

    .line 1101
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1103
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {p0, v0, v5, p2}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->measureChild(Landroid/view/View;II)V

    .line 1106
    :cond_1
    if-nez v4, :cond_3

    .line 1107
    invoke-virtual {p0}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 1109
    .local v2, lp:Landroid/view/ViewGroup$LayoutParams;
    iget v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-gtz v5, :cond_2

    iget-boolean v5, p0, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->hasTransientState:Z

    if-eqz v5, :cond_4

    .line 1110
    :cond_2
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1116
    .end local v2           #lp:Landroid/view/ViewGroup$LayoutParams;
    :cond_3
    :goto_1
    invoke-virtual {p0, v3, v1}, Lco/vine/android/dragsort/DragSortWidget$DragSortListItem;->setMeasuredDimension(II)V

    goto :goto_0

    .line 1112
    .restart local v2       #lp:Landroid/view/ViewGroup$LayoutParams;
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    goto :goto_1
.end method
