.class public abstract Lco/vine/android/BaseTimelineFragment;
.super Lco/vine/android/BaseListFragment;
.source "BaseTimelineFragment.java"

# interfaces
.implements Lco/vine/android/widget/SpanClickListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;
    }
.end annotation


# static fields
.field private static final REQUEST_CODE_OPTIONS:I = 0xa

.field private static final STATE_LIKE_CACHE:Ljava/lang/String; = "state_like_cache"

.field private static final STATE_REVINE_CACHE:Ljava/lang/String; = "state_revine_cache"


# instance fields
.field private mCallback:Landroid/support/v7/app/ActionBarActivity;

.field protected mCursorPreviousSize:I

.field protected mCursorQuerySize:I

.field protected mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

.field protected mFetched:Z

.field protected mFlurryEventSource:Ljava/lang/String;

.field protected final mHeaderParents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field protected mLastFetchType:I

.field protected mLikeCache:Lco/vine/android/LikeCache;

.field private final mMuteChangeReceiver:Landroid/content/BroadcastReceiver;

.field protected mPage:I

.field protected mRestoreOffset:I

.field protected mRestoreStatusId:J

.field protected mRevineCache:Lco/vine/android/RevineCache;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lco/vine/android/BaseListFragment;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mHeaderParents:Ljava/util/HashSet;

    .line 86
    new-instance v0, Lco/vine/android/BaseTimelineFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/BaseTimelineFragment$1;-><init>(Lco/vine/android/BaseTimelineFragment;)V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mMuteChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 507
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/BaseTimelineFragment;)Landroid/support/v7/app/ActionBarActivity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 51
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mCallback:Landroid/support/v7/app/ActionBarActivity;

    return-object v0
.end method

