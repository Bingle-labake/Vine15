.class public Lco/vine/android/HomeTimelineFragment;
.super Lco/vine/android/BaseTimelineFragment;
.source "HomeTimelineFragment.java"

# interfaces
.implements Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;


# static fields
.field private static final DIALOG_ADD_WIDGET:I = 0x3e0

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Home Timeline"

.field public static final PREF_INVITE_BANNER_CLICKED:Ljava/lang/String; = "inviteBannerWasClicked"

.field public static final PREF_INVITE_BANNER_VIEW_COUNT:Ljava/lang/String; = "inviteBannerViewCount"

.field public static final REQUEST_FIND_FRIENDS:I = 0x0

.field public static final REQUEST_SETTINGS:I = 0x1


# instance fields
.field private mInviteBanner:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lco/vine/android/BaseTimelineFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected fetchPosts(IZ)Ljava/lang/String;
    .locals 11
    .parameter "pageType"
    .parameter "userInitiated"

    .prologue
    const/4 v9, 0x0

    .line 159
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/client/AppController;->fetchPendingNotificationCount(Lco/vine/android/client/Session;)Ljava/lang/String;

    .line 160
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v1

    const/16 v2, 0xa

    iget-object v3, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v3

    const/4 v5, 0x1

    iget-object v6, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    move v6, p1

    move v7, p2

    move-object v10, v9

    invoke-virtual/range {v0 .. v10}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 14
    .parameter "savedInstanceState"

    .prologue
    .line 57
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 58
    iget-object v10, p0, Lco/vine/android/HomeTimelineFragment;->mListView:Landroid/widget/ListView;

    iget-object v11, p0, Lco/vine/android/HomeTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v10, v11}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 60
    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    invoke-static {v10}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 61
    .local v7, sp:Landroid/content/SharedPreferences;
    const-string v10, "inviteBannerWasClicked"

    const/4 v11, 0x0

    invoke-interface {v7, v10, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-nez v10, :cond_2

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v10

    invoke-static {v10}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    .line 64
    .local v5, inflater:Landroid/view/LayoutInflater;
    const v10, 0x7f03003b

    iget-object v11, p0, Lco/vine/android/HomeTimelineFragment;->mListView:Landroid/widget/ListView;

    const/4 v12, 0x0

    invoke-virtual {v5, v10, v11, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    .line 66
    .local v3, container:Landroid/widget/RelativeLayout;
    const v10, 0x7f0a00a3

    invoke-virtual {v3, v10}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/RelativeLayout;

    iput-object v10, p0, Lco/vine/android/HomeTimelineFragment;->mInviteBanner:Landroid/widget/RelativeLayout;

    .line 67
    iget-object v10, p0, Lco/vine/android/HomeTimelineFragment;->mInviteBanner:Landroid/widget/RelativeLayout;

    new-instance v11, Lco/vine/android/HomeTimelineFragment$1;

    invoke-direct {v11, p0}, Lco/vine/android/HomeTimelineFragment$1;-><init>(Lco/vine/android/HomeTimelineFragment;)V

    invoke-virtual {v10, v11}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    const/4 v10, 0x6

    invoke-virtual {p0, v10}, Lco/vine/android/HomeTimelineFragment;->setRefreshableHeaderOffset(I)V

    .line 78
    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-virtual {p0, v3, v10, v11}, Lco/vine/android/HomeTimelineFragment;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 80
    const-string v10, "inviteBannerViewCount"

    const-wide/16 v11, 0x0

    invoke-interface {v7, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    const-wide/16 v12, 0x1

    add-long v8, v10, v12

    .line 81
    .local v8, viewCount:J
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string v11, "inviteBannerViewCount"

    invoke-interface {v10, v11, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 82
    const-wide/16 v10, 0xa

    cmp-long v10, v8, v10

    if-gez v10, :cond_0

    const-wide/16 v10, 0x5

    rem-long v10, v8, v10

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-eqz v10, :cond_1

    :cond_0
    const-wide/16 v10, 0xa

    rem-long v10, v8, v10

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_2

    .line 83
    :cond_1
    invoke-static {v8, v9}, Lco/vine/android/util/FlurryUtils;->trackInviteBannerViewed(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .end local v3           #container:Landroid/widget/RelativeLayout;
    .end local v5           #inflater:Landroid/view/LayoutInflater;
    .end local v8           #viewCount:J
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 92
    .local v1, activity:Landroid/support/v4/app/FragmentActivity;
    invoke-static {v1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 93
    .local v2, am:Landroid/accounts/AccountManager;
    iget-object v10, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v10}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v10

    invoke-virtual {v10}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v10

    invoke-static {v1, v10}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 95
    .local v0, account:Landroid/accounts/Account;
    if-eqz v0, :cond_3

    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v10

    invoke-virtual {v10, v1, v2, v0}, Lco/vine/android/AppImpl;->doAddWidget(Landroid/content/Context;Landroid/accounts/AccountManager;Landroid/accounts/Account;)Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-static {}, Lco/vine/android/util/BuildUtil;->isAmazon()Z

    move-result v10

    if-nez v10, :cond_3

    .line 97
    invoke-static {v2, v0}, Lco/vine/android/client/VineAccountHelper;->setAddWidget(Landroid/accounts/AccountManager;Landroid/accounts/Account;)V

    .line 98
    const/16 v10, 0x3e0

    invoke-static {v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    move-result-object v6

    .line 100
    .local v6, p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    const v10, 0x7f0e0040

    invoke-virtual {v6, v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setTitle(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 101
    const v10, 0x7f0e003f

    invoke-virtual {v6, v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 102
    const v10, 0x7f0e0052

    invoke-virtual {v6, v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 103
    const v10, 0x7f0e0042

    invoke-virtual {v6, v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogSupportFragment;

    .line 104
    invoke-virtual {v6, p0}, Lco/vine/android/widgets/PromptDialogSupportFragment;->setListener(Lco/vine/android/widgets/PromptDialogSupportFragment$OnDialogDoneListener;)V

    .line 105
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v10

    invoke-virtual {v6, v10}, Lco/vine/android/widgets/PromptDialogSupportFragment;->show(Landroid/support/v4/app/FragmentManager;)V

    .line 107
    .end local v6           #p:Lco/vine/android/widgets/PromptDialogSupportFragment;
    :cond_3
    return-void

    .line 85
    .end local v0           #account:Landroid/accounts/Account;
    .end local v1           #activity:Landroid/support/v4/app/FragmentActivity;
    .end local v2           #am:Landroid/accounts/AccountManager;
    :catch_0
    move-exception v4

    .line 87
    .local v4, e:Ljava/lang/Exception;
    const-string v10, "Failed to show invite banner, which is ok."

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v4, v10, v11}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string v11, "inviteBannerWasClicked"

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v0, 0x1

    .line 111
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseTimelineFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 112
    if-ne p1, v0, :cond_0

    if-ne p2, v0, :cond_0

    .line 114
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/HomeTimelineFragment;->mFetched:Z

    .line 116
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 45
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const-string v0, "Home Timeline"

    iput-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    .line 47
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/HomeTimelineFragment;->setFocused(Z)V

    .line 48
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 8
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

    .line 147
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE:Landroid/net/Uri;

    iget-object v1, p0, Lco/vine/android/HomeTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v7

    .line 151
    .local v7, uri:Landroid/net/Uri$Builder;
    const-string v0, "limit"

    iget v1, p0, Lco/vine/android/HomeTimelineFragment;->mCursorQuerySize:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 153
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v7}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 2
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    .line 167
    packed-switch p2, :pswitch_data_0

    .line 182
    :goto_0
    return-void

    .line 169
    :pswitch_0
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 176
    :pswitch_1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    goto :goto_0

    .line 171
    :pswitch_2
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v0

    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/AppImpl;->setupWidget(Landroid/app/Activity;)V

    .line 172
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    goto :goto_0

    .line 167
    nop

    :pswitch_data_0
    .packed-switch 0x3e0
        :pswitch_0
    .end packed-switch

    .line 169
    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 141
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onPause()V

    .line 142
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 143
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 129
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onResume()V

    .line 130
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    .line 131
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const-string v1, "HomeTimelineFragment"

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->startLoadingTimeProfiling(Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_1

    .line 133
    invoke-virtual {p0}, Lco/vine/android/HomeTimelineFragment;->initLoader()V

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 134
    :cond_1
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/HomeTimelineFragment;->fetchContent(IZ)V

    goto :goto_0
.end method

.method public removeHeader()V
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mInviteBanner:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lco/vine/android/HomeTimelineFragment;->mInviteBanner:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 123
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/HomeTimelineFragment;->setRefreshableHeaderOffset(I)V

    .line 125
    :cond_0
    return-void
.end method

.method protected trackNewCount()Z
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x1

    return v0
.end method
