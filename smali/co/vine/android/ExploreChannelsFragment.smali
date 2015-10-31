.class public Lco/vine/android/ExploreChannelsFragment;
.super Lco/vine/android/BaseTimelineFragment;
.source "ExploreChannelsFragment.java"


# static fields
.field public static final ARG_CHANNEL_ID:Ljava/lang/String; = "channelId"

.field public static final ARG_SORT:Ljava/lang/String; = "sort"

.field public static final ARG_TAG:Ljava/lang/String; = "tag"

.field public static final CATEGORY_CHANNELS:Ljava/lang/String; = "channels"

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Explore Channel: "

.field public static final SORT_POPULAR:Ljava/lang/String; = "popular"

.field public static final SORT_RECENT:Ljava/lang/String; = "recent"


# instance fields
.field private mCallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/ExploreChannelsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private mChannelId:Ljava/lang/String;

.field private mSort:Ljava/lang/String;

.field private mTabTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lco/vine/android/BaseTimelineFragment;-><init>()V

    return-void
.end method

.method private handleFocus()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 119
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mCallback:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mCallback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mCallback:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/ExploreChannelsActivity;

    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mTabTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lco/vine/android/ExploreChannelsActivity;->isShowing(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 121
    invoke-virtual {p0, v3}, Lco/vine/android/ExploreChannelsFragment;->setFocused(Z)V

    .line 122
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {p0, v4}, Lco/vine/android/ExploreChannelsFragment;->showProgress(I)V

    .line 124
    invoke-virtual {p0, v4, v2}, Lco/vine/android/ExploreChannelsFragment;->fetchContent(IZ)V

    .line 126
    :cond_0
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0}, Lco/vine/android/widget/GenericTimelineAdapter;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_1

    .line 127
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    .line 134
    :cond_1
    :goto_0
    return-void

    .line 130
    :cond_2
    invoke-virtual {p0, v2}, Lco/vine/android/ExploreChannelsFragment;->setFocused(Z)V

    .line 131
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, v2}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    goto :goto_0
.end method

.method public static prepareArguments(Landroid/content/Intent;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2
    .parameter "intent"
    .parameter "refreshable"
    .parameter "channelId"
    .parameter "sort"
    .parameter "tag"

    .prologue
    .line 152
    invoke-static {p0, p1}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v0

    .line 153
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "channelId"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-string v1, "sort"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v1, "tag"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return-object v0
.end method


# virtual methods
.method protected fetchPosts(IZ)Ljava/lang/String;
    .locals 11
    .parameter "pageType"
    .parameter "userInitiated"

    .prologue
    .line 139
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    const-string v1, "popular"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    const/16 v5, 0x8

    .line 145
    .local v5, groupType:I
    :goto_0
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    const/16 v2, 0xa

    iget-object v3, p0, Lco/vine/android/ExploreChannelsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v3

    iget-object v8, p0, Lco/vine/android/ExploreChannelsFragment;->mChannelId:Ljava/lang/String;

    iget-object v9, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    const/4 v10, 0x0

    move v6, p1

    move v7, p2

    invoke-virtual/range {v0 .. v10}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 142
    .end local v5           #groupType:I
    :cond_0
    const/16 v5, 0x9

    .restart local v5       #groupType:I
    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 68
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 69
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->setCompactLikesComments(Z)V

    .line 70
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 71
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 42
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onAttach(Landroid/app/Activity;)V

    move-object v0, p1

    .line 43
    check-cast v0, Lco/vine/android/ExploreChannelsActivity;

    .line 44
    .local v0, callback:Lco/vine/android/ExploreChannelsActivity;
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mCallback:Ljava/lang/ref/WeakReference;

    .line 45
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 49
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onCreate(Landroid/os/Bundle;)V

    .line 50
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 51
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "channelId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mChannelId:Ljava/lang/String;

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Explore Channel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ExploreChannelsFragment;->mChannelId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mFlurryEventSource:Ljava/lang/String;

    .line 55
    const-string v1, "sort"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    .line 56
    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 57
    const-string v1, "popular"

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    .line 60
    :cond_0
    const-string v1, "tag"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mTabTag:Ljava/lang/String;

    .line 61
    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mTabTag:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 62
    const-string v1, "popular"

    iput-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mTabTag:Ljava/lang/String;

    .line 64
    :cond_1
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 11
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
    const/4 v3, 0x0

    .line 93
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v7

    .line 95
    .local v7, activeId:J
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mChannelId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You have to specify a channel ID."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :cond_0
    const-string v0, "popular"

    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mSort:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 101
    sget-object v9, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_CHANNEL_POPULAR:Landroid/net/Uri;

    .line 105
    .local v9, baseUri:Landroid/net/Uri;
    :goto_0
    invoke-static {v9, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v10

    .line 106
    .local v10, contentUri:Landroid/net/Uri$Builder;
    const-string v0, "channel_id"

    iget-object v1, p0, Lco/vine/android/ExploreChannelsFragment;->mChannelId:Ljava/lang/String;

    invoke-virtual {v10, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 107
    const-string v0, "limit"

    iget v1, p0, Lco/vine/android/ExploreChannelsFragment;->mCursorQuerySize:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 109
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v10}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 103
    .end local v9           #baseUri:Landroid/net/Uri;
    .end local v10           #contentUri:Landroid/net/Uri$Builder;
    :cond_1
    sget-object v9, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_CHANNEL_RECENT:Landroid/net/Uri;

    .restart local v9       #baseUri:Landroid/net/Uri;
    goto :goto_0
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 0
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
    .line 114
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseTimelineFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 115
    invoke-direct {p0}, Lco/vine/android/ExploreChannelsFragment;->handleFocus()V

    .line 116
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 23
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/ExploreChannelsFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onPause()V

    .line 86
    invoke-virtual {p0, v1}, Lco/vine/android/ExploreChannelsFragment;->setFocused(Z)V

    .line 87
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 88
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 75
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onResume()V

    .line 76
    invoke-direct {p0}, Lco/vine/android/ExploreChannelsFragment;->handleFocus()V

    .line 77
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const-string v1, "ExploreChannels"

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->startLoadingTimeProfiling(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Lco/vine/android/ExploreChannelsFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    .line 79
    invoke-virtual {p0}, Lco/vine/android/ExploreChannelsFragment;->initLoader()V

    .line 81
    :cond_0
    return-void
.end method