.method private startReshareActivity(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 3
    .parameter "network"
    .parameter "data"

    .prologue
    .line 461
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 462
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, p1, v2}, Lco/vine/android/ReshareActivity;->getReshareIntent(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v1

    .line 463
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 464
    return-void
.end method


# virtual methods
.method public addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V
    .locals 1
    .parameter "view"
    .parameter "data"
    .parameter "isSeletable"

    .prologue
    .line 112
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 113
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mHeaderParents:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 114
    return-void
.end method

.method protected fetchContent(IZ)V
    .locals 2
    .parameter "fetchType"
    .parameter "userInitiated"

    .prologue
    .line 238
    iput p1, p0, Lco/vine/android/BaseTimelineFragment;->mLastFetchType:I

    .line 239
    invoke-virtual {p0, p1}, Lco/vine/android/BaseTimelineFragment;->hasPendingRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 267
    :goto_0
    return-void

    .line 242
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/BaseTimelineFragment;->mFetched:Z

    .line 246
    packed-switch p1, :pswitch_data_0

    .line 258
    :pswitch_0
    const/4 v0, 0x1

    .line 263
    .local v0, pageType:I
    :goto_1
    if-eqz p2, :cond_1

    .line 264
    invoke-virtual {p0, p1}, Lco/vine/android/BaseTimelineFragment;->showProgress(I)V

    .line 266
    :cond_1
    invoke-virtual {p0, v0, p2}, Lco/vine/android/BaseTimelineFragment;->fetchPosts(IZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;I)Ljava/lang/String;

    goto :goto_0

    .line 249
    .end local v0           #pageType:I
    :pswitch_1
    const/4 v0, 0x2

    .line 250
    .restart local v0       #pageType:I
    goto :goto_1

    .line 253
    .end local v0           #pageType:I
    :pswitch_2
    const/4 v0, 0x3

    .line 254
    .restart local v0       #pageType:I
    goto :goto_1

    .line 246
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected abstract fetchPosts(IZ)Ljava/lang/String;
.end method

.method public getHeaderViewParents()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mHeaderParents:Ljava/util/HashSet;

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 153
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 154
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 155
    .local v1, activity:Landroid/app/Activity;
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 156
    new-instance v0, Lco/vine/android/widget/ExploreFeedAdapter;

    iget-object v2, p0, Lco/vine/android/BaseTimelineFragment;->mListView:Landroid/widget/ListView;

    iget-object v3, p0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    iget-object v4, p0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-object v6, p0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object v5, p0

    invoke-direct/range {v0 .. v6}, Lco/vine/android/widget/ExploreFeedAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    .line 163
    :goto_0
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    .line 164
    invoke-static {v1}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lco/vine/android/widget/GenericTimelineAdapter;->setCompactLikesComments(Z)V

    .line 167
    :cond_0
    return-void

    .line 159
    :cond_1
    new-instance v0, Lco/vine/android/widget/FeedAdapter;

    iget-object v2, p0, Lco/vine/android/BaseTimelineFragment;->mListView:Landroid/widget/ListView;

    iget-object v3, p0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    iget-object v4, p0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-object v6, p0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object v5, p0

    invoke-direct/range {v0 .. v6}, Lco/vine/android/widget/FeedAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 413
    packed-switch p1, :pswitch_data_0

    .line 454
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseListFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 458
    :cond_0
    :goto_0
    return-void

    .line 415
    :pswitch_0
    const/4 v7, -0x1

    if-ne p2, v7, :cond_0

    .line 416
    if-eqz p3, :cond_0

    .line 417
    invoke-virtual {p3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 418
    .local v0, action:Ljava/lang/String;
    const-string v7, "action_report"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 419
    const-string v7, "post_id"

    const-wide/16 v8, 0x0

    invoke-virtual {p3, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 421
    .local v2, postId:J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-lez v7, :cond_0

    .line 422
    iget-object v7, p0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v8, p0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v8}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v8

    invoke-virtual {v7, v8, v2, v3}, Lco/vine/android/client/AppController;->reportPost(Lco/vine/android/client/Session;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 425
    .end local v2           #postId:J
    :cond_1
    const-string v7, "action_delete"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 426
    const-string v7, "post_id"

    const-wide/16 v8, 0x0

    invoke-virtual {p3, v7, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 428
    .restart local v2       #postId:J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-lez v7, :cond_0

    .line 429
    iget-object v7, p0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    iget-object v8, p0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v8}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v8

    invoke-virtual {v7, v8, v2, v3}, Lco/vine/android/client/AppController;->deletePost(Lco/vine/android/client/Session;J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 432
    .end local v2           #postId:J
    :cond_2
    const-string v7, "action_twitter"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 433
    const-string v7, "twitter"

    invoke-direct {p0, v7, p3}, Lco/vine/android/BaseTimelineFragment;->startReshareActivity(Ljava/lang/String;Landroid/content/Intent;)V

    goto :goto_0

    .line 434
    :cond_3
    const-string v7, "action_facebook"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 435
    const-string v7, "facebook"

    invoke-direct {p0, v7, p3}, Lco/vine/android/BaseTimelineFragment;->startReshareActivity(Ljava/lang/String;Landroid/content/Intent;)V

    goto :goto_0

    .line 436
    :cond_4
    const-string v7, "action_other"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 437
    const-string v7, "other"

    const-string v8, "post_id"

    const-wide/16 v9, 0x0

    invoke-virtual {p3, v8, v9, v10}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Lco/vine/android/util/FlurryUtils;->trackSharePost(Ljava/lang/String;J)V

    .line 438
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 439
    .local v4, res:Landroid/content/res/Resources;
    const-string v7, "name"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 441
    .local v1, name:Ljava/lang/String;
    const-string v7, "share_url"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 442
    .local v6, url:Ljava/lang/String;
    new-instance v5, Landroid/content/Intent;

    const-string v7, "android.intent.action.SEND"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 443
    .local v5, share:Landroid/content/Intent;
    const-string v7, "text/plain"

    invoke-virtual {v5, v7}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 444
    const/high16 v7, 0x8

    invoke-virtual {v5, v7}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 445
    const-string v7, "android.intent.extra.SUBJECT"

    const v8, 0x7f0e0194

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-virtual {v4, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 446
    const-string v7, "android.intent.extra.TEXT"

    const v8, 0x7f0e0195

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const/4 v10, 0x1

    aput-object v6, v9, v10

    invoke-virtual {v4, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 447
    invoke-virtual {p0, v5}, Lco/vine/android/BaseTimelineFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 413
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
    .end packed-switch
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 145
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onAttach(Landroid/app/Activity;)V

    .line 146
    instance-of v0, p1, Landroid/support/v7/app/ActionBarActivity;

    if-eqz v0, :cond_0

    .line 147
    check-cast p1, Landroid/support/v7/app/ActionBarActivity;

    .end local p1
    iput-object p1, p0, Lco/vine/android/BaseTimelineFragment;->mCallback:Landroid/support/v7/app/ActionBarActivity;

    .line 149
    :cond_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0}, Lco/vine/android/widget/GenericTimelineAdapter;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 17
    .parameter "view"

    .prologue
    .line 331
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 409
    :goto_0
    :pswitch_0
    return-void

    .line 333
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Long;

    .line 334
    .local v16, postId:Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/vine/android/LikeCache;->isLike(J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 336
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Lco/vine/android/client/AppController;->unlikePost(Ljava/lang/String;Lco/vine/android/client/Session;JZ)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 340
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/vine/android/LikeCache;->unlike(J)V

    .line 341
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->showUnlikedByMe(J)V

    goto :goto_0

    .line 344
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v6

    move-object/from16 v0, p0

    iget-object v9, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v9}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v9

    invoke-virtual {v9}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lco/vine/android/client/AppController;->likePost(Ljava/lang/String;Lco/vine/android/client/Session;JJLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 349
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/vine/android/LikeCache;->like(J)V

    .line 350
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->showLikedByMe(J)V

    goto/16 :goto_0

    .line 355
    .end local v16           #postId:Ljava/lang/Long;
    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lco/vine/android/api/VinePost;

    .line 356
    .local v15, post:Lco/vine/android/api/VinePost;
    iget-wide v1, v15, Lco/vine/android/api/VinePost;->userId:J

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_7

    const/4 v13, 0x1

    .line 357
    .local v13, isMyPost:Z
    :goto_1
    new-instance v1, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lco/vine/android/PostOptionsDialogActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "post_id"

    iget-wide v3, v15, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "delete"

    invoke-virtual {v1, v2, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "report"

    if-nez v13, :cond_8

    const/4 v1, 0x1

    :goto_2
    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v12

    .line 362
    .local v12, intent:Landroid/content/Intent;
    invoke-virtual {v15}, Lco/vine/android/api/VinePost;->isShareable()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v15}, Lco/vine/android/api/VinePost;->isPrivate()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    if-eqz v13, :cond_6

    .line 363
    :cond_2
    const-string v2, "post_twitter"

    invoke-virtual {v15}, Lco/vine/android/api/VinePost;->isShareable()Z

    move-result v1

    if-nez v1, :cond_3

    if-eqz v13, :cond_9

    :cond_3
    const/4 v1, 0x1

    :goto_3
    invoke-virtual {v12, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 365
    const-string v2, "post_facebook"

    invoke-virtual {v15}, Lco/vine/android/api/VinePost;->isShareable()Z

    move-result v1

    if-nez v1, :cond_4

    if-eqz v13, :cond_a

    :cond_4
    const/4 v1, 0x1

    :goto_4
    invoke-virtual {v12, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 367
    const-string v2, "share_other"

    invoke-virtual {v15}, Lco/vine/android/api/VinePost;->isShareable()Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz v13, :cond_b

    :cond_5
    const/4 v1, 0x1

    :goto_5
    invoke-virtual {v12, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 369
    const-string v1, "description"

    iget-object v2, v15, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    invoke-virtual {v12, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 370
    const-string v1, "share_url"

    iget-object v2, v15, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    invoke-virtual {v12, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 371
    const-string v1, "thumbnail_url"

    iget-object v2, v15, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {v12, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 372
    const-string v1, "name"

    iget-object v2, v15, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    invoke-virtual {v12, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 375
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v12, v2}, Landroid/support/v4/app/FragmentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto/16 :goto_0

    .line 356
    .end local v12           #intent:Landroid/content/Intent;
    .end local v13           #isMyPost:Z
    :cond_7
    const/4 v13, 0x0

    goto/16 :goto_1

    .line 357
    .restart local v13       #isMyPost:Z
    :cond_8
    const/4 v1, 0x0

    goto :goto_2

    .line 363
    .restart local v12       #intent:Landroid/content/Intent;
    :cond_9
    const/4 v1, 0x0

    goto :goto_3

    .line 365
    :cond_a
    const/4 v1, 0x0

    goto :goto_4

    .line 367
    :cond_b
    const/4 v1, 0x0

    goto :goto_5

    .line 379
    .end local v12           #intent:Landroid/content/Intent;
    .end local v13           #isMyPost:Z
    .end local v15           #post:Lco/vine/android/api/VinePost;
    :pswitch_3
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/vine/android/api/VinePost;

    .line 380
    .local v14, p:Lco/vine/android/api/VinePost;
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/RevineCache;->isRevined(J)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 382
    iget-object v1, v14, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    if-eqz v1, :cond_d

    iget-object v1, v14, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v1}, Lco/vine/android/api/VineUser;->isFollowing()Z

    move-result v1

    if-eqz v1, :cond_d

    const/4 v8, 0x1

    .line 384
    .local v8, following:Z
    :goto_6
    iget-wide v1, v14, Lco/vine/android/api/VinePost;->postId:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_c

    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/RevineCache;->getMyRepostId(J)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_c

    .line 385
    new-instance v1, Lco/vine/android/VineException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid unrevine: post userId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v14, Lco/vine/android/api/VinePost;->userId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " comments count "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v14, Lco/vine/android/api/VinePost;->commentsCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " created at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v14, Lco/vine/android/api/VinePost;->created:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    .line 389
    :cond_c
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    iget-wide v4, v14, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v9, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v6, v9, v10}, Lco/vine/android/RevineCache;->getMyRepostId(J)J

    move-result-wide v6

    iget-wide v9, v14, Lco/vine/android/api/VinePost;->userId:J

    const/4 v11, 0x1

    invoke-virtual/range {v1 .. v11}, Lco/vine/android/client/AppController;->unRevine(Ljava/lang/String;Lco/vine/android/client/Session;JJZJZ)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 393
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/RevineCache;->unRevine(J)V

    .line 394
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lco/vine/android/widget/GenericTimelineAdapter;->updateRevinedCount(JZ)V

    goto/16 :goto_0

    .line 382
    .end local v8           #following:Z
    :cond_d
    const/4 v8, 0x0

    goto/16 :goto_6

    .line 397
    :cond_e
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v3}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v3

    iget-wide v4, v14, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/BaseTimelineFragment;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lco/vine/android/client/AppController;->revine(Ljava/lang/String;Lco/vine/android/client/Session;JLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/BaseTimelineFragment;->addRequest(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-virtual {v1, v2, v3}, Lco/vine/android/RevineCache;->revine(J)V

    .line 402
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lco/vine/android/widget/GenericTimelineAdapter;->updateRevinedCount(JZ)V

    goto/16 :goto_0

    .line 331
    :pswitch_data_0
    .packed-switch 0x7f0a00dc
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 122
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 123
    new-instance v0, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;

    invoke-direct {v0, p0}, Lco/vine/android/BaseTimelineFragment$TimeLineSessionListener;-><init>(Lco/vine/android/BaseTimelineFragment;)V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mAppSessionListener:Lco/vine/android/client/AppSessionListener;

    .line 125
    if-eqz p1, :cond_0

    const-string v0, "state_like_cache"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    const-string v0, "state_like_cache"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lco/vine/android/LikeCache;

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    .line 127
    const-string v0, "state_revine_cache"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lco/vine/android/RevineCache;

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    .line 132
    :goto_0
    const/4 v0, 0x0

    invoke-static {v0}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v0

    iput v0, p0, Lco/vine/android/BaseTimelineFragment;->mCursorQuerySize:I

    .line 133
    return-void

    .line 129
    :cond_0
    new-instance v0, Lco/vine/android/LikeCache;

    invoke-direct {v0}, Lco/vine/android/LikeCache;-><init>()V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    .line 130
    new-instance v0, Lco/vine/android/RevineCache;

    invoke-direct {v0}, Lco/vine/android/RevineCache;-><init>()V

    iput-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    goto :goto_0
.end method

.method public abstract onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
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
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 475
    :try_start_0
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onDestroy()V

    .line 476
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onDestroy()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 480
    :goto_0
    return-void

    .line 477
    :catch_0
    move-exception v0

    .line 478
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Failed to remove timeline fragment"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0}, Lco/vine/android/widget/GenericTimelineAdapter;->onDestroyView()V

    .line 172
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onDestroyView()V

    .line 173
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 6
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
    const/4 v2, 0x7

    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 187
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    .line 188
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lco/vine/android/BaseTimelineFragment;->mFetched:Z

    if-nez v1, :cond_1

    .line 189
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->isFocused()Z

    move-result v2

    invoke-virtual {v1, v2}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 190
    invoke-virtual {p0, v5, v3}, Lco/vine/android/BaseTimelineFragment;->fetchContent(IZ)V

    .line 213
    :cond_0
    :goto_0
    return-void

    .line 192
    :cond_1
    invoke-virtual {p0, v5}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 193
    iget-boolean v1, p0, Lco/vine/android/BaseTimelineFragment;->mFetched:Z

    if-nez v1, :cond_2

    .line 195
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->refreshSilently()V

    .line 200
    :goto_1
    iget v1, p0, Lco/vine/android/BaseTimelineFragment;->mLastFetchType:I

    if-ne v1, v2, :cond_0

    .line 201
    invoke-virtual {p0, v2}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 202
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 203
    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v1}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 204
    .local v0, newSize:I
    iget v1, p0, Lco/vine/android/BaseTimelineFragment;->mCursorPreviousSize:I

    if-gt v0, v1, :cond_0

    .line 205
    invoke-virtual {p0, v3, v3}, Lco/vine/android/BaseTimelineFragment;->fetchContent(IZ)V

    goto :goto_0

    .line 197
    .end local v0           #newSize:I
    :cond_2
    invoke-virtual {p0, v4}, Lco/vine/android/BaseTimelineFragment;->showSadface(Z)V

    goto :goto_1

    .line 208
    :cond_3
    new-instance v1, Lco/vine/android/VineException;

    invoke-direct {v1}, Lco/vine/android/VineException;-><init>()V

    const-string v2, "Possible cursor swapped with null, cursor: {}."

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p2, v3, v4

    invoke-static {v1, v2, v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 51
    check-cast p2, Landroid/database/Cursor;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lco/vine/android/BaseTimelineFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onMoveAway(I)V
    .locals 2
    .parameter "newPosition"

    .prologue
    .line 226
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onMoveAway(I)V

    .line 227
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 228
    return-void
.end method

.method public onMoveTo(I)V
    .locals 2
    .parameter "oldPosition"

    .prologue
    .line 217
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onMoveTo(I)V

    .line 218
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mCursorAdapter:Landroid/support/v4/widget/CursorAdapter;

    invoke-virtual {v0}, Landroid/support/v4/widget/CursorAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    const/4 v0, 0x3

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lco/vine/android/BaseTimelineFragment;->fetchContent(IZ)V

    .line 221
    :cond_0
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->isFocused()Z

    move-result v1

    invoke-virtual {v0, v1}, Lco/vine/android/widget/GenericTimelineAdapter;->onResume(Z)V

    .line 222
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 107
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onPause()V

    .line 108
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mMuteChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 109
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 101
    invoke-super {p0}, Lco/vine/android/BaseListFragment;->onResume()V

    .line 102
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mMuteChangeReceiver:Landroid/content/BroadcastReceiver;

    sget-object v2, Lco/vine/android/util/MuteUtil;->MUTE_INTENT_FILTER:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 103
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 177
    invoke-super {p0, p1}, Lco/vine/android/BaseListFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 178
    const-string v0, "state_like_cache"

    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mLikeCache:Lco/vine/android/LikeCache;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 179
    const-string v0, "state_revine_cache"

    iget-object v1, p0, Lco/vine/android/BaseTimelineFragment;->mRevineCache:Lco/vine/android/RevineCache;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 180
    return-void
.end method

.method protected onScrollLastItem(Landroid/database/Cursor;)V
    .locals 5
    .parameter "cursor"

    .prologue
    const/4 v4, 0x7

    .line 488
    iget-object v2, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v2}, Lco/vine/android/widget/GenericTimelineAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object p1

    .line 489
    iget-boolean v2, p0, Lco/vine/android/BaseTimelineFragment;->mRefreshable:Z

    if-eqz v2, :cond_0

    .line 490
    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 491
    .local v0, extras:Landroid/os/Bundle;
    const-string v2, "is_last"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 492
    .local v1, isLast:Z
    if-nez v1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    const/16 v3, 0x190

    if-gt v2, v3, :cond_0

    .line 493
    iget-object v2, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->isFocused()Z

    move-result v3

    invoke-virtual {v2, v3}, Lco/vine/android/widget/GenericTimelineAdapter;->onPause(Z)V

    .line 494
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    iput v2, p0, Lco/vine/android/BaseTimelineFragment;->mCursorPreviousSize:I

    .line 495
    iget v2, p0, Lco/vine/android/BaseTimelineFragment;->mCursorPreviousSize:I

    invoke-static {v2}, Lco/vine/android/util/Util;->getNextCursorSize(I)I

    move-result v2

    iput v2, p0, Lco/vine/android/BaseTimelineFragment;->mCursorQuerySize:I

    .line 498
    iput v4, p0, Lco/vine/android/BaseTimelineFragment;->mLastFetchType:I

    .line 499
    invoke-virtual {p0, v4}, Lco/vine/android/BaseTimelineFragment;->showProgress(I)V

    .line 500
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->restartLoader()Z

    .line 501
    iget v2, p0, Lco/vine/android/BaseTimelineFragment;->mPage:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lco/vine/android/BaseTimelineFragment;->mPage:I

    .line 502
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lco/vine/android/BaseTimelineFragment;->mPage:I

    invoke-static {v2, v3}, Lco/vine/android/util/FlurryUtils;->trackTimeLinePageScroll(Ljava/lang/String;I)V

    .line 505
    .end local v0           #extras:Landroid/os/Bundle;
    .end local v1           #isLast:Z
    :cond_0
    return-void
.end method

.method public declared-synchronized onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 468
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseListFragment;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    .line 469
    iget-object v0, p0, Lco/vine/android/BaseTimelineFragment;->mFeedAdapter:Lco/vine/android/widget/GenericTimelineAdapter;

    invoke-virtual {v0, p1, p2}, Lco/vine/android/widget/GenericTimelineAdapter;->onScrollStateChanged(Landroid/widget/AbsListView;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    monitor-exit p0

    return-void

    .line 468
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onSpanClicked(Landroid/view/View;ILjava/lang/Object;)V
    .locals 8
    .parameter "view"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 284
    invoke-virtual {p0}, Lco/vine/android/BaseTimelineFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 285
    .local v0, activity:Landroid/support/v4/app/FragmentActivity;
    if-eqz v0, :cond_0

    .line 286
    packed-switch p2, :pswitch_data_0

    .line 327
    .end local p3
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .restart local p3
    :pswitch_1
    move-object v2, p3

    .line 288
    check-cast v2, Ljava/lang/Long;

    .line 289
    .local v2, postId:Ljava/lang/Long;
    new-instance v1, Landroid/content/Intent;

    const-class v4, Lco/vine/android/UsersActivity;

    invoke-direct {v1, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 290
    .local v1, i:Landroid/content/Intent;
    const-string v4, "post_id"

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 291
    const-string v4, "u_type"

    const/4 v5, 0x5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 292
    invoke-virtual {p0, v1}, Lco/vine/android/BaseTimelineFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 296
    .end local v1           #i:Landroid/content/Intent;
    .end local v2           #postId:Ljava/lang/Long;
    :pswitch_2
    check-cast p3, Ljava/lang/Long;

    .end local p3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v6, p0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    invoke-static {v0, v4, v5, v6}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 300
    .restart local p3
    :pswitch_3
    check-cast p3, Ljava/lang/String;

    .end local p3
    invoke-static {v0, p3}, Lco/vine/android/HashtagActivity;->start(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .restart local p3
    :pswitch_4
    move-object v3, p3

    .line 304
    check-cast v3, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    .line 306
    .local v3, spanTag:Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;,"Lco/vine/android/widget/GenericVideoAdapter<Lco/vine/android/widget/FeedViewHolder;>.SpanCommentObjectTag;"
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lco/vine/android/CommentsActivity;

    invoke-direct {v4, v0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "post_id"

    iget-wide v6, v3, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;->postId:J

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "post_author_id"

    iget-wide v6, v3, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;->authorId:J

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "hide_keyboard"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {p0, v4}, Lco/vine/android/BaseTimelineFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .end local v3           #spanTag:Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;,"Lco/vine/android/widget/GenericVideoAdapter<Lco/vine/android/widget/FeedViewHolder;>.SpanCommentObjectTag;"
    :pswitch_5
    move-object v3, p3

    .line 313
    check-cast v3, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    .line 315
    .restart local v3       #spanTag:Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;,"Lco/vine/android/widget/GenericVideoAdapter<Lco/vine/android/widget/FeedViewHolder;>.SpanCommentObjectTag;"
    new-instance v1, Landroid/content/Intent;

    const-class v4, Lco/vine/android/UsersActivity;

    invoke-direct {v1, v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 316
    .restart local v1       #i:Landroid/content/Intent;
    const-string v4, "post_id"

    iget-wide v5, v3, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;->postId:J

    invoke-virtual {v1, v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 317
    const-string v4, "u_type"

    const/16 v5, 0x9

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 318
    invoke-virtual {p0, v1}, Lco/vine/android/BaseTimelineFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 322
    .end local v1           #i:Landroid/content/Intent;
    .end local v3           #spanTag:Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;,"Lco/vine/android/widget/GenericVideoAdapter<Lco/vine/android/widget/FeedViewHolder;>.SpanCommentObjectTag;"
    :pswitch_6
    check-cast p3, Ljava/lang/Long;

    .end local p3
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-object v6, p0, Lco/vine/android/BaseTimelineFragment;->mFlurryEventSource:Ljava/lang/String;

    invoke-static {v0, v4, v5, v6}, Lco/vine/android/ProfileActivity;->start(Landroid/content/Context;JLjava/lang/String;)V

    goto :goto_0

    .line 286
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method protected refresh()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 273
    invoke-virtual {p0, v1}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 274
    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lco/vine/android/BaseTimelineFragment;->fetchContent(IZ)V

    .line 275
    return-void
.end method

.method protected refreshSilently()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 278
    invoke-virtual {p0, v1}, Lco/vine/android/BaseTimelineFragment;->hideProgress(I)V

    .line 279
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Lco/vine/android/BaseTimelineFragment;->fetchContent(IZ)V

    .line 280
    return-void
.end method

.method protected trackNewCount()Z
    .locals 1

    .prologue
    .line 483
    const/4 v0, 0x0

    return v0
.end method
