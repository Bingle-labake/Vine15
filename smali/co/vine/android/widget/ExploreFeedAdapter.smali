.class public Lco/vine/android/widget/ExploreFeedAdapter;
.super Lco/vine/android/widget/GenericTimelineAdapter;
.source "ExploreFeedAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lco/vine/android/widget/GenericTimelineAdapter",
        "<",
        "Lco/vine/android/widget/ExploreFeedViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private mShouldBePlayingHolder:Lco/vine/android/widget/ExploreFeedViewHolder;

.field private mStartClickTime:J

.field private mStartedClickOnVideo:Z

.field private final mVideoBox:Landroid/graphics/Rect;

.field private final mVideoClicker:Lco/vine/android/player/OnSingleVideoClickedListener;

.field private final mVideoLoadProgressBar:Landroid/view/View;

.field private final mVideoOverlay:Landroid/view/View;

.field private final mVideoView:Lco/vine/android/player/OldSdkVideoView;

.field private mWasResumed:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V
    .locals 15
    .parameter "context"
    .parameter "listView"
    .parameter "likeCache"
    .parameter "revineCache"
    .parameter "timelineFragment"
    .parameter "source"

    .prologue
    .line 69
    invoke-direct/range {p0 .. p6}, Lco/vine/android/widget/GenericTimelineAdapter;-><init>(Landroid/app/Activity;Landroid/widget/ListView;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Lco/vine/android/BaseTimelineFragment;Ljava/lang/String;)V

    .line 59
    new-instance v9, Landroid/os/Handler;

    invoke-direct {v9}, Landroid/os/Handler;-><init>()V

    iput-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mHandler:Landroid/os/Handler;

    .line 66
    const/4 v9, 0x0

    iput-boolean v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mWasResumed:Z

    .line 72
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 73
    .local v1, decorView:Landroid/view/ViewGroup;
    const v9, 0x7f0a0186

    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 74
    .local v8, videoOverlay:Landroid/view/View;
    if-nez v8, :cond_0

    .line 75
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v9

    const v10, 0x7f030071

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v1, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 76
    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 79
    :cond_0
    iput-object v8, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    .line 81
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    const v10, 0x7f0a0056

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lco/vine/android/player/OldSdkVideoView;

    iput-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    .line 83
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    const v10, 0x7f0a0187

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    iput-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoLoadProgressBar:Landroid/view/View;

    .line 85
    new-instance v9, Lco/vine/android/player/OnSingleVideoClickedListener;

    iget-object v10, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-direct {v9, v10}, Lco/vine/android/player/OnSingleVideoClickedListener;-><init>(Lco/vine/android/player/VideoViewInterface;)V

    iput-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoClicker:Lco/vine/android/player/OnSingleVideoClickedListener;

    .line 87
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    new-instance v10, Lco/vine/android/widget/ExploreFeedAdapter$1;

    invoke-direct {v10, p0}, Lco/vine/android/widget/ExploreFeedAdapter$1;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 118
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v9

    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 119
    .local v3, display:Landroid/view/Display;
    invoke-static {v3}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v7

    .line 120
    .local v7, size:Landroid/graphics/Point;
    new-instance v4, Landroid/util/DisplayMetrics;

    invoke-direct {v4}, Landroid/util/DisplayMetrics;-><init>()V

    .line 121
    .local v4, outMetrics:Landroid/util/DisplayMetrics;
    invoke-virtual {v3, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 123
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0b0054

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v9

    float-to-int v9, v9

    mul-int/lit8 v5, v9, 0x2

    .line 124
    .local v5, padding:I
    iget v9, v7, Landroid/graphics/Point;->x:I

    sub-int v2, v9, v5

    .line 126
    .local v2, dimen:I
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    const v10, 0x7f0a0054

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 127
    .local v0, container:Landroid/widget/RelativeLayout;
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 128
    .local v6, params:Landroid/view/ViewGroup$LayoutParams;
    iput v2, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 129
    iput v2, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 130
    invoke-virtual {v0, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    new-instance v9, Landroid/graphics/Rect;

    iget v10, v7, Landroid/graphics/Point;->x:I

    div-int/lit8 v10, v10, 0x2

    div-int/lit8 v11, v2, 0x2

    sub-int/2addr v10, v11

    iget v11, v7, Landroid/graphics/Point;->y:I

    div-int/lit8 v11, v11, 0x2

    div-int/lit8 v12, v2, 0x2

    sub-int/2addr v11, v12

    iget v12, v7, Landroid/graphics/Point;->x:I

    div-int/lit8 v12, v12, 0x2

    div-int/lit8 v13, v2, 0x2

    add-int/2addr v12, v13

    iget v13, v7, Landroid/graphics/Point;->y:I

    div-int/lit8 v13, v13, 0x2

    div-int/lit8 v14, v2, 0x2

    add-int/2addr v13, v14

    invoke-direct {v9, v10, v11, v12, v13}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoBox:Landroid/graphics/Rect;

    .line 136
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    new-instance v10, Lco/vine/android/widget/ExploreFeedAdapter$2;

    invoke-direct {v10, p0}, Lco/vine/android/widget/ExploreFeedAdapter$2;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;)V

    invoke-virtual {v9, v10}, Lco/vine/android/player/OldSdkVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 155
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lco/vine/android/player/OldSdkVideoView;->setLooping(Z)V

    .line 156
    iget-object v9, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    new-instance v10, Lco/vine/android/widget/ExploreFeedAdapter$3;

    invoke-direct {v10, p0}, Lco/vine/android/widget/ExploreFeedAdapter$3;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;)V

    invoke-virtual {v9, v10}, Lco/vine/android/player/OldSdkVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 166
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/widget/ExploreFeedAdapter;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 55
    iget-wide v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mStartClickTime:J

    return-wide v0
