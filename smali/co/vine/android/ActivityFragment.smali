.class public Lco/vine/android/ActivityFragment;
.super Lco/vine/android/BaseListFragment;
.source "ActivityFragment.java"

# interfaces
.implements Lco/vine/android/widget/SpanClickListener;
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widget/OnTabChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ActivityFragment$ActivityListener;
    }
.end annotation


# static fields
.field public static final ARG_TAKE_FOCUS:Ljava/lang/String; = "take_focus"

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Activity Feed"

.field private static final LOADED_ID_ACTIVITY:I = 0x1

.field private static final LOADER_ID_PENDING_REQUEST_COUNT:I = 0x2

.field private static final STATED_EXPANDED:I = 0x2

.field private static final STATE_COLLAPSED:I = 0x1

.field private static final STATE_FEW:I = 0x3

.field private static final STATE_FOLLOW_HEADER_ADDED:Ljava/lang/String; = "state_follow_header_added"

.field private static final STATE_FOLLOW_HEADER_SHOWING:Ljava/lang/String; = "state_follow_header_showing"

.field private static final STATE_FOLLOW_REQUEST_COUNT:Ljava/lang/String; = "state_follow_count"

.field private static final STATE_FOLLOW_STATE:Ljava/lang/String; = "state_follow_state"

.field private static final STATE_NONE:I = 0x4

.field private static final STATE_PRIVATE:Ljava/lang/String; = "state_private"


# instance fields
.field private mFetched:Z

.field private mFocused:Z

.field private mFollowHeader:Landroid/widget/LinearLayout;

.field private mFollowHeaderAdded:Z

.field private mFollowHeaderShowing:Z

.field private mFollowRequestCount:I

.field private mFollowState:I

.field private mHeaderCollapsed:Landroid/widget/ImageView;

.field private mHeaderExpanded:Landroid/widget/ImageView;

.field private mHeaderFew:Landroid/widget/ImageView;

.field private mPrivate:Z

.field private mTextCollapsed:Landroid/widget/TextView;

.field private mTextExpanded:Landroid/widget/TextView;

.field private mTextFew:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    .line 477
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ActivityFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFocused:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/ActivityFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    return v0
.end method

