.class public Lco/vine/android/FindFriendsAddressFragment;
.super Lco/vine/android/BaseListFragment;
.source "FindFriendsAddressFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/FindFriendsAddressFragment$FriendsListener;
    }
.end annotation


# static fields
.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Find Friends: Address"

.field private static final STATE_FETCHED:Ljava/lang/String; = "fetch"

.field private static final STATE_FRIENDSHIPS:Ljava/lang/String; = "friendships"

.field private static final STATE_SAFE_TO_LOAD:Ljava/lang/String; = "safe"


# instance fields
.field private mBold:[Landroid/text/style/StyleSpan;

.field private mFetched:Z

.field private mFriendships:Lco/vine/android/Friendships;

.field private mNewFollowsCount:I

.field private mProjection:[Ljava/lang/String;

.field private mSafeToLoad:Z

.field private mSortOrder:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    .line 238
    return-void
.end method

.method static synthetic access$002(Lco/vine/android/FindFriendsAddressFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput-boolean p1, p0, Lco/vine/android/FindFriendsAddressFragment;->mSafeToLoad:Z

    return p1
.end method

.method static synthetic access$100(Lco/vine/android/FindFriendsAddressFragment;)Lco/vine/android/Friendships;
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    return-object v0
.end method

.method private fetchContent(I)V
    .locals 3
    .parameter "fetchType"

    .prologue
    .line 166
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFetched:Z

    .line 168
    packed-switch p1, :pswitch_data_0

    .line 183
    :goto_0
    return-void

    .line 170
    :pswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0f0028

    invoke-direct {v0, v1, v2}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    .line 172
    .local v0, d:Landroid/app/ProgressDialog;
    const v1, 0x7f0e00c3

    invoke-virtual {p0, v1}, Lco/vine/android/FindFriendsAddressFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 173
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 174
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 175
    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 176
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/client/AppController;->fetchAddressFriends(Lco/vine/android/client/Session;)Ljava/lang/String;

    goto :goto_0

    .line 168
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method private startProfileActivity(J)V
    .locals 2
    .parameter "userId"

    .prologue
    .line 230
    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "Find Friends: Address"

    invoke-static {v0, p1, p2, v1}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    .line 231
    return-void
.end method


# virtual methods
.method public getFirstItemPosition()Lcom/twitter/android/widget/ItemPosition;
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 113
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 114
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-nez v0, :cond_0

    .line 115
    sget-object v0, Lco/vine/android/provider/VineDatabaseSQL$UsersQuery;->PROJECTION:[Ljava/lang/String;

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mProjection:[Ljava/lang/String;

    .line 116
    const-string v0, "username ASC"

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mSortOrder:Ljava/lang/String;

    .line 117
    new-instance v0, Lco/vine/android/UsersAdapter;

    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v3, 0x1

    iget-object v5, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    const/4 v6, 0x0

    move-object v4, p0

    invoke-direct/range {v0 .. v6}, Lco/vine/android/UsersAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;ZLandroid/view/View$OnClickListener;Lco/vine/android/Friendships;I)V

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 120
    :cond_0
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 121
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .parameter "view"

    .prologue
    const/4 v5, 0x1

    .line 187
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 209
    :cond_0
    :goto_0
    return-void

    .line 189
    :sswitch_0
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lco/vine/android/FindFriendsAddressFragment;->fetchContent(I)V

    .line 192
    :sswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/FollowButtonViewHolder;

    .line 193
    .local v0, holder:Lco/vine/android/FollowButtonViewHolder;
    if-eqz v0, :cond_0

    .line 194
    iget-boolean v1, v0, Lco/vine/android/FollowButtonViewHolder;->following:Z

    if-nez v1, :cond_1

    .line 195
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    iget-wide v3, v0, Lco/vine/android/FollowButtonViewHolder;->userId:J

    invoke-virtual {v1, v2, v3, v4, v5}, Lco/vine/android/client/AppController;->followUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;

    .line 197
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    iget-wide v2, v0, Lco/vine/android/FollowButtonViewHolder;->userId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/Friendships;->addFollowing(J)V

    .line 198
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 199
    iget v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mNewFollowsCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mNewFollowsCount:I

    goto :goto_0

    .line 201
    :cond_1
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    iget-wide v3, v0, Lco/vine/android/FollowButtonViewHolder;->userId:J

    invoke-virtual {v1, v2, v3, v4, v5}, Lco/vine/android/client/AppController;->unfollowUser(Lco/vine/android/client/Session;JZ)Ljava/lang/String;

    .line 203
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    iget-wide v2, v0, Lco/vine/android/FollowButtonViewHolder;->userId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/Friendships;->removeFollowing(J)V

    .line 204
    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 187
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0093 -> :sswitch_0
        0x7f0a0181 -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x1

    .line 54
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 56
    new-array v0, v3, [Landroid/text/style/StyleSpan;

    const/4 v1, 0x0

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mBold:[Landroid/text/style/StyleSpan;

    .line 58
    if-eqz p1, :cond_4

    .line 59
    const-string v0, "fetch"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    const-string v0, "fetch"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mFetched:Z

    .line 62
    :cond_0
    const-string v0, "friendships"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    const-string v0, "friendships"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lco/vine/android/Friendships;

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    .line 65
    :cond_1
    const-string v0, "safe"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 66
    const-string v0, "safe"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mSafeToLoad:Z

    .line 72
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mSafeToLoad:Z

    if-nez v0, :cond_3

    .line 74
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->removeUsers(Lco/vine/android/client/Session;I)Ljava/lang/String;

    .line 78
    :cond_3
    new-instance v0, Lco/vine/android/FindFriendsAddressFragment$FriendsListener;

    invoke-direct {v0, p0}, Lco/vine/android/FindFriendsAddressFragment$FriendsListener;-><init>(Lco/vine/android/FindFriendsAddressFragment;)V

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 79
    return-void

    .line 69
    :cond_4
    new-instance v0, Lco/vine/android/Friendships;

    invoke-direct {v0}, Lco/vine/android/Friendships;-><init>()V

    iput-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    goto :goto_0
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

    .line 158
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FIND_FRIENDS_ADDRESS:Landroid/net/Uri;

    iget-object v3, p0, Lco/vine/android/FindFriendsAddressFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v5

    invoke-static {v2, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/FindFriendsAddressFragment;->mProjection:[Ljava/lang/String;

    iget-object v6, p0, Lco/vine/android/FindFriendsAddressFragment;->mSortOrder:Ljava/lang/String;

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 84
    const v2, 0x7f030030

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 86
    .local v1, v:Landroid/view/View;
    const v2, 0x102000a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mListView:Landroid/widget/ListView;

    .line 87
    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mListView:Landroid/widget/ListView;

    const v3, 0x1020004

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 88
    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 90
    const v2, 0x7f0a0093

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 91
    .local v0, mActionButton:Landroid/widget/Button;
    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mBold:[Landroid/text/style/StyleSpan;

    const v3, 0x7f0e00b0

    invoke-virtual {p0, v3}, Lco/vine/android/FindFriendsAddressFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x22

    invoke-static {v2, v3, v4}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 95
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    return-object v1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .parameter
    .parameter "view"
    .parameter "i"
    .parameter "l"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 223
    .local p1, adapterView:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lco/vine/android/widget/UserViewHolder;

    if-eqz v1, :cond_0

    .line 224
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/UserViewHolder;

    .line 225
    .local v0, h:Lco/vine/android/widget/UserViewHolder;
    iget-wide v1, v0, Lco/vine/android/widget/UserViewHolder;->userId:J

    invoke-direct {p0, v1, v2}, Lco/vine/android/FindFriendsAddressFragment;->startProfileActivity(J)V

    .line 227
    .end local v0           #h:Lco/vine/android/widget/UserViewHolder;
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
    .line 149
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 150
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mFetched:Z

    if-nez v0, :cond_0

    .line 154
    :goto_0
    return-void

    .line 152
    :cond_0
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/FindFriendsAddressFragment;->hideProgress(I)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/FindFriendsAddressFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 2
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
    .line 235
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 236
    return-void
.end method

.method public onMoveAway(I)V
    .locals 3
    .parameter "newPosition"

    .prologue
    .line 213
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onMoveAway(I)V

    .line 214
    iget-boolean v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFetched:Z

    if-eqz v1, :cond_0

    .line 215
    iget v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mNewFollowsCount:I

    const/16 v2, 0xf

    if-le v1, v2, :cond_1

    const-string v0, ">15"

    .line 216
    .local v0, count:Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Lco/vine/android/util/FlurryUtils;->trackAddressNewFollowingCount(Ljava/lang/String;)V

    .line 218
    .end local v0           #count:Ljava/lang/String;
    :cond_0
    const/4 v1, 0x0

    iput v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mNewFollowsCount:I

    .line 219
    return-void

    .line 215
    :cond_1
    iget v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mNewFollowsCount:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 125
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 126
    iget-boolean v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mSafeToLoad:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/FindFriendsAddressFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    .line 127
    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->initLoader()V

    .line 131
    :goto_0
    return-void

    .line 129
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->dismissDialog()V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 141
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 142
    const-string v0, "fetch"

    iget-boolean v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFetched:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 143
    const-string v0, "friendships"

    iget-object v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mFriendships:Lco/vine/android/Friendships;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 144
    const-string v0, "safe"

    iget-boolean v1, p0, Lco/vine/android/FindFriendsAddressFragment;->mSafeToLoad:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 145
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 102
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 103
    invoke-virtual {p0}, Lco/vine/android/FindFriendsAddressFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 104
    .local v0, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f03003d

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 105
    .local v1, title:Landroid/view/View;
    iget-object v2, p0, Lco/vine/android/FindFriendsAddressFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 107
    const v2, 0x7f0a00a5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f0e00b3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 109
    return-void
.end method
