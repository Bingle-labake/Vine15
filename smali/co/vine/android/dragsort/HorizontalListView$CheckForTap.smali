.class final Lco/vine/android/dragsort/HorizontalListView$CheckForTap;
.super Ljava/lang/Object;
.source "HorizontalListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/dragsort/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CheckForTap"
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/dragsort/HorizontalListView;


# direct methods
.method constructor <init>(Lco/vine/android/dragsort/HorizontalListView;)V
    .locals 0
    .parameter

    .prologue
    .line 1260
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 1262
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$000(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v3

    if-nez v3, :cond_3

    .line 1263
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v3, v6}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1264
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    iget-object v4, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I
    invoke-static {v4}, Lco/vine/android/dragsort/HorizontalListView;->access$200(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v4

    iget-object v5, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I
    invoke-static {v5}, Lco/vine/android/dragsort/HorizontalListView;->access$800(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v4}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1265
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->hasFocusable()Z

    move-result v3

    if-nez v3, :cond_3

    .line 1266
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$100(Lco/vine/android/dragsort/HorizontalListView;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1267
    invoke-virtual {v0, v6}, Landroid/view/View;->setPressed(Z)V

    .line 1268
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3, v6}, Lco/vine/android/dragsort/HorizontalListView;->setPressed(Z)V

    .line 1269
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->layoutChildren()V

    .line 1271
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->refreshDrawableState()V

    .line 1273
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView;->isLongClickable()Z

    move-result v2

    .line 1275
    .local v2, longClickable:Z
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$900(Lco/vine/android/dragsort/HorizontalListView;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1276
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$900(Lco/vine/android/dragsort/HorizontalListView;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1277
    .local v1, d:Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_0

    instance-of v3, v1, Landroid/graphics/drawable/TransitionDrawable;

    if-eqz v3, :cond_0

    .line 1278
    if-eqz v2, :cond_4

    .line 1279
    check-cast v1, Landroid/graphics/drawable/TransitionDrawable;

    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mLongPressMillis:I
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$1000(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 1286
    :cond_0
    :goto_0
    if-eqz v2, :cond_5

    .line 1287
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$1100(Lco/vine/android/dragsort/HorizontalListView;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    move-result-object v3

    if-nez v3, :cond_1

    .line 1288
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    new-instance v4, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    iget-object v5, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;-><init>(Lco/vine/android/dragsort/HorizontalListView;Lco/vine/android/dragsort/HorizontalListView$1;)V

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    invoke-static {v3, v4}, Lco/vine/android/dragsort/HorizontalListView;->access$1102(Lco/vine/android/dragsort/HorizontalListView;Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    .line 1290
    :cond_1
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$1100(Lco/vine/android/dragsort/HorizontalListView;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;->rememberWindowAttachCount()V

    .line 1291
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    iget-object v4, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    invoke-static {v4}, Lco/vine/android/dragsort/HorizontalListView;->access$1100(Lco/vine/android/dragsort/HorizontalListView;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mLongPressMillis:I
    invoke-static {v5}, Lco/vine/android/dragsort/HorizontalListView;->access$1000(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v3, v4, v5, v6}, Lco/vine/android/dragsort/HorizontalListView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1296
    :goto_1
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$900(Lco/vine/android/dragsort/HorizontalListView;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1297
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Lco/vine/android/dragsort/HorizontalListView;->access$900(Lco/vine/android/dragsort/HorizontalListView;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1298
    .restart local v1       #d:Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_2

    instance-of v3, v1, Landroid/graphics/drawable/TransitionDrawable;

    if-eqz v3, :cond_2

    .line 1299
    check-cast v1, Landroid/graphics/drawable/TransitionDrawable;

    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 1303
    .end local v2           #longClickable:Z
    :cond_2
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v3, v7}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 1306
    .end local v0           #child:Landroid/view/View;
    :cond_3
    return-void

    .line 1281
    .restart local v0       #child:Landroid/view/View;
    .restart local v1       #d:Landroid/graphics/drawable/Drawable;
    .restart local v2       #longClickable:Z
    :cond_4
    check-cast v1, Landroid/graphics/drawable/TransitionDrawable;

    .end local v1           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    goto :goto_0

    .line 1293
    :cond_5
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v3, v7}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    goto :goto_1
.end method