.end method

.method static synthetic access$002(Lco/vine/android/widget/ExploreFeedAdapter;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    iput-wide p1, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mStartClickTime:J

    return-wide p1
.end method

.method static synthetic access$100(Lco/vine/android/widget/ExploreFeedAdapter;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-boolean v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mStartedClickOnVideo:Z

    return v0
.end method

.method static synthetic access$102(Lco/vine/android/widget/ExploreFeedAdapter;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 55
    iput-boolean p1, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mStartedClickOnVideo:Z

    return p1
.end method

.method static synthetic access$200(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/graphics/Rect;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoBox:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$300(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OnSingleVideoClickedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoClicker:Lco/vine/android/player/OnSingleVideoClickedListener;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/widget/ExploreFeedAdapter;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    invoke-direct {p0}, Lco/vine/android/widget/ExploreFeedAdapter;->dismissVideo()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/widget/ExploreFeedViewHolder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mShouldBePlayingHolder:Lco/vine/android/widget/ExploreFeedViewHolder;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/widget/ExploreFeedAdapter;)Lco/vine/android/player/OldSdkVideoView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    return-object v0
.end method

.method static synthetic access$700(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lco/vine/android/widget/ExploreFeedAdapter;->showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V

    return-void
.end method

.method static synthetic access$800(Lco/vine/android/widget/ExploreFeedAdapter;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 55
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lco/vine/android/widget/ExploreFeedAdapter;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 55
    invoke-direct {p0}, Lco/vine/android/widget/ExploreFeedAdapter;->onVideoStarted()V

    return-void
.end method

.method private bindView(Lco/vine/android/widget/ExploreFeedViewHolder;)V
    .locals 34
    .parameter "h"

    .prologue
    .line 337
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v16, v0

    .line 338
    .local v16, post:Lco/vine/android/api/VinePost;
    move-object/from16 v0, p1

    iget v15, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->position:I

    .line 340
    .local v15, position:I
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/ExploreFeedAdapter;->bindAvatar(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 342
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/ExploreFeedAdapter;->bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 344
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lco/vine/android/api/VinePost;->isExplicit()Z

    move-result v29

    if-eqz v29, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    move-object/from16 v29, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_1

    .line 345
    :cond_0
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 350
    :goto_0
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v29, v0

    if-eqz v29, :cond_4

    .line 351
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revineContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 352
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-wide v0, v0, Lco/vine/android/api/VineRepost;->userId:J

    move-wide/from16 v25, v0

    .line 353
    .local v25, userId:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v29

    cmp-long v29, v25, v29

    if-nez v29, :cond_2

    .line 354
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v30, v0

    const v31, 0x7f0e0146

    invoke-virtual/range {v30 .. v31}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 370
    .end local v25           #userId:J
    :goto_1
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_d

    .line 371
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setVisibility(I)V

    .line 373
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    if-nez v29, :cond_5

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    if-eqz v29, :cond_5

    .line 374
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    iput-object v0, v1, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    .line 375
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_5

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/api/VineEntity;

    .line 376
    .local v10, entity:Lco/vine/android/api/VineEntity;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->clone()Lco/vine/android/api/VineEntity;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 347
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    :cond_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    const/16 v30, 0x4

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_0

    .line 356
    .restart local v25       #userId:J
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    const v30, 0x7f0e0145

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget-object v0, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    move-object/from16 v33, v0

    aput-object v33, v31, v32

    invoke-virtual/range {v29 .. v31}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    .line 357
    .local v20, revinedBy:Ljava/lang/String;
    new-instance v21, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 358
    .local v21, revinedBySb:Landroid/text/SpannableStringBuilder;
    new-instance v27, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v29, 0x8

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v31, v0

    move-object/from16 v0, v27

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 360
    .local v27, usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v23

    .line 361
    .local v23, start:I
    if-gez v23, :cond_3

    const/16 v23, 0x0

    .end local v23           #start:I
    :cond_3
    invoke-virtual/range {v21 .. v21}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v29

    const/16 v30, 0x21

    move-object/from16 v0, v21

    move-object/from16 v1, v27

    move/from16 v2, v23

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 363
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v29, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 364
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revineLine:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 367
    .end local v20           #revinedBy:Ljava/lang/String;
    .end local v21           #revinedBySb:Landroid/text/SpannableStringBuilder;
    .end local v25           #userId:J
    .end local v27           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_4
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revineContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 380
    :cond_5
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    .line 381
    .local v17, postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    if-eqz v17, :cond_c

    .line 382
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v29, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 383
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v29, v0

    if-nez v29, :cond_7

    .line 384
    new-instance v29, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v30, v0

    invoke-direct/range {v29 .. v30}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    iput-object v0, v1, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    .line 385
    move-object/from16 v0, v16

    iget-object v8, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    .line 387
    .local v8, descriptionSb:Landroid/text/SpannableStringBuilder;
    const/16 v29, 0x0

    const/16 v30, 0x0

    :try_start_0
    move-object/from16 v0, v17

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-static {v0, v8, v1, v2}, Lco/vine/android/util/Util;->adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V

    .line 389
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .restart local v11       #i$:Ljava/util/Iterator;
    :cond_6
    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/api/VineEntity;

    .line 390
    .restart local v10       #entity:Lco/vine/android/api/VineEntity;
    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->isUserType()Z

    move-result v29

    if-eqz v29, :cond_b

    .line 391
    new-instance v27, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v29, 0x1

    iget-wide v0, v10, Lco/vine/android/api/VineEntity;->id:J

    move-wide/from16 v30, v0

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v31, v0

    move-object/from16 v0, v27

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 394
    .restart local v27       #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mVineGreen:I

    move/from16 v29, v0

    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 395
    iget v0, v10, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v29, v0

    iget v0, v10, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v30, v0

    const/16 v31, 0x21

    move-object/from16 v0, v27

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-static {v8, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 406
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v27           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :catch_0
    move-exception v9

    .line 407
    .local v9, e:Ljava/lang/Exception;
    invoke-static {v9}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 410
    .end local v8           #descriptionSb:Landroid/text/SpannableStringBuilder;
    .end local v9           #e:Ljava/lang/Exception;
    :cond_7
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->descriptionSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    .end local v17           #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    .line 419
    .local v18, res:Landroid/content/res/Resources;
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v29, v0

    if-eqz v29, :cond_e

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VineVenue;->venueName:Ljava/lang/String;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_e

    .line 420
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->location:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lco/vine/android/api/VineVenue;->venueName:Ljava/lang/String;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    sget-object v29, Lco/vine/android/api/VineVenue;->iconMap:Landroid/util/SparseIntArray;

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Lco/vine/android/api/VineVenue;->displayType:I

    move/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/util/SparseIntArray;->get(I)I

    move-result v29

    move-object/from16 v0, v18

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 422
    .local v7, d:Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->locationIcon:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 423
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->locationContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 428
    .end local v7           #d:Landroid/graphics/drawable/Drawable;
    :goto_5
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    move-object/from16 v29, v0

    if-eqz v29, :cond_8

    .line 429
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v0, v15}, Lco/vine/android/player/SensitiveImageClickListener;->setPosition(I)V

    .line 432
    :cond_8
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    move-object/from16 v28, v0

    .line 434
    .local v28, usernameString:Ljava/lang/String;
    if-nez v28, :cond_9

    .line 435
    const-string v28, ""

    .line 436
    new-instance v29, Lco/vine/android/VineException;

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "Invalid user name for post "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v31, v0

    invoke-virtual/range {v30 .. v32}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-direct/range {v29 .. v30}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v29 .. v29}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 438
    :cond_9
    new-instance v22, Landroid/text/SpannableStringBuilder;

    move-object/from16 v0, v22

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 439
    .local v22, sb:Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v31

    const/16 v32, 0x21

    move-object/from16 v0, v22

    move-object/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    move/from16 v4, v32

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 441
    new-instance v24, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v29, 0x1

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v30, v0

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v31, v0

    move-object/from16 v0, v24

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 443
    .local v24, styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v29, 0x7f090076

    move-object/from16 v0, v18

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v29

    move-object/from16 v0, v24

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 444
    const/16 v29, 0x0

    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v30

    const/16 v31, 0x21

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 446
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->userImage:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    new-instance v30, Lco/vine/android/widget/ExploreFeedAdapter$8;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/ExploreFeedAdapter$8;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 452
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->username:Landroid/widget/TextView;

    move-object/from16 v29, v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 453
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->username:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 454
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->timestamp:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->created:J

    move-wide/from16 v30, v0

    const/16 v32, 0x0

    move-object/from16 v0, v18

    move-wide/from16 v1, v30

    move/from16 v3, v32

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/util/Util;->getRelativeTimeString(Landroid/content/res/Resources;JZ)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->comment:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    new-instance v30, Lco/vine/android/widget/ExploreFeedAdapter$9;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/ExploreFeedAdapter$9;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 466
    move-object/from16 v0, p1

    iget-object v13, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    .line 467
    .local v13, likersContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p1

    iget-object v5, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->commentsContainer:Landroid/widget/RelativeLayout;

    .line 468
    .local v5, commentsContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p1

    iget-object v6, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    .line 469
    .local v6, compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mCompactLikesComments:Z

    move/from16 v29, v0

    if-nez v29, :cond_12

    .line 471
    const/16 v29, 0x8

    move/from16 v0, v29

    invoke-virtual {v6, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 474
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    if-eqz v29, :cond_f

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v29

    if-nez v29, :cond_f

    .line 475
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 476
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->likesCount:I

    move/from16 v29, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/widget/ExploreFeedAdapter;->setStyledLikers(Lco/vine/android/widget/GenericFeedViewHolder;ILco/vine/android/api/VinePagedData;)V

    .line 482
    :goto_6
    invoke-virtual/range {p0 .. p1}, Lco/vine/android/widget/ExploreFeedAdapter;->setRevinersCount(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 485
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    if-eqz v29, :cond_11

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v29

    if-nez v29, :cond_11

    .line 486
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 487
    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lco/vine/android/widget/ExploreFeedAdapter;->setStyledComments(Lco/vine/android/widget/GenericFeedViewHolder;Lco/vine/android/api/VinePagedData;)V

    .line 488
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v29, v0

    const/16 v30, 0x5

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_10

    .line 489
    const/16 v29, 0x2

    move/from16 v0, v29

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/ExploreFeedViewHolder;->commentType:I

    .line 490
    const v29, 0x7f0e01be

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v32, v0

    add-int/lit8 v32, v32, -0x5

    move-object/from16 v0, v18

    move/from16 v1, v32

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v18

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 493
    .local v14, olderComments:Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 494
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->olderComments:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v0, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 495
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    new-instance v30, Lco/vine/android/widget/ExploreFeedAdapter$10;

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lco/vine/android/widget/ExploreFeedAdapter$10;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;Lco/vine/android/api/VinePost;)V

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 519
    .end local v14           #olderComments:Ljava/lang/String;
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/LikeCache;->contains(J)Z

    move-result v29

    if-eqz v29, :cond_13

    .line 520
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/LikeCache;->isLike(J)Z

    move-result v12

    .line 521
    .local v12, liked:Z
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lco/vine/android/api/VinePost;->setFlagLiked(Z)V

    .line 530
    :goto_8
    if-eqz v12, :cond_15

    .line 531
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const v30, 0x7f0200d2

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 536
    :goto_9
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 537
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 539
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->more:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 540
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->more:Landroid/widget/ImageView;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 543
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->userId:J

    move-wide/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v31

    cmp-long v29, v29, v31

    if-eqz v29, :cond_a

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isPrivate()Z

    move-result v29

    if-eqz v29, :cond_16

    .line 545
    :cond_a
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 569
    :goto_a
    return-void

    .line 397
    .end local v5           #commentsContainer:Landroid/widget/RelativeLayout;
    .end local v6           #compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    .end local v12           #liked:Z
    .end local v13           #likersContainer:Landroid/widget/RelativeLayout;
    .end local v18           #res:Landroid/content/res/Resources;
    .end local v22           #sb:Landroid/text/SpannableStringBuilder;
    .end local v24           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v28           #usernameString:Ljava/lang/String;
    .restart local v8       #descriptionSb:Landroid/text/SpannableStringBuilder;
    .restart local v10       #entity:Lco/vine/android/api/VineEntity;
    .restart local v11       #i$:Ljava/util/Iterator;
    .restart local v17       #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_b
    :try_start_1
    invoke-virtual {v10}, Lco/vine/android/api/VineEntity;->isTagType()Z

    move-result v29

    if-eqz v29, :cond_6

    .line 398
    new-instance v27, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v29, 0x4

    iget-object v0, v10, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v31, v0

    move-object/from16 v0, v27

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 401
    .restart local v27       #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mVineGreen:I

    move/from16 v29, v0

    move-object/from16 v0, v27

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 402
    iget v0, v10, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v29, v0

    iget v0, v10, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v30, v0

    const/16 v31, 0x21

    move-object/from16 v0, v27

    move/from16 v1, v29

    move/from16 v2, v30

    move/from16 v3, v31

    invoke-static {v8, v0, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 412
    .end local v8           #descriptionSb:Landroid/text/SpannableStringBuilder;
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v27           #usernameSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_c
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 415
    .end local v17           #postEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_d
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->description:Landroid/widget/TextView;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    invoke-virtual/range {v29 .. v30}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 425
    .restart local v18       #res:Landroid/content/res/Resources;
    :cond_e
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->locationContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_5

    .line 478
    .restart local v5       #commentsContainer:Landroid/widget/RelativeLayout;
    .restart local v6       #compactLikesCommentsContainer:Landroid/widget/RelativeLayout;
    .restart local v13       #likersContainer:Landroid/widget/RelativeLayout;
    .restart local v22       #sb:Landroid/text/SpannableStringBuilder;
    .restart local v24       #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v28       #usernameString:Ljava/lang/String;
    :cond_f
    const/16 v29, 0x8

    move/from16 v0, v29

    invoke-virtual {v13, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_6

    .line 505
    :cond_10
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->olderCommentsContainer:Landroid/widget/RelativeLayout;

    move-object/from16 v29, v0

    const/16 v30, 0x8

    invoke-virtual/range {v29 .. v30}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 506
    const/16 v29, 0x1

    move/from16 v0, v29

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/ExploreFeedViewHolder;->commentType:I

    goto/16 :goto_7

    .line 509
    :cond_11
    const/16 v29, 0x8

    move/from16 v0, v29

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_7

    .line 513
    :cond_12
    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->likesCount:I

    move/from16 v29, v0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    move/from16 v30, v0

    move-object/from16 v0, v16

    iget v0, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    move/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/widget/ExploreFeedAdapter;->setStyledCompactLikesComments(Lco/vine/android/widget/GenericFeedViewHolder;III)V

    goto/16 :goto_7

    .line 523
    :cond_13
    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isLiked()Z

    move-result v12

    .line 524
    .restart local v12       #liked:Z
    if-eqz v12, :cond_14

    .line 525
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/LikeCache;->like(J)V

    goto/16 :goto_8

    .line 527
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/LikeCache;->unlike(J)V

    goto/16 :goto_8

    .line 533
    :cond_15
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->liked:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const v30, 0x7f02008f

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto/16 :goto_9

    .line 547
    :cond_16
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/RevineCache;->contains(J)Z

    move-result v29

    if-eqz v29, :cond_17

    .line 550
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/RevineCache;->isRevined(J)Z

    move-result v19

    .line 551
    .local v19, revined:Z
    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagRevined(Z)V

    .line 561
    :goto_b
    if-eqz v19, :cond_1b

    .line 562
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const v30, 0x7f0200b4

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 566
    :goto_c
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 567
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v30, v0

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_a

    .line 553
    .end local v19           #revined:Z
    :cond_17
    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    move-wide/from16 v29, v0

    const-wide/16 v31, 0x0

    cmp-long v29, v29, v31

    if-gtz v29, :cond_18

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/api/VinePost;->isRevined()Z

    move-result v29

    if-eqz v29, :cond_19

    :cond_18
    const/16 v19, 0x1

    .line 554
    .restart local v19       #revined:Z
    :goto_d
    if-eqz v19, :cond_1a

    .line 555
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    move-wide/from16 v32, v0

    invoke-virtual/range {v29 .. v33}, Lco/vine/android/RevineCache;->putMyRepostId(JJ)V

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/RevineCache;->revine(J)V

    goto :goto_b

    .line 553
    .end local v19           #revined:Z
    :cond_19
    const/16 v19, 0x0

    goto :goto_d

    .line 558
    .restart local v19       #revined:Z
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    move-object/from16 v29, v0

    move-object/from16 v0, v16

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v30, v0

    invoke-virtual/range {v29 .. v31}, Lco/vine/android/RevineCache;->unRevine(J)V

    goto :goto_b

    .line 564
    :cond_1b
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->revine:Landroid/widget/ImageButton;

    move-object/from16 v29, v0

    const v30, 0x7f0200b2

    invoke-virtual/range {v29 .. v30}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_c
.end method

.method private dismissVideo()Z
    .locals 2

    .prologue
    .line 187
    const-string v0, "Dismiss Video."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 188
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->removeVideoUri()V

    .line 189
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 190
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoOverlay:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 191
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/OldSdkVideoView;->stopPlayback()V

    .line 194
    :cond_0
    const/4 v0, 0x1

    .line 196
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private onVideoStarted()V
    .locals 4

    .prologue
    .line 169
    const-string v0, "Video Started."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoLoadProgressBar:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 171
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mHandler:Landroid/os/Handler;

    new-instance v1, Lco/vine/android/widget/ExploreFeedAdapter$4;

    invoke-direct {v1, p0}, Lco/vine/android/widget/ExploreFeedAdapter$4;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 179
    return-void
.end method

.method private showVideo(Lco/vine/android/widget/ExploreFeedViewHolder;Z)V
    .locals 6
    .parameter "h"
    .parameter "forceLowKey"

    .prologue
    const/4 v4, 0x0

    .line 206
    if-eqz p1, :cond_1

    .line 207
    const-string v2, "Show Video: {}."

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    iput-object p1, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mShouldBePlayingHolder:Lco/vine/android/widget/ExploreFeedViewHolder;

    .line 209
    if-nez p2, :cond_0

    .line 210
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v2, v4}, Lco/vine/android/player/OldSdkVideoView;->setReportOpenVideoError(Z)V

    .line 212
    :cond_0
    iget-object v2, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    invoke-virtual {p0, v2, p2}, Lco/vine/android/widget/ExploreFeedAdapter;->getRequestKey(Lco/vine/android/api/VinePost;Z)Lco/vine/android/util/video/VideoKey;

    move-result-object v1

    .line 213
    .local v1, videoKey:Lco/vine/android/util/video/VideoKey;
    if-nez v1, :cond_2

    if-nez p2, :cond_2

    .line 214
    invoke-virtual {p0}, Lco/vine/android/widget/ExploreFeedAdapter;->onInvalidRequestKey()V

    .line 237
    .end local v1           #videoKey:Lco/vine/android/util/video/VideoKey;
    :cond_1
    :goto_0
    return-void

    .line 216
    .restart local v1       #videoKey:Lco/vine/android/util/video/VideoKey;
    :cond_2
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v2, v1}, Lco/vine/android/client/AppController;->getVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, path:Ljava/lang/String;
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v2, p1}, Lco/vine/android/player/OldSdkVideoView;->setTag(Ljava/lang/Object;)V

    .line 218
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    iget-object v3, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lco/vine/android/util/MuteUtil;->isMuted(Landroid/content/Context;)Z

    move-result v3

    invoke-virtual {v2, v3}, Lco/vine/android/player/OldSdkVideoView;->setMute(Z)V

    .line 219
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    iget-object v3, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lco/vine/android/player/OldSdkVideoView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 220
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoLoadProgressBar:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 221
    if-eqz v0, :cond_3

    .line 222
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v2, v0}, Lco/vine/android/player/OldSdkVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 224
    :cond_3
    iget-object v2, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mHandler:Landroid/os/Handler;

    new-instance v3, Lco/vine/android/widget/ExploreFeedAdapter$5;

    invoke-direct {v3, p0}, Lco/vine/android/widget/ExploreFeedAdapter$5;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;)V

    const-wide/16 v4, 0xfa

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 5
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 322
    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    .line 324
    .local v1, position:I
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/ExploreFeedViewHolder;

    .line 326
    .local v0, h:Lco/vine/android/widget/ExploreFeedViewHolder;
    invoke-virtual {p0, p3}, Lco/vine/android/widget/ExploreFeedAdapter;->bindCursorToPost(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;

    move-result-object v2

    iput-object v2, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    .line 327
    iput v1, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->position:I

    .line 329
    iget-object v2, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    if-nez v2, :cond_0

    .line 330
    new-instance v2, Lco/vine/android/VineException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Post was null: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 334
    :goto_0
    return-void

    .line 332
    :cond_0
    invoke-direct {p0, v0}, Lco/vine/android/widget/ExploreFeedAdapter;->bindView(Lco/vine/android/widget/ExploreFeedViewHolder;)V

    goto :goto_0
.end method

.method protected createInsensitiveListener(Lco/vine/android/widget/ExploreFeedViewHolder;)V
    .locals 2
    .parameter "h"

    .prologue
    .line 256
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 257
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 258
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 259
    new-instance v0, Lco/vine/android/widget/ExploreFeedAdapter$7;

    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    invoke-direct {v0, p0, v1}, Lco/vine/android/widget/ExploreFeedAdapter$7;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;Ljava/util/HashSet;)V

    iput-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    .line 271
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->videoImage:Landroid/widget/ImageView;

    iget-object v1, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    return-void
.end method

.method protected bridge synthetic createInsensitiveListener(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 55
    check-cast p1, Lco/vine/android/widget/ExploreFeedViewHolder;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/widget/ExploreFeedAdapter;->createInsensitiveListener(Lco/vine/android/widget/ExploreFeedViewHolder;)V

    return-void
.end method

.method protected createSensitiveLisenter(Lco/vine/android/widget/ExploreFeedViewHolder;)V
    .locals 3
    .parameter "h"

    .prologue
    const/4 v2, 0x1

    .line 241
    new-instance v0, Lco/vine/android/widget/ExploreFeedAdapter$6;

    iget-object v1, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    invoke-direct {v0, p0, v1, p1}, Lco/vine/android/widget/ExploreFeedAdapter$6;-><init>(Lco/vine/android/widget/ExploreFeedAdapter;Ljava/util/HashSet;Lco/vine/android/widget/ExploreFeedViewHolder;)V

    iput-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    .line 249
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    iget-object v1, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->imageListener:Lco/vine/android/player/SensitiveImageClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 250
    iget-object v0, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 251
    iput-boolean v2, p1, Lco/vine/android/widget/ExploreFeedViewHolder;->isVideoImageLoaded:Z

    .line 252
    return-void
.end method

.method protected bridge synthetic createSensitiveLisenter(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 55
    check-cast p1, Lco/vine/android/widget/ExploreFeedViewHolder;

    .end local p1
    invoke-virtual {p0, p1}, Lco/vine/android/widget/ExploreFeedAdapter;->createSensitiveLisenter(Lco/vine/android/widget/ExploreFeedViewHolder;)V

    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 293
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f03004b

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 295
    .local v4, view:Landroid/view/View;
    const v5, 0x7f0a0054

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    .line 296
    .local v0, container:Landroid/widget/RelativeLayout;
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 297
    .local v2, params:Landroid/view/ViewGroup$LayoutParams;
    iget v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 298
    iget v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 299
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 301
    const v5, 0x7f0a00be

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #container:Landroid/widget/RelativeLayout;
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 302
    .restart local v0       #container:Landroid/widget/RelativeLayout;
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 303
    iget v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 304
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 306
    const v5, 0x7f0a00b6

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 307
    .local v1, imageContainer:Landroid/widget/ImageView;
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 308
    iget v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 309
    iget v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mDimen:I

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 310
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    new-instance v3, Lco/vine/android/widget/ExploreFeedViewHolder;

    invoke-direct {v3, v4}, Lco/vine/android/widget/ExploreFeedViewHolder;-><init>(Landroid/view/View;)V

    .line 313
    .local v3, tag:Lco/vine/android/widget/ExploreFeedViewHolder;
    iget-object v5, v3, Lco/vine/android/widget/ExploreFeedViewHolder;->likers:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 315
    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 316
    iget-object v5, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mViewHolders:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 317
    return-object v4
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 202
    invoke-direct {p0}, Lco/vine/android/widget/ExploreFeedAdapter;->dismissVideo()Z

    move-result v0

    return v0
.end method

.method public onPause(Z)V
    .locals 0
    .parameter "isFocused"

    .prologue
    .line 183
    invoke-direct {p0}, Lco/vine/android/widget/ExploreFeedAdapter;->dismissVideo()Z

    .line 184
    return-void
.end method

.method public onVideoPathObtained(Ljava/util/HashMap;)V
    .locals 8
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
    .line 277
    .local p1, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mShouldBePlayingHolder:Lco/vine/android/widget/ExploreFeedViewHolder;

    .line 278
    .local v0, holder:Lco/vine/android/widget/ExploreFeedViewHolder;
    if-eqz v0, :cond_3

    .line 279
    iget-object v7, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v5, v7, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    .line 280
    .local v5, url:Ljava/lang/String;
    iget-object v7, v0, Lco/vine/android/widget/ExploreFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v3, v7, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    .line 281
    .local v3, lowUrl:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/video/VideoKey;

    .line 282
    .local v2, key:Lco/vine/android/util/video/VideoKey;
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/util/video/UrlVideo;

    .line 283
    .local v6, video:Lco/vine/android/util/video/UrlVideo;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lco/vine/android/util/video/UrlVideo;->isValid()Z

    move-result v7

    if-eqz v7, :cond_0

    if-eqz v5, :cond_1

    iget-object v7, v2, Lco/vine/android/util/video/VideoKey;->url:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    :cond_1
    if-eqz v3, :cond_0

    iget-object v7, v2, Lco/vine/android/util/video/VideoKey;->url:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 284
    :cond_2
    invoke-virtual {v6}, Lco/vine/android/util/video/UrlVideo;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 285
    .local v4, path:Ljava/lang/String;
    iget-object v7, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v7, v4}, Lco/vine/android/player/OldSdkVideoView;->setVideoPath(Ljava/lang/String;)V

    goto :goto_0

    .line 289
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #key:Lco/vine/android/util/video/VideoKey;
    .end local v3           #lowUrl:Ljava/lang/String;
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #url:Ljava/lang/String;
    .end local v6           #video:Lco/vine/android/util/video/UrlVideo;
    :cond_3
    return-void
.end method

.method public toggleMute(Z)V
    .locals 1
    .parameter "mute"

    .prologue
    .line 573
    invoke-super {p0, p1}, Lco/vine/android/widget/GenericTimelineAdapter;->toggleMute(Z)V

    .line 574
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    if-eqz v0, :cond_0

    .line 575
    iget-object v0, p0, Lco/vine/android/widget/ExploreFeedAdapter;->mVideoView:Lco/vine/android/player/OldSdkVideoView;

    invoke-virtual {v0, p1}, Lco/vine/android/player/OldSdkVideoView;->setMute(Z)V

    .line 577
    :cond_0
    return-void
.end method
