.class Lco/vine/android/dragsort/HorizontalListView$1;
.super Ljava/lang/Object;
.source "HorizontalListView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/dragsort/HorizontalListView;->onTouchEvent(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/vine/android/dragsort/HorizontalListView;

.field final synthetic val$child:Landroid/view/View;

.field final synthetic val$performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;


# direct methods
.method constructor <init>(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;Lco/vine/android/dragsort/HorizontalListView$PerformClick;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 552
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    iput-object p2, p0, Lco/vine/android/dragsort/HorizontalListView$1;->val$child:Landroid/view/View;

    iput-object p3, p0, Lco/vine/android/dragsort/HorizontalListView$1;->val$performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 554
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    const/4 v1, -0x1

    #setter for: Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I
    invoke-static {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->access$002(Lco/vine/android/dragsort/HorizontalListView;I)I

    .line 555
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->val$child:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 556
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    invoke-virtual {v0, v2}, Lco/vine/android/dragsort/HorizontalListView;->setPressed(Z)V

    .line 557
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z
    invoke-static {v0}, Lco/vine/android/dragsort/HorizontalListView;->access$100(Lco/vine/android/dragsort/HorizontalListView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I
    invoke-static {v0}, Lco/vine/android/dragsort/HorizontalListView;->access$200(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v0

    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView$1;->this$0:Lco/vine/android/dragsort/HorizontalListView;

    #getter for: Lco/vine/android/dragsort/HorizontalListView;->mDownPosition:I
    invoke-static {v1}, Lco/vine/android/dragsort/HorizontalListView;->access$300(Lco/vine/android/dragsort/HorizontalListView;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 558
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView$1;->val$performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView$PerformClick;->run()V

    .line 560
    :cond_0
    return-void
.end method
