.class public Lco/vine/android/TagSearchFragment;
.super Lco/vine/android/BaseSearchFragment;
.source "TagSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/TagSearchFragment$TagSearchSessionListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lco/vine/android/BaseSearchFragment;-><init>()V

    .line 128
    return-void
.end method


# virtual methods
.method public cleanSearchResults()V
    .locals 2

    .prologue
    .line 120
    iget-object v0, p0, Lco/vine/android/TagSearchFragment;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lco/vine/android/TagSearchFragment$1;

    invoke-direct {v1, p0}, Lco/vine/android/TagSearchFragment$1;-><init>(Lco/vine/android/TagSearchFragment;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 126
    return-void
.end method

.method protected fetchContent(I)V
    .locals 4
    .parameter "fetchType"

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lco/vine/android/TagSearchFragment;->hasPendingRequest(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 90
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 105
    const/4 v0, 0x1

    .line 110
    .local v0, pageType:I
    :goto_1
    iget-object v2, p0, Lco/vine/android/TagSearchFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v3, p0, Lco/vine/android/TagSearchFragment;->mEncodedQueryString:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lco/vine/android/client/AppController;->searchTags(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 112
    .local v1, reqId:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 113
    invoke-virtual {p0, p1}, Lco/vine/android/TagSearchFragment;->showProgress(I)V

    .line 114
    invoke-virtual {p0, v1, p1}, Lco/vine/android/TagSearchFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    goto :goto_0

    .line 92
    .end local v0           #pageType:I
    .end local v1           #reqId:Ljava/lang/String;
    :pswitch_0
    const/4 v0, 0x1

    .line 93
    .restart local v0       #pageType:I
    goto :goto_1

    .line 97
    .end local v0           #pageType:I
    :pswitch_1
    const/4 v0, 0x2

    .line 98
    .restart local v0       #pageType:I
    goto :goto_1

    .line 101
    .end local v0           #pageType:I
    :pswitch_2
    const/4 v0, 0x3

    .line 102
    .restart local v0       #pageType:I
    goto :goto_1

    .line 90
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getMinimumSearchQueryLength()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x3

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 26
    invoke-super {p0, p1}, Lco/vine/android/BaseSearchFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 27
    iget-object v0, p0, Lco/vine/android/TagSearchFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-nez v0, :cond_0

    .line 28
    sget-object v0, Lco/vine/android/provider/VineDatabaseSQL$TagsQuery;->PROJECTION:[Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/TagSearchFragment;->mProjection:[Ljava/lang/String;

    .line 29
    const-string v0, "_id ASC"

    iput-object v0, p0, Lco/vine/android/TagSearchFragment;->mSortOrder:Ljava/lang/String;

    .line 30
    new-instance v0, Lco/vine/android/TagsAdapter;

    invoke-virtual {p0}, Lco/vine/android/TagSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/TagSearchFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/TagsAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;I)V

    iput-object v0, p0, Lco/vine/android/TagSearchFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 32
    :cond_0
    iget-object v0, p0, Lco/vine/android/TagSearchFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/TagSearchFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 33
    new-instance v0, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lco/vine/android/TagSearchFragment$TagSearchSessionListener;-><init>(Lco/vine/android/TagSearchFragment;Lco/vine/android/TagSearchFragment$1;)V

    iput-object v0, p0, Lco/vine/android/TagSearchFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 34
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 7
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
    const/4 v4, 0x0

    .line 43
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/TagSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$TagSearchResults;->CONTENT_URI:Landroid/net/Uri;

    iget-object v3, p0, Lco/vine/android/TagSearchFragment;->mProjection:[Ljava/lang/String;

    iget-object v6, p0, Lco/vine/android/TagSearchFragment;->mSortOrder:Ljava/lang/String;

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 6
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 63
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 64
    .local v2, tag:Ljava/lang/Object;
    instance-of v3, v2, Lco/vine/android/widget/TagViewHolder;

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 65
    check-cast v0, Lco/vine/android/widget/TagViewHolder;

    .line 66
    .local v0, holder:Lco/vine/android/widget/TagViewHolder;
    invoke-virtual {p0}, Lco/vine/android/TagSearchFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "tag"

    iget-object v5, v0, Lco/vine/android/widget/TagViewHolder;->tagName:Ljava/lang/String;

    invoke-static {v3, v4, v5}, Lco/vine/android/ExploreVideoListActivity;->getIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 68
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lco/vine/android/TagSearchFragment;->startActivity(Landroid/content/Intent;)V

    .line 70
    .end local v0           #holder:Lco/vine/android/widget/TagViewHolder;
    .end local v1           #intent:Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 1
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
    .line 49
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseSearchFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 50
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/TagSearchFragment;->hideProgress(I)V

    .line 51
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 22
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/TagSearchFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 2
    .parameter "cursor"

    .prologue
    .line 55
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/16 v1, 0x190

    if-gt v0, v1, :cond_0

    .line 57
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/TagSearchFragment;->fetchContent(I)V

    .line 59
    :cond_0
    return-void
.end method

.method public performSearch()V
    .locals 1

    .prologue
    .line 74
    invoke-virtual {p0}, Lco/vine/android/TagSearchFragment;->hideSearchHint()V

    .line 75
    invoke-virtual {p0}, Lco/vine/android/TagSearchFragment;->cleanSearchResults()V

    .line 76
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/TagSearchFragment;->fetchContent(I)V

    .line 77
    return-void
.end method
