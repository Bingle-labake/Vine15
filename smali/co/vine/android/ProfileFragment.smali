.class public Lco/vine/android/ProfileFragment;
.super Lco/vine/android/BaseTimelineFragment;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lco/vine/android/widget/TabButton$TabChanger;
.implements Lco/vine/android/ViewOffsetResolver;
.implements Lco/vine/android/widget/SpanClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/ProfileFragment$PrivateAccountAdapter;,
        Lco/vine/android/ProfileFragment$ProfileListener;
    }
.end annotation


# static fields
.field public static final ARG_FOLLOW_EVENT_SOURCE:Ljava/lang/String; = "event_source"

.field public static final ARG_TAKE_FOCUS:Ljava/lang/String; = "take_focus"

.field public static final ARG_USER_ID:Ljava/lang/String; = "user_id"

.field public static final ARG_VANITY_URL:Ljava/lang/String; = "vanity_url"

.field private static final EVENT_SOURCE_TITLE:Ljava/lang/String; = "Profile: Tab "

.field private static final FLAG_PROFILE_INFO:I = 0x1

.field private static final FLAG_PROFILE_LIKES:I = 0x4

.field private static final FLAG_PROFILE_POSTS:I = 0x2

.field public static final FRAGMENT_TAG:Ljava/lang/String; = "profile"

.field private static final LOADER_ID_HIDE_REPOSTS:I = 0x3

.field private static final LOADER_ID_LIKES:I = 0x2

.field private static final LOADER_ID_POSTS:I = 0x1

.field private static final PREF_PROFILE_FETCH_COUNT:Ljava/lang/String; = "profile_fetch_count"

.field private static final STATE_HEADER_ADDED:Ljava/lang/String; = "stated_header_added"

.field private static final STATE_TAB:Ljava/lang/String; = "state_tab"

.field private static final TAB_LIKES:I = 0x2

.field private static final TAB_POSTS:I = 0x1


# instance fields
.field private mCurrentTab:I

.field protected mCursorPreviousLikes:I

.field protected mCursorPreviousPosts:I

.field protected mCursorQuerySizeLikes:I

.field protected mCursorQuerySizePosts:I

.field private mFetchFlags:I

.field protected mFlurryFollowEventSource:Ljava/lang/String;

.field private mFollowHeader:Landroid/widget/LinearLayout;

.field private mHeaderAdded:Z

.field private mHideProfileReposts:Z

.field private mHideRevines:Landroid/view/MenuItem;

.field private mIsMe:Z

.field private mIsUserBlocked:Z

.field private mLikePage:I

.field private mPendingFollowAccept:Landroid/widget/RelativeLayout;

.field private mPendingFollowReject:Landroid/widget/RelativeLayout;

.field private mPopupWindow:Landroid/widget/PopupWindow;

.field private mPostPage:I

.field mPrivateAdapter:Lco/vine/android/ProfileFragment$PrivateAccountAdapter;

.field mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

.field private mRepostsEnabled:Z

.field private mRepostsToggled:Z

.field private mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

.field private mTakeFocus:Z

.field private mUser:Lco/vine/android/api/VineUser;

.field private mUserId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Lco/vine/android/BaseTimelineFragment;-><init>()V

    .line 1176
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/ProfileFragment;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget v0, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/ProfileFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    return v0
.end method

