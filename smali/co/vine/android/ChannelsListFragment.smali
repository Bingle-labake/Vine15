.class public Lco/vine/android/ChannelsListFragment;
.super Lco/vine/android/BaseListFragment;
.source "ChannelsListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ChannelsListFragment$ChannelViewHolder;,
        Lco/vine/android/ChannelsListFragment$ChannelsAdapter;,
        Lco/vine/android/ChannelsListFragment$ChannelsListSessionListener;
    }
.end annotation


# static fields
.field public static final ARG_SELECTED_CHANNEL:Ljava/lang/String; = "selected_channel"

.field public static final ARG_TAKE_FOCUS:Ljava/lang/String; = "take_focus"


# instance fields
.field private mCallback:Lco/vine/android/ChannelsListActivity;

.field private mDbHelper:Lco/vine/android/provider/VineDatabaseHelper;

.field private mFetched:Z

.field private mSelectedChannel:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    .line 246
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ChannelsListFragment;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 44
    iget-wide v0, p0, Lco/vine/android/ChannelsListFragment;->mSelectedChannel:J

    return-wide v0
.end method

.method private fetchContent(I)V
    .locals 2
    .parameter "fetchType"

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lco/vine/android/ChannelsListFragment;->hasPendingRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 147
    :goto_0
    return-void

    .line 130
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 141
    const/4 v0, 0x1

    .line 145
    .local v0, pageType:I
    :goto_1
    iget-object v1, p0, Lco/vine/android/ChannelsListFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1, v0}, Lco/vine/android/client/AppController;->fetchChannels(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lco/vine/android/ChannelsListFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    .line 146
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/ChannelsListFragment;->mFetched:Z

    goto :goto_0

    .line 132
    .end local v0           #pageType:I
    :pswitch_0
    const/4 v0, 0x2

    .line 133
    .restart local v0       #pageType:I
    goto :goto_1

    .line 136
    .end local v0           #pageType:I
    :pswitch_1
    const/4 v0, 0x3

    .line 137
    .restart local v0       #pageType:I
    goto :goto_1

    .line 130
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 76
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 78
    iget-object v1, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-nez v1, :cond_0

    .line 79
    new-instance v1, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;

    invoke-virtual {p0}, Lco/vine/android/ChannelsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/ChannelsListFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v4, 0x0

    invoke-direct {v1, p0, v2, v3, v4}, Lco/vine/android/ChannelsListFragment$ChannelsAdapter;-><init>(Lco/vine/android/ChannelsListFragment;Landroid/content/Context;Lco/vine/android/client/AppController;I)V

    iput-object v1, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 82
    :cond_0
    iget-object v0, p0, Lco/vine/android/ChannelsListFragment;->mListView:Landroid/widget/ListView;

    .line 83
    .local v0, listview:Landroid/widget/ListView;
    invoke-virtual {p0}, Lco/vine/android/ChannelsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f09001d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setBackgroundColor(I)V

    .line 84
    iget-object v1, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 85
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 60
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onAttach(Landroid/app/Activity;)V

    move-object v0, p1

    .line 61
    check-cast v0, Lco/vine/android/ChannelsListActivity;

    iput-object v0, p0, Lco/vine/android/ChannelsListFragment;->mCallback:Lco/vine/android/ChannelsListActivity;

    .line 62
    invoke-static {p1}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/ChannelsListFragment;->mDbHelper:Lco/vine/android/provider/VineDatabaseHelper;

    .line 63
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "view"

    .prologue
    .line 162
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 67
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 68
    new-instance v1, Lco/vine/android/ChannelsListFragment$ChannelsListSessionListener;

    invoke-direct {v1, p0}, Lco/vine/android/ChannelsListFragment$ChannelsListSessionListener;-><init>(Lco/vine/android/ChannelsListFragment;)V

    iput-object v1, p0, Lco/vine/android/ChannelsListFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 70
    invoke-virtual {p0}, Lco/vine/android/ChannelsListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 71
    .local v0, args:Landroid/os/Bundle;
    const-string v1, "selected_channel"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lco/vine/android/ChannelsListFragment;->mSelectedChannel:J

    .line 72
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

    .line 100
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ChannelsListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Channels;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ChannelsQuery;->PROJECTION:[Ljava/lang/String;

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 5
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 151
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v4}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    .line 152
    .local v3, cursor:Landroid/database/Cursor;
    if-eqz v3, :cond_0

    invoke-interface {v3, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 153
    const/4 v4, 0x1

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    .line 154
    .local v1, channelId:J
    const/4 v4, 0x2

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, channel:Ljava/lang/String;
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment;->mCallback:Lco/vine/android/ChannelsListActivity;

    invoke-virtual {v4, v1, v2, v0}, Lco/vine/android/ChannelsListActivity;->onChannelSelected(JLjava/lang/String;)V

    .line 156
    iget-object v4, p0, Lco/vine/android/ChannelsListFragment;->mDbHelper:Lco/vine/android/provider/VineDatabaseHelper;

    invoke-virtual {v4, v1, v2}, Lco/vine/android/provider/VineDatabaseHelper;->markChannelLastUsedTimestamp(J)V

    .line 158
    .end local v0           #channel:Ljava/lang/String;
    .end local v1           #channelId:J
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
    .line 106
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 107
    iget-boolean v0, p0, Lco/vine/android/ChannelsListFragment;->mFetched:Z

    if-eqz v0, :cond_0

    .line 108
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/ChannelsListFragment;->hideProgress(I)V

    .line 109
    iget-object v0, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 110
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/ChannelsListFragment;->showSadface(Z)V

    .line 115
    :cond_0
    :goto_0
    return-void

    .line 112
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/ChannelsListFragment;->showSadface(Z)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 44
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/ChannelsListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 89
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 90
    iget-object v0, p0, Lco/vine/android/ChannelsListFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lco/vine/android/ChannelsListFragment;->initLoader()V

    .line 93
    :cond_0
    iget-boolean v0, p0, Lco/vine/android/ChannelsListFragment;->mFetched:Z

    if-nez v0, :cond_1

    .line 94
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lco/vine/android/ChannelsListFragment;->fetchContent(I)V

    .line 96
    :cond_1
    return-void
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 1
    .parameter "cursor"

    .prologue
    .line 119
    iget-boolean v0, p0, Lco/vine/android/ChannelsListFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 120
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/ChannelsListFragment;->fetchContent(I)V

    .line 122
    :cond_0
    return-void
.end method
