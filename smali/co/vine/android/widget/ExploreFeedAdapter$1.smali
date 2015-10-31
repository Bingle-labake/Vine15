.class Lco/vine/android/widget/ExploreFeedAdapter$1;
.super Ljava/lang/Object;
.source "ExploreFeedAdapter.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/vine/android/widget/ExploreFeedAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field public mInitialY:I

.field final synthetic this$0:Lco/vine/android/widget/ExploreFeedAdapter;


# direct methods
.method constructor <init>(Lco/vine/android/widget/ExploreFeedAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 87
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v4, 0x1

    .line 93
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    float-to-int v2, v5

    .line 94
    .local v2, x:I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v3, v5

    .line 95
    .local v3, y:I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    if-nez v5, :cond_1

    .line 96
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    #setter for: Lco/vine/android/widget/ExploreFeedAdapter;->mStartClickTime:J
    invoke-static {v5, v6, v7}, Lco/vine/android/widget/ExploreFeedAdapter;->access$002(Lco/vine/android/widget/ExploreFeedAdapter;J)J

    .line 97
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v6, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoBox:Landroid/graphics/Rect;
    invoke-static {v6}, Lco/vine/android/widget/ExploreFeedAdapter;->access$200(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    #setter for: Lco/vine/android/widget/ExploreFeedAdapter;->mStartedClickOnVideo:Z
    invoke-static {v5, v6}, Lco/vine/android/widget/ExploreFeedAdapter;->access$102(Lco/vine/android/widget/ExploreFeedAdapter;Z)Z

    .line 98
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mStartedClickOnVideo:Z
    invoke-static {v5}, Lco/vine/android/widget/ExploreFeedAdapter;->access$100(Lco/vine/android/widget/ExploreFeedAdapter;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 99
    iput v3, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->mInitialY:I

    .line 114
    :cond_0
    :goto_0
    return v4

    .line 102
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    if-ne v5, v4, :cond_0

    .line 103
    const/16 v1, 0xc8

    .line 104
    .local v1, tolerance:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-object v7, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mStartClickTime:J
    invoke-static {v7}, Lco/vine/android/widget/ExploreFeedAdapter;->access$000(Lco/vine/android/widget/ExploreFeedAdapter;)J

    move-result-wide v7

    sub-long/2addr v5, v7

    int-to-long v7, v1

    cmp-long v5, v5, v7

    if-gtz v5, :cond_2

    move v0, v4

    .line 105
    .local v0, isClick:Z
    :goto_1
    if-eqz v0, :cond_0

    .line 106
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mStartedClickOnVideo:Z
    invoke-static {v5}, Lco/vine/android/widget/ExploreFeedAdapter;->access$100(Lco/vine/android/widget/ExploreFeedAdapter;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 107
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #getter for: Lco/vine/android/widget/ExploreFeedAdapter;->mVideoClicker:Lco/vine/android/player/OnSingleVideoClickedListener;
    invoke-static {v5}, Lco/vine/android/widget/ExploreFeedAdapter;->access$300(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OnSingleVideoClickedListener;

    move-result-object v5

    invoke-virtual {v5}, Lco/vine/android/player/OnSingleVideoClickedListener;->onClick()V

    goto :goto_0

    .line 104
    .end local v0           #isClick:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 109
    .restart local v0       #isClick:Z
    :cond_3
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter$1;->this$0:Lco/vine/android/widget/ExploreFeedAdapter;

    #calls: Lco/vine/android/widget/ExploreFeedAdapter;->dismissVideo()Z
    invoke-static {v5}, Lco/vine/android/widget/ExploreFeedAdapter;->access$400(Lco/vine/android/widget/ExploreFeedAdapter;)Z

    goto :goto_0
.end method