.method static synthetic access$1000(Lco/vine/android/ProfileFragment;)Landroid/widget/LinearLayout;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$102(Lco/vine/android/ProfileFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-boolean p1, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    return p1
.end method

.method static synthetic access$1102(Lco/vine/android/ProfileFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-boolean p1, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    return p1
.end method

.method static synthetic access$1200(Lco/vine/android/ProfileFragment;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->initProfile()V

    return-void
.end method

.method static synthetic access$200(Lco/vine/android/ProfileFragment;)Lco/vine/android/api/VineUser;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    return-object v0
.end method

.method static synthetic access$202(Lco/vine/android/ProfileFragment;Lco/vine/android/api/VineUser;)Lco/vine/android/api/VineUser;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-object p1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    return-object p1
.end method

.method static synthetic access$300(Lco/vine/android/ProfileFragment;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->isLocked()Z

    move-result v0

    return v0
.end method

.method static synthetic access$402(Lco/vine/android/ProfileFragment;Lco/vine/android/widget/SectionAdapter;)Lco/vine/android/widget/SectionAdapter;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-object p1, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    return-object p1
.end method

.method static synthetic access$500(Lco/vine/android/ProfileFragment;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->setup()V

    return-void
.end method

.method static synthetic access$600(Lco/vine/android/ProfileFragment;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 66
    iget-wide v0, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    return-wide v0
.end method

.method static synthetic access$602(Lco/vine/android/ProfileFragment;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-wide p1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    return-wide p1
.end method

.method static synthetic access$702(Lco/vine/android/ProfileFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-boolean p1, p0, Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z

    return p1
.end method

.method static synthetic access$802(Lco/vine/android/ProfileFragment;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    iput-boolean p1, p0, Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z

    return p1
.end method

.method static synthetic access$900(Lco/vine/android/ProfileFragment;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->bindProfileDataAndCounts()V

    return-void
.end method

.method private bindProfileDataAndCounts()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 224
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    if-nez v1, :cond_0

    .line 242
    :goto_0
    return-void

    .line 227
    :cond_0
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-eqz v1, :cond_1

    .line 228
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 229
    .local v0, pref:Landroid/content/SharedPreferences;
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_name"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    .line 230
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_description"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    .line 231
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_location"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    .line 232
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_email"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->email:Ljava/lang/String;

    .line 233
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_phone"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->phoneNumber:Ljava/lang/String;

    .line 234
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "settings_profile_avatar_url"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    .line 235
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "profile_follow_count"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lco/vine/android/api/VineUser;->followingCount:I

    .line 236
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "profile_follower_count"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lco/vine/android/api/VineUser;->followerCount:I

    .line 237
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "profile_authored_post_count"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lco/vine/android/api/VineUser;->authoredPostCount:I

    .line 238
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "profile_post_count"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lco/vine/android/api/VineUser;->postCount:I

    .line 239
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    const-string v2, "profile_like_count"

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lco/vine/android/api/VineUser;->likeCount:I

    .line 241
    .end local v0           #pref:Landroid/content/SharedPreferences;
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {p0, v1}, Lco/vine/android/ProfileFragment;->bindUserData(Lco/vine/android/api/VineUser;)V

    goto :goto_0
.end method

.method private initProfile()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    .line 194
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v3}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    if-nez v3, :cond_0

    .line 195
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->initLoader(I)V

    .line 196
    invoke-virtual {p0, v6}, Lco/vine/android/ProfileFragment;->initLoader(I)V

    .line 198
    :cond_0
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v3, :cond_2

    .line 199
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->bindProfileDataAndCounts()V

    .line 200
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 217
    :goto_0
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    if-eqz v3, :cond_1

    .line 218
    iget v3, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    if-ne v3, v6, :cond_5

    const v2, 0x7f0a010a

    .line 219
    .local v2, tabId:I
    :goto_1
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v3, v2}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    .line 221
    .end local v2           #tabId:I
    :cond_1
    return-void

    .line 202
    :cond_2
    iget v3, p0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    or-int/lit8 v3, v3, 0x1

    iput v3, p0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    .line 203
    iget-boolean v3, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-eqz v3, :cond_4

    .line 204
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v4, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v3, v4, v5}, Lco/vine/android/client/AppController;->fetchUsersMe(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 207
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 208
    .local v1, prefs:Landroid/content/SharedPreferences;
    const-string v3, "profile_fetch_count"

    const/4 v4, 0x0

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 209
    .local v0, count:I
    rem-int/lit8 v3, v0, 0x5

    if-nez v3, :cond_3

    .line 210
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v4, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v3, v4, v5}, Lco/vine/android/client/AppController;->fetchFriends(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 212
    :cond_3
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "profile_fetch_count"

    add-int/lit8 v5, v0, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 214
    .end local v0           #count:I
    .end local v1           #prefs:Landroid/content/SharedPreferences;
    :cond_4
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v4, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v3, v4, v5}, Lco/vine/android/client/AppController;->fetchUser(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 218
    :cond_5
    const v2, 0x7f0a0108

    goto :goto_1
.end method

.method private isLocked()Z
    .locals 1

    .prologue
    .line 837
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v0}, Lco/vine/android/api/VineUser;->isPrivateLocked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v0}, Lco/vine/android/api/VineUser;->isBlocked()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setRevineOptionText(Lco/vine/android/api/VineUser;Z)V
    .locals 2
    .parameter "user"
    .parameter "repostsEnabled"

    .prologue
    .line 573
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mHideRevines:Landroid/view/MenuItem;

    .line 575
    .local v0, hideRevines:Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 576
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lco/vine/android/api/VineUser;->isFollowing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 577
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 584
    :cond_0
    :goto_0
    return-void

    .line 578
    :cond_1
    if-eqz p2, :cond_2

    .line 579
    const v1, 0x7f0e00d4

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0

    .line 581
    :cond_2
    const v1, 0x7f0e01a0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method private setup()V
    .locals 9

    .prologue
    .line 618
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    if-nez v0, :cond_0

    .line 619
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 620
    new-instance v0, Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v5, 0x1

    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v3}, Lco/vine/android/api/VineUser;->isBlocked()Z

    move-result v6

    iget-object v7, p0, Lco/vine/android/ProfileFragment;->mFlurryFollowEventSource:Ljava/lang/String;

    iget-boolean v8, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    move-object v3, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v8}, Lco/vine/android/ProfileHeaderAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;Landroid/view/View$OnClickListener;Lco/vine/android/widget/SpanClickListener;ZZLjava/lang/String;Z)V

    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    .line 622
    new-instance v0, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;

    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v1}, Lco/vine/android/api/VineUser;->isBlocked()Z

    move-result v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v2}, Lco/vine/android/api/VineUser;->isPrivateLocked()Z

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Lco/vine/android/ProfileFragment$PrivateAccountAdapter;-><init>(Lco/vine/android/ProfileFragment;ZZ)V

    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mPrivateAdapter:Lco/vine/android/ProfileFragment$PrivateAccountAdapter;

    .line 624
    new-instance v0, Lco/vine/android/widget/SectionAdapter;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/widget/BaseAdapter;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mPrivateAdapter:Lco/vine/android/ProfileFragment$PrivateAccountAdapter;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lco/vine/android/widget/SectionAdapter;-><init>([Landroid/widget/BaseAdapter;)V

    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    .line 626
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 627
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    invoke-virtual {v0}, Lco/vine/android/widget/SectionAdapter;->notifyDataSetChanged()V

    .line 642
    :cond_0
    :goto_0
    return-void

    .line 629
    :cond_1
    new-instance v0, Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, p0, Lco/vine/android/ProfileFragment;->mFlurryFollowEventSource:Ljava/lang/String;

    iget-boolean v8, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    move-object v3, p0

    move-object v4, p0

    invoke-direct/range {v0 .. v8}, Lco/vine/android/ProfileHeaderAdapter;-><init>(Landroid/content/Context;Lco/vine/android/client/AppController;Landroid/view/View$OnClickListener;Lco/vine/android/widget/SpanClickListener;ZZLjava/lang/String;Z)V

    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    .line 631
    new-instance v0, Lco/vine/android/widget/SectionAdapter;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/widget/BaseAdapter;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lco/vine/android/widget/SectionAdapter;-><init>([Landroid/widget/BaseAdapter;)V

    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    .line 635
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mTakeFocus:Z

    if-eqz v0, :cond_2

    .line 636
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    .line 638
    :cond_2
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 639
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p0}, Lco/vine/android/widget/GenericTimelineAdapter;->setOffsetResolver(Lco/vine/android/ViewOffsetResolver;)V

    goto :goto_0
.end method

.method private updateTabSelection()V
    .locals 2

    .prologue
    .line 270
    iget v0, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 271
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    const v1, 0x7f0a0108

    invoke-virtual {v0, v1}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    .line 275
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    iget v0, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 273
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    const v1, 0x7f0a010a

    invoke-virtual {v0, v1}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    goto :goto_0
.end method


# virtual methods
.method bindUserData(Lco/vine/android/api/VineUser;)V
    .locals 5
    .parameter "user"

    .prologue
    const/4 v4, 0x0

    .line 245
    invoke-virtual {p1}, Lco/vine/android/api/VineUser;->hasFollowApprovalPending()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mHeaderAdded:Z

    if-nez v2, :cond_1

    .line 246
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 247
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v2, 0x7f030035

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 249
    .local v0, approvalPending:Landroid/widget/LinearLayout;
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mListView:Landroid/widget/ListView;

    if-eqz v2, :cond_0

    .line 250
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 251
    const v2, 0x7f0a009d

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lco/vine/android/ProfileFragment;->mPendingFollowAccept:Landroid/widget/RelativeLayout;

    .line 253
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mPendingFollowAccept:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    const v2, 0x7f0a009a

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout;

    iput-object v2, p0, Lco/vine/android/ProfileFragment;->mPendingFollowReject:Landroid/widget/RelativeLayout;

    .line 256
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mPendingFollowReject:Landroid/widget/RelativeLayout;

    invoke-virtual {v2, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    iput-object v0, p0, Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    .line 258
    const/4 v2, 0x1

    iput-boolean v2, p0, Lco/vine/android/ProfileFragment;->mHeaderAdded:Z

    .line 260
    :cond_0
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mFollowHeader:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 262
    .end local v0           #approvalPending:Landroid/widget/LinearLayout;
    .end local v1           #inflater:Landroid/view/LayoutInflater;
    :cond_1
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    invoke-virtual {v2}, Lco/vine/android/api/VineUser;->areRepostsEnabled()Z

    move-result v2

    iput-boolean v2, p0, Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z

    .line 263
    invoke-virtual {p1}, Lco/vine/android/api/VineUser;->areRepostsEnabled()Z

    move-result v2

    invoke-direct {p0, p1, v2}, Lco/vine/android/ProfileFragment;->setRevineOptionText(Lco/vine/android/api/VineUser;Z)V

    .line 264
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v2, p1}, Lco/vine/android/ProfileHeaderAdapter;->bindUser(Lco/vine/android/api/VineUser;)V

    .line 266
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->updateTabSelection()V

    .line 267
    return-void
.end method

.method public changeTab(Landroid/widget/Button;)V
    .locals 5
    .parameter "tab"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 587
    invoke-virtual {p1}, Landroid/widget/Button;->getId()I

    move-result v0

    .line 588
    .local v0, tabId:I
    packed-switch v0, :pswitch_data_0

    .line 608
    :goto_0
    :pswitch_0
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v1, v0}, Lco/vine/android/ProfileHeaderAdapter;->changeSelectedTab(I)V

    .line 609
    :cond_0
    return-void

    .line 590
    :pswitch_1
    iget v1, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    if-eq v1, v3, :cond_0

    .line 593
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    invoke-virtual {v1, v3, v4, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 594
    iput v3, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    .line 595
    const-string v1, "Profile: Tab 2"

    iput-object v1, p0, Lco/vine/android/ProfileFragment;->mFlurryEventSource:Ljava/lang/String;

    goto :goto_0

    .line 599
    :pswitch_2
    iget v1, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    if-eq v1, v2, :cond_0

    .line 602
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 603
    iput v2, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    .line 604
    const-string v1, "Profile: Tab 1"

    iput-object v1, p0, Lco/vine/android/ProfileFragment;->mFlurryEventSource:Ljava/lang/String;

    goto :goto_0

    .line 588
    :pswitch_data_0
    .packed-switch 0x7f0a0108
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected fetchContent(IZ)V
    .locals 20
    .parameter "fetchType"
    .parameter "userInitiated"

    .prologue
    .line 646
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/ProfileFragment;->mLastFetchType:I

    .line 647
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/ProfileFragment;->hasPendingRequest(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 683
    :goto_0
    return-void

    .line 652
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 666
    :pswitch_0
    const/4 v8, 0x1

    .line 671
    .local v8, pageType:I
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    if-eqz v2, :cond_1

    const/16 v7, 0xa

    .line 674
    .local v7, postGroup:I
    :goto_2
    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    or-int/lit8 v2, v2, 0x2

    move-object/from16 v0, p0

    iput v2, v0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    .line 675
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    const/16 v4, 0xa

    move-object/from16 v0, p0

    iget-wide v5, v0, Lco/vine/android/ProfileFragment;->mUserId:J

    move-object/from16 v0, p0

    iget-wide v9, v0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move/from16 v9, p2

    invoke-virtual/range {v2 .. v12}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    .line 679
    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    or-int/lit8 v2, v2, 0x4

    move-object/from16 v0, p0

    iput v2, v0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    .line 680
    move-object/from16 v0, p0

    iget-object v9, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v10

    const/16 v11, 0xa

    move-object/from16 v0, p0

    iget-wide v12, v0, Lco/vine/android/ProfileFragment;->mUserId:J

    const/4 v14, 0x3

    move-object/from16 v0, p0

    iget-wide v2, v0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    const/16 v19, 0x0

    move v15, v8

    move/from16 v16, p2

    invoke-virtual/range {v9 .. v19}, Lco/vine/android/client/AppController;->fetchPosts(Lco/vine/android/client/Session;IJIIZLjava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual {v0, v2, v1}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    goto :goto_0

    .line 655
    .end local v7           #postGroup:I
    .end local v8           #pageType:I
    :pswitch_1
    const/4 v8, 0x2

    .line 656
    .restart local v8       #pageType:I
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    goto :goto_1

    .line 660
    .end local v8           #pageType:I
    :pswitch_2
    const/4 v8, 0x3

    .line 661
    .restart local v8       #pageType:I
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    goto :goto_1

    .line 671
    :cond_1
    const/4 v7, 0x2

    goto :goto_2

    .line 652
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected fetchPosts(IZ)Ljava/lang/String;
    .locals 2
    .parameter "pageType"
    .parameter "userInitiated"

    .prologue
    .line 340
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Don\'t call fetch posts for ProfileFragment, this fragment handles its own fetching."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOffset(Landroid/widget/BaseAdapter;)I
    .locals 2
    .parameter "me"

    .prologue
    .line 794
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    invoke-virtual {v1, p1}, Lco/vine/android/widget/SectionAdapter;->getMyAdapterIndex(Landroid/widget/BaseAdapter;)I

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/SectionAdapter;->getPositionOffset(I)I

    move-result v0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 367
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseTimelineFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 368
    packed-switch p1, :pswitch_data_0

    .line 379
    :cond_0
    :goto_0
    return-void

    .line 370
    :pswitch_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 371
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    .line 372
    iget-wide v0, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 373
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->fetchFriends(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 368
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 13
    .parameter "view"

    .prologue
    const v12, 0x7f0b0054

    const/4 v11, 0x1

    const/4 v10, -0x2

    const/4 v9, 0x0

    .line 687
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 749
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onClick(Landroid/view/View;)V

    .line 753
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 690
    .restart local p1
    :sswitch_0
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v5, p1, p0}, Lco/vine/android/ProfileHeaderAdapter;->onProfileHeaderClick(Landroid/view/View;Lco/vine/android/ProfileFragment;)V

    goto :goto_0

    .line 695
    :sswitch_1
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v5, p1, p0}, Lco/vine/android/ProfileHeaderAdapter;->onProfileHeaderClick(Landroid/view/View;Lco/vine/android/ProfileFragment;)V

    .line 696
    check-cast p1, Landroid/widget/Button;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/ProfileFragment;->changeTab(Landroid/widget/Button;)V

    goto :goto_0

    .line 700
    .restart local p1
    :sswitch_2
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->onFollowersClicked()V

    goto :goto_0

    .line 703
    :sswitch_3
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->onFollowingClicked()V

    goto :goto_0

    .line 706
    :sswitch_4
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v6, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v6

    iget-wide v7, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v5, v6, v7, v8}, Lco/vine/android/client/AppController;->acceptFollowRequest(Lco/vine/android/client/Session;J)Ljava/lang/String;

    goto :goto_0

    .line 710
    :sswitch_5
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v6, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v6

    iget-wide v7, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v5, v6, v7, v8}, Lco/vine/android/client/AppController;->acceptRejectRequest(Lco/vine/android/client/Session;J)Ljava/lang/String;

    goto :goto_0

    .line 714
    :sswitch_6
    iget-boolean v5, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    if-eqz v5, :cond_1

    const v5, 0x7f0e01a0

    :goto_1
    invoke-virtual {p0, v5}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 716
    .local v2, label:Ljava/lang/String;
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    const v6, 0x7f030050

    const v7, 0x7f0a00c3

    new-array v8, v11, [Ljava/lang/String;

    aput-object v2, v8, v9

    invoke-direct {v0, v5, v6, v7, v8}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    .line 719
    .local v0, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v1, Landroid/widget/ListView;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 720
    .local v1, contentView:Landroid/widget/ListView;
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 722
    .local v3, params:Landroid/widget/FrameLayout$LayoutParams;
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iput v5, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 723
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    invoke-virtual {v1, v9, v5, v9, v9}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 724
    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 725
    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 726
    new-instance v5, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x106000d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-direct {v5, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v5}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 728
    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 729
    invoke-virtual {v1, v9}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 731
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getView()Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 732
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getView()Landroid/view/View;

    move-result-object v5

    const v6, 0x7f0a0108

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lco/vine/android/widget/TabButton;

    .line 733
    .local v4, postsButton:Lco/vine/android/widget/TabButton;
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v5

    if-nez v5, :cond_0

    if-eqz v4, :cond_0

    .line 734
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v11}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 735
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 736
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Lco/vine/android/widget/TabButton;->getMeasuredWidth()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 737
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v10}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 741
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f090066

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-direct {v6, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v5, v6}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 743
    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v5, v4, v9, v9}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    goto/16 :goto_0

    .line 714
    .end local v0           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v1           #contentView:Landroid/widget/ListView;
    .end local v2           #label:Ljava/lang/String;
    .end local v3           #params:Landroid/widget/FrameLayout$LayoutParams;
    .end local v4           #postsButton:Lco/vine/android/widget/TabButton;
    :cond_1
    const v5, 0x7f0e00d4

    goto/16 :goto_1

    .line 687
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a0051 -> :sswitch_0
        0x7f0a009a -> :sswitch_5
        0x7f0a009d -> :sswitch_4
        0x7f0a0103 -> :sswitch_2
        0x7f0a0105 -> :sswitch_3
        0x7f0a0106 -> :sswitch_0
        0x7f0a0108 -> :sswitch_1
        0x7f0a0109 -> :sswitch_6
        0x7f0a010a -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 133
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onCreate(Landroid/os/Bundle;)V

    .line 134
    invoke-virtual {p0, v1}, Lco/vine/android/ProfileFragment;->setHasOptionsMenu(Z)V

    .line 136
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 137
    .local v0, b:Landroid/os/Bundle;
    const-string v3, "user_id"

    const-wide/16 v4, -0x1

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    iput-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    .line 138
    const-string v3, "Profile: Tab 1"

    iput-object v3, p0, Lco/vine/android/ProfileFragment;->mFlurryEventSource:Ljava/lang/String;

    .line 139
    const-string v3, "event_source"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/ProfileFragment;->mFlurryFollowEventSource:Ljava/lang/String;

    .line 140
    const-string v3, "take_focus"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lco/vine/android/ProfileFragment;->mTakeFocus:Z

    .line 141
    iget-boolean v3, p0, Lco/vine/android/ProfileFragment;->mTakeFocus:Z

    if-eqz v3, :cond_0

    .line 142
    invoke-virtual {p0, v1}, Lco/vine/android/ProfileFragment;->setFocused(Z)V

    .line 144
    :cond_0
    new-instance v3, Lco/vine/android/ProfileFragment$ProfileListener;

    invoke-direct {v3, p0}, Lco/vine/android/ProfileFragment$ProfileListener;-><init>(Lco/vine/android/ProfileFragment;)V

    iput-object v3, p0, Lco/vine/android/ProfileFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 145
    new-instance v3, Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    const/4 v5, 0x0

    const v6, 0x7f01002d

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v3, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    .line 147
    if-eqz p1, :cond_4

    .line 148
    const-string v3, "state_tab"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    .line 149
    const-string v3, "stated_header_added"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 150
    const-string v3, "stated_header_added"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lco/vine/android/ProfileFragment;->mHeaderAdded:Z

    .line 158
    :cond_1
    :goto_0
    invoke-static {v2}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v3

    iput v3, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizePosts:I

    .line 159
    invoke-static {v2}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v3

    iput v3, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizeLikes:I

    .line 160
    invoke-virtual {p0, v2}, Lco/vine/android/ProfileFragment;->showSadface(Z)V

    .line 162
    iput-boolean v1, p0, Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z

    .line 163
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v3, :cond_2

    .line 164
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    iput v1, v3, Lco/vine/android/api/VineUser;->repostsEnabled:I

    .line 168
    :cond_2
    const-string v3, "vanity_url"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 170
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    const-string v2, "vanity_url"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/client/AppController;->fetchUserId(Ljava/util/ArrayList;)Ljava/lang/String;

    .line 177
    :cond_3
    :goto_1
    return-void

    .line 153
    :cond_4
    iput v1, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    .line 154
    iput-boolean v2, p0, Lco/vine/android/ProfileFragment;->mHeaderAdded:Z

    goto :goto_0

    .line 171
    :cond_5
    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_3

    .line 172
    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_6

    :goto_2
    iput-boolean v1, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    .line 173
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-nez v1, :cond_3

    .line 174
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getBlockedUsers()Ljava/lang/String;

    goto :goto_1

    :cond_6
    move v1, v2

    .line 172
    goto :goto_2
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 12
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

    .line 426
    packed-switch p1, :pswitch_data_0

    .line 454
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find loader with id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 428
    :pswitch_0
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_USER:Landroid/net/Uri;

    iget-wide v1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v11

    .line 431
    .local v11, uri:Landroid/net/Uri$Builder;
    const-string v0, "limit"

    iget v1, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizePosts:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 433
    const-string v1, "hide_profile_reposts"

    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    if-eqz v0, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-virtual {v11, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 435
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v11}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    .end local v11           #uri:Landroid/net/Uri$Builder;
    :goto_1
    return-object v0

    .line 433
    .restart local v11       #uri:Landroid/net/Uri$Builder;
    :cond_0
    const-string v0, "0"

    goto :goto_0

    .line 439
    .end local v11           #uri:Landroid/net/Uri$Builder;
    :pswitch_1
    sget-object v0, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_USER_LIKES:Landroid/net/Uri;

    iget-wide v1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v11

    .line 442
    .restart local v11       #uri:Landroid/net/Uri$Builder;
    const-string v0, "limit"

    iget v1, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizeLikes:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 444
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v11}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 448
    .end local v11           #uri:Landroid/net/Uri$Builder;
    :pswitch_2
    sget-object v0, Lco/vine/android/provider/Vine$Users;->CONTENT_URI_HIDE_PROFILE_REPOSTS:Landroid/net/Uri;

    iget-wide v1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 450
    .local v6, contentUri:Landroid/net/Uri;
    new-instance v4, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    const/4 v0, 0x1

    new-array v7, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "hide_profile_reposts"

    aput-object v1, v7, v0

    move-object v8, v3

    move-object v9, v3

    move-object v10, v3

    invoke-direct/range {v4 .. v10}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v4

    goto :goto_1

    .line 426
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 279
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-nez v0, :cond_0

    .line 280
    const v0, 0x7f10000a

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 282
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 362
    const v0, 0x7f030046

    invoke-virtual {p0, p1, v0, p2}, Lco/vine/android/ProfileFragment;->createView(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onFollowersClicked()V
    .locals 4

    .prologue
    .line 821
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lco/vine/android/UsersActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 822
    .local v0, i:Landroid/content/Intent;
    const-string v1, "p_id"

    iget-wide v2, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 823
    const-string v1, "u_type"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 825
    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 826
    return-void
.end method

.method public onFollowingClicked()V
    .locals 4

    .prologue
    .line 829
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lco/vine/android/UsersActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 830
    .local v0, i:Landroid/content/Intent;
    const-string v1, "p_id"

    iget-wide v2, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 831
    const-string v1, "u_type"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 833
    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 834
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
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
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 771
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    if-nez v1, :cond_2

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    .line 772
    iput-boolean v2, p0, Lco/vine/android/ProfileFragment;->mRepostsToggled:Z

    .line 773
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    iget v4, v4, Lco/vine/android/api/VineUser;->following:I

    if-lez v4, :cond_0

    move v3, v2

    :cond_0
    iget-boolean v4, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    invoke-static {v1, v3, v4}, Lco/vine/android/util/FlurryUtils;->trackFilterProfileReposts(ZZZ)V

    .line 775
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-eqz v1, :cond_3

    .line 776
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 777
    .local v0, e:Landroid/content/SharedPreferences$Editor;
    const-string v1, "profile_hide_reposts"

    iget-boolean v3, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 778
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 783
    .end local v0           #e:Landroid/content/SharedPreferences$Editor;
    :goto_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    if-eqz v1, :cond_1

    .line 784
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mPopupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 788
    :cond_1
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->isFocused()Z

    move-result v3

    invoke-virtual {v1, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 789
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 790
    return-void

    :cond_2
    move v1, v3

    .line 771
    goto :goto_0

    .line 780
    :cond_3
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    iget-boolean v5, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    invoke-virtual {v1, v3, v4, v5}, Lco/vine/android/client/AppController;->setHideProfileReposts(JZ)Ljava/lang/String;

    goto :goto_1
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 8
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
    const/4 v7, 0x7

    const/4 v6, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 471
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 472
    .local v1, oldCursor:Landroid/database/Cursor;
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 559
    :cond_0
    :goto_0
    return-void

    .line 474
    :pswitch_0
    iget v4, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    if-ne v4, v2, :cond_0

    .line 475
    if-eqz v1, :cond_1

    .line 476
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {v1, v4}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 478
    :cond_1
    if-eqz p2, :cond_2

    .line 479
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {p2, v4}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 481
    :cond_2
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4, p2}, Lco/vine/android/widget/GenericTimelineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 482
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    iget v4, p0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    and-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_3

    .line 483
    invoke-virtual {p0, v6, v2}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    .line 495
    :goto_1
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 498
    iget v4, p0, Lco/vine/android/ProfileFragment;->mLastFetchType:I

    if-ne v4, v7, :cond_0

    .line 499
    invoke-virtual {p0, v7}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 500
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 501
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v3}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 502
    .local v0, newSize:I
    iget v3, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousPosts:I

    if-gt v0, v3, :cond_0

    .line 503
    invoke-virtual {p0, v2, v2}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    goto :goto_0

    .line 484
    .end local v0           #newSize:I
    :cond_3
    iget-boolean v4, p0, Lco/vine/android/ProfileFragment;->mRepostsToggled:Z

    if-eqz v4, :cond_4

    .line 485
    invoke-virtual {p0, v6, v3}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    .line 486
    iput-boolean v3, p0, Lco/vine/android/ProfileFragment;->mRepostsToggled:Z

    goto :goto_1

    .line 488
    :cond_4
    invoke-virtual {p0, v6}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 489
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    .line 490
    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->showSadface(Z)V

    goto :goto_1

    .line 492
    :cond_5
    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->showSadface(Z)V

    goto :goto_1

    .line 506
    :cond_6
    new-instance v2, Lco/vine/android/VineException;

    invoke-direct {v2}, Lco/vine/android/VineException;-><init>()V

    const-string v4, "Possible null cursor after swap."

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v4, v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 515
    :pswitch_1
    iget v4, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 516
    if-eqz v1, :cond_7

    .line 517
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {v1, v4}, Landroid/database/Cursor;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 519
    :cond_7
    if-eqz p2, :cond_8

    .line 520
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mChangeObserver:Lco/vine/android/BaseListFragment$ChangeObserver;

    invoke-interface {p2, v4}, Landroid/database/Cursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    .line 522
    :cond_8
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4, p2}, Lco/vine/android/widget/GenericTimelineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 523
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_a

    iget v4, p0, Lco/vine/android/ProfileFragment;->mFetchFlags:I

    and-int/lit8 v4, v4, 0x4

    if-nez v4, :cond_a

    .line 524
    invoke-virtual {p0, v6, v2}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    .line 533
    :goto_2
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v3}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 536
    iget v3, p0, Lco/vine/android/ProfileFragment;->mLastFetchType:I

    if-ne v3, v7, :cond_0

    .line 537
    iget-object v3, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v3}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 538
    .restart local v0       #newSize:I
    iget v3, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousLikes:I

    if-gt v0, v3, :cond_9

    .line 539
    invoke-virtual {p0, v2, v2}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    .line 541
    :cond_9
    invoke-virtual {p0, v7}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    goto/16 :goto_0

    .line 526
    .end local v0           #newSize:I
    :cond_a
    invoke-virtual {p0, v6}, Lco/vine/android/ProfileFragment;->hideProgress(I)V

    .line 527
    iget-object v4, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v4}, Lco/vine/android/widget/GenericTimelineAdapter;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_b

    .line 528
    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->showSadface(Z)V

    goto :goto_2

    .line 530
    :cond_b
    invoke-virtual {p0, v3}, Lco/vine/android/ProfileFragment;->showSadface(Z)V

    goto :goto_2

    .line 548
    :pswitch_2
    if-eqz p2, :cond_d

    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 549
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    if-lez v4, :cond_c

    :goto_3
    iput-boolean v2, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    .line 553
    :goto_4
    const/4 v2, 0x0

    iput-object v2, p0, Lco/vine/android/ProfileFragment;->mSectionAdapter:Lco/vine/android/widget/SectionAdapter;

    .line 554
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->setup()V

    .line 555
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->initProfile()V

    goto/16 :goto_0

    :cond_c
    move v2, v3

    .line 549
    goto :goto_3

    .line 551
    :cond_d
    iput-boolean v3, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    goto :goto_4

    .line 472
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/ProfileFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 563
    .local p1, loader:Landroid/support/v4/content/Loader;,"Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 570
    :goto_0
    return-void

    .line 566
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    .line 563
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .parameter "view"

    .prologue
    .line 757
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 764
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 760
    :sswitch_0
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mProfileHeaderAdapter:Lco/vine/android/ProfileHeaderAdapter;

    invoke-virtual {v0, p1}, Lco/vine/android/ProfileHeaderAdapter;->onProfileHeaderLongClick(Landroid/view/View;)V

    .line 761
    const/4 v0, 0x1

    goto :goto_0

    .line 757
    :sswitch_data_0
    .sparse-switch
        0x7f0a0051 -> :sswitch_0
        0x7f0a0106 -> :sswitch_0
    .end sparse-switch