.method static synthetic access$102(Lco/vine/android/ActivityFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput-boolean p1, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    return p1
.end method

.method static synthetic access$200(Lco/vine/android/ActivityFragment;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 36
    iget v0, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    return v0
.end method

.method static synthetic access$202(Lco/vine/android/ActivityFragment;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    iput p1, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    return p1
.end method

.method static synthetic access$300(Lco/vine/android/ActivityFragment;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestCount()V

    return-void
.end method

.method private fetchContent(I)V
    .locals 1
    .parameter "fetchType"

    .prologue
    .line 278
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/ActivityFragment;->fetchContent(IZ)V

    .line 279
    return-void
.end method

.method private fetchContent(IZ)V
    .locals 5
    .parameter "fetchType"
    .parameter "silent"

    .prologue
    .line 282
    invoke-virtual {p0, p1}, Lco/vine/android/ActivityFragment;->hasPendingRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 308
    :goto_0
    return-void

    .line 285
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mFetched:Z

    .line 288
    if-nez p2, :cond_1

    .line 289
    invoke-virtual {p0, p1}, Lco/vine/android/ActivityFragment;->showProgress(I)V

    .line 291
    :cond_1
    packed-switch p1, :pswitch_data_0

    .line 302
    const/4 v0, 0x1

    .line 306
    .local v0, pageType:I
    :goto_1
    iget-object v1, p0, Lco/vine/android/ActivityFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v2, p0, Lco/vine/android/ActivityFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v2

    iget-boolean v3, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->isFocused()Z

    move-result v4

    invoke-virtual {v1, v2, v0, v3, v4}, Lco/vine/android/client/AppController;->fetchActivity(Lco/vine/android/client/Session;IZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lco/vine/android/ActivityFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    goto :goto_0

    .line 293
    .end local v0           #pageType:I
    :pswitch_0
    const/4 v0, 0x2

    .line 294
    .restart local v0       #pageType:I
    goto :goto_1

    .line 297
    .end local v0           #pageType:I
    :pswitch_1
    const/4 v0, 0x3

    .line 298
    .restart local v0       #pageType:I
    goto :goto_1

    .line 291
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateFollowRequestCount()V
    .locals 3

    .prologue
    .line 274
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 275
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    .line 116
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 117
    new-instance v0, Lco/vine/android/ActivityAdapter;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ActivityFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object v3, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lco/vine/android/ActivityAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;Lco/vine/android/widget/SpanClickListener;Landroid/view/View$OnClickListener;I)V

    iput-object v0, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 118
    iget-object v0, p0, Lco/vine/android/ActivityFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 120
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "take_focus"

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFetched:Z

    if-nez v0, :cond_0

    .line 121
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    check-cast v6, Lco/vine/android/HomeTabActivity;

    .line 122
    .local v6, callback:Lco/vine/android/HomeTabActivity;
    const/4 v0, 0x1

    invoke-virtual {v6, v0, p0}, Lco/vine/android/HomeTabActivity;->showPage(ILandroid/support/v4/app/Fragment;)V

    .line 124
    .end local v6           #callback:Lco/vine/android/HomeTabActivity;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "view"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 332
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 351
    :goto_0
    return-void

    .line 335
    :sswitch_0
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-string v0, "Activity Feed"

    invoke-static {v1, v2, v3, v0}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 339
    :sswitch_1
    const/4 v0, 0x2

    iput v0, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 340
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 341
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    goto :goto_0

    .line 345
    :sswitch_2
    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 346
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 347
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    goto :goto_0

    .line 332
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0051 -> :sswitch_0
        0x7f0a0053 -> :sswitch_0
        0x7f0a013c -> :sswitch_1
        0x7f0a0140 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x0

    .line 89
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 90
    new-instance v1, Lco/vine/android/ActivityFragment$ActivityListener;

    invoke-direct {v1, p0}, Lco/vine/android/ActivityFragment$ActivityListener;-><init>(Lco/vine/android/ActivityFragment;)V

    iput-object v1, p0, Lco/vine/android/ActivityFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 91
    if-eqz p1, :cond_5

    .line 92
    const-string v1, "state_private"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const-string v1, "state_private"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    .line 95
    :cond_0
    const-string v1, "state_follow_header_added"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 96
    const-string v1, "state_follow_header_added"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderAdded:Z

    .line 98
    :cond_1
    const-string v1, "state_follow_header_showing"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 99
    const-string v1, "state_follow_header_showing"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderShowing:Z

    .line 101
    :cond_2
    const-string v1, "state_follow_count"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 102
    const-string v1, "state_follow_count"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    .line 104
    :cond_3
    const-string v1, "state_follow_state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 105
    const-string v1, "state_follow_state"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 112
    :cond_4
    :goto_0
    return-void

    .line 108
    :cond_5
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 109
    .local v0, pr:Landroid/content/SharedPreferences;
    const-string v1, "settings_private"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    .line 110
    const-string v1, "settings_follow_pref_count"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

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

    .line 136
    packed-switch p1, :pswitch_data_0

    move-object v0, v4

    .line 176
    :goto_0
    return-object v0

    .line 138
    :pswitch_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "notification_id"

    aput-object v6, v3, v5

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 143
    :pswitch_1
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    if-eqz v0, :cond_0

    .line 144
    iget v0, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    packed-switch v0, :pswitch_data_1

    .line 164
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v6, "sort_id DESC, notification_id DESC"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 146
    :pswitch_2
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v6, "sort_id DESC, notification_id DESC"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 151
    :pswitch_3
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v6, "sort_id DESC, notification_id DESC"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 157
    :pswitch_4
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v6, "sort_id DESC, notification_id DESC"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 170
    :cond_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v6, "sort_id DESC, notification_id DESC"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 136
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    .line 144
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 129
    const v1, 0x7f030045

    invoke-virtual {p0, p1, v1, p2}, Lco/vine/android/ActivityFragment;->createView(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 130
    .local v0, v:Landroid/view/View;
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    .line 131
    return-object v0
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 8
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    const-wide/16 v2, 0x0

    .line 355
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lco/vine/android/widget/ActivityViewHolder;

    if-eqz v0, :cond_0

    .line 356
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/widget/ActivityViewHolder;

    .line 357
    .local v6, holder:Lco/vine/android/widget/ActivityViewHolder;
    iget v7, v6, Lco/vine/android/widget/ActivityViewHolder;->type:I

    .line 358
    .local v7, type:I
    packed-switch v7, :pswitch_data_0

    .line 377
    :pswitch_0
    iget-wide v0, v6, Lco/vine/android/widget/ActivityViewHolder;->postId:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 378
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-wide v1, v6, Lco/vine/android/widget/ActivityViewHolder;->postId:J

    invoke-static {v0, v1, v2}, Lco/vine/android/SingleActivity;->start(Landroid/content/Context;J)V

    .line 386
    .end local v6           #holder:Lco/vine/android/widget/ActivityViewHolder;
    .end local v7           #type:I
    :cond_0
    :goto_0
    return-void

    .line 360
    .restart local v6       #holder:Lco/vine/android/widget/ActivityViewHolder;
    .restart local v7       #type:I
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-wide v1, v6, Lco/vine/android/widget/ActivityViewHolder;->userId:J

    const-string v3, "Activity Feed"

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 368
    :pswitch_2
    iget-boolean v0, v6, Lco/vine/android/widget/ActivityViewHolder;->isLocked:Z

    if-eqz v0, :cond_1

    .line 369
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-wide v1, v6, Lco/vine/android/widget/ActivityViewHolder;->postId:J

    iget-object v3, v6, Lco/vine/android/widget/ActivityViewHolder;->username:Ljava/lang/String;

    iget-wide v4, v6, Lco/vine/android/widget/ActivityViewHolder;->userId:J

    invoke-static/range {v0 .. v5}, Lco/vine/android/SingleActivity;->startLocked(Landroid/content/Context;JLjava/lang/String;J)V

    goto :goto_0

    .line 372
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-wide v1, v6, Lco/vine/android/widget/ActivityViewHolder;->postId:J

    invoke-static {v0, v1, v2}, Lco/vine/android/SingleActivity;->start(Landroid/content/Context;J)V

    goto :goto_0

    .line 379
    :cond_2
    iget-wide v0, v6, Lco/vine/android/widget/ActivityViewHolder;->userId:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 380
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-wide v1, v6, Lco/vine/android/widget/ActivityViewHolder;->userId:J

    const-string v3, "Activity Feed"

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 358
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 3
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
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v1, 0x3

    const/4 v2, 0x0

    .line 196
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 226
    :goto_0
    return-void

    .line 198
    :pswitch_0
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 199
    iget-object v0, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFetched:Z

    if-nez v0, :cond_0

    .line 200
    invoke-direct {p0, v1}, Lco/vine/android/ActivityFragment;->fetchContent(I)V

    goto :goto_0

    .line 202
    :cond_0
    invoke-virtual {p0, v1}, Lco/vine/android/ActivityFragment;->hideProgress(I)V

    .line 203
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFetched:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 204
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/ActivityFragment;->showSadface(Z)V

    goto :goto_0

    .line 206
    :cond_1
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    if-eqz v0, :cond_2

    .line 207
    invoke-direct {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestCount()V

    .line 209
    :cond_2
    invoke-virtual {p0, v2}, Lco/vine/android/ActivityFragment;->showSadface(Z)V

    goto :goto_0

    .line 215
    :pswitch_1
    if-eqz p2, :cond_4

    .line 216
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_3

    .line 217
    invoke-interface {p2}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "num_reqs"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    .line 220
    :cond_3
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    .line 222
    :cond_4
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    goto :goto_0

    .line 196
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 36
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/ActivityFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onMoveAway(I)V
    .locals 1
    .parameter "newPosition"

    .prologue
    .line 269
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onMoveAway(I)V

    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFocused:Z

    .line 271
    return-void
.end method

.method public onMoveTo(I)V
    .locals 4
    .parameter "oldPosition"

    .prologue
    const/4 v3, 0x1

    .line 253
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onMoveTo(I)V

    .line 254
    iput-boolean v3, p0, Lco/vine/android/ActivityFragment;->mFocused:Z

    .line 255
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 256
    .local v0, pr:Landroid/content/SharedPreferences;
    const-string v1, "settings_private"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    .line 258
    iget-object v1, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->hasPendingRequest()Z

    move-result v1

    if-nez v1, :cond_0

    .line 259
    iget-object v1, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 260
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lco/vine/android/ActivityFragment;->fetchContent(I)V

    .line 265
    :cond_0
    :goto_0
    return-void

    .line 262
    :cond_1
    const/4 v1, 0x2

    invoke-direct {p0, v1, v3}, Lco/vine/android/ActivityFragment;->fetchContent(IZ)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 183
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 184
    iget-object v0, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_1

    .line 185
    invoke-direct {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestCount()V

    .line 186
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->updateFollowRequestHeader()V

    .line 187
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/ActivityFragment;->initLoader(I)V

    .line 188
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lco/vine/android/ActivityFragment;->initLoader(I)V

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    iget-object v0, p0, Lco/vine/android/ActivityFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mFetched:Z

    if-nez v0, :cond_0

    .line 190
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lco/vine/android/ActivityFragment;->fetchContent(I)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 230
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 231
    const-string v0, "state_private"

    iget-boolean v1, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 232
    const-string v0, "state_follow_header_showing"

    iget-boolean v1, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderShowing:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 233
    const-string v0, "state_follow_header_added"

    iget-boolean v1, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderAdded:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 234
    const-string v0, "state_follow_count"

    iget v1, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 235
    const-string v0, "state_follow_state"

    iget v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 236
    return-void
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 2
    .parameter "cursor"

    .prologue
    .line 245
    iget-boolean v0, p0, Lco/vine/android/ActivityFragment;->mRefreshable:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/16 v1, 0x190

    if-gt v0, v1, :cond_0

    .line 247
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lco/vine/android/ActivityFragment;->fetchContent(I)V

    .line 249
    :cond_0
    return-void
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 4
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 312
    packed-switch p2, :pswitch_data_0

    .line 322
    :pswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 328
    .end local p3
    :goto_0
    return-void

    .line 314
    .restart local p3
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p3, Ljava/lang/Long;

    .end local p3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string v3, "Activity Feed"

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 318
    .restart local p3
    :pswitch_2
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p3, Ljava/lang/String;

    .end local p3
    invoke-static {v0, p3}, Lco/vine/android/HashtagActivity;->start(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 324
    .restart local p3
    :pswitch_3
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p3, Ljava/lang/Long;

    .end local p3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string v3, "Activity Feed"

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 312
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 322
    :pswitch_data_1
    .packed-switch 0x7f0a004e
        :pswitch_3
    .end packed-switch
.end method

.method protected refresh()V
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lco/vine/android/ActivityFragment;->fetchContent(I)V

    .line 241
    return-void
.end method

.method public updateFollowRequestHeader()V
    .locals 12

    .prologue
    const/4 v11, -0x1

    const/4 v8, 0x5

    const/4 v7, 0x1

    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 389
    iget-boolean v5, p0, Lco/vine/android/ActivityFragment;->mPrivate:Z

    if-eqz v5, :cond_1

    .line 390
    iget v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 391
    .local v1, followState:I
    iget v0, p0, Lco/vine/android/ActivityFragment;->mFollowRequestCount:I

    .line 392
    .local v0, count:I
    if-gtz v0, :cond_2

    .line 393
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    if-eqz v5, :cond_0

    iget-boolean v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderShowing:Z

    if-eqz v5, :cond_0

    .line 394
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    const v6, 0x7f0a013b

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 395
    .local v4, v:Landroid/view/View;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v11, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 397
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 398
    iput-boolean v9, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderShowing:Z

    .line 399
    invoke-virtual {p0, v9}, Lco/vine/android/ActivityFragment;->setRefreshableHeaderOffset(I)V

    .line 401
    .end local v4           #v:Landroid/view/View;
    :cond_0
    const/4 v5, 0x4

    iput v5, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 475
    .end local v0           #count:I
    .end local v1           #followState:I
    :cond_1
    :goto_0
    return-void

    .line 405
    .restart local v0       #count:I
    .restart local v1       #followState:I
    :cond_2
    iget-boolean v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderAdded:Z

    if-nez v5, :cond_3

    .line 406
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    .line 407
    .local v3, inflater:Landroid/view/LayoutInflater;
    const v5, 0x7f030057

    iget-object v6, p0, Lco/vine/android/ActivityFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v5, v6, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 409
    .local v2, header:Landroid/widget/LinearLayout;
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5, v2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 410
    iput-object v2, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    .line 411
    iput-boolean v7, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderAdded:Z

    .line 412
    const/4 v5, 0x6

    invoke-virtual {p0, v5}, Lco/vine/android/ActivityFragment;->setRefreshableHeaderOffset(I)V

    .line 414
    const v5, 0x7f0a013c

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderCollapsed:Landroid/widget/ImageView;

    .line 415
    const v5, 0x7f0a013d

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mTextCollapsed:Landroid/widget/TextView;

    .line 416
    const v5, 0x7f0a0140

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderExpanded:Landroid/widget/ImageView;

    .line 417
    const v5, 0x7f0a0141

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mTextExpanded:Landroid/widget/TextView;

    .line 418
    const v5, 0x7f0a013e

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderFew:Landroid/widget/ImageView;

    .line 419
    const v5, 0x7f0a013f

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lco/vine/android/ActivityFragment;->mTextFew:Landroid/widget/TextView;

    .line 421
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderCollapsed:Landroid/widget/ImageView;

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 422
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderExpanded:Landroid/widget/ImageView;

    invoke-virtual {v5, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 424
    if-le v0, v8, :cond_3

    .line 425
    const/4 v1, 0x1

    .line 429
    .end local v2           #header:Landroid/widget/LinearLayout;
    .end local v3           #inflater:Landroid/view/LayoutInflater;
    :cond_3
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    if-eqz v5, :cond_4

    .line 430
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 431
    const/4 v5, 0x6

    invoke-virtual {p0, v5}, Lco/vine/android/ActivityFragment;->setRefreshableHeaderOffset(I)V

    .line 432
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    const v6, 0x7f0a013b

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 433
    .restart local v4       #v:Landroid/view/View;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v5, v11, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 436
    iput-boolean v7, p0, Lco/vine/android/ActivityFragment;->mFollowHeaderShowing:Z

    .line 438
    if-le v0, v8, :cond_5

    if-ne v1, v7, :cond_5

    .line 439
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderCollapsed:Landroid/widget/ImageView;

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 440
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextCollapsed:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 441
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextCollapsed:Landroid/widget/TextView;

    const v6, 0x7f0e00cc

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {p0, v6, v7}, Lco/vine/android/ActivityFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 443
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderExpanded:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 444
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextExpanded:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 445
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderFew:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 446
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextFew:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 468
    .end local v4           #v:Landroid/view/View;
    :cond_4
    :goto_1
    iget v5, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    if-eq v5, v1, :cond_7

    .line 469
    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    .line 470
    invoke-virtual {p0}, Lco/vine/android/ActivityFragment;->restartLoader()Z

    goto/16 :goto_0

    .line 447
    .restart local v4       #v:Landroid/view/View;
    :cond_5
    if-le v0, v8, :cond_6

    const/4 v5, 0x2

    if-ne v1, v5, :cond_6

    .line 448
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderExpanded:Landroid/widget/ImageView;

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 449
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextExpanded:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 450
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextExpanded:Landroid/widget/TextView;

    const v6, 0x7f0e00cc

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {p0, v6, v7}, Lco/vine/android/ActivityFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 452
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderCollapsed:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 453
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextCollapsed:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 454
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderFew:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 455
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextFew:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 456
    :cond_6
    if-gt v0, v8, :cond_4

    .line 457
    const/4 v1, 0x3

    .line 458
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderFew:Landroid/widget/ImageView;

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 459
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextFew:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 460
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextFew:Landroid/widget/TextView;

    const v6, 0x7f0e00cb

    invoke-virtual {p0, v6}, Lco/vine/android/ActivityFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderCollapsed:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 463
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextCollapsed:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 464
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mHeaderExpanded:Landroid/widget/ImageView;

    invoke-virtual {v5, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 465
    iget-object v5, p0, Lco/vine/android/ActivityFragment;->mTextExpanded:Landroid/widget/TextView;

    invoke-virtual {v5, v10}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 472
    .end local v4           #v:Landroid/view/View;
    :cond_7
    iput v1, p0, Lco/vine/android/ActivityFragment;->mFollowState:I

    goto/16 :goto_0
.end method
