.class public Lco/vine/android/BaseListFragment;
.super Lco/vine/android/BaseControllerFragment;
.source "BaseListFragment.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Lco/vine/android/widget/OnTabChangedListener;
.implements Lcom/twitter/android/widget/RefreshListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/BaseListFragment$OnScrollListener;,
        Lco/vine/android/BaseListFragment$ChangeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/vine/android/BaseControllerFragment;",
        "Landroid/widget/AbsListView$OnScrollListener;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lco/vine/android/widget/OnTabChangedListener;",
        "Lcom/twitter/android/widget/RefreshListener;"
    }
.end annotation


# static fields
.field public static final ARG_BG_COLOR:Ljava/lang/String; = "bg_color"

.field public static final ARG_CHOICE_MODE:Ljava/lang/String; = "chmode"

.field public static final ARG_DATA:Ljava/lang/String; = "data"

.field public static final ARG_EMPTY_DESC:Ljava/lang/String; = "empty_desc"

.field public static final ARG_OWNER_ID:Ljava/lang/String; = "owner_id"

.field public static final ARG_REFRESHABLE:Ljava/lang/String; = "refresh"

.field protected static final LOADER_ID_DEFAULT:I = 0x0

.field protected static final PROGRESS_FETCH_DATA:I = 0x3

.field protected static final PROGRESS_FETCH_DATA_NEW_AUTO:I = 0x4

.field protected static final PROGRESS_FETCH_NEWER:I = 0x2

.field protected static final PROGRESS_FETCH_OLDER:I = 0x1

.field protected static final PROGRESS_FIRST_USER:I = 0x6

.field protected static final PROGRESS_LOAD_DATA:I = 0x5

.field protected static final PROGRESS_LOAD_DATA_OLDER:I = 0x7

.field protected static final PROGRESS_NONE:I = 0x0

.field private static final STATE_CURRENT_REQ_IDS:Ljava/lang/String; = "pending_reqs"

.field private static final STATE_SCROLL_OFF_KEY:Ljava/lang/String; = "scroll_off"

.field private static final STATE_SCROLL_POS_KEY:Ljava/lang/String; = "scroll_pos"


# instance fields
.field protected mBgColor:I

.field protected mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

.field protected mChoiceMode:I

.field protected mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

.field private mEmpty:Landroid/view/View;

.field private mEmptyProgress:Landroid/widget/ProgressBar;

.field protected mEmptyText:Landroid/widget/TextView;

.field protected mEmptyTextStringRes:I

.field private mFocused:Z

.field private final mHandler:Landroid/os/Handler;

.field protected mListState:Lco/vine/android/ListState;

.field protected mListView:Landroid/widget/ListView;

.field private mLoaderId:I

.field private final mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private final mOnItemLongClickListenerClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

.field protected mOwnerId:J

.field protected mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

.field private mPendingRequests:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/PendingRequest;",
            ">;"
        }
    .end annotation
.end field

.field protected mProgressDialog:Landroid/app/ProgressDialog;

.field protected mRefreshable:Z

.field protected mRefreshing:Z

.field private final mRequestFocus:Ljava/lang/Runnable;

.field protected mSadface:Landroid/view/View;

.field private mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

.field private mScrollOffset:I

.field private mScrollPos:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lco/vine/android/BaseControllerFragment;-><init>()V

    .line 115
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/BaseListFragment;->mLoaderId:I

    .line 120
    new-instance v0, Lco/vine/android/BaseListFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/BaseListFragment$1;-><init>(Lco/vine/android/BaseListFragment;)V

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 127
    new-instance v0, Lco/vine/android/BaseListFragment$2;

    invoke-direct {v0, p0}, Lco/vine/android/BaseListFragment$2;-><init>(Lco/vine/android/BaseListFragment;)V

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mOnItemLongClickListenerClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    .line 134
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mHandler:Landroid/os/Handler;

    .line 136
    new-instance v0, Lco/vine/android/BaseListFragment$3;

    invoke-direct {v0, p0}, Lco/vine/android/BaseListFragment$3;-><init>(Lco/vine/android/BaseListFragment;)V

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mRequestFocus:Ljava/lang/Runnable;

    .line 902
    return-void
