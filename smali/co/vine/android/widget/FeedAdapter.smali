.class public Lco/vine/android/widget/FeedAdapter;
.super Lco/vine/android/widget/GenericTimelineAdapter;
.source "FeedAdapter.java"

# interfaces
.implements Lco/vine/android/player/HasVideoPlayerAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/vine/android/widget/GenericTimelineAdapter",
        "<",
        "Lco/vine/android/widget/FeedViewHolder;",
        ">;",
        "Lco/vine/android/player/HasVideoPlayerAdapter;"
    }
.end annotation


# instance fields
.field private currentPlayerCount:I

.field private mCurrentPlaying:I

.field private mFirstPlayed:Z

.field private final mHandler:Landroid/os/Handler;

.field private mHasFocus:Z

.field private mLastPlayer:Lco/vine/android/player/SdkVideoView;

.field private mMuted:Z

.field private mNeedReleaseOtherPlayers:Z

.field private final mPaths:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mPlayCurrentPositionRunnable:Ljava/lang/Runnable;

.field private final mPlayers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lco/vine/android/player/SdkVideoView;",
            ">;"
        }
    .end annotation
.end field

.field private final mPosts:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;"
        }
    .end annotation
.end field

.field private mShouldBePlaying:I

.field private final mUrlReverse:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoAttr:Landroid/util/AttributeSet;

.field private mWasResumed:Z

.field private maxPlayer:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V
    .locals 3
    .parameter "context"
    .parameter "listView"
    .parameter "likeCache"
    .parameter "revineCache"
    .parameter "timelineFragment"
    .parameter "followEventSource"

    .prologue
    const/high16 v2, -0x8000

    const/4 v1, 0x0

    .line 83
    invoke-direct/range {p0 .. p6}, Lco/vine/android/widget/GenericTimelineAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V

    .line 66
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mHandler:Landroid/os/Handler;

    .line 68
    iput v2, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    .line 69
    iput v2, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    .line 70
    const/16 v0, 0xa

    iput v0, p0, Lco/vine/android/widget/FeedAdapter;->maxPlayer:I

    .line 71
    iput v1, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    .line 72
    iput-boolean v1, p0, Lco/vine/android/widget/FeedAdapter;->mNeedReleaseOtherPlayers:Z

    .line 75
    iput-boolean v1, p0, Lco/vine/android/widget/FeedAdapter;->mWasResumed:Z

    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mVideoAttr:Landroid/util/AttributeSet;

    .line 84
    const-string v0, "Adapter constructed, accelerated? {}"

    invoke-virtual {p2}, Landroid/widget/ListView;->isHardwareAccelerated()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPlayers:Landroid/util/SparseArray;

    .line 86
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    .line 87
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    .line 89
    new-instance v0, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;

    invoke-direct {v0, p0}, Lco/vine/android/widget/FeedAdapter$PlayCurrentPositionRunnable;-><init>(Lco/vine/android/widget/FeedAdapter;)V

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPlayCurrentPositionRunnable:Ljava/lang/Runnable;

    .line 90
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/widget/FeedAdapter;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    return v0
.end method

