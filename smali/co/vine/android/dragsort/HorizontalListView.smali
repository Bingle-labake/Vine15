.class public Lco/vine/android/dragsort/HorizontalListView;
.super Landroid/widget/AdapterView;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/dragsort/HorizontalListView$OnScrollListener;,
        Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;,
        Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;,
        Lco/vine/android/dragsort/HorizontalListView$PerformClick;,
        Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;,
        Lco/vine/android/dragsort/HorizontalListView$CheckForTap;,
        Lco/vine/android/dragsort/HorizontalListView$Recycler;,
        Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;,
        Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView",
        "<",
        "Landroid/widget/ListAdapter;",
        ">;"
    }
.end annotation


# static fields
.field public static final NO_POSITION:I = -0x1

.field private static final TOUCH_MODE_DONE_WAITING:I = 0x2

.field private static final TOUCH_MODE_DOWN:I = 0x0

.field private static final TOUCH_MODE_FLING:I = 0x4

.field private static final TOUCH_MODE_REST:I = -0x1

.field private static final TOUCH_MODE_SCROLL:I = 0x3

.field private static final TOUCH_MODE_TAP:I = 0x1


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mChildFillWidth:I

.field private mChildWidthListener:Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;

.field private mClipToPadding:Z

.field private mDataChanged:Z

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerPaint:Landroid/graphics/Paint;

.field private mDividerWidth:I

.field private mDownPosition:I

.field private final mEdgePadding:I

.field private final mFillWidthHeightRatio:F

.field private mFingerScrollEnabled:Z

.field private mFirstVisiblePos:I

.field private final mFlingRunnable:Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;

.field private mHeightMeasureSpec:I

