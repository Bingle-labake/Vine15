.class public final Lcom/twitter/android/widget/RefreshableListView;
.super Landroid/widget/ListView;
.source "RefreshableListView.java"

# interfaces
.implements Lcom/twitter/android/widget/TopScrollable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/android/widget/RefreshableListView$SavedState;,
        Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;,
        Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;,
        Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;,
        Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;
    }
.end annotation


# static fields
.field static final MODE_ADDED:I = 0x1

.field static final MODE_ATTACHED:I = 0x2

.field static final MODE_POPPED:I = 0x10

.field static final MODE_REFRESHING:I = 0x22

.field static final MODE_REFRESH_STARTED:I = 0x20

.field static final MODE_SCROLLING:I = 0x8

.field static final MODE_SLOP:I = 0x40

.field static final MODE_TRACKING:I = 0x4

.field private static final SMOOTH_SCROLL_MAX_POSITION:I = 0x5


# instance fields
.field private mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

.field private mAttachedToWindow:Z

.field private mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

.field private mDownY:I

.field private final mFooterLayoutId:I

.field private mFooterView:Landroid/view/View;

.field private final mFooterViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ListView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mHeaderViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ListView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field mItemCount:I

.field private final mLoading:Landroid/widget/ImageView;

.field private mLoadingAnimation:Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;

.field private mMode:I

.field private mMoveY:I

.field private final mPixelScale:F

.field private final mPullBackgroundColor:I

.field private mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

.field private final mRefreshTriangle1:Landroid/widget/ImageView;

.field private final mRefreshTriangle2:Landroid/widget/ImageView;

.field private final mRefreshTriangle3:Landroid/widget/ImageView;

.field final mRefreshView:Landroid/widget/RelativeLayout;

.field private final mScrollRunnable:Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;

.field final mScroller:Landroid/widget/Scroller;

.field private mTopPos:I

.field private final mTouchSlop:I