.end method

.method public onMoveTo(I)V
    .locals 0
    .parameter "oldPosition"

    .prologue
    .line 346
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onMoveTo(I)V

    .line 347
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->setup()V

    .line 348
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->bindProfileDataAndCounts()V

    .line 349
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 286
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 319
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :cond_0
    :goto_0
    return v1

    .line 288
    :pswitch_0
    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z

    if-eqz v2, :cond_1

    .line 289
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->unblockUser(J)Ljava/lang/String;

    goto :goto_0

    .line 291
    :cond_1
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->blockUser(J)Ljava/lang/String;

    goto :goto_0

    .line 296
    :pswitch_1
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->reportPerson(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 300
    :pswitch_2
    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z

    if-eqz v2, :cond_2

    .line 301
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->disableReposts(J)Ljava/lang/String;

    goto :goto_0

    .line 303
    :cond_2
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v2, v3, v4}, Lco/vine/android/client/AppController;->enableReposts(J)Ljava/lang/String;

    goto :goto_0

    .line 308
    :pswitch_3
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-nez v2, :cond_0

    .line 309
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackShareProfile()V

    .line 310
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 311
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "vnd.android-dir/mms-sms"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 312
    const-string v2, "sms_body"

    invoke-static {}, Lco/vine/android/util/Util;->getShareProfileMessageId()I

    move-result v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    iget-object v6, v6, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    aput-object v6, v4, v5

    iget-object v5, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    iget-wide v5, v5, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {p0, v3, v4}, Lco/vine/android/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 314
    const v2, 0x7f0e0150

    invoke-virtual {p0, v2}, Lco/vine/android/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {p0, v2}, Lco/vine/android/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 286
    :pswitch_data_0
    .packed-switch 0x7f0a0195
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 613
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onPause()V

    .line 614
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 615
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 3
    .parameter "menu"

    .prologue
    .line 326
    const v1, 0x7f0a0195

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 327
    .local v0, block:Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 328
    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mIsUserBlocked:Z

    if-eqz v1, :cond_1

    .line 329
    const v1, 0x7f0e01c8

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 334
    :cond_0
    :goto_0
    const v1, 0x7f0a0197

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/ProfileFragment;->mHideRevines:Landroid/view/MenuItem;

    .line 335
    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mUser:Lco/vine/android/api/VineUser;

    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mRepostsEnabled:Z

    invoke-direct {p0, v1, v2}, Lco/vine/android/ProfileFragment;->setRevineOptionText(Lco/vine/android/api/VineUser;Z)V

    .line 336
    return-void

    .line 331
    :cond_1
    const v1, 0x7f0e004e

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    goto :goto_0
.end method

