.class Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
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
    name = "CheckForLongPress"
.end annotation


# instance fields
.field private mOriginalAttachCount:I

.field final synthetic this$0:Lco/vine/android/dragsort/HorizontalListView;


# direct methods
.method private constructor <init>(Lco/vine/android/dragsort/HorizontalListView;)V
    .locals 0
    .parameter

    .prologue
    .line 1309
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lco/vine/android/dragsort/HorizontalListView;Lco/vine/android/dragsort/HorizontalListView$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1309
    invoke-direct {p0, p1}, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    return-void
.end method


# virtual methods
.method public rememberWindowAttachCount()V
    .locals 1

    .prologue
    .line 1313
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #calls: Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I
    invoke-static {v0}, Lco/vine/android/dragsort/HorizontalListView;->access$1300(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v0

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->mOriginalAttachCount:I

    .line 1314
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 1321
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$200(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v5

    .line 1322
    .local v5, motionPosition:I
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    iget-object v7, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I
    invoke-static {v7}, Lco/vine/android/dragsort/HorizontalListView;->access$800(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v7

    sub-int v7, v5, v7

    invoke-virtual {v6, v7}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1323
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_1

    .line 1324
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$200(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v4

    .line 1325
    .local v4, longPressPosition:I
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$500(Lco/vine/android/dragsort/HorizontalListView;)Landroid/widget/ListAdapter;

    move-result-object v6

    iget-object v7, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I
    invoke-static {v7}, Lco/vine/android/dragsort/HorizontalListView;->access$200(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v2

    .line 1327
    .local v2, longPressId:J
    const/4 v1, 0x0

    .line 1328
    .local v1, handled:Z
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->sameWindow()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z
    invoke-static {v6}, Lco/vine/android/dragsort/HorizontalListView;->access$100(Lco/vine/android/dragsort/HorizontalListView;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1329
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #calls: Lco/vine/android/dragsort/HorizontalListView;->performLongPress(Landroid/view/View;IJ)Z
    invoke-static {v6, v0, v4, v2, v3}, Lco/vine/android/dragsort/HorizontalListView;->access$1500(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;IJ)Z

    move-result v1

    .line 1331
    :cond_0
    if-eqz v1, :cond_2

    .line 1332
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v7, -0x1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v6, v7}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1333
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v6, v8}, Lco/vine/android/dragsort/HorizontalListView;->setPressed(Z)V

    .line 1334
    invoke-virtual {v0, v8}, Landroid/view/View;->setPressed(Z)V

    .line 1340
    .end local v1           #handled:Z
    .end local v2           #longPressId:J
    .end local v4           #longPressPosition:I
    :cond_1
    :goto_0
    return-void

    .line 1336
    .restart local v1       #handled:Z
    .restart local v2       #longPressId:J
    .restart local v4       #longPressPosition:I
    :cond_2
    iget-object v6, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v7, 0x2

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v6, v7}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    goto :goto_0
.end method

.method public sameWindow()Z
    .locals 2

    .prologue
    .line 1317
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #calls: Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I
    invoke-static {v0}, Lco/vine/android/dragsort/HorizontalListView;->access$1400(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v0

    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->mOriginalAttachCount:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