.field private mWidthMeasureSpec:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 115
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/twitter/android/widget/RefreshableListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 119
    sget v0, Lcom/twitter/android/R$attr;->refreshableListViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/twitter/android/widget/RefreshableListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 120
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 123
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 111
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    .line 112
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    .line 125
    sget-object v8, Lcom/twitter/android/R$styleable;->RefreshableListView:[I

    const/4 v9, 0x0

    invoke-virtual {p1, p2, v8, p3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 128
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    iput v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mPixelScale:F

    .line 130
    const/4 v8, 0x4

    const/4 v9, -0x1

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v8

    iput v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mPullBackgroundColor:I

    .line 133
    const/4 v8, 0x5

    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 135
    .local v2, divider:Landroid/graphics/drawable/Drawable;
    new-instance v8, Landroid/widget/Scroller;

    invoke-direct {v8, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mScroller:Landroid/widget/Scroller;

    .line 136
    new-instance v8, Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;

    invoke-direct {v8, p0}, Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;-><init>(Lcom/twitter/android/widget/RefreshableListView;)V

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mScrollRunnable:Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;

    .line 138
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    .line 139
    .local v4, inflater:Landroid/view/LayoutInflater;
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 140
    .local v5, layout:I
    const/4 v8, 0x0

    invoke-virtual {v4, v5, p0, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/RelativeLayout;

    .line 142
    .local v7, v:Landroid/widget/RelativeLayout;
    if-eqz v2, :cond_0

    .line 143
    sget v8, Lcom/twitter/android/R$id;->refresh_divider:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 144
    .local v3, dividerView:Landroid/view/View;
    invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 145
    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .end local v3           #dividerView:Landroid/view/View;
    :cond_0
    sget v8, Lcom/twitter/android/R$id;->refresh_loading:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoading:Landroid/widget/ImageView;

    .line 150
    sget v8, Lcom/twitter/android/R$id;->refresh_triangle_1:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle1:Landroid/widget/ImageView;

    .line 151
    sget v8, Lcom/twitter/android/R$id;->refresh_triangle_2:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle2:Landroid/widget/ImageView;

    .line 152
    sget v8, Lcom/twitter/android/R$id;->refresh_triangle_3:I

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ImageView;

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle3:Landroid/widget/ImageView;

    .line 154
    iput-object v7, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    .line 156
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    .line 157
    .local v1, config:Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v8

    iput v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mTouchSlop:I

    .line 160
    invoke-virtual {v7}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 161
    .local v6, p:Landroid/view/ViewGroup$LayoutParams;
    new-instance v8, Landroid/widget/AbsListView$LayoutParams;

    iget v9, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v10, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v11, -0x1

    invoke-direct {v8, v9, v10, v11}, Landroid/widget/AbsListView$LayoutParams;-><init>(III)V

    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    iput v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterLayoutId:I

    .line 165
    new-instance v8, Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;

    iget-object v9, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoading:Landroid/widget/ImageView;

    invoke-direct {v8, p0, v9}, Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;-><init>(Lcom/twitter/android/widget/RefreshableListView;Landroid/widget/ImageView;)V

    iput-object v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoadingAnimation:Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;

    .line 167
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 168
    return-void
.end method

.method static synthetic access$000(Lcom/twitter/android/widget/RefreshableListView;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/twitter/android/widget/RefreshableListView;)Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/twitter/android/widget/RefreshableListView;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    return-object v0
.end method

.method private clearRecycledState(Ljava/util/ArrayList;)V
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/widget/ListView$FixedViewInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 232
    .local p1, infos:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/widget/ListView$FixedViewInfo;>;"
    if-eqz p1, :cond_1

    .line 235
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView$FixedViewInfo;

    .line 236
    .local v2, info:Landroid/widget/ListView$FixedViewInfo;
    iget-object v0, v2, Landroid/widget/ListView$FixedViewInfo;->view:Landroid/view/View;

    .line 237
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/AbsListView$LayoutParams;

    .line 238
    .local v3, p:Landroid/widget/AbsListView$LayoutParams;
    if-eqz v3, :cond_0

    .line 239
    iget-object v4, v2, Landroid/widget/ListView$FixedViewInfo;->view:Landroid/view/View;

    new-instance v5, Landroid/widget/AbsListView$LayoutParams;

    iget v6, v3, Landroid/widget/AbsListView$LayoutParams;->width:I

    iget v7, v3, Landroid/widget/AbsListView$LayoutParams;->height:I

    const/4 v8, -0x2

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/AbsListView$LayoutParams;-><init>(III)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    .line 244
    .end local v0           #child:Landroid/view/View;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #info:Landroid/widget/ListView$FixedViewInfo;
    .end local v3           #p:Landroid/widget/AbsListView$LayoutParams;
    :cond_1
    return-void
.end method

.method private isRefreshable()Z
    .locals 1

    .prologue
    .line 625
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private silence(Ljava/lang/Exception;Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "e"
    .parameter "ev"

    .prologue
    .line 313
    const-string v0, "Event was: {}, x: {}, y: {}."

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p1, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 314
    return-void
.end method

.method private startScroll(I)V
    .locals 1
    .parameter "distance"

    .prologue
    .line 559
    if-lez p1, :cond_0

    .line 560
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mScrollRunnable:Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;

    invoke-virtual {v0, p1}, Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;->scroll(I)V

    .line 562
    :cond_0
    return-void
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V
    .locals 2
    .parameter "v"
    .parameter "data"
    .parameter "isSelectable"

    .prologue
    .line 656
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 657
    new-instance v0, Landroid/widget/ListView$FixedViewInfo;

    invoke-direct {v0, p0}, Landroid/widget/ListView$FixedViewInfo;-><init>(Landroid/widget/ListView;)V

    .line 658
    .local v0, info:Landroid/widget/ListView$FixedViewInfo;
    iput-object p1, v0, Landroid/widget/ListView$FixedViewInfo;->view:Landroid/view/View;

    .line 659
    iput-object p2, v0, Landroid/widget/ListView$FixedViewInfo;->data:Ljava/lang/Object;

    .line 660
    iput-boolean p3, v0, Landroid/widget/ListView$FixedViewInfo;->isSelectable:Z

    .line 661
    iget-object v1, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    .end local v0           #info:Landroid/widget/ListView$FixedViewInfo;
    :goto_0
    return-void

    .line 663
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    goto :goto_0
.end method

.method public addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V
    .locals 2
    .parameter "v"
    .parameter "data"
    .parameter "isSelectable"

    .prologue
    .line 630
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 631
    new-instance v0, Landroid/widget/ListView$FixedViewInfo;

    invoke-direct {v0, p0}, Landroid/widget/ListView$FixedViewInfo;-><init>(Landroid/widget/ListView;)V

    .line 632
    .local v0, info:Landroid/widget/ListView$FixedViewInfo;
    iput-object p1, v0, Landroid/widget/ListView$FixedViewInfo;->view:Landroid/view/View;

    .line 633
    iput-object p2, v0, Landroid/widget/ListView$FixedViewInfo;->data:Ljava/lang/Object;

    .line 634
    iput-boolean p3, v0, Landroid/widget/ListView$FixedViewInfo;->isSelectable:Z

    .line 635
    iget-object v1, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 639
    .end local v0           #info:Landroid/widget/ListView$FixedViewInfo;
    :goto_0
    return-void

    .line 637
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    goto :goto_0
.end method

.method attach(I)V
    .locals 17
    .parameter "y"

    .prologue
    .line 742
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    .line 743
    .local v12, refreshView:Landroid/view/View;
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    .line 744
    .local v11, p:Landroid/view/ViewGroup$LayoutParams;
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v1

    .line 746
    .local v1, addedOnce:Z
    if-eqz v1, :cond_1

    .line 747
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14, v11}, Lcom/twitter/android/widget/RefreshableListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 753
    :goto_0
    const/4 v14, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    .line 755
    if-eqz v1, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->isLayoutRequested()Z

    move-result v14

    if-eqz v14, :cond_2

    :cond_0
    const/4 v10, 0x1

    .line 757
    .local v10, needToMeasure:Z
    :goto_1
    if-eqz v10, :cond_4

    .line 758
    move-object/from16 v0, p0

    iget v14, v0, Lcom/twitter/android/widget/RefreshableListView;->mWidthMeasureSpec:I

    invoke-virtual/range {p0 .. p0}, Lcom/twitter/android/widget/RefreshableListView;->getListPaddingLeft()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Lcom/twitter/android/widget/RefreshableListView;->getListPaddingRight()I

    move-result v16

    add-int v15, v15, v16

    iget v0, v11, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v16, v0

    invoke-static/range {v14 .. v16}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v6

    .line 760
    .local v6, childWidthSpec:I
    iget v9, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 762
    .local v9, lpHeight:I
    if-lez v9, :cond_3

    .line 763
    const/high16 v14, 0x4000

    invoke-static {v9, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 767
    .local v3, childHeightSpec:I
    :goto_2
    invoke-virtual {v12, v6, v3}, Landroid/view/View;->measure(II)V

    .line 772
    .end local v3           #childHeightSpec:I
    .end local v6           #childWidthSpec:I
    .end local v9           #lpHeight:I
    :goto_3
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredWidth()I

    move-result v13

    .line 773
    .local v13, w:I
    invoke-virtual {v12}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    .line 774
    .local v8, h:I
    sub-int v5, p1, v8

    .line 775
    .local v5, childTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/twitter/android/widget/RefreshableListView;->getListPaddingLeft()I

    move-result v7

    .line 777
    .local v7, childrenLeft:I
    if-eqz v10, :cond_5

    .line 778
    add-int v4, v7, v13

    .line 779
    .local v4, childRight:I
    add-int v2, v5, v8

    .line 780
    .local v2, childBottom:I
    invoke-virtual {v12, v7, v5, v4, v2}, Landroid/view/View;->layout(IIII)V

    .line 786
    .end local v2           #childBottom:I
    .end local v4           #childRight:I
    :goto_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-virtual {v14}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;->onChanged()V

    .line 787
    return-void

    .line 749
    .end local v5           #childTop:I
    .end local v7           #childrenLeft:I
    .end local v8           #h:I
    .end local v10           #needToMeasure:Z
    .end local v13           #w:I
    :cond_1
    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v14, v11, v15}, Lcom/twitter/android/widget/RefreshableListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 750
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    goto :goto_0

    .line 755
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 765
    .restart local v6       #childWidthSpec:I
    .restart local v9       #lpHeight:I
    .restart local v10       #needToMeasure:Z
    :cond_3
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v14, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .restart local v3       #childHeightSpec:I
    goto :goto_2

    .line 769
    .end local v3           #childHeightSpec:I
    .end local v6           #childWidthSpec:I
    .end local v9           #lpHeight:I
    :cond_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/twitter/android/widget/RefreshableListView;->cleanupLayoutState(Landroid/view/View;)V

    goto :goto_3

    .line 782
    .restart local v5       #childTop:I
    .restart local v7       #childrenLeft:I
    .restart local v8       #h:I
    .restart local v13       #w:I
    :cond_5
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    move-result v14

    sub-int v14, v7, v14

    invoke-virtual {v12, v14}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 783
    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v14

    sub-int v14, v5, v14

    invoke-virtual {v12, v14}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_4
.end method

.method protected computeVerticalScrollOffset()I
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 678
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->isSmoothScrollbarEnabled()Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x2

    invoke-virtual {p0, v7}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 679
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v2

    .line 680
    .local v2, firstPosition:I
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getChildCount()I

    move-result v0

    .line 681
    .local v0, childCount:I
    iget v7, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    add-int/lit8 v1, v7, -0x1

    .line 683
    .local v1, count:I
    if-lez v1, :cond_0

    const/4 v7, 0x1

    if-lt v2, v7, :cond_0

    if-lez v0, :cond_0

    .line 684
    invoke-virtual {p0, v6}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 685
    .local v5, view:Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v4

    .line 686
    .local v4, top:I
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 688
    .local v3, height:I
    if-lez v3, :cond_0

    .line 689
    add-int/lit8 v7, v2, -0x1

    mul-int/lit8 v7, v7, 0x64

    mul-int/lit8 v8, v4, 0x64

    div-int/2addr v8, v3

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getScrollY()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    int-to-float v9, v1

    mul-float/2addr v8, v9

    const/high16 v9, 0x42c8

    mul-float/2addr v8, v9

    float-to-int v8, v8

    add-int/2addr v7, v8

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 696
    .end local v0           #childCount:I
    .end local v1           #count:I
    .end local v2           #firstPosition:I
    .end local v3           #height:I
    .end local v4           #top:I
    .end local v5           #view:Landroid/view/View;
    :cond_0
    :goto_0
    return v6

    :cond_1
    invoke-super {p0}, Landroid/widget/ListView;->computeVerticalScrollOffset()I

    move-result v6

    goto :goto_0
.end method

.method protected computeVerticalScrollRange()I
    .locals 5

    .prologue
    .line 702
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->isSmoothScrollbarEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 703
    iget v3, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    add-int/lit8 v0, v3, -0x1

    .line 704
    .local v0, count:I
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getScrollY()I

    move-result v2

    .line 705
    .local v2, scrollY:I
    mul-int/lit8 v3, v0, 0x64

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 706
    .local v1, result:I
    if-eqz v2, :cond_0

    .line 708
    int-to-float v3, v2

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    int-to-float v4, v0

    mul-float/2addr v3, v4

    const/high16 v4, 0x42c8

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v1, v3

    .line 712
    .end local v0           #count:I
    .end local v1           #result:I
    .end local v2           #scrollY:I
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-super {p0}, Landroid/widget/ListView;->computeVerticalScrollRange()I

    move-result v1

    goto :goto_0
.end method

.method detach()V
    .locals 1

    .prologue
    .line 793
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 794
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne p0, v0, :cond_0

    .line 795
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->detachViewFromParent(Landroid/view/View;)V

    .line 797
    :cond_0
    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->unsetMode(I)V

    .line 798
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;->onChanged()V

    .line 800
    :cond_1
    return-void
.end method

.method protected detachViewsFromParent(II)V
    .locals 1
    .parameter "start"
    .parameter "count"

    .prologue
    .line 805
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 809
    :goto_0
    return-void

    .line 808
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/ListView;->detachViewsFromParent(II)V

    goto :goto_0
.end method

.method public getFooterViewsCount()I
    .locals 1

    .prologue
    .line 669
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 670
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 672
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Landroid/widget/ListView;->getFooterViewsCount()I

    move-result v0

    goto :goto_0
.end method

.method public getHeaderViewsCount()I
    .locals 1

    .prologue
    .line 643
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 644
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 645
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 650
    :goto_0
    return v0

    .line 647
    :cond_0
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    .line 650
    :cond_1
    invoke-super {p0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v0

    goto :goto_0
.end method

.method isMode(I)Z
    .locals 1
    .parameter "mode"

    .prologue
    .line 733
    iget v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected layoutChildren()V
    .locals 1

    .prologue
    .line 213
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 214
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 218
    :cond_1
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    iget v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    if-nez v0, :cond_2

    .line 225
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->clearRecycledState(Ljava/util/ArrayList;)V

    .line 226
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->clearRecycledState(Ljava/util/ArrayList;)V

    .line 228
    :cond_2
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    goto :goto_0
.end method

.method offsetChildrenTopAndBottom(I)V
    .locals 3
    .parameter "offset"

    .prologue
    .line 570
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getChildCount()I

    move-result v0

    .line 573
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 574
    invoke-virtual {p0, v1}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 575
    .local v2, v:Landroid/view/View;
    invoke-virtual {v2, p1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 573
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 577
    .end local v2           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 191
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->registerDataSetObserver()V

    .line 193
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->updateItemCount()V

    .line 195
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAttachedToWindow:Z

    .line 196
    invoke-super {p0}, Landroid/widget/ListView;->onAttachedToWindow()V

    .line 197
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 201
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 202
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->unregisterDataSetObserver()V

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mScrollRunnable:Lcom/twitter/android/widget/RefreshableListView$ScrollRunnable;

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 207
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAttachedToWindow:Z

    .line 208
    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    .line 209
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .parameter "canvas"

    .prologue
    .line 248
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 249
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 250
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 251
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getScrollX()I

    move-result v1

    .line 252
    .local v1, left:I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 253
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getScrollY()I

    move-result v2

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getWidth()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 254
    iget v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mPullBackgroundColor:I

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 255
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 258
    .end local v0           #child:Landroid/view/View;
    .end local v1           #left:I
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onDraw(Landroid/graphics/Canvas;)V

    .line 259
    return-void
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1
    .parameter "gainFocus"
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAttachedToWindow:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getSelectedItemPosition()I

    move-result v0

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    if-eqz v0, :cond_0

    .line 184
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->updateItemCount()V

    .line 186
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ListView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 187
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .parameter "ev"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 263
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v8

    if-nez v8, :cond_0

    .line 264
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    .line 308
    :goto_0
    return v6

    .line 267
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    float-to-int v5, v8

    .line 268
    .local v5, y:I
    iget v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mDownY:I

    sub-int v1, v5, v8

    .line 270
    .local v1, deltaY:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 305
    :cond_1
    :goto_1
    :pswitch_0
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    goto :goto_0

    .line 272
    :pswitch_1
    iput v5, p0, Lcom/twitter/android/widget/RefreshableListView;->mDownY:I

    .line 273
    const/high16 v7, -0x8000

    iput v7, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    goto :goto_1

    .line 277
    :pswitch_2
    const/16 v8, 0x20

    invoke-virtual {p0, v8}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 278
    iput v5, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    goto :goto_1

    .line 281
    :cond_2
    const/4 v8, 0x2

    invoke-virtual {p0, v8}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    .line 284
    .local v0, attached:Z
    if-eqz v0, :cond_3

    .line 285
    invoke-virtual {p0, v7}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 290
    .local v4, topChild:Landroid/view/View;
    :goto_2
    if-eqz v4, :cond_4

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v3

    .line 291
    .local v3, top:I
    :goto_3
    iput v5, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    .line 293
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v8

    if-nez v8, :cond_1

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getListPaddingTop()I

    move-result v8

    if-lt v3, v8, :cond_1

    iget v8, p0, Lcom/twitter/android/widget/RefreshableListView;->mTouchSlop:I

    if-le v1, v8, :cond_1

    move v6, v7

    .line 295
    goto :goto_0

    .line 287
    .end local v3           #top:I
    .end local v4           #topChild:Landroid/view/View;
    :cond_3
    invoke-virtual {p0, v6}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .restart local v4       #topChild:Landroid/view/View;
    goto :goto_2

    :cond_4
    move v3, v6

    .line 290
    goto :goto_3

    .line 306
    .end local v0           #attached:Z
    .end local v4           #topChild:Landroid/view/View;
    :catch_0
    move-exception v2

    .line 307
    .local v2, e:Ljava/lang/RuntimeException;
    invoke-direct {p0, v2, p1}, Lcom/twitter/android/widget/RefreshableListView;->silence(Ljava/lang/Exception;Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 270
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .locals 0
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 172
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->updateItemCount()V

    .line 173
    iput p1, p0, Lcom/twitter/android/widget/RefreshableListView;->mWidthMeasureSpec:I

    .line 174
    invoke-super {p0, p1, p2}, Landroid/widget/ListView;->onMeasure(II)V

    .line 175
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .parameter "state"

    .prologue
    .line 1107
    move-object v0, p1

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;

    .line 1108
    .local v0, ss:Lcom/twitter/android/widget/RefreshableListView$SavedState;
    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/ListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1109
    iget-boolean v1, v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;->refreshable:Z

    if-eqz v1, :cond_0

    .line 1110
    iget v1, v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;->mode:I

    iput v1, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    .line 1112
    :cond_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 1098
    invoke-super {p0}, Landroid/widget/ListView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 1099
    .local v1, superState:Landroid/os/Parcelable;
    new-instance v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;

    invoke-direct {v0, v1}, Lcom/twitter/android/widget/RefreshableListView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 1100
    .local v0, ss:Lcom/twitter/android/widget/RefreshableListView$SavedState;
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v2

    iput-boolean v2, v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;->refreshable:Z

    .line 1101
    iget v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    iput v2, v0, Lcom/twitter/android/widget/RefreshableListView$SavedState;->mode:I

    .line 1102
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14
    .parameter "ev"

    .prologue
    .line 324
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v12

    if-nez v12, :cond_0

    .line 325
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v12

    .line 439
    :goto_0
    return v12

    .line 328
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v12

    and-int/lit16 v0, v12, 0xff

    .line 330
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v12

    float-to-int v11, v12

    .line 331
    .local v11, y:I
    iget v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mDownY:I

    sub-int v4, v11, v12

    .line 333
    .local v4, deltaY:I
    packed-switch v0, :pswitch_data_0

    .line 436
    :cond_1
    :goto_1
    :try_start_0
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    goto :goto_0

    .line 335
    :pswitch_0
    iput v11, p0, Lcom/twitter/android/widget/RefreshableListView;->mDownY:I

    .line 336
    const/high16 v12, -0x8000

    iput v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    .line 337
    const/16 v12, 0x40

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    goto :goto_1

    .line 342
    :pswitch_1
    const/16 v12, 0x14

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->unsetMode(I)V

    .line 344
    const/16 v12, 0x20

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-nez v12, :cond_1

    const/4 v12, 0x2

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 345
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 346
    .local v9, topChild:Landroid/view/View;
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v7

    .line 348
    .local v7, firstPos:I
    if-nez v7, :cond_1

    if-eqz v9, :cond_1

    .line 349
    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v8

    .line 350
    .local v8, top:I
    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v2

    .line 351
    .local v2, bottom:I
    if-lez v8, :cond_2

    .line 353
    iget-object v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    const/4 v13, 0x1

    invoke-interface {v12, v13}, Lcom/twitter/android/widget/RefreshListener;->onRefreshReleased(Z)V

    .line 354
    invoke-direct {p0, v8}, Lcom/twitter/android/widget/RefreshableListView;->startScroll(I)V

    goto :goto_1

    .line 355
    :cond_2
    invoke-virtual {v9}, Landroid/view/View;->getBottom()I

    move-result v12

    if-lez v12, :cond_1

    .line 356
    iget-object v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    const/4 v13, 0x0

    invoke-interface {v12, v13}, Lcom/twitter/android/widget/RefreshListener;->onRefreshReleased(Z)V

    .line 357
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getDividerHeight()I

    move-result v12

    add-int/2addr v12, v2

    invoke-direct {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->startScroll(I)V

    goto :goto_1

    .line 364
    .end local v2           #bottom:I
    .end local v7           #firstPos:I
    .end local v8           #top:I
    .end local v9           #topChild:Landroid/view/View;
    :pswitch_2
    const/16 v12, 0x20

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 365
    iput v11, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    goto :goto_1

    .line 368
    :cond_3
    iget v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    const/high16 v13, -0x8000

    if-eq v12, v13, :cond_6

    .line 369
    iget v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    sub-int v5, v11, v12

    .line 375
    .local v5, diff:I
    :goto_2
    const/4 v12, 0x2

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v1

    .line 378
    .local v1, attached:Z
    if-eqz v1, :cond_7

    .line 379
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 384
    .restart local v9       #topChild:Landroid/view/View;
    :goto_3
    if-eqz v9, :cond_8

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v8

    .line 385
    .restart local v8       #top:I
    :goto_4
    iget v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    if-lt v11, v12, :cond_9

    const/4 v10, 0x1

    .line 387
    .local v10, up:Z
    :goto_5
    iput v11, p0, Lcom/twitter/android/widget/RefreshableListView;->mMoveY:I

    .line 389
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v12

    if-nez v12, :cond_c

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getListPaddingTop()I

    move-result v12

    if-lt v8, v12, :cond_c

    iget v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mTouchSlop:I

    if-le v4, v12, :cond_c

    .line 391
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->requestDisallowInterceptTouchEvent(Z)V

    .line 394
    const/16 v12, 0x40

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 395
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 396
    const/16 v12, 0x40

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->unsetMode(I)V

    .line 400
    :cond_4
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->setChildrenDrawingCacheEnabled(Z)V

    .line 401
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->setChildrenDrawnWithCacheEnabled(Z)V

    .line 403
    if-eqz v1, :cond_b

    .line 405
    int-to-float v12, v5

    const/high16 v13, 0x3f00

    mul-float/2addr v12, v13

    float-to-int v12, v12

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->offsetChildrenTopAndBottom(I)V

    .line 406
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->invalidate()V

    .line 407
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 408
    .local v3, child:Landroid/view/View;
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v12

    if-ltz v12, :cond_a

    .line 409
    if-eqz v10, :cond_5

    const/16 v12, 0x10

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-nez v12, :cond_5

    .line 410
    const/16 v12, 0x10

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    .line 411
    iget-object v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    invoke-interface {v12}, Lcom/twitter/android/widget/RefreshListener;->onRefreshPulled()V

    .line 423
    .end local v3           #child:Landroid/view/View;
    :cond_5
    :goto_6
    const/4 v12, 0x4

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    .line 425
    const/4 v12, 0x1

    goto/16 :goto_0

    .line 371
    .end local v1           #attached:Z
    .end local v5           #diff:I
    .end local v8           #top:I
    .end local v9           #topChild:Landroid/view/View;
    .end local v10           #up:Z
    :cond_6
    move v5, v4

    .restart local v5       #diff:I
    goto :goto_2

    .line 381
    .restart local v1       #attached:Z
    :cond_7
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .restart local v9       #topChild:Landroid/view/View;
    goto :goto_3

    .line 384
    :cond_8
    const/4 v8, 0x0

    goto :goto_4

    .line 385
    .restart local v8       #top:I
    :cond_9
    const/4 v10, 0x0

    goto :goto_5

    .line 414
    .restart local v3       #child:Landroid/view/View;
    .restart local v10       #up:Z
    :cond_a
    if-nez v10, :cond_5

    const/16 v12, 0x10

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 415
    const/16 v12, 0x10

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->unsetMode(I)V

    .line 416
    iget-object v12, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    invoke-interface {v12}, Lcom/twitter/android/widget/RefreshListener;->onRefreshCancelled()V

    goto :goto_6

    .line 420
    .end local v3           #child:Landroid/view/View;
    :cond_b
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getDividerHeight()I

    move-result v12

    sub-int v12, v8, v12

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->attach(I)V

    goto :goto_6

    .line 427
    :cond_c
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->detach()V

    goto/16 :goto_1

    .line 437
    .end local v1           #attached:Z
    .end local v5           #diff:I
    .end local v8           #top:I
    .end local v9           #topChild:Landroid/view/View;
    .end local v10           #up:Z
    :catch_0
    move-exception v6

    .line 438
    .local v6, e:Ljava/lang/RuntimeException;
    invoke-direct {p0, v6, p1}, Lcom/twitter/android/widget/RefreshableListView;->silence(Ljava/lang/Exception;Landroid/view/MotionEvent;)V

    .line 439
    const/4 v12, 0x0

    goto/16 :goto_0

    .line 333
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public refreshMore(Z)V
    .locals 2
    .parameter "start"

    .prologue
    .line 717
    if-eqz p1, :cond_0

    .line 718
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 722
    :goto_0
    return-void

    .line 720
    :cond_0
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method requestLastChildLayout()V
    .locals 6

    .prologue
    .line 812
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 813
    .local v2, lastChild:Landroid/view/View;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getBottom()I

    move-result v4

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getBottomPaddingOffset()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getDividerHeight()I

    move-result v5

    sub-int/2addr v4, v5

    if-ge v3, v4, :cond_0

    .line 816
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 818
    .local v1, firstChild:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 819
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v0

    .line 820
    .local v0, before:I
    invoke-super {p0}, Landroid/widget/ListView;->layoutChildren()V

    .line 821
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v3, v0, v3

    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->offsetChildrenTopAndBottom(I)V

    .line 824
    .end local v0           #before:I
    .end local v1           #firstChild:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public scrollTop()Z
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 842
    iget v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mTopPos:I

    .line 843
    .local v2, pos:I
    const/16 v5, 0x22

    invoke-virtual {p0, v5}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 844
    add-int/lit8 v2, v2, 0x1

    .line 846
    :cond_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v6, 0x7

    if-le v5, v6, :cond_4

    .line 847
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v1

    .line 848
    .local v1, firstPos:I
    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 850
    .local v0, child:Landroid/view/View;
    if-gt v1, v2, :cond_1

    if-ne v1, v2, :cond_3

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    if-gez v5, :cond_3

    .line 853
    :cond_1
    const/4 v3, 0x5

    if-le v1, v3, :cond_2

    .line 854
    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->setSelection(I)V

    .line 857
    :cond_2
    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->smoothScrollToPosition(I)V

    move v3, v4

    .line 865
    .end local v0           #child:Landroid/view/View;
    .end local v1           #firstPos:I
    :cond_3
    :goto_0
    return v3

    .line 864
    :cond_4
    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->setSelection(I)V

    move v3, v4

    .line 865
    goto :goto_0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 58
    check-cast p1, Landroid/widget/ListAdapter;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/twitter/android/widget/RefreshableListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 8
    .parameter "adapter"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 596
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 597
    if-eqz p1, :cond_3

    .line 598
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 599
    :cond_0
    new-instance v0, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-direct {v0, p0}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;-><init>(Lcom/twitter/android/widget/RefreshableListView;)V

    iput-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    .line 601
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterView:Landroid/view/View;

    if-nez v0, :cond_1

    .line 603
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    .line 604
    .local v7, inflater:Landroid/view/LayoutInflater;
    iget v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterLayoutId:I

    invoke-virtual {v7, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    .line 606
    .local v6, footerView:Landroid/view/View;
    invoke-virtual {p0, v6, v1, v2}, Lcom/twitter/android/widget/RefreshableListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 607
    sget v0, Lcom/twitter/android/R$id;->footer_content:I

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterView:Landroid/view/View;

    .line 610
    .end local v6           #footerView:Landroid/view/View;
    .end local v7           #inflater:Landroid/view/LayoutInflater;
    :cond_1
    new-instance v0, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    iget-object v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/twitter/android/widget/RefreshableListView;->mFooterViewInfos:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;-><init>(Lcom/twitter/android/widget/RefreshableListView;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/widget/ListAdapter;Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;)V

    iput-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    .line 613
    :cond_2
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->getSuperCount()I

    move-result v0

    iput v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    .line 618
    :goto_0
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-super {p0, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 622
    :goto_1
    return-void

    .line 615
    :cond_3
    iput-object v1, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    .line 616
    iput v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    goto :goto_0

    .line 620
    :cond_4
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_1
.end method

.method setMode(I)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 725
    iget v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    or-int/2addr v0, p1

    iput v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    .line 726
    return-void
.end method

.method public setRefreshListener(Lcom/twitter/android/widget/RefreshListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 585
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getHeaderViewsCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 586
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "setRefreshListener must be called before addHeaderView."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 589
    :cond_0
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    if-eq p1, v0, :cond_1

    .line 590
    iput-object p1, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    .line 592
    :cond_1
    return-void
.end method

.method public setTopPosition(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 832
    iput p1, p0, Lcom/twitter/android/widget/RefreshableListView;->mTopPos:I

    .line 833
    return-void
.end method

.method public setViewYOffset(I)V
    .locals 4
    .parameter "offset"

    .prologue
    const/4 v3, 0x0

    .line 317
    int-to-float v1, p1

    iget v2, p0, Lcom/twitter/android/widget/RefreshableListView;->mPixelScale:F

    mul-float/2addr v1, v2

    const/high16 v2, 0x3f00

    add-float/2addr v1, v2

    float-to-int v0, v1

    .line 318
    .local v0, pixels:I
    iget-object v1, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshView:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v3, v3, v3, v0}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 319
    return-void
.end method

.method public startRefresh()V
    .locals 4

    .prologue
    const/16 v3, 0x20

    const/4 v2, 0x2

    const/4 v1, 0x4

    .line 447
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 465
    :cond_0
    :goto_0
    return-void

    .line 450
    :cond_1
    invoke-virtual {p0, v3}, Lcom/twitter/android/widget/RefreshableListView;->setMode(I)V

    .line 451
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 452
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle2:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 453
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle3:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 455
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoading:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 456
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoadingAnimation:Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;->run()V

    .line 462
    invoke-virtual {p0, v2}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 463
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;->onChanged()V

    goto :goto_0
.end method

.method public stopRefresh()V
    .locals 13

    .prologue
    const/16 v12, 0x20

    const/4 v9, 0x0

    .line 497
    iget-object v5, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshListener:Lcom/twitter/android/widget/RefreshListener;

    .line 499
    .local v5, l:Lcom/twitter/android/widget/RefreshListener;
    if-eqz v5, :cond_1

    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 500
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoadingAnimation:Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;

    invoke-virtual {v10}, Lcom/twitter/android/widget/RefreshableListView$AnimateLoader;->cancel()V

    .line 502
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->getFirstVisiblePosition()I

    move-result v0

    .line 503
    .local v0, first:I
    const/4 v10, 0x2

    invoke-virtual {p0, v10}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v3

    .line 505
    .local v3, isAttached:Z
    invoke-interface {v5}, Lcom/twitter/android/widget/RefreshListener;->getFirstItemPosition()Lcom/twitter/android/widget/ItemPosition;

    move-result-object v2

    .line 506
    .local v2, ip:Lcom/twitter/android/widget/ItemPosition;
    iget v7, v2, Lcom/twitter/android/widget/ItemPosition;->offset:I

    .line 507
    .local v7, top:I
    iget v4, v2, Lcom/twitter/android/widget/ItemPosition;->position:I

    .line 510
    .local v4, itemPos:I
    invoke-interface {v5}, Lcom/twitter/android/widget/RefreshListener;->onRefreshFinished()V

    .line 513
    iget-wide v10, v2, Lcom/twitter/android/widget/ItemPosition;->itemId:J

    invoke-interface {v5, v10, v11}, Lcom/twitter/android/widget/RefreshListener;->getPositionForItemId(J)I

    move-result v6

    .line 516
    .local v6, pos:I
    invoke-virtual {p0, v12}, Lcom/twitter/android/widget/RefreshableListView;->unsetMode(I)V

    .line 519
    if-ne v6, v4, :cond_5

    .line 520
    invoke-interface {v5}, Lcom/twitter/android/widget/RefreshListener;->onRefreshFinishedNoChange()V

    .line 523
    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->isInTouchMode()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 524
    const/4 v10, 0x1

    invoke-virtual {p0, v10}, Lcom/twitter/android/widget/RefreshableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 525
    .local v1, firstChild:Landroid/view/View;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v8

    .line 526
    .local v8, topChild:I
    :goto_0
    if-eqz v3, :cond_0

    .line 527
    invoke-direct {p0, v8}, Lcom/twitter/android/widget/RefreshableListView;->startScroll(I)V

    .line 551
    .end local v1           #firstChild:Landroid/view/View;
    .end local v8           #topChild:I
    :cond_0
    :goto_1
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle1:Landroid/widget/ImageView;

    invoke-virtual {v10, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 552
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle2:Landroid/widget/ImageView;

    invoke-virtual {v10, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 553
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mRefreshTriangle3:Landroid/widget/ImageView;

    invoke-virtual {v10, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 554
    iget-object v9, p0, Lcom/twitter/android/widget/RefreshableListView;->mLoading:Landroid/widget/ImageView;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 556
    .end local v0           #first:I
    .end local v2           #ip:Lcom/twitter/android/widget/ItemPosition;
    .end local v3           #isAttached:Z
    .end local v4           #itemPos:I
    .end local v6           #pos:I
    .end local v7           #top:I
    :cond_1
    return-void

    .restart local v0       #first:I
    .restart local v1       #firstChild:Landroid/view/View;
    .restart local v2       #ip:Lcom/twitter/android/widget/ItemPosition;
    .restart local v3       #isAttached:Z
    .restart local v4       #itemPos:I
    .restart local v6       #pos:I
    .restart local v7       #top:I
    :cond_2
    move v8, v9

    .line 525
    goto :goto_0

    .line 531
    .end local v1           #firstChild:Landroid/view/View;
    :cond_3
    if-eqz v3, :cond_4

    .line 532
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->detach()V

    .line 537
    :goto_2
    add-int/lit8 v10, v4, -0x1

    invoke-virtual {p0, v10, v7}, Lcom/twitter/android/widget/RefreshableListView;->setSelectionFromTop(II)V

    goto :goto_1

    .line 534
    :cond_4
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-virtual {v10}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;->onChanged()V

    goto :goto_2

    .line 540
    :cond_5
    invoke-interface {v5}, Lcom/twitter/android/widget/RefreshListener;->onRefreshFinishedNewData()V

    .line 544
    if-eqz v3, :cond_6

    .line 545
    invoke-virtual {p0}, Lcom/twitter/android/widget/RefreshableListView;->detach()V

    .line 549
    :goto_3
    add-int/lit8 v10, v6, -0x1

    invoke-virtual {p0, v10, v7}, Lcom/twitter/android/widget/RefreshableListView;->setSelectionFromTop(II)V

    goto :goto_1

    .line 547
    :cond_6
    iget-object v10, p0, Lcom/twitter/android/widget/RefreshableListView;->mDataSetObserver:Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;

    invoke-virtual {v10}, Lcom/twitter/android/widget/RefreshableListView$AdapterDataSetObserver;->onChanged()V

    goto :goto_3
.end method

.method unsetMode(I)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 729
    iget v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mMode:I

    .line 730
    return-void
.end method

.method updateItemCount()V
    .locals 1

    .prologue
    .line 1115
    invoke-direct {p0}, Lcom/twitter/android/widget/RefreshableListView;->isRefreshable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1123
    :goto_0
    return-void

    .line 1118
    :cond_0
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Lcom/twitter/android/widget/RefreshableListView;->isMode(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1119
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->getSuperCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    goto :goto_0

    .line 1121
    :cond_1
    iget-object v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mAdapter:Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView$RefreshViewListAdapter;->getSuperCount()I

    move-result v0

    iput v0, p0, Lcom/twitter/android/widget/RefreshableListView;->mItemCount:I

    goto :goto_0
.end method