.method static synthetic access$102(Lco/vine/android/widget/FeedAdapter;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput p1, p0, Lco/vine/android/widget/FeedAdapter;->maxPlayer:I

    return p1
.end method

.method static synthetic access$200(Lco/vine/android/widget/FeedAdapter;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    return v0
.end method

.method static synthetic access$302(Lco/vine/android/widget/FeedAdapter;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-boolean p1, p0, Lco/vine/android/widget/FeedAdapter;->mNeedReleaseOtherPlayers:Z

    return p1
.end method

.method static synthetic access$400(Lco/vine/android/widget/FeedAdapter;)Landroid/util/SparseArray;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/widget/FeedAdapter;)Landroid/util/SparseArray;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/widget/FeedAdapter;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    invoke-direct {p0}, Lco/vine/android/widget/FeedAdapter;->calculateCurrentPosition()I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lco/vine/android/widget/FeedAdapter;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lco/vine/android/widget/FeedAdapter;->getExplicit(I)Z

    move-result v0

    return v0
.end method

.method private bindView(Lco/vine/android/widget/FeedViewHolder;)V
    .locals 35
    .parameter "h"

    .prologue
    .line 510
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v16, v0

    .line 511
    .local v16, post:Lco/vine/android/api/VinePost;
    move-object/from16 v0, p1

    iget v15, v0, Lco/vine/android/widget/FeedViewHolder;->position:I

    .line 513
    .local v15, position:I
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lco/vine/android/widget/FeedAdapter;->shouldShowThumbnail(I)Z

    move-result v30

    if-eqz v30, :cond_0

    .line 514
    const-string v30, "Should show thumbnail... {} {}."

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    move/from16 v32, v0

    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    invoke-static/range {v30 .. v32}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 515
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->videoLoadImage:Landroid/widget/ProgressBar;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 516
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v30, v0

    const/16 v31, 0x4

    invoke-virtual/range {v30 .. v31}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 519
    :cond_0
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/FeedAdapter;->bindAvatar(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 521
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/FeedAdapter;->bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 523
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lco/vine/android/api/VinePost;->isExplicit()Z

    move-result v30

    if-eqz v30, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    move-object/from16 v30, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v30

    if-eqz v30, :cond_2

    .line 524
    :cond_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->videoImage:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 529
    :goto_0
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v30, v0

    if-eqz v30, :cond_6

    .line 530
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 531
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setVisibility(I)V

    .line 532
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-wide v0, v0, Lco/vine/android/api/VineRepost;->userId:J

    move-wide/from16 v26, v0

    .line 533
    .local v26, userId:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v30

    cmp-long v30, v26, v30

    if-nez v30, :cond_3

    .line 534
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v31, v0

    const v32, 0x7f0e0146

    invoke-virtual/range {v31 .. v32}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 552
    .end local v26           #userId:J
    :goto_1
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-nez v30, :cond_11

    .line 553
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setVisibility(I)V

    .line 555
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    if-nez v30, :cond_7

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    if-eqz v30, :cond_7

    .line 556
    new-instance v30, Ljava/util/ArrayList;

    invoke-direct/range {v30 .. v30}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v30

    move-object/from16 v1, v16

    iput-object v0, v1, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    .line 557
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/api/VineEntity;

    .line 558
    .local v10, entity:Lco/vine/android/api/VineEntity;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->clone()Lco/vine/android/api/VineEntity;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 526
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    :cond_2
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->videoImage:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    const/16 v31, 0x4

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_0

    .line 535
    .restart local v26       #userId:J
    :cond_3
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    move-object/from16 v30, v0

    if-eqz v30, :cond_5

    .line 536
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v30, v0

    const v31, 0x7f0e0145

    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    iget-object v0, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    move-object/from16 v34, v0

    aput-object v34, v32, v33

    invoke-virtual/range {v30 .. v32}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    .line 537
    .local v20, revinedBy:Ljava/lang/String;
    new-instance v21, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 538
    .local v21, revinedBySb:Landroid/text/SpannableStringBuilder;
    new-instance v28, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v30, 0x8

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v32, v0

    move-object/from16 v0, v28

    move/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 540
    .local v28, usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v24

    .line 541
    .local v24, start:I
    if-gez v24, :cond_4

    const/16 v24, 0x0

    .end local v24           #start:I
    :cond_4
    invoke-virtual/range {v21 .. v21}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v30

    const/16 v31, 0x21

    move-object/from16 v0, v21

    move-object/from16 v1, v28

    move/from16 v2, v24

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 543
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v30, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 544
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 546
    .end local v20           #revinedBy:Ljava/lang/String;
    .end local v21           #revinedBySb:Landroid/text/SpannableStringBuilder;
    .end local v28           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_5
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_1

    .line 549
    .end local v26           #userId:J
    :cond_6
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revineContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 562
    :cond_7
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    .line 563
    .local v17, postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    if-eqz v17, :cond_10

    .line 564
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v30, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 565
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v30, v0

    if-nez v30, :cond_9

    .line 566
    new-instance v30, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-direct/range {v30 .. v31}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v0, v30

    move-object/from16 v1, v16

    iput-object v0, v1, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    .line 567
    move-object/from16 v0, v16

    iget-object v8, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    .line 569
    .local v8, descriptionSb:Landroid/text/SpannableStringBuilder;
    const/16 v30, 0x0

    const/16 v31, 0x0

    :try_start_0
    move-object/from16 v0, v17

    move/from16 v1, v30

    move/from16 v2, v31

    invoke-static {v0, v8, v1, v2}, Lco/vine/android/util/Util;->adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V

    .line 571
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .restart local v11       #i$:Ljava/util/Iterator;
    :cond_8
    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/api/VineEntity;

    .line 572
    .restart local v10       #entity:Lco/vine/android/api/VineEntity;
    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->isUserType()Z

    move-result v30

    if-eqz v30, :cond_f

    .line 573
    new-instance v28, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v30, 0x1

    iget-wide v0, v10, Lco/vine/android/api/VineEntity;->id:J

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v32, v0

    move-object/from16 v0, v28

    move/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 576
    .restart local v28       #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/FeedAdapter;->mVineGreen:I

    move/from16 v30, v0

    move-object/from16 v0, v28

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 577
    iget v0, v10, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v30, v0

    iget v0, v10, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v31, v0

    const/16 v32, 0x21

    move-object/from16 v0, v28

    move/from16 v1, v30

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v8, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 588
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v28           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :catch_0
    move-exception v9

    .line 589
    .local v9, e:Ljava/lang/Exception;
    invoke-static {v9}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 592
    .end local v8           #descriptionSb:Landroid/text/SpannableStringBuilder;
    .end local v9           #e:Ljava/lang/Exception;
    :cond_9
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 599
    .end local v17           #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    .line 601
    .local v18, res:Landroid/content/res/Resources;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v30, v0

    if-eqz v30, :cond_12

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VineVenue;->venueName:Ljava/lang/String;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v30

    if-nez v30, :cond_12

    .line 602
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->location:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget-object v0, v0, Lco/vine/android/api/VineVenue;->venueName:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 603
    sget-object v30, Lco/vine/android/api/VineVenue;->iconMap:Landroid/util/SparseIntArray;

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    iget v0, v0, Lco/vine/android/api/VineVenue;->displayType:I

    move/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/util/SparseIntArray;->get(I)I

    move-result v30

    move-object/from16 v0, v18

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 604
    .local v7, d:Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->locationIcon:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 605
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->locationContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 609
    .end local v7           #d:Landroid/graphics/drawable/Drawable;
    :goto_5
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->listener:Lco/vine/android/player/OnListVideoClickListener;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Lco/vine/android/player/OnListVideoClickListener;->setPosition(I)V

    .line 610
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    move-object/from16 v30, v0

    if-eqz v30, :cond_a

    .line 611
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v15}, Lco/vine/android/player/SensitiveImageClickListener;->setPosition(I)V

    .line 614
    :cond_a
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    move-object/from16 v29, v0

    .line 616
    .local v29, usernameString:Ljava/lang/String;
    if-nez v29, :cond_b

    .line 617
    const-string v29, ""

    .line 618
    new-instance v30, Lco/vine/android/VineException;

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "Invalid user name for post "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v32, v0

    invoke-virtual/range {v31 .. v33}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v30 .. v30}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 620
    :cond_b
    new-instance v23, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 621
    .local v23, sb:Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v32

    const/16 v33, 0x21

    move-object/from16 v0, v23

    move-object/from16 v1, v30

    move/from16 v2, v31

    move/from16 v3, v32

    move/from16 v4, v33

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 623
    new-instance v25, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v30, 0x1

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v32, v0

    move-object/from16 v0, v25

    move/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 625
    .local v25, styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v30, 0x7f090076

    move-object/from16 v0, v18

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v30

    move-object/from16 v0, v25

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 626
    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v31

    const/16 v32, 0x21

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move/from16 v2, v30

    move/from16 v3, v31

    move/from16 v4, v32

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 628
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->userImage:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    new-instance v31, Lco/vine/android/widget/FeedAdapter$4;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/FeedAdapter$4;-><init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 634
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->username:Landroid/widget/TextView;

    move-object/from16 v30, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 635
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->username:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 636
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->timestamp:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->created:J

    move-wide/from16 v31, v0

    const/16 v33, 0x0

    move-object/from16 v0, v18

    move-wide/from16 v1, v31

    move/from16 v3, v33

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/util/Util;->getRelativeTimeString(Landroid/content/res/Resources;JZ)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 638
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->comment:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    new-instance v31, Lco/vine/android/widget/FeedAdapter$5;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/FeedAdapter$5;-><init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 648
    move-object/from16 v0, p1

    iget-object v13, v0, Lco/vine/android/widget/FeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    .line 649
    .local v13, likersContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v22, v0

    .line 650
    .local v22, revinersContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p1

    iget-object v5, v0, Lco/vine/android/widget/FeedViewHolder;->commentsContainer:Landroid/widget/RelativeLayout;

    .line 651
    .local v5, commentsContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p1

    iget-object v6, v0, Lco/vine/android/widget/FeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    .line 652
    .local v6, compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/widget/FeedAdapter;->mCompactLikesComments:Z

    move/from16 v30, v0

    if-nez v30, :cond_16

    .line 654
    const/16 v30, 0x8

    move/from16 v0, v30

    invoke-virtual {v6, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 657
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    if-eqz v30, :cond_13

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_13

    .line 658
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 659
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->likesCount:I

    move/from16 v30, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v30

    move-object/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/widget/FeedAdapter;->setStyledLikers(Lco/vine/android/widget/GenericFeedViewHolder;ILco/vine/android/api/VinePagedData;)V

    .line 665
    :goto_6
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/FeedAdapter;->setRevinersCount(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 668
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    if-eqz v30, :cond_15

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_15

    .line 669
    const/16 v30, 0x0

    move/from16 v0, v30

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 670
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lco/vine/android/widget/FeedAdapter;->setStyledComments(Lco/vine/android/widget/GenericFeedViewHolder;Lco/vine/android/api/VinePagedData;)V

    .line 671
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v30, v0

    const/16 v31, 0x5

    move/from16 v0, v30

    move/from16 v1, v31

    if-le v0, v1, :cond_14

    .line 672
    const/16 v30, 0x2

    move/from16 v0, v30

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/FeedViewHolder;->commentType:I

    .line 673
    const v30, 0x7f0e01be

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v33, v0

    add-int/lit8 v33, v33, -0x5

    move-object/from16 v0, v18

    move/from16 v1, v33

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v33

    aput-object v33, v31, v32

    move-object/from16 v0, v18

    move/from16 v1, v30

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 676
    .local v14, olderComments:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 677
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->olderComments:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 678
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    new-instance v31, Lco/vine/android/widget/FeedAdapter$6;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/FeedAdapter$6;-><init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 702
    .end local v14           #olderComments:Ljava/lang/String;
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/LikeCache;->contains(J)Z

    move-result v30

    if-eqz v30, :cond_17

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/LikeCache;->isLike(J)Z

    move-result v12

    .line 704
    .local v12, liked:Z
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lco/vine/android/api/VinePost;->setFlagLiked(Z)V

    .line 713
    :goto_8
    if-eqz v12, :cond_19

    .line 714
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const v31, 0x7f0200d2

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 719
    :goto_9
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 720
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 722
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->more:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 723
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->more:Landroid/widget/ImageView;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v32

    cmp-long v30, v30, v32

    if-eqz v30, :cond_c

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isPrivate()Z

    move-result v30

    if-eqz v30, :cond_1a

    .line 728
    :cond_c
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 753
    :goto_a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v15, v1}, Lco/vine/android/widget/FeedAdapter;->initVideoView(ILco/vine/android/widget/FeedViewHolder;)V

    .line 754
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/widget/FeedAdapter;->mFirstPlayed:Z

    move/from16 v30, v0

    if-nez v30, :cond_e

    if-nez v15, :cond_e

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isExplicit()Z

    move-result v30

    if-nez v30, :cond_e

    .line 755
    const/16 v30, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/vine/android/widget/FeedAdapter;->play(I)V

    .line 756
    sget-boolean v30, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-eqz v30, :cond_d

    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/vine/android/widget/FeedAdapter;->mStartLoadingTime:J

    move-wide/from16 v30, v0

    const-wide/16 v32, 0x0

    cmp-long v30, v30, v32

    if-lez v30, :cond_d

    .line 757
    const-string v30, "Time since started loading to request 0th video to play: {}ms"

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/widget/FeedAdapter;->timeSinceStartLoadingTime()J

    move-result-wide v31

    invoke-static/range {v31 .. v32}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v31

    invoke-static/range {v30 .. v31}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 759
    :cond_d
    const/16 v30, 0x1

    move/from16 v0, v30

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/widget/FeedAdapter;->mFirstPlayed:Z

    .line 761
    :cond_e
    return-void

    .line 579
    .end local v5           #commentsContainer:Landroid/widget/RelativeLayout;
    .end local v6           #compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    .end local v12           #liked:Z
    .end local v13           #likersContainer:Landroid/widget/RelativeLayout;
    .end local v18           #res:Landroid/content/res/Resources;
    .end local v22           #revinersContainer:Landroid/widget/RelativeLayout;
    .end local v23           #sb:Landroid/text/SpannableStringBuilder;
    .end local v25           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v29           #usernameString:Ljava/lang/String;
    .restart local v8       #descriptionSb:Landroid/text/SpannableStringBuilder;
    .restart local v10       #entity:Lco/vine/android/api/VineEntity;
    .restart local v11       #i$:Ljava/util/Iterator;
    .restart local v17       #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_f
    :try_start_1
    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->isTagType()Z

    move-result v30

    if-eqz v30, :cond_8

    .line 580
    new-instance v28, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v30, 0x4

    iget-object v0, v10, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v32, v0

    move-object/from16 v0, v28

    move/from16 v1, v30

    move-object/from16 v2, v31

    move-object/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 583
    .restart local v28       #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/FeedAdapter;->mVineGreen:I

    move/from16 v30, v0

    move-object/from16 v0, v28

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 584
    iget v0, v10, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v30, v0

    iget v0, v10, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v31, v0

    const/16 v32, 0x21

    move-object/from16 v0, v28

    move/from16 v1, v30

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-static {v8, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 594
    .end local v8           #descriptionSb:Landroid/text/SpannableStringBuilder;
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v28           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_10
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 597
    .end local v17           #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_11
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 607
    .restart local v18       #res:Landroid/content/res/Resources;
    :cond_12
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->locationContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_5

    .line 661
    .restart local v5       #commentsContainer:Landroid/widget/RelativeLayout;
    .restart local v6       #compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    .restart local v13       #likersContainer:Landroid/widget/RelativeLayout;
    .restart local v22       #revinersContainer:Landroid/widget/RelativeLayout;
    .restart local v23       #sb:Landroid/text/SpannableStringBuilder;
    .restart local v25       #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v29       #usernameString:Ljava/lang/String;
    :cond_13
    const/16 v30, 0x8

    move/from16 v0, v30

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_6

    .line 688
    :cond_14
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v30, v0

    const/16 v31, 0x8

    invoke-virtual/range {v30 .. v31}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 689
    const/16 v30, 0x1

    move/from16 v0, v30

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/FeedViewHolder;->commentType:I

    goto/16 :goto_7

    .line 692
    :cond_15
    const/16 v30, 0x8

    move/from16 v0, v30

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_7

    .line 696
    :cond_16
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->likesCount:I

    move/from16 v30, v0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v31, v0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v30

    move/from16 v3, v31

    move/from16 v4, v32

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/widget/FeedAdapter;->setStyledCompactLikesComments(Lco/vine/android/widget/FeedViewHolder;III)V

    goto/16 :goto_7

    .line 706
    :cond_17
    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isLiked()Z

    move-result v12

    .line 707
    .restart local v12       #liked:Z
    if-eqz v12, :cond_18

    .line 708
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/LikeCache;->like(J)V

    goto/16 :goto_8

    .line 710
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/LikeCache;->unlike(J)V

    goto/16 :goto_8

    .line 716
    :cond_19
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const v31, 0x7f02008f

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto/16 :goto_9

    .line 730
    :cond_1a
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 732
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/RevineCache;->contains(J)Z

    move-result v30

    if-eqz v30, :cond_1b

    .line 733
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/RevineCache;->isRevined(J)Z

    move-result v19

    .line 734
    .local v19, revined:Z
    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagRevined(Z)V

    .line 744
    :goto_b
    if-eqz v19, :cond_1f

    .line 745
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const v31, 0x7f0200b4

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 749
    :goto_c
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 750
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_a

    .line 736
    .end local v19           #revined:Z
    :cond_1b
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    move-wide/from16 v30, v0

    const-wide/16 v32, 0x0

    cmp-long v30, v30, v32

    if-gtz v30, :cond_1c

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isRevined()Z

    move-result v30

    if-eqz v30, :cond_1d

    :cond_1c
    const/16 v19, 0x1

    .line 737
    .restart local v19       #revined:Z
    :goto_d
    if-eqz v19, :cond_1e

    .line 738
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    move-wide/from16 v33, v0

    invoke-virtual/range {v30 .. v34}, Lco/vine/android/RevineCache;->putMyRepostId(JJ)V

    .line 739
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/RevineCache;->revine(J)V

    goto :goto_b

    .line 736
    .end local v19           #revined:Z
    :cond_1d
    const/16 v19, 0x0

    goto :goto_d

    .line 741
    .restart local v19       #revined:Z
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/FeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Lco/vine/android/RevineCache;->unRevine(J)V

    goto :goto_b

    .line 747
    :cond_1f
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/FeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v30, v0

    const v31, 0x7f0200b2

    invoke-virtual/range {v30 .. v31}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_c
.end method

.method private calculateCurrentPosition()I
    .locals 15

    .prologue
    .line 93
    iget-object v11, p0, Lco/vine/android/widget/FeedAdapter;->mListView:Landroid/widget/ListView;

    invoke-virtual {v11}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 94
    .local v1, currentFirst:I
    const/4 v8, 0x0

    .line 95
    .local v8, offset:I
    iget-object v11, p0, Lco/vine/android/widget/FeedAdapter;->mViewOffsetResolver:Lco/vine/android/ViewOffsetResolver;

    if-eqz v11, :cond_0

    .line 96
    iget-object v11, p0, Lco/vine/android/widget/FeedAdapter;->mViewOffsetResolver:Lco/vine/android/ViewOffsetResolver;

    invoke-interface {v11, p0}, Lco/vine/android/ViewOffsetResolver;->getOffset(Landroid/widget/BaseAdapter;)I

    move-result v8

    .line 98
    :cond_0
    sub-int/2addr v1, v8

    .line 100
    iget-object v11, p0, Lco/vine/android/widget/FeedAdapter;->mTimelineFragment:Lco/vine/android/BaseTimelineFragment;

    invoke-virtual {v11}, Lco/vine/android/BaseTimelineFragment;->getHeaderViewParents()Ljava/util/HashSet;

    move-result-object v4

    .line 101
    .local v4, headers:Ljava/util/HashSet;,"Ljava/util/HashSet<Landroid/view/View;>;"
    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v11

    if-lez v11, :cond_3

    .line 102
    const/4 v7, 0x0

    .line 103
    .local v7, missingHeaderViewCount:I
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    .line 104
    .local v10, view:Landroid/view/View;
    invoke-virtual {v10}, Landroid/view/View;->isShown()Z

    move-result v11

    if-nez v11, :cond_1

    .line 105
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 108
    .end local v10           #view:Landroid/view/View;
    :cond_2
    sub-int/2addr v1, v7

    .line 109
    const-string v11, "Try to get current First: {}, missing header count: {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v7           #missingHeaderViewCount:I
    :cond_3
    invoke-virtual {p0, v1}, Lco/vine/android/widget/FeedAdapter;->getViewAtPosition(I)Landroid/view/View;

    move-result-object v2

    .line 113
    .local v2, currentView:Landroid/view/View;
    if-nez v2, :cond_5

    .line 114
    const/4 v1, -0x1

    .line 133
    .end local v1           #currentFirst:I
    :cond_4
    :goto_1
    return v1

    .line 117
    .restart local v1       #currentFirst:I
    :cond_5
    const/4 v3, 0x0

    .line 118
    .local v3, currentlyPlayingOffset:I
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->getLastPlayer()Lco/vine/android/player/SdkVideoView;

    move-result-object v11

    if-eqz v11, :cond_6

    .line 119
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->getLastPlayer()Lco/vine/android/player/SdkVideoView;

    move-result-object v11

    invoke-virtual {v11}, Lco/vine/android/player/SdkVideoView;->getHeight()I

    move-result v11

    div-int/lit8 v3, v11, 0x2

    .line 121
    :cond_6
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v11

    int-to-float v11, v11

    int-to-float v12, v3

    add-float v0, v11, v12

    .line 122
    .local v0, bottom:F
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v11, v11

    int-to-float v12, v3

    add-float v5, v11, v12

    .line 123
    .local v5, height:F
    const/4 v11, 0x0

    cmpl-float v11, v5, v11

    if-nez v11, :cond_7

    const/high16 v5, 0x3f80

    .end local v5           #height:F
    :cond_7
    div-float v9, v0, v5

    .line 124
    .local v9, ratio:F
    const-string v11, "Current First: {}, ratio: {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    float-to-double v11, v9

    const-wide/high16 v13, 0x3fe0

    cmpg-double v11, v11, v13

    if-ltz v11, :cond_8

    const/4 v11, -0x1

    if-ne v1, v11, :cond_9

    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->getCount()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    if-ge v1, v11, :cond_9

    add-int/lit8 v11, v1, 0x1

    iget v12, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    if-eq v11, v12, :cond_9

    .line 129
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 130
    :cond_9
    iget v11, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    if-ne v1, v11, :cond_4

    .line 133
    const/4 v1, -0x1

    goto :goto_1
.end method

.method private getExplicit(I)Z
    .locals 3
    .parameter "position"

    .prologue
    .line 320
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/api/VinePost;

    .line 321
    .local v0, post:Lco/vine/android/api/VinePost;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lco/vine/android/api/VinePost;->isExplicit()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private hasPlayerPlaying()Z
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isPaused()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private initVideoView(ILco/vine/android/widget/FeedViewHolder;)V
    .locals 3
    .parameter "position"
    .parameter "tag"

    .prologue
    .line 378
    iget-object v1, p2, Lco/vine/android/widget/FeedViewHolder;->videoLoadImage:Landroid/widget/ProgressBar;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 379
    iget-object v0, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 380
    .local v0, view:Lco/vine/android/player/SdkVideoView;
    new-instance v1, Lco/vine/android/widget/FeedAdapter$1;

    invoke-direct {v1, p0, v0, p2}, Lco/vine/android/widget/FeedAdapter$1;-><init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/player/SdkVideoView;Lco/vine/android/widget/FeedViewHolder;)V

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 393
    new-instance v1, Lco/vine/android/widget/FeedAdapter$2;

    invoke-direct {v1, p0, v0, p1, p2}, Lco/vine/android/widget/FeedAdapter$2;-><init>(Lco/vine/android/widget/FeedAdapter;Lco/vine/android/player/SdkVideoView;ILco/vine/android/widget/FeedViewHolder;)V

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 417
    new-instance v1, Lco/vine/android/widget/FeedAdapter$3;

    invoke-direct {v1, p0}, Lco/vine/android/widget/FeedAdapter$3;-><init>(Lco/vine/android/widget/FeedAdapter;)V

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 429
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mPlayers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 430
    return-void
.end method

.method private preFetch(I)Z
    .locals 9
    .parameter "requestedPosition"

    .prologue
    const/4 v6, 0x0

    .line 282
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/api/VinePost;

    .line 283
    .local v3, nextPost:Lco/vine/android/api/VinePost;
    if-eqz v3, :cond_5

    .line 284
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_4

    .line 285
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/api/VinePost;

    invoke-virtual {p0, v5, v6}, Lco/vine/android/widget/FeedAdapter;->getRequestKey(Lco/vine/android/api/VinePost;Z)Lco/vine/android/util/video/VideoKey;

    move-result-object v4

    .line 286
    .local v4, nextUrl:Lco/vine/android/util/video/VideoKey;
    const-string v5, "Pre-fetch {}: {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 287
    if-eqz v4, :cond_2

    .line 288
    iget-object v5, v3, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 289
    new-instance v1, Lco/vine/android/util/image/ImageKey;

    iget-object v5, v3, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-direct {v1, v5}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 290
    .local v1, imageKey:Lco/vine/android/util/image/ImageKey;
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v1}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 291
    .local v0, bitmap:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 292
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v5, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 295
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v1           #imageKey:Lco/vine/android/util/image/ImageKey;
    :cond_0
    iget-object v5, v3, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 296
    new-instance v1, Lco/vine/android/util/image/ImageKey;

    iget-object v5, v3, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-direct {v1, v5}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 297
    .restart local v1       #imageKey:Lco/vine/android/util/image/ImageKey;
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v1}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 298
    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 299
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v5, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 302
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v1           #imageKey:Lco/vine/android/util/image/ImageKey;
    :cond_1
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v4}, Lco/vine/android/client/AppController;->getVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;

    move-result-object v2

    .line 303
    .local v2, nextPath:Ljava/lang/String;
    if-eqz v2, :cond_3

    .line 304
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v5, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 312
    .end local v2           #nextPath:Ljava/lang/String;
    .end local v4           #nextUrl:Lco/vine/android/util/video/VideoKey;
    :cond_2
    :goto_0
    const/4 v5, 0x1

    .line 315
    :goto_1
    return v5

    .line 306
    .restart local v2       #nextPath:Ljava/lang/String;
    .restart local v4       #nextUrl:Lco/vine/android/util/video/VideoKey;
    :cond_3
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 310
    .end local v2           #nextPath:Ljava/lang/String;
    .end local v4           #nextUrl:Lco/vine/android/util/video/VideoKey;
    :cond_4
    const-string v5, "{} is already fetched."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 314
    :cond_5
    const-string v5, "End of list, no pre-fetching: {} {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->getCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v5, v7, v8}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move v5, v6

    .line 315
    goto :goto_1