.end method

.method public static prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;
    .locals 3
    .parameter "intent"
    .parameter "refreshable"

    .prologue
    .line 863
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 864
    .local v0, args:Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 865
    new-instance v0, Landroid/os/Bundle;

    .end local v0           #args:Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 867
    .restart local v0       #args:Landroid/os/Bundle;
    :cond_0
    const-string v1, "data"

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 868
    const-string v1, "refresh"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 869
    return-object v0
.end method

.method private showLoading(Z)V
    .locals 4
    .parameter "show"

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x8

    .line 600
    if-eqz p1, :cond_2

    .line 601
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 602
    .local v0, l:Landroid/widget/ListView;
    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setVisibility(I)V

    .line 603
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 604
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 606
    :cond_0
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mEmptyProgress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 607
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mEmptyProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 619
    :cond_1
    :goto_0
    return-void

    .line 610
    .end local v0           #l:Landroid/widget/ListView;
    :cond_2
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 611
    .restart local v0       #l:Landroid/widget/ListView;
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 612
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_0

    .line 614
    :cond_3
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mEmptyProgress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1

    .line 615
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mEmptyProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method protected addRequest(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "reqId"

    .prologue
    .line 748
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    new-instance v1, Lco/vine/android/PendingRequest;

    invoke-direct {v1, p1}, Lco/vine/android/PendingRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 749
    return-object p1
.end method

.method protected addRequest(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .parameter "reqId"
    .parameter "fetchType"

    .prologue
    .line 756
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    new-instance v1, Lco/vine/android/PendingRequest;

    invoke-direct {v1, p1, p2}, Lco/vine/android/PendingRequest;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 757
    return-object p1
.end method

.method protected createDefaultView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .parameter "inflater"
    .parameter "container"

    .prologue
    .line 353
    const v0, 0x7f030044

    invoke-virtual {p0, p1, v0, p2}, Lco/vine/android/BaseListFragment;->createView(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected final createView(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .parameter "inflater"
    .parameter "layout"
    .parameter "container"

    .prologue
    .line 312
    const/4 v4, 0x0

    invoke-virtual {p1, p2, p3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 314
    .local v3, v:Landroid/view/View;
    const v4, 0x102000a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 315
    .local v2, listView:Landroid/widget/ListView;
    iget-object v4, p0, Lco/vine/android/BaseListFragment;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 316
    iget-object v4, p0, Lco/vine/android/BaseListFragment;->mOnItemLongClickListenerClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 317
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setScrollbarFadingEnabled(Z)V

    .line 318
    invoke-virtual {v2, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 319
    iget v4, p0, Lco/vine/android/BaseListFragment;->mChoiceMode:I

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 320
    iget v0, p0, Lco/vine/android/BaseListFragment;->mBgColor:I

    .line 321
    .local v0, bgColor:I
    if-eqz v0, :cond_0

    .line 322
    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 323
    invoke-virtual {v2, v0}, Landroid/widget/ListView;->setCacheColorHint(I)V

    .line 326
    :cond_0
    const v4, 0x1020004

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 327
    .local v1, emptyView:Landroid/view/View;
    if-eqz v1, :cond_1

    .line 328
    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 329
    const v4, 0x7f0a0145

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ProgressBar;

    iput-object v4, p0, Lco/vine/android/BaseListFragment;->mEmptyProgress:Landroid/widget/ProgressBar;

    .line 332
    :cond_1
    const v4, 0x7f0a0061

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lco/vine/android/BaseListFragment;->mEmptyText:Landroid/widget/TextView;

    .line 333
    iget v4, p0, Lco/vine/android/BaseListFragment;->mEmptyTextStringRes:I

    if-lez v4, :cond_2

    .line 334
    iget-object v4, p0, Lco/vine/android/BaseListFragment;->mEmptyText:Landroid/widget/TextView;

    if-eqz v4, :cond_2

    .line 335
    iget-object v4, p0, Lco/vine/android/BaseListFragment;->mEmptyText:Landroid/widget/TextView;

    iget v5, p0, Lco/vine/android/BaseListFragment;->mEmptyTextStringRes:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 339
    :cond_2
    const v4, 0x7f0a0060

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    .line 341
    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mEmpty:Landroid/view/View;

    .line 343
    iget-boolean v4, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v4, :cond_3

    move-object v4, v2

    .line 344
    check-cast v4, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v4, p0}, Lcom/twitter/android/widget/RefreshableListView;->setRefreshListener(Lcom/twitter/android/widget/RefreshListener;)V

    .line 347
    :cond_3
    iput-object v2, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 349
    return-object v3
.end method

.method protected dismissDialog()V
    .locals 1

    .prologue
    .line 843
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 844
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 845
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 847
    :cond_0
    return-void
.end method

.method public getFirstItemPosition()Lcom/twitter/android/widget/ItemPosition;
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 818
    iget-object v3, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 819
    .local v3, l:Landroid/widget/ListView;
    invoke-virtual {v3}, Landroid/widget/ListView;->getCount()I

    move-result v6

    const/4 v7, 0x1

    if-ge v6, v7, :cond_0

    const/4 v5, 0x0

    .line 838
    :goto_0
    return-object v5

    .line 820
    :cond_0
    invoke-virtual {v3}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 821
    .local v1, firstPos:I
    invoke-virtual {v3}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v2

    .line 823
    .local v2, headerCount:I
    iget-boolean v6, p0, Lco/vine/android/BaseListFragment;->mRefreshing:Z

    if-eqz v6, :cond_1

    .line 824
    add-int/lit8 v2, v2, 0x1

    .line 830
    :cond_1
    if-ge v1, v2, :cond_3

    .line 831
    move v4, v2

    .line 832
    .local v4, position:I
    sub-int v6, v4, v1

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 838
    .local v0, child:Landroid/view/View;
    :goto_1
    new-instance v6, Lcom/twitter/android/widget/ItemPosition;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->getItemIdAtPosition(I)J

    move-result-wide v7

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v5

    :cond_2
    invoke-direct {v6, v4, v7, v8, v5}, Lcom/twitter/android/widget/ItemPosition;-><init>(IJI)V

    move-object v5, v6

    goto :goto_0

    .line 834
    .end local v0           #child:Landroid/view/View;
    .end local v4           #position:I
    :cond_3
    move v4, v1

    .line 835
    .restart local v4       #position:I
    invoke-virtual {v3, v5}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .restart local v0       #child:Landroid/view/View;
    goto :goto_1
.end method

.method protected getIdColumnIndex()I
    .locals 1

    .prologue
    .line 741
    const/4 v0, -0x1

    return v0
.end method

.method public getPositionForItemId(J)I
    .locals 5
    .parameter "id"

    .prologue
    .line 706
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getIdColumnIndex()I

    move-result v1

    .line 708
    .local v1, idColumnIndex:I
    if-ltz v1, :cond_3

    .line 709
    iget-object v3, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v3}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 710
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_3

    .line 711
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 713
    :cond_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    cmp-long v3, v3, p1

    if-nez v3, :cond_2

    .line 714
    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    iget-object v4, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v4

    add-int v2, v3, v4

    .line 719
    .local v2, pos:I
    iget-boolean v3, p0, Lco/vine/android/BaseListFragment;->mRefreshing:Z

    if-eqz v3, :cond_1

    .line 720
    add-int/lit8 v2, v2, 0x1

    .line 729
    .end local v0           #cursor:Landroid/database/Cursor;
    .end local v2           #pos:I
    :cond_1
    :goto_0
    return v2

    .line 724
    .restart local v0       #cursor:Landroid/database/Cursor;
    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 729
    .end local v0           #cursor:Landroid/database/Cursor;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected handleContentChanged()V
    .locals 2

    .prologue
    .line 692
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getFirstItemPosition()Lcom/twitter/android/widget/ItemPosition;

    move-result-object v0

    .line 694
    .local v0, itemPosition:Lcom/twitter/android/widget/ItemPosition;
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->onContentChanged()V

    .line 698
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/BaseListFragment;->restoreItemPosition(Lcom/twitter/android/widget/ItemPosition;Z)V

    .line 699
    return-void
.end method

.method protected handlePendingCaptchaRequest()V
    .locals 4

    .prologue
    .line 931
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    if-eqz v1, :cond_1

    .line 932
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v1, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 934
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v2, v2, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    iget-object v3, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v3, v3, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    invoke-virtual {v1, v2, v3}, Lco/vine/android/client/AppController;->retryRequest(ILandroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lco/vine/android/BaseListFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 943
    :cond_0
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 945
    :cond_1
    return-void

    .line 936
    :cond_2
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v1, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 938
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->generateReqIdForCanceledCaptcha()Ljava/lang/String;

    move-result-object v0

    .line 939
    .local v0, newRequestToFail:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lco/vine/android/BaseListFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 940
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget v2, v2, Lco/vine/android/PendingCaptchaRequest;->actionCode:I

    iget-object v3, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v3, v3, Lco/vine/android/PendingCaptchaRequest;->bundle:Landroid/os/Bundle;

    invoke-virtual {v1, v0, v2, v3}, Lco/vine/android/client/AppController;->failRequest(Ljava/lang/String;ILandroid/os/Bundle;)V

    goto :goto_0
.end method

.method protected hasPendingRequest()Z
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hasPendingRequest(I)Z
    .locals 3
    .parameter "fetchType"

    .prologue
    .line 517
    if-eqz p1, :cond_1

    .line 518
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/PendingRequest;

    .line 519
    .local v1, req:Lco/vine/android/PendingRequest;
    iget v2, v1, Lco/vine/android/PendingRequest;->fetchType:I

    if-ne v2, p1, :cond_0

    .line 520
    const/4 v2, 0x1

    .line 524
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #req:Lco/vine/android/PendingRequest;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected hideProgress(I)V
    .locals 2
    .parameter "progressType"

    .prologue
    const/4 v1, 0x0

    .line 564
    packed-switch p1, :pswitch_data_0

    .line 592
    :cond_0
    :goto_0
    return-void

    .line 567
    :pswitch_0
    invoke-direct {p0, v1}, Lco/vine/android/BaseListFragment;->showLoading(Z)V

    goto :goto_0

    .line 573
    :pswitch_1
    invoke-direct {p0, v1}, Lco/vine/android/BaseListFragment;->showLoading(Z)V

    .line 574
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    .line 575
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView;->stopRefresh()V

    .line 576
    iput-boolean v1, p0, Lco/vine/android/BaseListFragment;->mRefreshing:Z

    goto :goto_0

    .line 582
    :pswitch_2
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    .line 583
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v0, v1}, Lcom/twitter/android/widget/RefreshableListView;->refreshMore(Z)V

    goto :goto_0

    .line 564
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected initLoader()V
    .locals 1

    .prologue
    .line 184
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/BaseListFragment;->initLoader(I)V

    .line 185
    return-void
.end method

.method protected final initLoader(I)V
    .locals 3
    .parameter "loaderId"

    .prologue
    .line 195
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    if-nez v0, :cond_0

    .line 196
    new-instance v0, Lco/vine/android/BaseListFragment$ChangeObserver;

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lco/vine/android/BaseListFragment$ChangeObserver;-><init>(Lco/vine/android/BaseListFragment;Landroid/os/Handler;)V

    iput-object v0, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    .line 197
    iput p1, p0, Lco/vine/android/BaseListFragment;->mLoaderId:I

    .line 199
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    iget v1, p0, Lco/vine/android/BaseListFragment;->mLoaderId:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 200
    return-void
.end method

.method invokeScrollFirstItem()V
    .locals 1

    .prologue
    .line 850
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

    if-eqz v0, :cond_0

    .line 851
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

    invoke-interface {v0}, Lco/vine/android/BaseListFragment$OnScrollListener;->onScrollFirstItem()V

    .line 853
    :cond_0
    return-void
.end method

.method protected isEmpty()Z
    .locals 3

    .prologue
    .line 595
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 596
    .local v0, l:Landroid/widget/ListView;
    invoke-virtual {v0}, Landroid/widget/ListView;->getCount()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/ListView;->getHeaderViewsCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/widget/ListView;->getFooterViewsCount()I

    move-result v2

    sub-int/2addr v1, v2

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected isFocused()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mFocused:Z

    return v0
.end method

.method protected loadCursor(Z)V
    .locals 0
    .parameter "restart"

    .prologue
    .line 222
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v2, 0x2

    .line 911
    packed-switch p1, :pswitch_data_0

    .line 928
    :cond_0
    :goto_0
    return-void

    .line 913
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    if-eqz v1, :cond_0

    if-eqz p3, :cond_0

    .line 914
    const-string v1, "rid"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 915
    .local v0, reqId:Ljava/lang/String;
    const/4 v1, -0x1

    if-ne p2, v1, :cond_1

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v1, v1, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 917
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iput v2, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    goto :goto_0

    .line 919
    :cond_1
    if-ne p2, v2, :cond_0

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    iget-object v1, v1, Lco/vine/android/PendingCaptchaRequest;->reqId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 921
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    const/4 v2, 0x3

    iput v2, v1, Lco/vine/android/PendingCaptchaRequest;->state:I

    goto :goto_0

    .line 911
    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
    .end packed-switch
.end method

.method protected onContentChanged()V
    .locals 0

    .prologue
    .line 702
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->onRefreshFinished()V

    .line 703
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 278
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 280
    new-instance v1, Lco/vine/android/ListState;

    invoke-direct {v1}, Lco/vine/android/ListState;-><init>()V

    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    .line 282
    if-eqz p1, :cond_1

    .line 283
    const-string v1, "scroll_pos"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lco/vine/android/BaseListFragment;->mScrollPos:I

    .line 284
    const-string v1, "scroll_off"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lco/vine/android/BaseListFragment;->mScrollOffset:I

    .line 285
    const-string v1, "pending_reqs"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    .line 286
    const-string v1, "state_pending_captcha_request"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/PendingCaptchaRequest;

    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    .line 293
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 294
    .local v0, args:Landroid/os/Bundle;
    if-eqz v0, :cond_2

    .line 295
    const-string v1, "refresh"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    .line 296
    const-string v1, "owner_id"

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/BaseListFragment;->mOwnerId:J

    .line 298
    const-string v1, "chmode"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 299
    const-string v1, "chmode"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lco/vine/android/BaseListFragment;->mChoiceMode:I

    .line 301
    :cond_0
    const-string v1, "bg_color"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lco/vine/android/BaseListFragment;->mBgColor:I

    .line 302
    const-string v1, "empty_desc"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lco/vine/android/BaseListFragment;->mEmptyTextStringRes:I

    .line 309
    :goto_1
    return-void

    .line 288
    .end local v0           #args:Landroid/os/Bundle;
    :cond_1
    iput v4, p0, Lco/vine/android/BaseListFragment;->mScrollPos:I

    .line 289
    iput v4, p0, Lco/vine/android/BaseListFragment;->mScrollOffset:I

    .line 290
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    goto :goto_0

    .line 304
    .restart local v0       #args:Landroid/os/Bundle;
    :cond_2
    iput-boolean v3, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    .line 305
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/BaseListFragment;->mOwnerId:J

    .line 306
    iput v4, p0, Lco/vine/android/BaseListFragment;->mChoiceMode:I

    .line 307
    iput v4, p0, Lco/vine/android/BaseListFragment;->mBgColor:I

    goto :goto_1
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .parameter "dialog"

    .prologue
    .line 883
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 1
    .parameter "id"
    .parameter "args"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 233
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 360
    invoke-virtual {p0, p1, p2}, Lco/vine/android/BaseListFragment;->createDefaultView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 377
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v1, :cond_0

    .line 381
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 382
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    if-eqz v1, :cond_0

    .line 383
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 387
    .end local v0           #cursor:Landroid/database/Cursor;
    :cond_0
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onDestroy()V

    .line 388
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 371
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 372
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onDestroyView()V

    .line 373
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 0
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 269
    return-void
.end method

.method protected onListItemLongClick(Landroid/widget/ListView;Landroid/view/View;IJ)Z
    .locals 1
    .parameter "parent"
    .parameter "view"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 272
    const/4 v0, 0x0

    return v0
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 2
    .parameter
    .parameter "cursor"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 245
    .local v0, oldCursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 246
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 248
    :cond_0
    if-eqz p2, :cond_1

    .line 249
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {p2, v1}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 251
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1, p2}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 252
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 47
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 261
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 262
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 263
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 265
    :cond_0
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 266
    return-void
.end method

.method public onMoveAway(I)V
    .locals 1
    .parameter "newPosition"

    .prologue
    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/BaseListFragment;->mFocused:Z

    .line 145
    return-void
.end method

.method public onMoveTo(I)V
    .locals 1
    .parameter "oldPosition"

    .prologue
    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/BaseListFragment;->mFocused:Z

    .line 150
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 414
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onPause()V

    .line 416
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->dismissDialog()V

    .line 420
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 421
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getFirstItemPosition()Lcom/twitter/android/widget/ItemPosition;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/BaseListFragment;->saveItemPosition(Lcom/twitter/android/widget/ItemPosition;)V

    .line 423
    :cond_0
    return-void
.end method

.method public onRefreshCancelled()V
    .locals 0

    .prologue
    .line 662
    return-void
.end method

.method public onRefreshFinished()V
    .locals 2

    .prologue
    .line 678
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 680
    .local v0, adapter:Landroid/support/v4/widget/CursorAdapter;
    if-eqz v0, :cond_0

    .line 681
    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 682
    .local v1, cursor:Landroid/database/Cursor;
    if-eqz v1, :cond_0

    .line 686
    .end local v1           #cursor:Landroid/database/Cursor;
    :cond_0
    return-void
.end method

.method public onRefreshFinishedNewData()V
    .locals 0

    .prologue
    .line 672
    return-void
.end method

.method public onRefreshFinishedNoChange()V
    .locals 0

    .prologue
    .line 675
    return-void
.end method

.method public onRefreshPulled()V
    .locals 0

    .prologue
    .line 658
    return-void
.end method

.method public onRefreshReleased(Z)V
    .locals 1
    .parameter "shouldStartRefresh"

    .prologue
    .line 665
    if-eqz p1, :cond_0

    .line 666
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackValidPullToRefreshRelease(Ljava/lang/String;)V

    .line 667
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->refresh()V

    .line 669
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 392
    invoke-super {p0}, Lco/vine/android/BaseControllerFragment;->onResume()V

    .line 398
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 399
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/PendingRequest;

    .line 400
    .local v1, req:Lco/vine/android/PendingRequest;
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, v1, Lco/vine/android/PendingRequest;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lco/vine/android/client/AppController;->isPendingRequest(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 401
    iget v2, v1, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {p0, v2}, Lco/vine/android/BaseListFragment;->showProgress(I)V

    .line 398
    :goto_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 403
    :cond_0
    iget v2, v1, Lco/vine/android/PendingRequest;->fetchType:I

    invoke-virtual {p0, v2}, Lco/vine/android/BaseListFragment;->hideProgress(I)V

    .line 404
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 408
    .end local v1           #req:Lco/vine/android/PendingRequest;
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->restorePosition()V

    .line 409
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->handlePendingCaptchaRequest()V

    .line 410
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 427
    invoke-super {p0, p1}, Lco/vine/android/BaseControllerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 428
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->savePosition()V

    .line 429
    const-string v0, "pending_reqs"

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 430
    const-string v0, "scroll_pos"

    iget v1, p0, Lco/vine/android/BaseListFragment;->mScrollPos:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 431
    const-string v0, "scroll_off"

    iget v1, p0, Lco/vine/android/BaseListFragment;->mScrollOffset:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 432
    const-string v0, "state_pending_captcha_request"

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mPendingCaptchaRequest:Lco/vine/android/PendingCaptchaRequest;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 433
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 4
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    .line 439
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iput p2, v2, Lco/vine/android/ListState;->firstVisibleItem:I

    .line 440
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iput p3, v2, Lco/vine/android/ListState;->visibleItemCount:I

    .line 441
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iput p4, v2, Lco/vine/android/ListState;->totalItemCount:I

    .line 443
    if-nez p3, :cond_1

    .line 466
    :cond_0
    :goto_0
    return-void

    .line 447
    :cond_1
    if-nez p2, :cond_2

    .line 448
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

    if-eqz v2, :cond_2

    .line 449
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

    invoke-interface {v2}, Lco/vine/android/BaseListFragment$OnScrollListener;->onScrollFirstItem()V

    .line 453
    :cond_2
    if-lez p2, :cond_0

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v2, :cond_0

    .line 454
    add-int v1, p2, p3

    .line 456
    .local v1, position:I
    if-lt v1, p4, :cond_0

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 457
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v2}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 458
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    .line 459
    invoke-interface {v0}, Landroid/database/Cursor;->moveToLast()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iget-boolean v2, v2, Lco/vine/android/ListState;->hasNewScrollState:Z

    if-eqz v2, :cond_0

    .line 460
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lco/vine/android/ListState;->hasNewScrollState:Z

    .line 461
    invoke-virtual {p0, v0}, Lco/vine/android/BaseListFragment;->onScrollLastItem(Landroid/database/Cursor;)V

    goto :goto_0
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 0
    .parameter "cursor"

    .prologue
    .line 498
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 476
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lco/vine/android/ListState;->hasNewScrollState:Z

    .line 477
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    invoke-virtual {v0, p2}, Lco/vine/android/ListState;->setScrollState(I)V

    .line 480
    if-nez p2, :cond_0

    .line 481
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iget v0, v0, Lco/vine/android/ListState;->firstVisibleItem:I

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iget v1, v1, Lco/vine/android/ListState;->visibleItemCount:I

    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mListState:Lco/vine/android/ListState;

    iget v2, v2, Lco/vine/android/ListState;->totalItemCount:I

    invoke-virtual {p0, p1, v0, v1, v2}, Lco/vine/android/BaseListFragment;->onScroll(Landroid/widget/AbsListView;III)V

    .line 484
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 365
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseControllerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 366
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 367
    return-void
.end method

.method protected refresh()V
    .locals 0

    .prologue
    .line 492
    return-void
.end method

.method protected removeRequest(Ljava/lang/String;)Lco/vine/android/PendingRequest;
    .locals 5
    .parameter "reqId"

    .prologue
    .line 762
    iget-object v2, p0, Lco/vine/android/BaseListFragment;->mPendingRequests:Ljava/util/ArrayList;

    .line 763
    .local v2, reqs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/PendingRequest;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 764
    .local v3, size:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 765
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/PendingRequest;

    .line 766
    .local v1, req:Lco/vine/android/PendingRequest;
    iget-object v4, v1, Lco/vine/android/PendingRequest;->id:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 767
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/PendingRequest;

    .line 770
    .end local v1           #req:Lco/vine/android/PendingRequest;
    :goto_1
    return-object v4

    .line 764
    .restart local v1       #req:Lco/vine/android/PendingRequest;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 770
    .end local v1           #req:Lco/vine/android/PendingRequest;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected restartLoader()Z
    .locals 3

    .prologue
    .line 209
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    if-nez v0, :cond_0

    .line 210
    const/4 v0, 0x0

    .line 213
    :goto_0
    return v0

    .line 212
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/BaseListFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    iget v1, p0, Lco/vine/android/BaseListFragment;->mLoaderId:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 213
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected restoreItemPosition(Lcom/twitter/android/widget/ItemPosition;Z)V
    .locals 0
    .parameter "itemPosition"
    .parameter "changedCursor"

    .prologue
    .line 792
    return-void
.end method

.method protected restorePosition()V
    .locals 3

    .prologue
    .line 795
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    iget v1, p0, Lco/vine/android/BaseListFragment;->mScrollPos:I

    iget v2, p0, Lco/vine/android/BaseListFragment;->mScrollOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 796
    return-void
.end method

.method protected saveItemPosition(Lcom/twitter/android/widget/ItemPosition;)V
    .locals 0
    .parameter "itemPosition"

    .prologue
    .line 781
    return-void
.end method

.method protected savePosition()V
    .locals 4

    .prologue
    .line 801
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    .line 802
    .local v0, l:Landroid/widget/ListView;
    if-eqz v0, :cond_0

    .line 804
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 806
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_1

    .line 807
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    .line 812
    .local v1, offset:I
    :goto_0
    invoke-virtual {v0}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v3

    iput v3, p0, Lco/vine/android/BaseListFragment;->mScrollPos:I

    .line 813
    iput v1, p0, Lco/vine/android/BaseListFragment;->mScrollOffset:I

    .line 815
    .end local v1           #offset:I
    .end local v2           #v:Landroid/view/View;
    :cond_0
    return-void

    .line 809
    .restart local v2       #v:Landroid/view/View;
    :cond_1
    const/4 v1, 0x0

    .restart local v1       #offset:I
    goto :goto_0
.end method

.method protected setEmptyStringMessage(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 653
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mEmptyText:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lco/vine/android/BaseListFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 654
    return-void
.end method

.method public setFocused(Z)V
    .locals 0
    .parameter "focused"

    .prologue
    .line 157
    iput-boolean p1, p0, Lco/vine/android/BaseListFragment;->mFocused:Z

    .line 158
    return-void
.end method

.method public setOwnerId(J)V
    .locals 0
    .parameter "ownerId"

    .prologue
    .line 899
    iput-wide p1, p0, Lco/vine/android/BaseListFragment;->mOwnerId:J

    .line 900
    return-void
.end method

.method public setRefreshableHeaderOffset(I)V
    .locals 1
    .parameter "offset"

    .prologue
    .line 469
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    .line 470
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v0, p1}, Lcom/twitter/android/widget/RefreshableListView;->setViewYOffset(I)V

    .line 472
    :cond_0
    return-void
.end method

.method setScrollListener(Lco/vine/android/BaseListFragment$OnScrollListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 873
    iput-object p1, p0, Lco/vine/android/BaseListFragment;->mScrollListener:Lco/vine/android/BaseListFragment$OnScrollListener;

    .line 874
    return-void
.end method

.method public showDialog(I)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 892
    invoke-virtual {p0, p1}, Lco/vine/android/BaseListFragment;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    .line 893
    .local v0, d:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    .line 894
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 896
    :cond_0
    return-void
.end method

.method protected showProgress(I)V
    .locals 2
    .parameter "progressType"

    .prologue
    const/4 v1, 0x1

    .line 533
    packed-switch p1, :pswitch_data_0

    .line 561
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 536
    :pswitch_1
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    .line 537
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v0, v1}, Lcom/twitter/android/widget/RefreshableListView;->refreshMore(Z)V

    goto :goto_0

    .line 544
    :pswitch_2
    iget-boolean v0, p0, Lco/vine/android/BaseListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    .line 545
    iget-object v0, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    check-cast v0, Lcom/twitter/android/widget/RefreshableListView;

    invoke-virtual {v0}, Lcom/twitter/android/widget/RefreshableListView;->startRefresh()V

    .line 546
    iput-boolean v1, p0, Lco/vine/android/BaseListFragment;->mRefreshing:Z

    goto :goto_0

    .line 553
    :pswitch_3
    invoke-direct {p0, v1}, Lco/vine/android/BaseListFragment;->showLoading(Z)V

    goto :goto_0

    .line 533
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected showSadface(Z)V
    .locals 0
    .parameter "show"

    .prologue
    .line 622
    invoke-virtual {p0, p1, p1}, Lco/vine/android/BaseListFragment;->showSadface(ZZ)V

    .line 623
    return-void
.end method

.method protected showSadface(ZZ)V
    .locals 5
    .parameter "show"
    .parameter "showFrown"

    .prologue
    const v4, 0x7f0a008f

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 626
    if-eqz p1, :cond_2

    .line 627
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 628
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setVisibility(I)V

    .line 629
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 632
    if-eqz p2, :cond_1

    .line 633
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 634
    .local v0, sadFace:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 635
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 650
    .end local v0           #sadFace:Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 638
    :cond_1
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 639
    .restart local v0       #sadFace:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 640
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 645
    .end local v0           #sadFace:Landroid/view/View;
    :cond_2
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 646
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setVisibility(I)V

    .line 647
    iget-object v1, p0, Lco/vine/android/BaseListFragment;->mSadface:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
