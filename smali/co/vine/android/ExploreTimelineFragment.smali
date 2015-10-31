.class public Lco/vine/android/ExploreTimelineFragment;
.super Lco/vine/android/BaseTimelineFragment;
.source "ExploreTimelineFragment.java"


# static fields
.field public static final ARG_CATEGORY:Ljava/lang/String; = "category"

.field public static final ARG_DATA:Ljava/lang/String; = "data"

.field public static final ARG_TAG:Ljava/lang/String; = "tag"

.field public static final CATEGORY_ON_THE_RISE:Ljava/lang/String; = "trending-people"

.field public static final CATEGORY_POPULAR_NOW:Ljava/lang/String; = "popular-now"

.field public static final CATEGORY_TAG:Ljava/lang/String; = "tag"

.field public static final CATEGORY_TIMELINES:Ljava/lang/String; = "timelines"

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Explore Timeline: "


# instance fields
.field private mCategory:Ljava/lang/String;

.field private mData:Landroid/net/Uri;

.field private mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lco/vine/android/BaseTimelineFragment;-><init>()V

    return-void
.end method

.method public static prepareArguments(Landroid/content/Intent;ZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Landroid/os/Bundle;
    .locals 2
    .parameter "intent"
    .parameter "refreshable"
    .parameter "category"
    .parameter "tag"
    .parameter "data"

    .prologue
    .line 130
    invoke-static {p0, p1}, Lco/vine/android/BaseListFragment;->prepareArguments(Landroid/content/Intent;Z)Landroid/os/Bundle;

    move-result-object v0

    .line 131
    .local v0, bundle:Landroid/os/Bundle;
    const-string v1, "category"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    const-string v1, "tag"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string v1, "data"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 134
    return-object v0
.end method


# virtual methods
.method protected fetchPosts(IZ)Ljava/lang/String;
    .locals 11
    .parameter "pageType"
    .parameter "userInitiated"

    .prologue
    .line 109
    const-string v0, "trending-people"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    const/4 v5, 0x4

    .line 124
    .local v5, type:I
    :goto_0
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    const/16 v2, 0xa

    iget-object v3, p0, Lco/vine/android/ExploreTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v3

    iget-object v8, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    const/4 v9, 0x0

    iget-object v10, p0, Lco/vine/android/ExploreTimelineFragment;->mData:Landroid/net/Uri;

    move v6, p1

    move v7, p2

    invoke-virtual/range {v0 .. v10}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 111
    .end local v5           #type:I
    :cond_0
    const-string v0, "popular-now"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 112
    const/4 v5, 0x5

    .restart local v5       #type:I
    goto :goto_0

    .line 113
    .end local v5           #type:I
    :cond_1
    const-string v0, "tag"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 114
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 115
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You have to specify a tag."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_2
    const/4 v5, 0x6

    .restart local v5       #type:I
    goto :goto_0

    .line 118
    .end local v5           #type:I
    :cond_3
    const-string v0, "timelines"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 119
    const/16 v5, 0xb

    .restart local v5       #type:I
    goto :goto_0

    .line 121
    .end local v5           #type:I
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You have to specify a category."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 49
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 50
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->setCompactLikesComments(Z)V

    .line 51
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 52
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 38
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onCreate(Landroid/os/Bundle;)V

    .line 39
    invoke-virtual {p0}, Lco/vine/android/ExploreTimelineFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 40
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "category"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    .line 41
    const-string v1, "data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mData:Landroid/net/Uri;

    .line 42
    const-string v1, "tag"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Explore Timeline: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    .line 44
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lco/vine/android/ExploreTimelineFragment;->setFocused(Z)V

    .line 45
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 10
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

    .line 73
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v7

    .line 75
    .local v7, activeId:J
    const-string v0, "trending-people"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_ON_THE_RISE:Landroid/net/Uri;

    invoke-static {v0, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v9

    .line 101
    .local v9, contentUri:Landroid/net/Uri$Builder;
    :goto_0
    const-string v0, "limit"

    iget v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCursorQuerySize:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 103
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ExploreTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v9}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 79
    .end local v9           #contentUri:Landroid/net/Uri$Builder;
    :cond_0
    const-string v0, "popular-now"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 80
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_POPULAR_NOW:Landroid/net/Uri;

    invoke-static {v0, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v9

    .restart local v9       #contentUri:Landroid/net/Uri$Builder;
    goto :goto_0

    .line 83
    .end local v9           #contentUri:Landroid/net/Uri$Builder;
    :cond_1
    const-string v0, "tag"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 84
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You have to specify a tag."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_2
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_TAG:Landroid/net/Uri;

    invoke-static {v0, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v9

    .line 90
    .restart local v9       #contentUri:Landroid/net/Uri$Builder;
    const-string v0, "tag_name"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    invoke-virtual {v9, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    .line 91
    .end local v9           #contentUri:Landroid/net/Uri$Builder;
    :cond_3
    const-string v0, "timelines"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 92
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ARBITRARY_TIMELINE:Landroid/net/Uri;

    invoke-static {v0, v7, v8}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v9

    .line 95
    .restart local v9       #contentUri:Landroid/net/Uri$Builder;
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mData:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    .line 96
    const-string v0, "tag_name"

    iget-object v1, p0, Lco/vine/android/ExploreTimelineFragment;->mTag:Ljava/lang/String;

    invoke-virtual {v9, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    .line 98
    .end local v9           #contentUri:Landroid/net/Uri$Builder;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You have to specify a category."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 66
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onPause()V

    .line 67
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/ExploreTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 68
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 56
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onResume()V

    .line 57
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/ExploreTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    .line 58
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const-string v1, "ExploreTimeline"

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->startLoadingTimeProfiling(Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lco/vine/android/ExploreTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    .line 60
    invoke-virtual {p0}, Lco/vine/android/ExploreTimelineFragment;->initLoader()V

    .line 62
    :cond_0
    return-void
.end method