.end method

.method private refreshVideoView(ILco/vine/android/widget/FeedViewHolder;)V
    .locals 6
    .parameter "position"
    .parameter "tag"

    .prologue
    .line 357
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 358
    .local v2, group:Landroid/view/ViewGroup;
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mVideoAttr:Landroid/util/AttributeSet;

    if-nez v3, :cond_0

    .line 359
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->getAttributes()Landroid/util/AttributeSet;

    move-result-object v3

    iput-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mVideoAttr:Landroid/util/AttributeSet;

    .line 361
    :cond_0
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 363
    :try_start_0
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    :goto_0
    new-instance v3, Lco/vine/android/player/SdkVideoView;

    iget-object v4, p0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mVideoAttr:Landroid/util/AttributeSet;

    invoke-direct {v3, v4, v5}, Lco/vine/android/player/SdkVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 372
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    const v4, 0x7f0a0056

    invoke-virtual {v3, v4}, Lco/vine/android/player/SdkVideoView;->setId(I)V

    .line 373
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 374
    invoke-direct {p0, p1, p2}, Lco/vine/android/widget/FeedAdapter;->initVideoView(ILco/vine/android/widget/FeedViewHolder;)V

    .line 375
    return-void

    .line 364
    :catch_0
    move-exception v0

    .line 366
    .local v0, e:Ljava/lang/RuntimeException;
    :try_start_1
    iget-object v3, p2, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 367
    :catch_1
    move-exception v1

    .line 368
    .local v1, e2:Ljava/lang/Exception;
    const-string v3, "Weird things are happening."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private shouldShowThumbnail(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 478
    iget v0, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    if-ne v0, p1, :cond_0

    invoke-direct {p0}, Lco/vine/android/widget/FeedAdapter;->hasPlayerPlaying()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 6
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 483
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v2

    .line 485
    .local v2, position:I
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/FeedViewHolder;

    .line 487
    .local v0, h:Lco/vine/android/widget/FeedViewHolder;
    invoke-virtual {p0, p3}, Lco/vine/android/widget/FeedAdapter;->bindCursorToPost(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;

    move-result-object v3

    iput-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    .line 488
    iput v2, v0, Lco/vine/android/widget/FeedViewHolder;->position:I

    .line 489
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    iget-object v4, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    invoke-virtual {v3, v2, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 491
    const/4 v1, 0x0

    .line 492
    .local v1, nextPost:Lco/vine/android/api/VinePost;
    invoke-interface {p3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 493
    invoke-virtual {p0, p3}, Lco/vine/android/widget/FeedAdapter;->bindCursorToPost(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;

    move-result-object v1

    .line 494
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    invoke-virtual {v3, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 495
    invoke-interface {p3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 496
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    invoke-virtual {p0, p3}, Lco/vine/android/widget/FeedAdapter;->bindCursorToPost(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 497
    invoke-interface {p3}, Landroid/database/Cursor;->moveToPrevious()Z

    .line 499
    :cond_0
    invoke-interface {p3}, Landroid/database/Cursor;->moveToPrevious()Z

    .line 502
    :cond_1
    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    if-nez v3, :cond_2

    .line 503
    new-instance v3, Lco/vine/android/VineException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Post was null: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " nextPost is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 507
    :goto_0
    return-void

    .line 505
    :cond_2
    invoke-direct {p0, v0}, Lco/vine/android/widget/FeedAdapter;->bindView(Lco/vine/android/widget/FeedViewHolder;)V

    goto :goto_0
.end method

.method protected createInsensitiveListener(Lco/vine/android/widget/FeedViewHolder;)V
    .locals 2
    .parameter "h"

    .prologue
    .line 854
    iget-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 855
    iget-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 856
    iget-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 857
    return-void
.end method

.method protected bridge synthetic createInsensitiveListener(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    check-cast p1, Lco/vine/android/widget/FeedViewHolder;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->createInsensitiveListener(Lco/vine/android/widget/FeedViewHolder;)V

    return-void
.end method

.method protected createSensitiveLisenter(Lco/vine/android/widget/FeedViewHolder;)V
    .locals 3
    .parameter "h"

    .prologue
    const/4 v2, 0x1

    .line 846
    new-instance v0, Lco/vine/android/player/VideoSensitiveImageClickListener;

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    invoke-direct {v0, p0, v1}, Lco/vine/android/player/VideoSensitiveImageClickListener;-><init>(Lco/vine/android/player/HasVideoPlayerAdapter;Ljava/util/HashSet;)V

    iput-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    .line 847
    iget-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    iget-object v1, p1, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 848
    iget-object v0, p1, Lco/vine/android/widget/FeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 849
    iput-boolean v2, p1, Lco/vine/android/widget/FeedViewHolder;->isVideoImageLoaded:Z

    .line 850
    return-void
.end method

.method protected bridge synthetic createSensitiveLisenter(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    check-cast p1, Lco/vine/android/widget/FeedViewHolder;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->createSensitiveLisenter(Lco/vine/android/widget/FeedViewHolder;)V

    return-void
.end method

.method protected getHolderFromPosition(I)Lco/vine/android/widget/FeedViewHolder;
    .locals 2
    .parameter "position"

    .prologue
    .line 800
    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 801
    .local v0, p:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/widget/FeedViewHolder;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/FeedViewHolder;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getLastPlayer()Lco/vine/android/player/SdkVideoView;
    .locals 1

    .prologue
    .line 861
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    return-object v0
.end method

.method public getPlayer(IZ)Lco/vine/android/player/SdkVideoView;
    .locals 1
    .parameter "position"
    .parameter "b"

    .prologue
    .line 344
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPlayers:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/player/SdkVideoView;

    return-object v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 353
    invoke-direct {p0}, Lco/vine/android/widget/FeedAdapter;->hasPlayerPlaying()Z

    move-result v0

    return v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    const v8, 0x7f0a0054

    .line 445
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f03004a

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 447
    .local v4, view:Landroid/view/View;
    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 448
    .local v0, container:Landroid/widget/RelativeLayout;
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 449
    .local v2, params:Landroid/view/ViewGroup$LayoutParams;
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 450
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 451
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 453
    const v5, 0x7f0a00be

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #container:Landroid/widget/RelativeLayout;
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 454
    .restart local v0       #container:Landroid/widget/RelativeLayout;
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 455
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 456
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 458
    const v5, 0x7f0a00b6

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 459
    .local v1, imageContainer:Landroid/widget/ImageView;
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 460
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 461
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 462
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 464
    new-instance v3, Lco/vine/android/widget/FeedViewHolder;

    invoke-direct {v3, v4}, Lco/vine/android/widget/FeedViewHolder;-><init>(Landroid/view/View;)V

    .line 465
    .local v3, tag:Lco/vine/android/widget/FeedViewHolder;
    const v5, 0x7f0a0056

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lco/vine/android/player/SdkVideoView;

    iput-object v5, v3, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 466
    new-instance v5, Lco/vine/android/player/OnListVideoClickListener;

    invoke-direct {v5, p0}, Lco/vine/android/player/OnListVideoClickListener;-><init>(Lco/vine/android/player/HasVideoPlayerAdapter;)V

    iput-object v5, v3, Lco/vine/android/widget/FeedViewHolder;->listener:Lco/vine/android/player/OnListVideoClickListener;

    .line 467
    iget-object v5, v3, Lco/vine/android/widget/FeedViewHolder;->likers:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 468
    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget-object v6, v3, Lco/vine/android/widget/FeedViewHolder;->listener:Lco/vine/android/player/OnListVideoClickListener;

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 470
    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 471
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mViewHolders:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 472
    const-string v5, "Get view: {}"

    iget-object v6, v3, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v6

    rem-int/lit8 v6, v6, 0x64

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 474
    return-object v4
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 806
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->stopCurrentPlayer()V

    .line 807
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FeedAdapter;->releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V

    .line 808
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 866
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FeedAdapter;->releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V

    .line 867
    return-void
.end method

.method public declared-synchronized onPause(Z)V
    .locals 2
    .parameter "focused"

    .prologue
    .line 764
    monitor-enter p0

    :try_start_0
    const-string v0, "OnPause {}. {}"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, p0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 765
    iput-boolean p1, p0, Lco/vine/android/widget/FeedAdapter;->mHasFocus:Z

    .line 766
    const/high16 v0, -0x8000

    iput v0, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    .line 767
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mPlayCurrentPositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 768
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FeedAdapter;->releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V

    .line 769
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/widget/FeedAdapter;->resetStates(Z)V

    .line 770
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/widget/FeedAdapter;->mWasResumed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 771
    monitor-exit p0

    return-void

    .line 764
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onResume(Z)V
    .locals 5
    .parameter "focused"

    .prologue
    .line 774
    monitor-enter p0

    :try_start_0
    const-string v3, "OnResume {}. {}"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4, p0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 775
    iget-boolean v3, p0, Lco/vine/android/widget/FeedAdapter;->mWasResumed:Z

    if-nez v3, :cond_0

    .line 776
    const/4 v3, 0x1

    iput-boolean v3, p0, Lco/vine/android/widget/FeedAdapter;->mWasResumed:Z

    .line 777
    const/high16 v3, -0x8000

    iput v3, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    .line 778
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lco/vine/android/util/MuteUtil;->isMuted(Landroid/content/Context;)Z

    move-result v3

    iput-boolean v3, p0, Lco/vine/android/widget/FeedAdapter;->mMuted:Z

    .line 779
    invoke-static {}, Lco/vine/android/util/video/VideoCache;->resetAverageSpeed()V

    .line 781
    :cond_0
    iput-boolean p1, p0, Lco/vine/android/widget/FeedAdapter;->mHasFocus:Z

    .line 782
    iget-boolean v3, p0, Lco/vine/android/widget/FeedAdapter;->mHasFocus:Z

    if-eqz v3, :cond_1

    .line 783
    invoke-direct {p0}, Lco/vine/android/widget/FeedAdapter;->calculateCurrentPosition()I

    move-result v0

    .line 784
    .local v0, currentPosition:I
    if-lez v0, :cond_1

    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-le v3, v0, :cond_1

    .line 786
    :try_start_1
    invoke-virtual {p0, v0}, Lco/vine/android/widget/FeedAdapter;->getHolderFromPosition(I)Lco/vine/android/widget/FeedViewHolder;

    move-result-object v2

    .line 787
    .local v2, h:Lco/vine/android/widget/FeedViewHolder;
    if-eqz v2, :cond_1

    .line 788
    invoke-virtual {p0, v2}, Lco/vine/android/widget/FeedAdapter;->bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 796
    .end local v0           #currentPosition:I
    .end local v2           #h:Lco/vine/android/widget/FeedViewHolder;
    :cond_1
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->playCurrentPosition()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 797
    monitor-exit p0

    return-void

    .line 790
    .restart local v0       #currentPosition:I
    :catch_0
    move-exception v1

    .line 792
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    :try_start_3
    const-string v3, "Race condition."

    invoke-static {v3, v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 774
    .end local v0           #currentPosition:I
    .end local v1           #e:Ljava/lang/IndexOutOfBoundsException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 812
    if-nez p2, :cond_0

    .line 813
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->playCurrentPosition()V

    .line 815
    :cond_0
    return-void
.end method

.method protected onVideoImageObtained(Lco/vine/android/widget/FeedViewHolder;Z)V
    .locals 0
    .parameter "holder"
    .parameter "b"

    .prologue
    .line 840
    iput-boolean p2, p1, Lco/vine/android/widget/FeedViewHolder;->isVideoImageLoaded:Z

    .line 841
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->playCurrentPosition()V

    .line 842
    return-void
.end method

.method protected bridge synthetic onVideoImageObtained(Lco/vine/android/widget/GenericFeedViewHolder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    check-cast p1, Lco/vine/android/widget/FeedViewHolder;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lco/vine/android/widget/FeedAdapter;->onVideoImageObtained(Lco/vine/android/widget/FeedViewHolder;Z)V

    return-void
.end method

.method public onVideoPathObtained(Ljava/util/HashMap;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/video/VideoKey;",
            "Lco/vine/android/util/video/UrlVideo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 827
    .local p1, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    const-string v3, "CALLBACK onVideoPathObtained"

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 828
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/util/video/VideoKey;

    .line 829
    .local v1, key:Lco/vine/android/util/video/VideoKey;
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/video/UrlVideo;

    .line 830
    .local v2, video:Lco/vine/android/util/video/UrlVideo;
    invoke-virtual {v2}, Lco/vine/android/util/video/UrlVideo;->isValid()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 831
    iget-object v4, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2}, Lco/vine/android/util/video/UrlVideo;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 832
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    if-ne v3, v4, :cond_0

    .line 833
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->playCurrentPosition()V

    goto :goto_0

    .line 837
    .end local v1           #key:Lco/vine/android/util/video/VideoKey;
    .end local v2           #video:Lco/vine/android/util/video/UrlVideo;
    :cond_1
    return-void
.end method

.method public pauseCurrentPlayer()V
    .locals 2

    .prologue
    .line 337
    invoke-direct {p0}, Lco/vine/android/widget/FeedAdapter;->hasPlayerPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    const-string v0, "Pause player {}."

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/SdkVideoView;->getPlayingPosition()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 339
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 341
    :cond_0
    return-void
.end method

.method public declared-synchronized play(I)V
    .locals 8
    .parameter "requestedPosition"

    .prologue
    .line 231
    monitor-enter p0

    :try_start_0
    const-string v5, "play task executing with position {} "

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    iget-boolean v5, p0, Lco/vine/android/widget/FeedAdapter;->mHasFocus:Z

    if-eqz v5, :cond_8

    .line 233
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 234
    add-int/lit8 v5, p1, 0x1

    invoke-direct {p0, v5}, Lco/vine/android/widget/FeedAdapter;->preFetch(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 235
    add-int/lit8 v5, p1, 0x2

    invoke-direct {p0, v5}, Lco/vine/android/widget/FeedAdapter;->preFetch(I)Z

    .line 237
    :cond_0
    const-string v5, "{} is in cache or it is already pre-fetched."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 238
    const-string v5, "playing file at position {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 239
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->playFile(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 279
    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    .line 241
    :cond_2
    :try_start_1
    const-string v5, "Real fetch for {}."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VinePost;

    .line 243
    .local v1, post:Lco/vine/android/api/VinePost;
    if-eqz v1, :cond_7

    .line 244
    const/4 v5, 0x0

    invoke-virtual {p0, v1, v5}, Lco/vine/android/widget/FeedAdapter;->getRequestKey(Lco/vine/android/api/VinePost;Z)Lco/vine/android/util/video/VideoKey;

    move-result-object v3

    .line 245
    .local v3, url:Lco/vine/android/util/video/VideoKey;
    if-nez v3, :cond_3

    .line 246
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->onInvalidRequestKey()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 231
    .end local v1           #post:Lco/vine/android/api/VinePost;
    .end local v3           #url:Lco/vine/android/util/video/VideoKey;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 249
    .restart local v1       #post:Lco/vine/android/api/VinePost;
    .restart local v3       #url:Lco/vine/android/util/video/VideoKey;
    :cond_3
    :try_start_2
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v3}, Lco/vine/android/client/AppController;->getVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, path:Ljava/lang/String;
    add-int/lit8 v5, p1, 0x1

    invoke-direct {p0, v5}, Lco/vine/android/widget/FeedAdapter;->preFetch(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 251
    add-int/lit8 v5, p1, 0x2

    invoke-direct {p0, v5}, Lco/vine/android/widget/FeedAdapter;->preFetch(I)Z

    .line 253
    :cond_4
    if-eqz v0, :cond_5

    .line 254
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v5, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 255
    const-string v5, "playing file at position {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 256
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->playFile(I)V

    goto :goto_0

    .line 258
    :cond_5
    iput p1, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    .line 259
    iget-object v5, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v3, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    const-string v5, "{} is not in app cache yet."

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->pauseCurrentPlayer()V

    .line 262
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->getViewAtPosition(I)Landroid/view/View;

    move-result-object v4

    .line 263
    .local v4, view:Landroid/view/View;
    if-eqz v4, :cond_1

    .line 264
    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 265
    .local v2, tag:Ljava/lang/Object;
    instance-of v5, v2, Lco/vine/android/widget/FeedViewHolder;

    if-eqz v5, :cond_6

    .line 266
    check-cast v2, Lco/vine/android/widget/FeedViewHolder;

    .end local v2           #tag:Ljava/lang/Object;
    iget-object v5, v2, Lco/vine/android/widget/FeedViewHolder;->videoLoadImage:Landroid/widget/ProgressBar;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 268
    .restart local v2       #tag:Ljava/lang/Object;
    :cond_6
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Somehow tag was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", view class is \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 273
    .end local v0           #path:Ljava/lang/String;
    .end local v2           #tag:Ljava/lang/Object;
    .end local v3           #url:Lco/vine/android/util/video/VideoKey;
    .end local v4           #view:Landroid/view/View;
    :cond_7
    const-string v5, "mPosts is {} or the requested position has no post object in it yet, return -1."

    iget-object v6, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 277
    .end local v1           #post:Lco/vine/android/api/VinePost;
    :cond_8
    const-string v5, "not playing because not focused."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method

.method public declared-synchronized playCurrentPosition()V
    .locals 4

    .prologue
    .line 348
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mPlayCurrentPositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 349
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/widget/FeedAdapter;->mPlayCurrentPositionRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    monitor-exit p0

    return-void

    .line 348
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized playFile(I)V
    .locals 10
    .parameter "position"

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 151
    monitor-enter p0

    if-gez p1, :cond_1

    .line 228
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 154
    :cond_1
    :try_start_0
    const-string v6, "Playing item: {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    invoke-virtual {p0, p1}, Lco/vine/android/widget/FeedAdapter;->getViewAtPosition(I)Landroid/view/View;

    move-result-object v1

    .line 157
    .local v1, currentView:Landroid/view/View;
    if-nez v1, :cond_2

    .line 158
    const-string v5, "Item is not visible: {}"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 151
    .end local v1           #currentView:Landroid/view/View;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 161
    .restart local v1       #currentView:Landroid/view/View;
    :cond_2
    :try_start_1
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/widget/FeedViewHolder;

    .line 162
    .local v4, tag:Lco/vine/android/widget/FeedViewHolder;
    if-eqz v4, :cond_0

    .line 165
    iget-boolean v6, v4, Lco/vine/android/widget/FeedViewHolder;->isVideoImageLoaded:Z

    if-nez v6, :cond_3

    iget-boolean v6, v4, Lco/vine/android/widget/FeedViewHolder;->hasVideoImage:Z

    if-eqz v6, :cond_3

    .line 166
    const-string v5, "Waiting for video image to load: {}."

    iget-object v6, v4, Lco/vine/android/widget/FeedViewHolder;->videoImageKey:Lco/vine/android/util/image/ImageKey;

    iget-object v6, v6, Lco/vine/android/util/image/ImageKey;->url:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 167
    invoke-virtual {p0, v4}, Lco/vine/android/widget/FeedAdapter;->bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 168
    invoke-virtual {p0, v4}, Lco/vine/android/widget/FeedAdapter;->bindAvatar(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 169
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->playCurrentPosition()V

    goto :goto_0

    .line 173
    :cond_3
    iget-object v0, v4, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 175
    .local v0, currentVideoView:Lco/vine/android/player/SdkVideoView;
    iget-object v6, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    if-eq v0, v6, :cond_4

    .line 176
    const-string v6, "Pause previous player."

    invoke-static {v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->pauseCurrentPlayer()V

    .line 180
    :cond_4
    iget-object v6, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v6, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 182
    .local v2, newPath:Ljava/lang/String;
    if-nez v2, :cond_5

    .line 183
    const-string v5, "Path was cleared."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    goto :goto_0

    .line 187
    :cond_5
    invoke-virtual {v0, v2}, Lco/vine/android/player/SdkVideoView;->isPathPlaying(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_d

    .line 188
    iget-object v6, p0, Lco/vine/android/widget/FeedAdapter;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lco/vine/android/util/SystemUtil;->isSinglePlayerEnabled(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-static {}, Lco/vine/android/player/SdkVideoView;->getCurrentUri()Landroid/net/Uri;

    move-result-object v6

    if-nez v6, :cond_b

    .line 190
    .local v3, newView:Z
    :cond_6
    :goto_1
    if-nez v3, :cond_7

    .line 191
    invoke-direct {p0, p1, v4}, Lco/vine/android/widget/FeedAdapter;->refreshVideoView(ILco/vine/android/widget/FeedViewHolder;)V

    .line 193
    :cond_7
    iget-object v0, v4, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    .line 194
    iget-boolean v5, p0, Lco/vine/android/widget/FeedAdapter;->mMuted:Z

    invoke-virtual {v0, v5}, Lco/vine/android/player/SdkVideoView;->setMute(Z)V

    .line 195
    iget-boolean v5, p0, Lco/vine/android/widget/FeedAdapter;->mNeedReleaseOtherPlayers:Z

    if-eqz v5, :cond_8

    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    iget v6, p0, Lco/vine/android/widget/FeedAdapter;->maxPlayer:I

    if-lt v5, v6, :cond_8

    .line 196
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {p0, v5}, Lco/vine/android/widget/FeedAdapter;->releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V

    .line 198
    :cond_8
    const-string v5, "Start playing by set path."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 199
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v5, v5, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v5}, Lco/vine/android/player/SdkVideoView;->setTag(Ljava/lang/Object;)V

    .line 200
    const-string v5, "Setting video path in feed for post {}"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, v4, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v8, v8, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 201
    invoke-virtual {v0, v2}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 202
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isSurfaceReady()Z

    move-result v5

    if-nez v5, :cond_9

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_9

    .line 203
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 205
    :cond_9
    iget v5, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    .line 221
    .end local v3           #newView:Z
    :goto_2
    invoke-virtual {v0, p1}, Lco/vine/android/player/SdkVideoView;->setPlayingPosition(I)V

    .line 222
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->listener:Lco/vine/android/player/OnListVideoClickListener;

    invoke-virtual {v5, p1}, Lco/vine/android/player/OnListVideoClickListener;->setPosition(I)V

    .line 223
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    if-eqz v5, :cond_a

    .line 224
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    invoke-virtual {v5, p1}, Lco/vine/android/player/SensitiveImageClickListener;->setPosition(I)V

    .line 226
    :cond_a
    iput p1, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    .line 227
    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    goto/16 :goto_0

    :cond_b
    move v3, v5

    .line 188
    goto :goto_1

    :cond_c
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->getPath()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    move v3, v5

    goto :goto_1

    .line 207
    :cond_d
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v5}, Lco/vine/android/player/SdkVideoView;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_e

    .line 208
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 210
    :cond_e
    iget-boolean v5, p0, Lco/vine/android/widget/FeedAdapter;->mMuted:Z

    invoke-virtual {v0, v5}, Lco/vine/android/player/SdkVideoView;->setMute(Z)V

    .line 211
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v5

    if-eqz v5, :cond_f

    .line 212
    const-string v5, "Start playing by calling start."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->start()V

    goto :goto_2

    .line 215
    :cond_f
    const-string v5, "Start playing by set path."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 216
    iget-object v5, v4, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v5, v5, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v5}, Lco/vine/android/player/SdkVideoView;->setTag(Ljava/lang/Object;)V

    .line 217
    const-string v5, "Setting video path in feed for post {}"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, v4, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v8, v8, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 218
    invoke-virtual {v0, v2}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method public declared-synchronized releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V
    .locals 5
    .parameter "view"

    .prologue
    .line 433
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lco/vine/android/widget/FeedAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 434
    .local v2, key:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/widget/FeedViewHolder;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/FeedViewHolder;

    .line 435
    .local v0, holder:Lco/vine/android/widget/FeedViewHolder;
    if-eqz v0, :cond_0

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    if-eq p1, v3, :cond_0

    .line 436
    const-string v3, "Releasing player: {}"

    iget v4, v0, Lco/vine/android/widget/FeedViewHolder;->position:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 437
    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 438
    iget v3, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 433
    .end local v0           #holder:Lco/vine/android/widget/FeedViewHolder;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #key:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/widget/FeedViewHolder;>;"
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 441
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_1
    monitor-exit p0

    return-void
.end method

.method protected resetStates(Z)V
    .locals 2
    .parameter "hasDataSetChanged"

    .prologue
    const/4 v1, 0x0

    .line 138
    invoke-super {p0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->resetStates(Z)V

    .line 139
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->stopCurrentPlayer()V

    .line 140
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/widget/FeedAdapter;->mShouldBePlaying:I

    .line 141
    iput v1, p0, Lco/vine/android/widget/FeedAdapter;->currentPlayerCount:I

    .line 142
    iput-boolean v1, p0, Lco/vine/android/widget/FeedAdapter;->mFirstPlayed:Z

    .line 143
    if-eqz p1, :cond_0

    .line 144
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPosts:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 145
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mPaths:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 146
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mUrlReverse:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 148
    :cond_0
    return-void
.end method

.method public stopCurrentPlayer()V
    .locals 1

    .prologue
    .line 329
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v0, :cond_0

    .line 330
    iget-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 331
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/widget/FeedAdapter;->mLastPlayer:Lco/vine/android/player/SdkVideoView;

    .line 332
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/widget/FeedAdapter;->mCurrentPlaying:I

    .line 334
    :cond_0
    return-void
.end method

.method public toggleMute(Z)V
    .locals 3
    .parameter "mute"

    .prologue
    .line 818
    iput-boolean p1, p0, Lco/vine/android/widget/FeedAdapter;->mMuted:Z

    .line 819
    const-string v1, "Mute state changed to muted? {}."

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 820
    invoke-virtual {p0}, Lco/vine/android/widget/FeedAdapter;->getLastPlayer()Lco/vine/android/player/SdkVideoView;

    move-result-object v0

    .line 821
    .local v0, lastPlayer:Lco/vine/android/player/SdkVideoView;
    if-eqz v0, :cond_0

    .line 822
    iget-boolean v1, p0, Lco/vine/android/widget/FeedAdapter;->mMuted:Z

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setMute(Z)V

    .line 824
    :cond_0
    return-void
.end method