.field private final mIsRecycled:[Z

.field private mItemCount:I

.field private mLastX:I

.field private mLongPressMillis:I

.field private final mMaximumFlingVelocity:I

.field private final mMinimumFlingVelocity:I

.field private mMotionPosition:I

.field private mMotionX:I

.field private mMotionY:I

.field private mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mOnScrollListener:Lco/vine/android/dragsort/HorizontalListView$OnScrollListener;

.field private mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

.field private mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

.field private mPerformClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

.field private final mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

.field private mSelector:Landroid/graphics/drawable/Drawable;

.field private mTouchFrame:Landroid/graphics/Rect;

.field private mTouchMode:I

.field private mTouchModeReset:Ljava/lang/Runnable;

.field private final mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 192
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/dragsort/HorizontalListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 193
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 196
    sget v0, Lco/vine/android/dragsort/R$attr;->horizontalListViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/dragsort/HorizontalListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 197
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v7, 0x1

    const/high16 v6, -0x8000

    const/4 v5, 0x0

    .line 200
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 94
    const/4 v4, -0x1

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    .line 98
    new-instance v4, Lco/vine/android/dragsort/HorizontalListView$Recycler;

    invoke-direct {v4, p0}, Lco/vine/android/dragsort/HorizontalListView$Recycler;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    iput-object v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    .line 104
    new-array v4, v7, [Z

    iput-object v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mIsRecycled:[Z

    .line 109
    iput v5, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 125
    iput v6, p0, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    .line 130
    iput v6, p0, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    .line 177
    iput-boolean v7, p0, Lco/vine/android/dragsort/HorizontalListView;->mFingerScrollEnabled:Z

    .line 182
    iput v6, p0, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    .line 186
    new-instance v4, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;

    invoke-direct {v4, p0}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    iput-object v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mFlingRunnable:Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;

    .line 188
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mLongPressMillis:I

    .line 202
    sget-object v4, Lco/vine/android/dragsort/R$styleable;->HorizontalListView:[I

    invoke-virtual {p1, p2, v4, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 204
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 205
    .local v2, divider:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_0

    .line 206
    invoke-virtual {p0, v2}, Lco/vine/android/dragsort/HorizontalListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 208
    :cond_0
    invoke-virtual {v0, v7, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 210
    .local v3, dividerWidth:I
    if-lez v3, :cond_1

    .line 211
    invoke-virtual {p0, v3}, Lco/vine/android/dragsort/HorizontalListView;->setDividerWidth(I)V

    .line 214
    :cond_1
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    .line 215
    const/4 v4, 0x3

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mFillWidthHeightRatio:F

    .line 217
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 219
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    .line 220
    .local v1, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchSlop:I

    .line 221
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mMinimumFlingVelocity:I

    .line 222
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v4

    iput v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mMaximumFlingVelocity:I

    .line 223
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    return v0
.end method

.method static synthetic access$002(Lco/vine/android/dragsort/HorizontalListView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    return p1
.end method

.method static synthetic access$100(Lco/vine/android/dragsort/HorizontalListView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-boolean v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    return v0
.end method

.method static synthetic access$1000(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mLongPressMillis:I

    return v0
.end method

.method static synthetic access$102(Lco/vine/android/dragsort/HorizontalListView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-boolean p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    return p1
.end method

.method static synthetic access$1100(Lco/vine/android/dragsort/HorizontalListView;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    return-object v0
.end method

.method static synthetic access$1102(Lco/vine/android/dragsort/HorizontalListView;Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;)Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    return-object p1
.end method

.method static synthetic access$1300(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;IJ)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Lco/vine/android/dragsort/HorizontalListView;->performLongPress(Landroid/view/View;IJ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1600(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I

    move-result v0

    return v0
.end method

.method static synthetic access$1700(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWindowAttachCount()I

    move-result v0

    return v0
.end method

.method static synthetic access$1800(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I

    move-result v0

    return v0
.end method

.method static synthetic access$1900(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowRight()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I

    return v0
.end method

.method static synthetic access$300(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDownPosition:I

    return v0
.end method

.method static synthetic access$400(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    return v0
.end method

.method static synthetic access$402(Lco/vine/android/dragsort/HorizontalListView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    return p1
.end method

.method static synthetic access$500(Lco/vine/android/dragsort/HorizontalListView;)Landroid/widget/ListAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 46
    invoke-virtual {p0, p1, p2}, Lco/vine/android/dragsort/HorizontalListView;->removeDetachedView(Landroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$700(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 46
    invoke-virtual {p0, p1, p2}, Lco/vine/android/dragsort/HorizontalListView;->removeDetachedView(Landroid/view/View;Z)V

    return-void
.end method

.method static synthetic access$800(Lco/vine/android/dragsort/HorizontalListView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    return v0
.end method

.method static synthetic access$900(Lco/vine/android/dragsort/HorizontalListView;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method private attachChild(IIIZ)Landroid/view/View;
    .locals 7
    .parameter "position"
    .parameter "x"
    .parameter "y"
    .parameter "right"

    .prologue
    .line 849
    iget-boolean v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    if-nez v0, :cond_0

    .line 850
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    invoke-virtual {v0, p1}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->getActiveView(I)Landroid/view/View;

    move-result-object v1

    .line 851
    .local v1, child:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 852
    const/4 v5, 0x1

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lco/vine/android/dragsort/HorizontalListView;->layoutChild(Landroid/view/View;IIZZ)V

    move-object v6, v1

    .line 858
    .end local v1           #child:Landroid/view/View;
    .local v6, child:Landroid/view/View;
    :goto_0
    return-object v6

    .line 856
    .end local v6           #child:Landroid/view/View;
    :cond_0
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mIsRecycled:[Z

    invoke-direct {p0, p1, v0}, Lco/vine/android/dragsort/HorizontalListView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v1

    .line 857
    .restart local v1       #child:Landroid/view/View;
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mIsRecycled:[Z

    const/4 v2, 0x0

    aget-boolean v5, v0, v2

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lco/vine/android/dragsort/HorizontalListView;->layoutChild(Landroid/view/View;IIZZ)V

    move-object v6, v1

    .line 858
    .end local v1           #child:Landroid/view/View;
    .restart local v6       #child:Landroid/view/View;
    goto :goto_0
.end method

.method private disallowParentIntercept(Z)V
    .locals 1
    .parameter "disallow"

    .prologue
    .line 671
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 672
    .local v0, parent:Landroid/view/ViewParent;
    if-eqz v0, :cond_0

    .line 673
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 675
    :cond_0
    return-void
.end method

.method private fillGap(Z)V
    .locals 5
    .parameter "right"

    .prologue
    .line 789
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v0

    .line 790
    .local v0, count:I
    if-eqz p1, :cond_1

    .line 792
    if-lez v0, :cond_0

    .line 793
    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0, v3}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    add-int v1, v3, v4

    .line 797
    .local v1, nextLeft:I
    :goto_0
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    add-int/2addr v3, v0

    invoke-direct {p0, v3, v1}, Lco/vine/android/dragsort/HorizontalListView;->fillRight(II)V

    .line 809
    .end local v1           #nextLeft:I
    :goto_1
    return-void

    .line 795
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v1

    .restart local v1       #nextLeft:I
    goto :goto_0

    .line 801
    .end local v1           #nextLeft:I
    :cond_1
    if-lez v0, :cond_2

    .line 802
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v3

    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    sub-int v2, v3, v4

    .line 806
    .local v2, nextRight:I
    :goto_2
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    add-int/lit8 v3, v3, -0x1

    invoke-direct {p0, v3, v2}, Lco/vine/android/dragsort/HorizontalListView;->fillLeft(II)V

    goto :goto_1

    .line 804
    .end local v2           #nextRight:I
    :cond_2
    const/4 v2, 0x0

    .restart local v2       #nextRight:I
    goto :goto_2
.end method

.method private fillLeft(II)V
    .locals 6
    .parameter "pos"
    .parameter "nextRight"

    .prologue
    const/4 v5, 0x0

    .line 812
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingTop()I

    move-result v0

    .line 813
    .local v0, childrenTop:I
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v1

    .line 816
    .local v1, listLeft:I
    :goto_0
    if-le p2, v1, :cond_0

    if-ltz p1, :cond_0

    .line 817
    invoke-direct {p0, p1, p2, v0, v5}, Lco/vine/android/dragsort/HorizontalListView;->attachChild(IIIZ)Landroid/view/View;

    move-result-object v2

    .line 818
    .local v2, v:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v3

    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    sub-int p2, v3, v4

    .line 819
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 821
    .end local v2           #v:Landroid/view/View;
    :cond_0
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-lez v3, :cond_1

    const/4 v3, -0x1

    if-ne p1, v3, :cond_1

    invoke-direct {p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I

    move-result v3

    if-gez v3, :cond_1

    .line 822
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->detachAllViewsFromParent()V

    .line 823
    iput v5, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 824
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v3

    invoke-direct {p0, v5, v3}, Lco/vine/android/dragsort/HorizontalListView;->fillRight(II)V

    .line 828
    :goto_1
    return-void

    .line 826
    :cond_1
    add-int/lit8 v3, p1, 0x1

    iput v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    goto :goto_1
.end method

.method private fillRight(II)V
    .locals 5
    .parameter "pos"
    .parameter "nextLeft"

    .prologue
    .line 831
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingTop()I

    move-result v0

    .line 832
    .local v0, childrenTop:I
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v4

    sub-int v1, v3, v4

    .line 834
    .local v1, listRight:I
    :goto_0
    if-ge p2, v1, :cond_0

    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-ge p1, v3, :cond_0

    .line 835
    const/4 v3, 0x1

    invoke-direct {p0, p1, p2, v0, v3}, Lco/vine/android/dragsort/HorizontalListView;->attachChild(IIIZ)Landroid/view/View;

    move-result-object v2

    .line 836
    .local v2, v:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v3

    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    add-int p2, v3, v4

    .line 837
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 839
    .end local v2           #v:Landroid/view/View;
    :cond_0
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    sub-int/2addr p2, v3

    .line 840
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-lez v3, :cond_2

    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-ne p1, v3, :cond_2

    invoke-direct {p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowRight()I

    move-result v3

    if-gez v3, :cond_2

    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    if-gtz v3, :cond_1

    invoke-direct {p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I

    move-result v3

    if-lez v3, :cond_2

    .line 842
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->detachAllViewsFromParent()V

    .line 843
    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    add-int/lit8 v3, v3, -0x1

    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    sub-int v4, v1, v4

    invoke-direct {p0, v3, v4}, Lco/vine/android/dragsort/HorizontalListView;->fillLeft(II)V

    .line 845
    :cond_2
    return-void
.end method

.method private getOverflowLeft()I
    .locals 4

    .prologue
    .line 781
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v2

    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    add-int v1, v2, v3

    .line 782
    .local v1, listLeft:I
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 783
    .local v0, firstChildLeft:I
    sub-int v2, v1, v0

    return v2
.end method

.method private getOverflowRight()I
    .locals 4

    .prologue
    .line 772
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    sub-int v1, v2, v3

    .line 773
    .local v1, listRight:I
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v0

    .line 774
    .local v0, lastChildRight:I
    sub-int v2, v0, v1

    return v2
.end method

.method private layoutChild(Landroid/view/View;IIZZ)V
    .locals 14
    .parameter "child"
    .parameter "x"
    .parameter "y"
    .parameter "right"
    .parameter "recycled"

    .prologue
    .line 880
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    .line 882
    .local v9, p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    if-nez v9, :cond_0

    .line 883
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    .end local v9           #p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    check-cast v9, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    .line 884
    .restart local v9       #p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    invoke-virtual {p1, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 886
    :cond_0
    if-eqz p5, :cond_3

    .line 887
    if-eqz p4, :cond_2

    const/4 v11, -0x1

    :goto_0
    invoke-virtual {p0, p1, v11, v9}, Lco/vine/android/dragsort/HorizontalListView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 892
    :goto_1
    if-eqz p5, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v11

    if-eqz v11, :cond_5

    :cond_1
    const/4 v8, 0x1

    .line 893
    .local v8, needToMeasure:Z
    :goto_2
    if-eqz v8, :cond_8

    .line 894
    iget v11, p0, Lco/vine/android/dragsort/HorizontalListView;->mHeightMeasureSpec:I

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingTop()I

    move-result v12

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingBottom()I

    move-result v13

    add-int/2addr v12, v13

    iget v13, v9, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;->height:I

    invoke-static {v11, v12, v13}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v2

    .line 896
    .local v2, childHeightSpec:I
    iget v11, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildFillWidth:I

    if-lez v11, :cond_6

    iget v7, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildFillWidth:I

    .line 898
    .local v7, lpWidth:I
    :goto_3
    if-lez v7, :cond_7

    .line 899
    const/high16 v11, 0x4000

    invoke-static {v7, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 903
    .local v5, childWidthSpec:I
    :goto_4
    invoke-virtual {p1, v5, v2}, Landroid/view/View;->measure(II)V

    .line 908
    .end local v2           #childHeightSpec:I
    .end local v5           #childWidthSpec:I
    .end local v7           #lpWidth:I
    :goto_5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    .line 909
    .local v10, w:I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    .line 910
    .local v6, h:I
    if-eqz p4, :cond_9

    move/from16 v3, p2

    .line 912
    .local v3, childLeft:I
    :goto_6
    if-eqz v8, :cond_a

    .line 913
    add-int v4, v3, v10

    .line 914
    .local v4, childRight:I
    add-int v1, p3, v6

    .line 915
    .local v1, childBottom:I
    move/from16 v0, p3

    invoke-virtual {p1, v3, v0, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 920
    .end local v1           #childBottom:I
    .end local v4           #childRight:I
    :goto_7
    return-void

    .line 887
    .end local v3           #childLeft:I
    .end local v6           #h:I
    .end local v8           #needToMeasure:Z
    .end local v10           #w:I
    :cond_2
    const/4 v11, 0x0

    goto :goto_0

    .line 889
    :cond_3
    if-eqz p4, :cond_4

    const/4 v11, -0x1

    :goto_8
    const/4 v12, 0x1

    invoke-virtual {p0, p1, v11, v9, v12}, Lco/vine/android/dragsort/HorizontalListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    goto :goto_1

    :cond_4
    const/4 v11, 0x0

    goto :goto_8

    .line 892
    :cond_5
    const/4 v8, 0x0

    goto :goto_2

    .line 896
    .restart local v2       #childHeightSpec:I
    .restart local v8       #needToMeasure:Z
    :cond_6
    iget v7, v9, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;->width:I

    goto :goto_3

    .line 901
    .restart local v7       #lpWidth:I
    :cond_7
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v11, v12}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .restart local v5       #childWidthSpec:I
    goto :goto_4

    .line 905
    .end local v2           #childHeightSpec:I
    .end local v5           #childWidthSpec:I
    .end local v7           #lpWidth:I
    :cond_8
    invoke-virtual {p0, p1}, Lco/vine/android/dragsort/HorizontalListView;->cleanupLayoutState(Landroid/view/View;)V

    goto :goto_5

    .line 910
    .restart local v6       #h:I
    .restart local v10       #w:I
    :cond_9
    sub-int v3, p2, v10

    goto :goto_6

    .line 917
    .restart local v3       #childLeft:I
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v11

    sub-int v11, v3, v11

    invoke-virtual {p1, v11}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 918
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v11

    sub-int v11, p3, v11

    invoke-virtual {p1, v11}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_7
.end method

.method private measureChild(Landroid/view/View;I)V
    .locals 7
    .parameter "child"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v6, 0x0

    .line 352
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    .line 353
    .local v3, p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    if-nez v3, :cond_0

    .line 354
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .end local v3           #p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    check-cast v3, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    .line 355
    .restart local v3       #p:Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 358
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingBottom()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, v3, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;->height:I

    invoke-static {p2, v4, v5}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v0

    .line 360
    .local v0, childHeightSpec:I
    iget v2, v3, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;->width:I

    .line 362
    .local v2, lpWidth:I
    if-lez v2, :cond_1

    .line 363
    const/high16 v4, 0x4000

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 367
    .local v1, childWidthSpec:I
    :goto_0
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 368
    return-void

    .line 365
    .end local v1           #childWidthSpec:I
    :cond_1
    invoke-static {v6, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .restart local v1       #childWidthSpec:I
    goto :goto_0
.end method

.method private obtainView(I[Z)Landroid/view/View;
    .locals 4
    .parameter "position"
    .parameter "isRecycled"

    .prologue
    .line 863
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    invoke-virtual {v2, p1}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->removeRecycleView(I)Landroid/view/View;

    move-result-object v1

    .line 864
    .local v1, convertView:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 865
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2, p1, v1, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 868
    .local v0, child:Landroid/view/View;
    if-eq v0, v1, :cond_0

    .line 869
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    invoke-virtual {v2, v1, p1}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 876
    :goto_0
    return-object v0

    .line 871
    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    aput-boolean v3, p2, v2

    goto :goto_0

    .line 874
    .end local v0           #child:Landroid/view/View;
    :cond_1
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .restart local v0       #child:Landroid/view/View;
    goto :goto_0
.end method

.method private performLongPress(Landroid/view/View;IJ)Z
    .locals 7
    .parameter "child"
    .parameter "longPressPosition"
    .parameter "longPressId"

    .prologue
    .line 1345
    const/4 v6, 0x0

    .line 1347
    .local v6, handled:Z
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    if-eqz v0, :cond_0

    .line 1348
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    move-result v6

    .line 1351
    :cond_0
    if-eqz v6, :cond_1

    .line 1352
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/dragsort/HorizontalListView;->performHapticFeedback(I)Z

    .line 1354
    :cond_1
    return v6
.end method

.method private recycleVelocityTracker()V
    .locals 1

    .prologue
    .line 459
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 460
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 461
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 956
    instance-of v0, p1, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    return v0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .parameter "canvas"

    .prologue
    .line 1005
    move-object/from16 v0, p0

    iget v6, v0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    .line 1006
    .local v6, dividerWidth:I
    if-lez v6, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDivider:Landroid/graphics/drawable/Drawable;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    const/4 v7, 0x1

    .line 1008
    .local v7, drawDividers:Z
    :goto_0
    if-eqz v7, :cond_8

    .line 1010
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 1011
    .local v3, bounds:Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v17

    move/from16 v0, v17

    iput v0, v3, Landroid/graphics/Rect;->left:I

    .line 1012
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v17

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v18

    sub-int v17, v17, v18

    move/from16 v0, v17

    iput v0, v3, Landroid/graphics/Rect;->right:I

    .line 1014
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v5

    .line 1015
    .local v5, count:I
    move-object/from16 v0, p0

    iget v11, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 1016
    .local v11, first:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 1017
    .local v2, adapter:Landroid/widget/ListAdapter;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getScrollX()I

    move-result v16

    .line 1022
    .local v16, scrollX:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->isOpaque()Z

    move-result v17

    if-eqz v17, :cond_4

    invoke-super/range {p0 .. p0}, Landroid/widget/AdapterView;->isOpaque()Z

    move-result v17

    if-nez v17, :cond_4

    const/4 v10, 0x1

    .line 1024
    .local v10, fillForMissingDividers:Z
    :goto_1
    if-eqz v10, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDividerPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    if-nez v17, :cond_0

    .line 1025
    new-instance v17, Landroid/graphics/Paint;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mDividerPaint:Landroid/graphics/Paint;

    .line 1027
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/dragsort/HorizontalListView;->mDividerPaint:Landroid/graphics/Paint;

    .line 1030
    .local v15, paint:Landroid/graphics/Paint;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mClipToPadding:Z

    move/from16 v17, v0

    if-eqz v17, :cond_5

    .line 1031
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v8

    .line 1032
    .local v8, effectivePaddingLeft:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v9

    .line 1038
    .local v9, effectivePaddingRight:I
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v17

    add-int v17, v17, v16

    sub-int v14, v17, v9

    .line 1041
    .local v14, listRight:I
    const/4 v12, 0x0

    .local v12, i:I
    :goto_3
    if-ge v12, v5, :cond_7

    .line 1042
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 1043
    .local v4, child:Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v13

    .line 1045
    .local v13, left:I
    if-le v13, v8, :cond_2

    .line 1046
    add-int v17, v11, v12

    move/from16 v0, v17

    invoke-interface {v2, v0}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v17

    if-eqz v17, :cond_6

    add-int/lit8 v17, v5, -0x1

    move/from16 v0, v17

    if-eq v12, v0, :cond_1

    add-int v17, v11, v12

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    invoke-interface {v2, v0}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 1048
    :cond_1
    sub-int v17, v13, v6

    move/from16 v0, v17

    iput v0, v3, Landroid/graphics/Rect;->left:I

    .line 1049
    iput v13, v3, Landroid/graphics/Rect;->right:I

    .line 1054
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lco/vine/android/dragsort/HorizontalListView;->drawDivider(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 1041
    :cond_2
    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 1006
    .end local v2           #adapter:Landroid/widget/ListAdapter;
    .end local v3           #bounds:Landroid/graphics/Rect;
    .end local v4           #child:Landroid/view/View;
    .end local v5           #count:I
    .end local v7           #drawDividers:Z
    .end local v8           #effectivePaddingLeft:I
    .end local v9           #effectivePaddingRight:I
    .end local v10           #fillForMissingDividers:Z
    .end local v11           #first:I
    .end local v12           #i:I
    .end local v13           #left:I
    .end local v14           #listRight:I
    .end local v15           #paint:Landroid/graphics/Paint;
    .end local v16           #scrollX:I
    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 1022
    .restart local v2       #adapter:Landroid/widget/ListAdapter;
    .restart local v3       #bounds:Landroid/graphics/Rect;
    .restart local v5       #count:I
    .restart local v7       #drawDividers:Z
    .restart local v11       #first:I
    .restart local v16       #scrollX:I
    :cond_4
    const/4 v10, 0x0

    goto :goto_1

    .line 1034
    .restart local v10       #fillForMissingDividers:Z
    .restart local v15       #paint:Landroid/graphics/Paint;
    :cond_5
    const/4 v8, 0x0

    .line 1035
    .restart local v8       #effectivePaddingLeft:I
    const/4 v9, 0x0

    .restart local v9       #effectivePaddingRight:I
    goto :goto_2

    .line 1055
    .restart local v4       #child:Landroid/view/View;
    .restart local v12       #i:I
    .restart local v13       #left:I
    .restart local v14       #listRight:I
    :cond_6
    if-eqz v10, :cond_2

    .line 1056
    sub-int v17, v13, v6

    move/from16 v0, v17

    iput v0, v3, Landroid/graphics/Rect;->left:I

    .line 1057
    iput v13, v3, Landroid/graphics/Rect;->right:I

    .line 1058
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v15}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_4

    .line 1063
    .end local v4           #child:Landroid/view/View;
    .end local v13           #left:I
    :cond_7
    if-lez v5, :cond_8

    if-lez v16, :cond_8

    if-eqz v7, :cond_8

    .line 1064
    iput v14, v3, Landroid/graphics/Rect;->left:I

    .line 1065
    add-int v17, v14, v6

    move/from16 v0, v17

    iput v0, v3, Landroid/graphics/Rect;->right:I

    .line 1066
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v3}, Lco/vine/android/dragsort/HorizontalListView;->drawDivider(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 1071
    .end local v2           #adapter:Landroid/widget/ListAdapter;
    .end local v3           #bounds:Landroid/graphics/Rect;
    .end local v5           #count:I
    .end local v8           #effectivePaddingLeft:I
    .end local v9           #effectivePaddingRight:I
    .end local v10           #fillForMissingDividers:Z
    .end local v11           #first:I
    .end local v12           #i:I
    .end local v14           #listRight:I
    .end local v15           #paint:Landroid/graphics/Paint;
    .end local v16           #scrollX:I
    :cond_8
    invoke-super/range {p0 .. p1}, Landroid/widget/AdapterView;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 1072
    return-void
.end method

.method drawDivider(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 1
    .parameter "canvas"
    .parameter "bounds"

    .prologue
    .line 1082
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 1083
    .local v0, divider:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 1084
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1085
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .prologue
    .line 951
    new-instance v0, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lco/vine/android/dragsort/HorizontalListView;->generateLayoutParams(Landroid/util/AttributeSet;)Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 966
    new-instance v0, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    invoke-direct {v0, p1}, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Lco/vine/android/dragsort/HorizontalListView$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 961
    new-instance v0, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lco/vine/android/dragsort/HorizontalListView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 46
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getDividerWidth()I
    .locals 1

    .prologue
    .line 1503
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    return v0
.end method

.method public getFirstVisiblePosition()I
    .locals 1

    .prologue
    .line 227
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    return v0
.end method

.method public getLastVisiblePosition()I
    .locals 2

    .prologue
    .line 232
    iget v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    .prologue
    .line 280
    const/4 v0, 0x0

    return-object v0
.end method

.method protected layoutChildren()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 923
    iget-boolean v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    .line 924
    .local v1, dataChanged:Z
    iget v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 925
    .local v2, firstPos:I
    iget-object v5, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    .line 926
    .local v5, recyler:Lco/vine/android/dragsort/HorizontalListView$Recycler;
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v0

    .line 927
    .local v0, childCount:I
    invoke-virtual {p0, v8}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 929
    .local v4, prevFirst:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 931
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 932
    invoke-virtual {p0, v3}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    add-int v7, v2, v3

    invoke-virtual {v5, v6, v7}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 931
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 935
    .end local v3           #i:I
    :cond_0
    invoke-virtual {v5, v2, v0}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->fillActiveViews(II)V

    .line 938
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->detachAllViewsFromParent()V

    .line 940
    if-nez v4, :cond_2

    .line 941
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v6

    iget v7, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    add-int/2addr v6, v7

    invoke-direct {p0, v2, v6}, Lco/vine/android/dragsort/HorizontalListView;->fillRight(II)V

    .line 945
    :goto_1
    invoke-virtual {v5}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->recycleActiveViews()V

    .line 946
    iput-boolean v8, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    .line 947
    return-void

    .line 943
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-direct {p0, v2, v6}, Lco/vine/android/dragsort/HorizontalListView;->fillRight(II)V

    goto :goto_1
.end method

.method final measureWidthOfChildren(IIIII)I
    .locals 10
    .parameter "heightMeasureSpec"
    .parameter "startPosition"
    .parameter "endPosition"
    .parameter "maxWidth"
    .parameter "disallowPartialChildPosition"

    .prologue
    const/4 v9, -0x1

    .line 398
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 399
    .local v0, adapter:Landroid/widget/ListAdapter;
    if-nez v0, :cond_1

    .line 400
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v8

    add-int v4, v7, v8

    .line 443
    :cond_0
    :goto_0
    return v4

    .line 404
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v8

    add-int v6, v7, v8

    .line 407
    .local v6, returnedWidth:I
    const/4 v4, 0x0

    .line 411
    .local v4, prevWidthWithoutPartialChild:I
    if-ne p3, v9, :cond_2

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v7

    add-int/lit8 p3, v7, -0x1

    .line 412
    :cond_2
    iget-object v5, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    .line 413
    .local v5, recycleBin:Lco/vine/android/dragsort/HorizontalListView$Recycler;
    iget-object v3, p0, Lco/vine/android/dragsort/HorizontalListView;->mIsRecycled:[Z

    .line 415
    .local v3, isRecycled:[Z
    move v2, p2

    .local v2, i:I
    :goto_1
    if-gt v2, p3, :cond_6

    .line 416
    invoke-direct {p0, v2, v3}, Lco/vine/android/dragsort/HorizontalListView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v1

    .line 418
    .local v1, child:Landroid/view/View;
    invoke-direct {p0, v1, p1}, Lco/vine/android/dragsort/HorizontalListView;->measureChild(Landroid/view/View;I)V

    .line 421
    invoke-virtual {v5, v1, v9}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 423
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v6, v7

    .line 425
    if-lt v6, p4, :cond_4

    .line 428
    if-ltz p5, :cond_3

    if-le v2, p5, :cond_3

    if-lez v4, :cond_3

    if-ne v6, p4, :cond_0

    :cond_3
    move v4, p4

    goto :goto_0

    .line 436
    :cond_4
    if-ltz p5, :cond_5

    if-lt v2, p5, :cond_5

    .line 437
    move v4, v6

    .line 415
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .end local v1           #child:Landroid/view/View;
    :cond_6
    move v4, v6

    .line 443
    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 245
    invoke-super {p0}, Landroid/widget/AdapterView;->onDetachedFromWindow()V

    .line 246
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    invoke-virtual {v0}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->clear()V

    .line 247
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    invoke-virtual {p0, v0}, Lco/vine/android/dragsort/HorizontalListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 250
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 3
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 448
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    .line 449
    if-eqz p1, :cond_0

    .line 450
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v0

    .line 451
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 452
    invoke-virtual {p0, v1}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->forceLayout()V

    .line 451
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 455
    .end local v0           #childCount:I
    .end local v1           #i:I
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->layoutChildren()V

    .line 456
    return-void
.end method

.method protected onMeasure(II)V
    .locals 15
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 296
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v14

    .line 297
    .local v14, widthMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v12

    .line 298
    .local v12, heightMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 299
    .local v5, widthSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v13

    .line 304
    .local v13, heightSize:I
    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v1, :cond_5

    const/4 v1, 0x0

    :goto_0
    iput v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    .line 305
    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-lez v1, :cond_6

    if-eqz v14, :cond_0

    if-nez v12, :cond_6

    .line 307
    :cond_0
    const/4 v1, 0x0

    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mIsRecycled:[Z

    invoke-direct {p0, v1, v2}, Lco/vine/android/dragsort/HorizontalListView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v7

    .line 309
    .local v7, child:Landroid/view/View;
    move/from16 v0, p2

    invoke-direct {p0, v7, v0}, Lco/vine/android/dragsort/HorizontalListView;->measureChild(Landroid/view/View;I)V

    .line 311
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    .line 312
    .local v10, childWidth:I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    .line 315
    .local v9, childHeight:I
    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    const/4 v2, -0x1

    invoke-virtual {v1, v7, v2}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 321
    .end local v7           #child:Landroid/view/View;
    :goto_1
    if-nez v14, :cond_7

    .line 322
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v2

    add-int/2addr v1, v2

    add-int v5, v1, v10

    .line 328
    :cond_1
    :goto_2
    if-nez v12, :cond_2

    .line 329
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    add-int v13, v1, v9

    .line 332
    :cond_2
    const/4 v1, 0x0

    iput v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildFillWidth:I

    .line 333
    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mFillWidthHeightRatio:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_3

    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-lez v1, :cond_3

    .line 334
    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    iget v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    add-int/lit8 v2, v2, -0x1

    mul-int v11, v1, v2

    .line 335
    .local v11, dividersWidth:I
    iget v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    mul-int/lit8 v1, v1, 0x2

    sub-int v1, v5, v1

    sub-int/2addr v1, v11

    iget v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    div-int v8, v1, v2

    .line 338
    .local v8, childFillWidth:I
    if-lt v8, v13, :cond_3

    int-to-float v1, v8

    iget v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mFillWidthHeightRatio:F

    int-to-float v3, v13

    mul-float/2addr v2, v3

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_3

    .line 340
    iput v8, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildFillWidth:I

    .line 343
    .end local v8           #childFillWidth:I
    .end local v11           #dividersWidth:I
    :cond_3
    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildWidthListener:Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;

    if-eqz v1, :cond_4

    .line 344
    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildWidthListener:Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;

    iget v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildFillWidth:I

    invoke-interface {v1, v2}, Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;->onChildWidthMeasured(I)V

    .line 347
    :cond_4
    invoke-virtual {p0, v5, v13}, Lco/vine/android/dragsort/HorizontalListView;->setMeasuredDimension(II)V

    .line 348
    move/from16 v0, p2

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mHeightMeasureSpec:I

    .line 349
    return-void

    .line 304
    .end local v9           #childHeight:I
    .end local v10           #childWidth:I
    :cond_5
    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    goto/16 :goto_0

    .line 317
    :cond_6
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getSuggestedMinimumWidth()I

    move-result v10

    .line 318
    .restart local v10       #childWidth:I
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getSuggestedMinimumHeight()I

    move-result v9

    .restart local v9       #childHeight:I
    goto :goto_1

    .line 323
    :cond_7
    const/high16 v1, -0x8000

    if-ne v14, v1, :cond_1

    .line 325
    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v6, -0x1

    move-object v1, p0

    move/from16 v2, p2

    invoke-virtual/range {v1 .. v6}, Lco/vine/android/dragsort/HorizontalListView;->measureWidthOfChildren(IIIII)I

    move-result v5

    goto :goto_2
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 22
    .parameter "event"

    .prologue
    .line 465
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    move/from16 v19, v0

    if-nez v19, :cond_1

    .line 466
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    const/16 v20, 0x0

    cmpg-float v19, v19, v20

    if-ltz v19, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpl-float v19, v19, v20

    if-gtz v19, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v19

    const/16 v20, 0x0

    cmpg-float v19, v19, v20

    if-ltz v19, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpl-float v19, v19, v20

    if-gtz v19, :cond_0

    const/16 v19, 0x1

    .line 667
    :goto_0
    return v19

    .line 466
    :cond_0
    const/16 v19, 0x0

    goto :goto_0

    .line 470
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v19, v0

    if-nez v19, :cond_2

    .line 471
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 473
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 475
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v19

    move/from16 v0, v19

    and-int/lit16 v4, v0, 0xff

    .line 476
    .local v4, action:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v17, v0

    .line 477
    .local v17, x:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v18, v0

    .line 479
    .local v18, y:I
    packed-switch v4, :pswitch_data_0

    .line 667
    :cond_3
    :goto_1
    const/16 v19, 0x1

    goto :goto_0

    .line 481
    :pswitch_0
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lco/vine/android/dragsort/HorizontalListView;->pointToPosition(II)I

    move-result v11

    .line 482
    .local v11, motionPosition:I
    move-object/from16 v0, p0

    iput v11, v0, Lco/vine/android/dragsort/HorizontalListView;->mDownPosition:I

    .line 483
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    move/from16 v19, v0

    if-nez v19, :cond_5

    .line 484
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    const/16 v20, 0x4

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_5

    if-ltz v11, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 488
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    .line 489
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    move-object/from16 v19, v0

    if-nez v19, :cond_4

    .line 490
    new-instance v19, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/dragsort/HorizontalListView$CheckForTap;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    .line 492
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    move-object/from16 v19, v0

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/dragsort/HorizontalListView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 497
    :cond_5
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->disallowParentIntercept(Z)V

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFlingRunnable:Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->stop()V

    .line 501
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    .line 502
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    .line 503
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    .line 504
    move-object/from16 v0, p0

    iput v11, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I

    goto/16 :goto_1

    .line 508
    .end local v11           #motionPosition:I
    :pswitch_1
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    packed-switch v19, :pswitch_data_1

    .line 579
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/vine/android/dragsort/HorizontalListView;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 580
    .local v15, velocityTracker:Landroid/view/VelocityTracker;
    const/16 v19, 0x3e8

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMaximumFlingVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 581
    invoke-virtual {v15}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v16

    .line 583
    .local v16, velocityX:F
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->abs(F)F

    move-result v19

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMinimumFlingVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpl-float v19, v19, v20

    if-lez v19, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFingerScrollEnabled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_6

    .line 584
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFlingRunnable:Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;

    move-object/from16 v19, v0

    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lco/vine/android/dragsort/HorizontalListView$FlingRunnable;->start(I)V

    .line 589
    .end local v15           #velocityTracker:Landroid/view/VelocityTracker;
    .end local v16           #velocityX:F
    :cond_6
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getHandler()Landroid/os/Handler;

    move-result-object v8

    .line 590
    .local v8, handler:Landroid/os/Handler;
    if-eqz v8, :cond_7

    .line 591
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 593
    :cond_7
    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->recycleVelocityTracker()V

    .line 594
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    .line 595
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    .line 596
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    goto/16 :goto_1

    .line 512
    .end local v8           #handler:Landroid/os/Handler;
    :pswitch_2
    move-object/from16 v0, p0

    iget v11, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I

    .line 513
    .restart local v11       #motionPosition:I
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    move/from16 v19, v0

    sub-int v19, v11, v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 515
    .local v5, child:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v19

    move/from16 v0, v17

    move/from16 v1, v19

    if-le v0, v1, :cond_e

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v17

    move/from16 v1, v19

    if-ge v0, v1, :cond_e

    const/4 v9, 0x1

    .line 518
    .local v9, inList:Z
    :goto_3
    if-eqz v5, :cond_11

    invoke-virtual {v5}, Landroid/view/View;->hasFocusable()Z

    move-result v19

    if-nez v19, :cond_11

    if-eqz v9, :cond_11

    .line 519
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    if-eqz v19, :cond_8

    .line 520
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/view/View;->setPressed(Z)V

    .line 523
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPerformClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    move-object/from16 v19, v0

    if-nez v19, :cond_9

    .line 524
    new-instance v19, Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/dragsort/HorizontalListView$PerformClick;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mPerformClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    .line 527
    :cond_9
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/vine/android/dragsort/HorizontalListView;->mPerformClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;

    .line 528
    .local v12, performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;
    iput v11, v12, Lco/vine/android/dragsort/HorizontalListView$PerformClick;->clickMotionPosition:I

    .line 529
    invoke-virtual {v12}, Lco/vine/android/dragsort/HorizontalListView$PerformClick;->rememberWindowAttachCount()V

    .line 531
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    if-eqz v19, :cond_a

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_10

    .line 532
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getHandler()Landroid/os/Handler;

    move-result-object v8

    .line 533
    .restart local v8       #handler:Landroid/os/Handler;
    if-eqz v8, :cond_b

    .line 534
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForTap:Lco/vine/android/dragsort/HorizontalListView$CheckForTap;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 536
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    move/from16 v19, v0

    if-nez v19, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v19

    if-eqz v19, :cond_f

    .line 537
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    .line 539
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->layoutChildren()V

    .line 540
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Landroid/view/View;->setPressed(Z)V

    .line 542
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->setPressed(Z)V

    .line 543
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    if-eqz v19, :cond_c

    .line 544
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mSelector:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 545
    .local v6, d:Landroid/graphics/drawable/Drawable;
    if-eqz v6, :cond_c

    instance-of v0, v6, Landroid/graphics/drawable/TransitionDrawable;

    move/from16 v19, v0

    if-eqz v19, :cond_c

    .line 546
    check-cast v6, Landroid/graphics/drawable/TransitionDrawable;

    .end local v6           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v6}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 549
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchModeReset:Ljava/lang/Runnable;

    move-object/from16 v19, v0

    if-eqz v19, :cond_d

    .line 550
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchModeReset:Ljava/lang/Runnable;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 552
    :cond_d
    new-instance v19, Lco/vine/android/dragsort/HorizontalListView$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5, v12}, Lco/vine/android/dragsort/HorizontalListView$1;-><init>(Lco/vine/android/dragsort/HorizontalListView;Landroid/view/View;Lco/vine/android/dragsort/HorizontalListView$PerformClick;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchModeReset:Ljava/lang/Runnable;

    .line 562
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchModeReset:Ljava/lang/Runnable;

    move-object/from16 v19, v0

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/dragsort/HorizontalListView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 567
    :goto_4
    const/16 v19, 0x1

    goto/16 :goto_0

    .line 515
    .end local v8           #handler:Landroid/os/Handler;
    .end local v9           #inList:Z
    .end local v12           #performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;
    :cond_e
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 565
    .restart local v8       #handler:Landroid/os/Handler;
    .restart local v9       #inList:Z
    .restart local v12       #performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;
    :cond_f
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    goto :goto_4

    .line 568
    .end local v8           #handler:Landroid/os/Handler;
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDataChanged:Z

    move/from16 v19, v0

    if-nez v19, :cond_11

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mDownPosition:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionPosition:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v11}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v19

    if-eqz v19, :cond_11

    .line 570
    invoke-virtual {v12}, Lco/vine/android/dragsort/HorizontalListView$PerformClick;->run()V

    .line 574
    .end local v12           #performClick:Lco/vine/android/dragsort/HorizontalListView$PerformClick;
    :cond_11
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    goto/16 :goto_2

    .line 600
    .end local v5           #child:Landroid/view/View;
    .end local v9           #inList:Z
    .end local v11           #motionPosition:I
    :pswitch_3
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    move/from16 v19, v0

    const/high16 v20, -0x8000

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_1a

    .line 601
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v19

    if-nez v19, :cond_12

    .line 602
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    .line 603
    invoke-super/range {p0 .. p1}, Landroid/widget/AdapterView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v19

    goto/16 :goto_0

    .line 605
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getHandler()Landroid/os/Handler;

    move-result-object v8

    .line 606
    .restart local v8       #handler:Landroid/os/Handler;
    if-eqz v8, :cond_13

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mPendingCheckForLongPress:Lco/vine/android/dragsort/HorizontalListView$CheckForLongPress;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 611
    :cond_13
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    move/from16 v19, v0

    sub-int v13, v17, v19

    .line 612
    .local v13, rawDeltaX:I
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_18

    .line 613
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    move/from16 v19, v0

    if-nez v19, :cond_14

    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I

    move-result v19

    if-nez v19, :cond_14

    if-gtz v13, :cond_15

    :cond_14
    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowRight()I

    move-result v19

    if-nez v19, :cond_16

    if-gez v13, :cond_16

    .line 615
    :cond_15
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->disallowParentIntercept(Z)V

    goto/16 :goto_1

    .line 618
    :cond_16
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    move/from16 v19, v0

    const/high16 v20, -0x8000

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_17

    .line 619
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    move/from16 v19, v0

    sub-int v14, v18, v19

    .line 620
    .local v14, rawDeltaY:I
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchSlop:I

    move/from16 v19, v0

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_17

    .line 621
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v1}, Lco/vine/android/dragsort/HorizontalListView;->disallowParentIntercept(Z)V

    goto/16 :goto_1

    .line 625
    .end local v14           #rawDeltaY:I
    :cond_17
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchSlop:I

    move/from16 v19, v0

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_3

    .line 628
    const/16 v19, 0x3

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    .line 630
    :cond_18
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    move/from16 v19, v0

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_3

    .line 635
    if-lez v13, :cond_1b

    .line 636
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchSlop:I

    move/from16 v19, v0

    sub-int v7, v13, v19

    .line 641
    .local v7, deltaX:I
    :goto_5
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    move/from16 v19, v0

    const/high16 v20, -0x8000

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_1c

    .line 642
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    move/from16 v19, v0

    sub-int v10, v17, v19

    .line 646
    .local v10, incrementalDeltaX:I
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mFingerScrollEnabled:Z

    move/from16 v19, v0

    if-eqz v19, :cond_19

    .line 647
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v10}, Lco/vine/android/dragsort/HorizontalListView;->scroll(II)Z

    .line 649
    :cond_19
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    .line 651
    .end local v7           #deltaX:I
    .end local v8           #handler:Landroid/os/Handler;
    .end local v10           #incrementalDeltaX:I
    .end local v13           #rawDeltaX:I
    :cond_1a
    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    .line 652
    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    goto/16 :goto_1

    .line 638
    .restart local v8       #handler:Landroid/os/Handler;
    .restart local v13       #rawDeltaX:I
    :cond_1b
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/dragsort/HorizontalListView;->mTouchSlop:I

    move/from16 v19, v0

    add-int v7, v13, v19

    .restart local v7       #deltaX:I
    goto :goto_5

    .line 644
    :cond_1c
    move v10, v7

    .restart local v10       #incrementalDeltaX:I
    goto :goto_6

    .line 656
    .end local v7           #deltaX:I
    .end local v8           #handler:Landroid/os/Handler;
    .end local v10           #incrementalDeltaX:I
    .end local v13           #rawDeltaX:I
    :pswitch_4
    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->recycleVelocityTracker()V

    .line 657
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionX:I

    .line 658
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mMotionY:I

    .line 659
    const/high16 v19, -0x8000

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mLastX:I

    .line 660
    const/16 v19, -0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/dragsort/HorizontalListView;->mTouchMode:I

    goto/16 :goto_1

    .line 479
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 508
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public pointToPosition(II)I
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    .line 978
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchFrame:Landroid/graphics/Rect;

    .line 979
    .local v2, frame:Landroid/graphics/Rect;
    if-nez v2, :cond_0

    .line 980
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchFrame:Landroid/graphics/Rect;

    .line 981
    iget-object v2, p0, Lco/vine/android/dragsort/HorizontalListView;->mTouchFrame:Landroid/graphics/Rect;

    .line 984
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v1

    .line 985
    .local v1, count:I
    add-int/lit8 v3, v1, -0x1

    .local v3, i:I
    :goto_0
    if-ltz v3, :cond_2

    .line 986
    invoke-virtual {p0, v3}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 987
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 988
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 989
    iget v4, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    add-int/2addr v4, v3

    .line 992
    .end local v0           #child:Landroid/view/View;
    :goto_1
    return v4

    .line 985
    .restart local v0       #child:Landroid/view/View;
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 992
    .end local v0           #child:Landroid/view/View;
    :cond_2
    const/4 v4, -0x1

    goto :goto_1
.end method

.method public scroll(II)Z
    .locals 16
    .parameter "rawDeltaX"
    .parameter "incrementalDeltaX"

    .prologue
    .line 687
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v2

    .line 690
    .local v2, childCount:I
    if-gez p2, :cond_3

    const/4 v11, 0x1

    .line 691
    .local v11, scrollRight:Z
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingLeft()I

    move-result v8

    .line 692
    .local v8, listLeft:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getWidth()I

    move-result v14

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getPaddingRight()I

    move-result v15

    sub-int v9, v14, v15

    .line 693
    .local v9, listRight:I
    add-int/lit8 v14, v2, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v7

    .line 694
    .local v7, lastChildRight:I
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v4

    .line 699
    .local v4, firstChildLeft:I
    if-eqz v11, :cond_4

    .line 700
    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowRight()I

    move-result v10

    .line 705
    .local v10, overflowSpace:I
    :goto_1
    move-object/from16 v0, p0

    iget v5, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 706
    .local v5, firstVisiblePos:I
    if-eqz v11, :cond_6

    .line 707
    add-int v14, v5, v2

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    if-lt v14, v15, :cond_0

    add-int v14, v7, p1

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    sub-int v15, v9, v15

    if-lt v14, v15, :cond_5

    :cond_0
    const/4 v12, 0x1

    .line 713
    .local v12, shouldScroll:Z
    :goto_2
    if-eqz v12, :cond_d

    .line 714
    const/4 v13, 0x0

    .line 715
    .local v13, start:I
    const/4 v3, 0x0

    .line 716
    .local v3, count:I
    if-eqz v11, :cond_a

    .line 720
    const/4 v6, 0x0

    .local v6, i:I
    :goto_3
    if-ge v6, v2, :cond_1

    .line 721
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 722
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v14

    add-int v14, v14, p1

    if-lt v14, v8, :cond_9

    .line 741
    .end local v1           #child:Landroid/view/View;
    :cond_1
    if-lez v3, :cond_2

    .line 743
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v3}, Lco/vine/android/dragsort/HorizontalListView;->detachViewsFromParent(II)V

    .line 747
    if-eqz v11, :cond_2

    .line 748
    move-object/from16 v0, p0

    iget v14, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    add-int/2addr v14, v3

    move-object/from16 v0, p0

    iput v14, v0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 751
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getChildCount()I

    move-result v2

    .line 752
    const/4 v6, 0x0

    :goto_4
    if-ge v6, v2, :cond_b

    .line 753
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    move/from16 v0, p1

    invoke-virtual {v14, v0}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 752
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 690
    .end local v3           #count:I
    .end local v4           #firstChildLeft:I
    .end local v5           #firstVisiblePos:I
    .end local v6           #i:I
    .end local v7           #lastChildRight:I
    .end local v8           #listLeft:I
    .end local v9           #listRight:I
    .end local v10           #overflowSpace:I
    .end local v11           #scrollRight:Z
    .end local v12           #shouldScroll:Z
    .end local v13           #start:I
    :cond_3
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 702
    .restart local v4       #firstChildLeft:I
    .restart local v7       #lastChildRight:I
    .restart local v8       #listLeft:I
    .restart local v9       #listRight:I
    .restart local v11       #scrollRight:Z
    :cond_4
    invoke-direct/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->getOverflowLeft()I

    move-result v10

    .restart local v10       #overflowSpace:I
    goto :goto_1

    .line 707
    .restart local v5       #firstVisiblePos:I
    :cond_5
    const/4 v12, 0x0

    goto :goto_2

    .line 710
    :cond_6
    if-gtz v5, :cond_7

    add-int v14, v4, p1

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/dragsort/HorizontalListView;->mEdgePadding:I

    add-int/2addr v15, v8

    if-gt v14, v15, :cond_8

    :cond_7
    const/4 v12, 0x1

    .restart local v12       #shouldScroll:Z
    :goto_5
    goto :goto_2

    .end local v12           #shouldScroll:Z
    :cond_8
    const/4 v12, 0x0

    goto :goto_5

    .line 725
    .restart local v1       #child:Landroid/view/View;
    .restart local v3       #count:I
    .restart local v6       #i:I
    .restart local v12       #shouldScroll:Z
    .restart local v13       #start:I
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 726
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    add-int v15, v5, v6

    invoke-virtual {v14, v1, v15}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 720
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 731
    .end local v1           #child:Landroid/view/View;
    .end local v6           #i:I
    :cond_a
    add-int/lit8 v6, v2, -0x1

    .restart local v6       #i:I
    :goto_6
    if-ltz v6, :cond_1

    .line 732
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/dragsort/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 733
    .restart local v1       #child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v14

    add-int v14, v14, p1

    if-le v14, v9, :cond_1

    .line 736
    move v13, v6

    .line 737
    add-int/lit8 v3, v3, 0x1

    .line 738
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/dragsort/HorizontalListView;->mRecycler:Lco/vine/android/dragsort/HorizontalListView$Recycler;

    add-int v15, v5, v6

    invoke-virtual {v14, v1, v15}, Lco/vine/android/dragsort/HorizontalListView$Recycler;->addRecycleView(Landroid/view/View;I)V

    .line 731
    add-int/lit8 v6, v6, -0x1

    goto :goto_6

    .line 755
    .end local v1           #child:Landroid/view/View;
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 760
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v14

    if-ge v10, v14, :cond_c

    .line 761
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lco/vine/android/dragsort/HorizontalListView;->fillGap(Z)V

    .line 763
    :cond_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/dragsort/HorizontalListView;->mOnScrollListener:Lco/vine/android/dragsort/HorizontalListView$OnScrollListener;

    invoke-interface {v14}, Lco/vine/android/dragsort/HorizontalListView$OnScrollListener;->onScroll()V

    .line 765
    .end local v3           #count:I
    .end local v6           #i:I
    .end local v13           #start:I
    :cond_d
    return v12
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 46
    check-cast p1, Landroid/widget/ListAdapter;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/dragsort/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2
    .parameter "listAdapter"

    .prologue
    .line 257
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eq p1, v0, :cond_2

    .line 258
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-nez v0, :cond_0

    .line 259
    new-instance v0, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;

    invoke-direct {v0, p0}, Lco/vine/android/dragsort/HorizontalListView$AdapterDataSetObserver;-><init>(Lco/vine/android/dragsort/HorizontalListView;)V

    iput-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataSetObserver:Landroid/database/DataSetObserver;

    .line 261
    :cond_0
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_1

    .line 262
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 264
    :cond_1
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    .line 265
    if-eqz p1, :cond_3

    .line 266
    iget-object v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 267
    invoke-interface {p1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    .line 272
    :cond_2
    :goto_0
    return-void

    .line 269
    :cond_3
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mItemCount:I

    goto :goto_0
.end method

.method public setChildWidthListener(Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;)V
    .locals 0
    .parameter "widthListener"

    .prologue
    .line 1490
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mChildWidthListener:Lco/vine/android/dragsort/HorizontalListView$ChildWidthListener;

    .line 1491
    return-void
.end method

.method public setClipToPadding(Z)V
    .locals 0
    .parameter "clipToPadding"

    .prologue
    .line 1106
    invoke-super {p0, p1}, Landroid/widget/AdapterView;->setClipToPadding(Z)V

    .line 1107
    iput-boolean p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mClipToPadding:Z

    .line 1108
    return-void
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "divider"

    .prologue
    .line 1088
    if-eqz p1, :cond_0

    .line 1089
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    .line 1093
    :goto_0
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 1094
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->requestLayout()V

    .line 1095
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 1096
    return-void

    .line 1091
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    goto :goto_0
.end method

.method public setDividerWidth(I)V
    .locals 0
    .parameter "dividerWidth"

    .prologue
    .line 1099
    iput p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mDividerWidth:I

    .line 1100
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->requestLayout()V

    .line 1101
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 1102
    return-void
.end method

.method public setFingerScrollEnabled(Z)V
    .locals 0
    .parameter "shouldScroll"

    .prologue
    .line 1516
    iput-boolean p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mFingerScrollEnabled:Z

    .line 1517
    return-void
.end method

.method public setLongPressDuration(I)V
    .locals 0
    .parameter "longPresMillis"

    .prologue
    .line 1507
    iput p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mLongPressMillis:I

    .line 1508
    return-void
.end method

.method public setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 1499
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    .line 1500
    return-void
.end method

.method public setOnScrollListener(Lco/vine/android/dragsort/DragSortWidget;)V
    .locals 0
    .parameter "onScrollListener"

    .prologue
    .line 1111
    iput-object p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mOnScrollListener:Lco/vine/android/dragsort/HorizontalListView$OnScrollListener;

    .line 1112
    return-void
.end method

.method public setPressed(Z)V
    .locals 1
    .parameter "pressed"

    .prologue
    .line 997
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    .line 998
    invoke-super {p0, p1}, Landroid/widget/AdapterView;->setPressed(Z)V

    .line 1000
    :cond_0
    return-void
.end method

.method public setSelection(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 288
    iput p1, p0, Lco/vine/android/dragsort/HorizontalListView;->mFirstVisiblePos:I

    .line 289
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->detachAllViewsFromParent()V

    .line 290
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->layoutChildren()V

    .line 291
    invoke-virtual {p0}, Lco/vine/android/dragsort/HorizontalListView;->invalidate()V

    .line 292
    return-void
.end method
