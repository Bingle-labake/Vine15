.class public Lco/vine/android/widget/ConversationList;
.super Landroid/widget/ListView;
.source "ConversationList.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/ConversationList$GetMoreListener;
    }
.end annotation


# instance fields
.field private mGetMoreHeaderProgressContainer:Landroid/view/View;

.field private mGetMoreListener:Lco/vine/android/widget/ConversationList$GetMoreListener;

.field private mProgressView:Landroid/view/View;

.field private mScrollListener:Landroid/widget/AbsListView$OnScrollListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 19
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method


# virtual methods
.method public deactivateRefresh()V
    .locals 2

    .prologue
    .line 75
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 76
    return-void
.end method

.method public hideProgress()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 94
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 32
    invoke-super {p0}, Landroid/widget/ListView;->onFinishInflate()V

    .line 33
    invoke-super {p0, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 35
    invoke-virtual {p0}, Lco/vine/android/widget/ConversationList;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 36
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v1, 0x7f030024

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreHeaderProgressContainer:Landroid/view/View;

    .line 37
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreHeaderProgressContainer:Landroid/view/View;

    const v2, 0x7f0a0071

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    .line 38
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreHeaderProgressContainer:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v3, v2}, Lco/vine/android/widget/ConversationList;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 39
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 3
    .parameter "view"
    .parameter "firstVisibleItem"
    .parameter "visibleItemCount"
    .parameter "totalItemCount"

    .prologue
    .line 55
    if-nez p3, :cond_1

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 59
    :cond_1
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreListener:Lco/vine/android/widget/ConversationList$GetMoreListener;

    if-eqz v1, :cond_2

    if-nez p2, :cond_2

    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_2

    .line 60
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lco/vine/android/widget/ConversationList;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 61
    .local v0, child:Landroid/view/View;
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreHeaderProgressContainer:Landroid/view/View;

    if-ne v0, v1, :cond_2

    .line 62
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreListener:Lco/vine/android/widget/ConversationList$GetMoreListener;

    invoke-interface {v1}, Lco/vine/android/widget/ConversationList$GetMoreListener;->getMore()V

    .line 65
    .end local v0           #child:Landroid/view/View;
    :cond_2
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v1, :cond_0

    .line 66
    iget-object v1, p0, Lco/vine/android/widget/ConversationList;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v1, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 48
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 51
    :cond_0
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .parameter "w"
    .parameter "h"
    .parameter "oldW"
    .parameter "oldH"

    .prologue
    .line 98
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ListView;->onSizeChanged(IIII)V

    .line 99
    invoke-virtual {p0}, Lco/vine/android/widget/ConversationList;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 100
    invoke-virtual {p0}, Lco/vine/android/widget/ConversationList;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lco/vine/android/widget/ConversationList;->setSelection(I)V

    .line 102
    :cond_0
    return-void
.end method

.method public reactivateRefresh()V
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    return-void
.end method

.method public setGetMoreListener(Lco/vine/android/widget/ConversationList$GetMoreListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 71
    iput-object p1, p0, Lco/vine/android/widget/ConversationList;->mGetMoreListener:Lco/vine/android/widget/ConversationList$GetMoreListener;

    .line 72
    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 43
    iput-object p1, p0, Lco/vine/android/widget/ConversationList;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    .line 44
    return-void
.end method

.method public showProgress()V
    .locals 2

    .prologue
    .line 87
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 88
    iget-object v0, p0, Lco/vine/android/widget/ConversationList;->mProgressView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 90
    :cond_0
    return-void
.end method