.method public onResume()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    .line 181
    invoke-super {p0}, Lco/vine/android/BaseTimelineFragment;->onResume()V

    .line 182
    invoke-virtual {p0, v4}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    .line 183
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-eqz v0, :cond_1

    .line 184
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "profile_hide_reposts"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/ProfileFragment;->mHideProfileReposts:Z

    .line 186
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->setup()V

    .line 187
    invoke-direct {p0}, Lco/vine/android/ProfileFragment;->initProfile()V

    .line 191
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    iget-wide v0, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 189
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v4, v1, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 383
    invoke-super {p0, p1}, Lco/vine/android/BaseTimelineFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 384
    const-string v0, "state_tab"

    iget v1, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 385
    const-string v0, "stated_header_added"

    iget-boolean v1, p0, Lco/vine/android/ProfileFragment;->mHeaderAdded:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 386
    return-void
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 6
    .parameter "cursor"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x7

    .line 393
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v2}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object p1

    .line 394
    iget-boolean v2, p0, Lco/vine/android/ProfileFragment;->mRefreshable:Z

    if-eqz v2, :cond_0

    .line 395
    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 396
    .local v0, extras:Landroid/os/Bundle;
    const-string v2, "is_last"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 397
    .local v1, isLast:Z
    if-nez v1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    const/16 v3, 0x190

    if-gt v2, v3, :cond_0

    .line 398
    iget-object v2, p0, Lco/vine/android/ProfileFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->isFocused()Z

    move-result v3

    invoke-virtual {v2, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 399
    iput v4, p0, Lco/vine/android/ProfileFragment;->mLastFetchType:I

    .line 400
    iget v2, p0, Lco/vine/android/ProfileFragment;->mCurrentTab:I

    packed-switch v2, :pswitch_data_0

    .line 422
    .end local v0           #extras:Landroid/os/Bundle;
    .end local v1           #isLast:Z
    :cond_0
    :goto_0
    return-void

    .line 402
    .restart local v0       #extras:Landroid/os/Bundle;
    .restart local v1       #isLast:Z
    :pswitch_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousPosts:I

    .line 403
    iget v2, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousPosts:I

    invoke-static {v2}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v2

    iput v2, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizePosts:I

    .line 404
    invoke-virtual {p0, v4}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    .line 405
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3, v5, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 406
    iget v2, p0, Lco/vine/android/ProfileFragment;->mPostPage:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/vine/android/ProfileFragment;->mPostPage:I

    .line 407
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_Post"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lco/vine/android/ProfileFragment;->mPostPage:I

    invoke-static {v2, v3}, Lco/vine/android/util/FlurryUtils;->trackTimeLinePageScroll(Ljava/lang/String;I)V

    goto :goto_0

    .line 411
    :pswitch_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousLikes:I

    .line 412
    iget v2, p0, Lco/vine/android/ProfileFragment;->mCursorPreviousLikes:I

    invoke-static {v2}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v2

    iput v2, p0, Lco/vine/android/ProfileFragment;->mCursorQuerySizeLikes:I

    .line 413
    invoke-virtual {p0, v4}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    .line 414
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v5, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 415
    iget v2, p0, Lco/vine/android/ProfileFragment;->mLikePage:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/vine/android/ProfileFragment;->mLikePage:I

    .line 416
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_Like"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lco/vine/android/ProfileFragment;->mLikePage:I

    invoke-static {v2, v3}, Lco/vine/android/util/FlurryUtils;->trackTimeLinePageScroll(Ljava/lang/String;I)V

    goto :goto_0

    .line 400
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 5
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 799
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 800
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    if-nez v0, :cond_0

    .line 818
    :goto_0
    return-void

    .line 803
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/vine/android/UsersActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 804
    .local v1, i:Landroid/content/Intent;
    const-string v2, "p_id"

    iget-wide v3, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 805
    packed-switch p2, :pswitch_data_0

    .line 815
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseTimelineFragment;->onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V

    goto :goto_0

    .line 807
    :pswitch_0
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->onFollowersClicked()V

    goto :goto_0

    .line 811
    :pswitch_1
    invoke-virtual {p0}, Lco/vine/android/ProfileFragment;->onFollowingClicked()V

    goto :goto_0

    .line 805
    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .parameter "view"
    .parameter "savedInstanceState"

    .prologue
    .line 353
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseTimelineFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 354
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->setRefreshableHeaderOffset(I)V

    .line 355
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 356
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->showProgress(I)V

    .line 357
    return-void
.end method

.method protected refresh()V
    .locals 3

    .prologue
    .line 461
    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/ProfileFragment;->fetchContent(IZ)V

    .line 462
    iget-boolean v0, p0, Lco/vine/android/ProfileFragment;->mIsMe:Z

    if-eqz v0, :cond_0

    .line 463
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v1, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v1}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->fetchUsersMe(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 467
    :goto_0
    return-void

    .line 465
    :cond_0
    iget-object v0, p0, Lco/vine/android/ProfileFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-wide v1, p0, Lco/vine/android/ProfileFragment;->mUserId:J

    invoke-virtual {v0, v1, v2}, Lco/vine/android/client/AppController;->fetchUser(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/ProfileFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method
