.class public abstract Lco/vine/android/widget/GenericVideoAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "GenericVideoAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lco/vine/android/widget/GenericFeedViewHolder;",
        ">",
        "Landroid/support/v4/widget/CursorAdapter;"
    }
.end annotation


# static fields
.field protected static final COMMA:C = ','

.field protected static final COMMENT_TYPE_FEW:I = 0x1

.field protected static final COMMENT_TYPE_MANY:I = 0x2

.field private static final HQ_THRESHOLD:I = 0xc8

.field protected static final INTERPUNCT:C = '\u00b7'

.field protected static final LIKE_TYPE_MANY:I = 0x3

.field protected static final LIKE_TYPE_MULTIPLE:I = 0x2

.field protected static final LIKE_TYPE_SINGLE:I = 0x1

.field public static final MANY_LIKES_SPAN:I = 0x2

.field protected static final MAX_COMMENT_ITEMS:I = 0x5

.field protected static final MAX_LIKE_ITEMS:I = 0xa

.field protected static final NEWLINE:C = '\n'

.field public static final OLDER_COMMENTS_SPAN:I = 0x3

.field public static final REVINED_BY_SPAN:I = 0x8

.field public static final REVINERS_SPAN:I = 0x7

.field protected static final SPACE:C = ' '

.field protected static final SPAN_FLAGS:I = 0x21

.field public static final SPAN_FOLLOWERS:I = 0x5

.field public static final SPAN_FOLLOWING:I = 0x6

.field public static final TAG_SPAN:I = 0x4

.field public static final USERNAME_SPAN:I = 0x1


# instance fields
.field protected final mAppController:Lco/vine/android/client/AppController;

.field protected final mAvatars:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected final mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

.field protected mCompactLikesComments:Z

.field protected final mContext:Landroid/content/Context;

.field protected final mCursorBundle:Landroid/os/Bundle;

.field protected final mDimen:I

.field protected final mDismissedWarnings:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected final mFollowEventSource:Ljava/lang/String;

.field protected mLikeCache:Lco/vine/android/LikeCache;

.field protected mLoadingTimeTag:Ljava/lang/String;

.field private mNormalVideoPlayable:Ljava/lang/Boolean;

.field protected mRevineCache:Lco/vine/android/RevineCache;

.field protected final mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

.field protected mStartLoadingTime:J

.field protected final mThumbnails:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected final mViewClickListener:Landroid/view/View$OnClickListener;

.field protected final mViewHolders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field protected mViewOffsetResolver:Lco/vine/android/ViewOffsetResolver;

.field protected final mVineGreen:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lco/vine/android/LikeCache;Lco/vine/android/RevineCache;Landroid/view/View$OnClickListener;Lco/vine/android/widget/SpanClickListener;Ljava/lang/String;)V
    .locals 9
    .parameter "context"
    .parameter "likeCache"
    .parameter "revineCache"
    .parameter "viewClickListener"
    .parameter "spanClickListener"
    .parameter "followEventSource"

    .prologue
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 116
    const/4 v4, 0x2

    invoke-direct {p0, p1, v8, v4}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 106
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCursorBundle:Landroid/os/Bundle;

    .line 117
    iput-object p1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    .line 118
    invoke-static {p1}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v4

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    .line 119
    iput-object p4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewClickListener:Landroid/view/View$OnClickListener;

    .line 120
    iput-object p5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    .line 121
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    .line 122
    new-instance v4, Landroid/util/SparseArray;

    invoke-direct {v4}, Landroid/util/SparseArray;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    .line 123
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    .line 124
    new-instance v4, Lco/vine/android/widget/TypefacesSpan;

    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v5, v7, v6}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-direct {v4, v8, v5}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    .line 127
    iput-boolean v7, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCompactLikesComments:Z

    .line 128
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    .line 130
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 131
    .local v0, display:Landroid/view/Display;
    invoke-static {v0}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v3

    .line 132
    .local v3, size:Landroid/graphics/Point;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 133
    .local v1, outMetrics:Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 135
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0054

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v4, v4

    mul-int/lit8 v2, v4, 0x2

    .line 136
    .local v2, padding:I
    iget v4, v3, Landroid/graphics/Point;->x:I

    sub-int/2addr v4, v2

    iput v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mDimen:I

    .line 137
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f090076

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iput v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    .line 138
    iget-object v4, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCursorBundle:Landroid/os/Bundle;

    const-string v5, "include_list"

    invoke-virtual {v4, v5, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 139
    iput-object p2, p0, Lco/vine/android/widget/GenericVideoAdapter;->mLikeCache:Lco/vine/android/LikeCache;

    .line 140
    iput-object p3, p0, Lco/vine/android/widget/GenericVideoAdapter;->mRevineCache:Lco/vine/android/RevineCache;

    .line 141
    iput-object p6, p0, Lco/vine/android/widget/GenericVideoAdapter;->mFollowEventSource:Ljava/lang/String;

    .line 142
    return-void
.end method


# virtual methods
.method protected bindAvatar(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 6
    .parameter "holder"

    .prologue
    .line 382
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iget-object v3, p1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    .line 383
    .local v3, post:Lco/vine/android/api/VinePost;
    iget v2, p1, Lco/vine/android/widget/GenericFeedViewHolder;->position:I

    .line 384
    .local v2, position:I
    iget-object v4, p1, Lco/vine/android/widget/GenericFeedViewHolder;->userImage:Landroid/widget/ImageView;

    .line 385
    .local v4, userImage:Landroid/widget/ImageView;
    iget-object v5, v3, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 386
    iget-object v5, v3, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-static {v5}, Lco/vine/android/util/Util;->isDefaultAvatarUrl(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 387
    invoke-static {v4}, Lco/vine/android/util/Util;->safeSetDefaultAvatar(Landroid/widget/ImageView;)V

    .line 399
    :cond_0
    :goto_0
    return-void

    .line 389
    :cond_1
    new-instance v1, Lco/vine/android/util/image/ImageKey;

    iget-object v5, v3, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-direct {v1, v5}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 390
    .local v1, avatarKey:Lco/vine/android/util/image/ImageKey;
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v5, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 391
    .local v0, avatar:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2

    .line 392
    invoke-virtual {p0, v4, v0}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)Z

    .line 396
    :goto_1
    iput-object v1, p1, Lco/vine/android/widget/GenericFeedViewHolder;->avatarKey:Lco/vine/android/util/image/ImageKey;

    goto :goto_0

    .line 394
    :cond_2
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v1}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)Z

    goto :goto_1
.end method

.method protected bindCursorToPost(Landroid/database/Cursor;)Lco/vine/android/api/VinePost;
    .locals 2
    .parameter "cursor"

    .prologue
    .line 655
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iget-object v1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCursorBundle:Landroid/os/Bundle;

    invoke-interface {p1, v1}, Landroid/database/Cursor;->respond(Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 656
    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 657
    .local v0, extras:Landroid/os/Bundle;
    const-string v1, "post"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lco/vine/android/api/VinePost;

    return-object v1
.end method

.method protected declared-synchronized bindVideoImage(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p1, h:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 927
    monitor-enter p0

    :try_start_0
    iget-object v2, p1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    .line 928
    .local v2, post:Lco/vine/android/api/VinePost;
    iget v1, p1, Lco/vine/android/widget/GenericFeedViewHolder;->position:I

    .line 930
    .local v1, position:I
    iget-object v6, v2, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    if-eqz v6, :cond_1

    move v6, v0

    :goto_0
    iput-boolean v6, p1, Lco/vine/android/widget/GenericFeedViewHolder;->hasVideoImage:Z

    .line 932
    invoke-virtual {v2}, Lco/vine/android/api/VinePost;->isExplicit()Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lco/vine/android/widget/GenericVideoAdapter;->mDismissedWarnings:Ljava/util/HashSet;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 934
    .local v0, isSensitiveImage:Z
    :goto_1
    if-eqz v0, :cond_3

    .line 935
    iget-object v5, p1, Lco/vine/android/widget/GenericFeedViewHolder;->sensitiveTextContainer:Landroid/widget/LinearLayout;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 936
    invoke-virtual {p0, p1}, Lco/vine/android/widget/GenericVideoAdapter;->createSensitiveLisenter(Lco/vine/android/widget/GenericFeedViewHolder;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 953
    :cond_0
    :goto_2
    monitor-exit p0

    return-void

    .end local v0           #isSensitiveImage:Z
    :cond_1
    move v6, v5

    .line 930
    goto :goto_0

    :cond_2
    move v0, v5

    .line 932
    goto :goto_1

    .line 938
    .restart local v0       #isSensitiveImage:Z
    :cond_3
    :try_start_1
    invoke-virtual {p0, p1}, Lco/vine/android/widget/GenericVideoAdapter;->createInsensitiveListener(Lco/vine/android/widget/GenericFeedViewHolder;)V

    .line 939
    iget-boolean v5, p1, Lco/vine/android/widget/GenericFeedViewHolder;->hasVideoImage:Z

    if-eqz v5, :cond_0

    .line 940
    new-instance v3, Lco/vine/android/util/image/ImageKey;

    iget-object v5, v2, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-direct {v3, v5}, Lco/vine/android/util/image/ImageKey;-><init>(Ljava/lang/String;)V

    .line 941
    .local v3, videoImageKey:Lco/vine/android/util/image/ImageKey;
    iput-object v3, p1, Lco/vine/android/widget/GenericFeedViewHolder;->videoImageKey:Lco/vine/android/util/image/ImageKey;

    .line 942
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v5, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 943
    .local v4, videoThumbnail:Landroid/graphics/Bitmap;
    if-eqz v4, :cond_4

    .line 944
    const-string v5, "setting thumbnail for {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 945
    invoke-virtual {p1}, Lco/vine/android/widget/GenericFeedViewHolder;->getViewForVideoImage()Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5, v4}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/view/View;Landroid/graphics/Bitmap;)Z

    move-result v5

    iput-boolean v5, p1, Lco/vine/android/widget/GenericFeedViewHolder;->isVideoImageLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 927
    .end local v0           #isSensitiveImage:Z
    .end local v1           #position:I
    .end local v2           #post:Lco/vine/android/api/VinePost;
    .end local v3           #videoImageKey:Lco/vine/android/util/image/ImageKey;
    .end local v4           #videoThumbnail:Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 947
    .restart local v0       #isSensitiveImage:Z
    .restart local v1       #position:I
    .restart local v2       #post:Lco/vine/android/api/VinePost;
    .restart local v3       #videoImageKey:Lco/vine/android/util/image/ImageKey;
    .restart local v4       #videoThumbnail:Landroid/graphics/Bitmap;
    :cond_4
    :try_start_2
    const-string v5, "fetching thumbnail for {}"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 948
    invoke-virtual {p1}, Lco/vine/android/widget/GenericFeedViewHolder;->getViewForVideoImage()Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v6, v3}, Lco/vine/android/client/AppController;->getPhotoBitmap(Lco/vine/android/util/image/ImageKey;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/view/View;Landroid/graphics/Bitmap;)Z

    move-result v5

    iput-boolean v5, p1, Lco/vine/android/widget/GenericFeedViewHolder;->isVideoImageLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method

.method protected abstract createInsensitiveListener(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method protected abstract createSensitiveLisenter(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method protected endLoadingTimeProfiling()V
    .locals 8

    .prologue
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const-wide/16 v6, 0x0

    .line 334
    iget-wide v2, p0, Lco/vine/android/widget/GenericVideoAdapter;->mStartLoadingTime:J

    cmp-long v2, v2, v6

    if-lez v2, :cond_0

    .line 335
    invoke-virtual {p0}, Lco/vine/android/widget/GenericVideoAdapter;->timeSinceStartLoadingTime()J

    move-result-wide v2

    const-wide/16 v4, 0x1f4

    div-long/2addr v2, v4

    long-to-float v2, v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    mul-int/lit16 v2, v2, 0x1f4

    int-to-long v0, v2

    .line 336
    .local v0, loadingTime:J
    iput-wide v6, p0, Lco/vine/android/widget/GenericVideoAdapter;->mStartLoadingTime:J

    .line 337
    const-string v2, "Loading time for {} was {}ms."

    iget-object v3, p0, Lco/vine/android/widget/GenericVideoAdapter;->mLoadingTimeTag:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 338
    iget-object v2, p0, Lco/vine/android/widget/GenericVideoAdapter;->mLoadingTimeTag:Ljava/lang/String;

    invoke-static {v2, v0, v1}, Lco/vine/android/util/FlurryUtils;->trackLoadingTime(Ljava/lang/String;J)V

    .line 340
    .end local v0           #loadingTime:J
    :cond_0
    return-void
.end method

.method public getItemId(I)J
    .locals 2
    .parameter "position"

    .prologue
    .line 868
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    int-to-long v0, p1

    return-wide v0
.end method

.method protected getRequestKey(Lco/vine/android/api/VinePost;Z)Lco/vine/android/util/video/VideoKey;
    .locals 10
    .parameter "post"
    .parameter "forceLowKey"

    .prologue
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 991
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    if-nez v5, :cond_0

    .line 992
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lco/vine/android/util/SystemUtil;->isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v5

    sget-object v8, Lco/vine/android/util/SystemUtil$PrefBooleanState;->FALSE:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    if-eq v5, v8, :cond_4

    move v5, v6

    :goto_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iput-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    .line 995
    :cond_0
    invoke-static {}, Lco/vine/android/util/video/VideoCache;->getCurrentAverageSpeed()I

    move-result v5

    const/16 v8, 0xc8

    if-le v5, v8, :cond_5

    move v1, v6

    .line 997
    .local v1, isSpeedGoodEnough:Z
    :goto_1
    const-string v5, "Getting HQ Video: {} && {}"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    iget-object v9, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    invoke-static {v5, v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 999
    new-instance v4, Lco/vine/android/util/video/VideoKey;

    iget-object v5, p1, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    invoke-direct {v4, v5}, Lco/vine/android/util/video/VideoKey;-><init>(Ljava/lang/String;)V

    .line 1000
    .local v4, peekKey:Lco/vine/android/util/video/VideoKey;
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    if-nez v1, :cond_3

    .line 1001
    :cond_1
    iget-object v5, p1, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    if-eqz v5, :cond_6

    iget-object v5, p1, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6

    move v0, v6

    .line 1002
    .local v0, hasLowKey:Z
    :goto_2
    if-nez v0, :cond_7

    .line 1003
    const-string v5, "Low key does NOT exist: forceLowKey {}. "

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget-object v7, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    invoke-static {v5, v6, v7}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1004
    if-nez p2, :cond_2

    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_3

    .line 1005
    :cond_2
    const/4 v4, 0x0

    .line 1019
    .end local v0           #hasLowKey:Z
    .end local v4           #peekKey:Lco/vine/android/util/video/VideoKey;
    :cond_3
    :goto_3
    return-object v4

    .end local v1           #isSpeedGoodEnough:Z
    :cond_4
    move v5, v7

    .line 992
    goto :goto_0

    :cond_5
    move v1, v7

    .line 995
    goto :goto_1

    .restart local v1       #isSpeedGoodEnough:Z
    .restart local v4       #peekKey:Lco/vine/android/util/video/VideoKey;
    :cond_6
    move v0, v7

    .line 1001
    goto :goto_2

    .line 1010
    .restart local v0       #hasLowKey:Z
    :cond_7
    new-instance v2, Lco/vine/android/util/video/VideoKey;

    iget-object v5, p1, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-direct {v2, v5}, Lco/vine/android/util/video/VideoKey;-><init>(Ljava/lang/String;)V

    .line 1011
    .local v2, lowKey:Lco/vine/android/util/video/VideoKey;
    if-nez p2, :cond_8

    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mNormalVideoPlayable:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_9

    :cond_8
    move-object v4, v2

    .line 1012
    goto :goto_3

    .line 1014
    :cond_9
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v5, v4}, Lco/vine/android/client/AppController;->peekVideoFilePath(Lco/vine/android/util/video/VideoKey;)Ljava/lang/String;

    move-result-object v3

    .line 1015
    .local v3, path:Ljava/lang/String;
    if-nez v3, :cond_3

    move-object v4, v2

    goto :goto_3
.end method

.method public getStartLoadingTime()J
    .locals 2

    .prologue
    .line 343
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iget-wide v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mStartLoadingTime:J

    return-wide v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 873
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 958
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 320
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    invoke-super {p0}, Landroid/support/v4/widget/CursorAdapter;->notifyDataSetChanged()V

    .line 321
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/widget/GenericVideoAdapter;->resetStates(Z)V

    .line 322
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 374
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 312
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 360
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method protected onInvalidRequestKey()V
    .locals 1

    .prologue
    .line 987
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const-string v0, "Invalid request key."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;)V

    .line 988
    return-void
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 970
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const-string v0, "onLowMemory called."

    new-instance v1, Lco/vine/android/VineException;

    invoke-direct {v1}, Lco/vine/android/VineException;-><init>()V

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 971
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 972
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 973
    return-void
.end method

.method public onPause(Z)V
    .locals 0
    .parameter "isFocused"

    .prologue
    .line 352
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method public onResume(Z)V
    .locals 0
    .parameter "isFocused"

    .prologue
    .line 356
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .parameter "view"
    .parameter "scrollState"

    .prologue
    .line 368
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 3
    .parameter "level"

    .prologue
    .line 962
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/16 v0, 0x50

    if-eq p1, v0, :cond_0

    .line 963
    const-string v0, "onTrimMemory: Adapter has cleaned it\'s bitmaps: {}, {}."

    iget-object v1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 964
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 965
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 967
    :cond_0
    return-void
.end method

.method protected onVideoImageObtained(Lco/vine/android/widget/GenericFeedViewHolder;Z)V
    .locals 0
    .parameter
    .parameter "b"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .line 864
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p1, holder:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    return-void
.end method

.method public onVideoPathObtained(Ljava/util/HashMap;)V
    .locals 0
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
    .line 364
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p1, videos:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/video/VideoKey;Lco/vine/android/util/video/UrlVideo;>;"
    return-void
.end method

.method protected resetStates(Z)V
    .locals 1
    .parameter "hasDataSetChanged"

    .prologue
    .line 145
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    if-eqz p1, :cond_0

    .line 146
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mThumbnails:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 147
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAvatars:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 149
    :cond_0
    return-void
.end method

.method public setCompactLikesComments(Z)V
    .locals 0
    .parameter "compact"

    .prologue
    .line 315
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iput-boolean p1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCompactLikesComments:Z

    .line 316
    return-void
.end method

.method protected setImage(Landroid/view/View;Landroid/graphics/Bitmap;)Z
    .locals 2
    .parameter "imageView"
    .parameter "bitmap"

    .prologue
    .line 888
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    if-nez p2, :cond_0

    .line 889
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 890
    const/4 v0, 0x0

    .line 893
    :goto_0
    return v0

    .line 892
    :cond_0
    new-instance v0, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 893
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)Z
    .locals 2
    .parameter "imageView"
    .parameter "bitmap"

    .prologue
    .line 877
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    if-nez p2, :cond_0

    .line 878
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090065

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 879
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 880
    const/4 v0, 0x0

    .line 883
    :goto_0
    return v0

    .line 882
    :cond_0
    new-instance v0, Lco/vine/android/drawable/RecyclableBitmapDrawable;

    iget-object v1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lco/vine/android/drawable/RecyclableBitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 883
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setImages(Ljava/util/HashMap;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Lco/vine/android/util/image/ImageKey;",
            "Lco/vine/android/util/image/UrlImage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 898
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p1, images:Ljava/util/HashMap;,"Ljava/util/HashMap<Lco/vine/android/util/image/ImageKey;Lco/vine/android/util/image/UrlImage;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 899
    .local v4, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<TT;>;>;"
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 900
    .local v3, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/widget/GenericFeedViewHolder;

    .line 901
    .local v0, holder:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    if-nez v0, :cond_1

    .line 902
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 905
    :cond_1
    iget-object v5, v0, Lco/vine/android/widget/GenericFeedViewHolder;->avatarKey:Lco/vine/android/util/image/ImageKey;

    if-eqz v5, :cond_2

    .line 906
    iget-object v5, v0, Lco/vine/android/widget/GenericFeedViewHolder;->avatarKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/image/UrlImage;

    .line 907
    .local v2, image:Lco/vine/android/util/image/UrlImage;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 908
    iget-object v5, v0, Lco/vine/android/widget/GenericFeedViewHolder;->userImage:Landroid/widget/ImageView;

    iget-object v6, v2, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v5, v6}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/widget/ImageView;Landroid/graphics/Bitmap;)Z

    .line 909
    const-string v5, "found for avatar."

    invoke-static {v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 912
    .end local v2           #image:Lco/vine/android/util/image/UrlImage;
    :cond_2
    iget-object v5, v0, Lco/vine/android/widget/GenericFeedViewHolder;->videoImageKey:Lco/vine/android/util/image/ImageKey;

    if-eqz v5, :cond_0

    .line 913
    iget-object v5, v0, Lco/vine/android/widget/GenericFeedViewHolder;->videoImageKey:Lco/vine/android/util/image/ImageKey;

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/util/image/UrlImage;

    .line 914
    .restart local v2       #image:Lco/vine/android/util/image/UrlImage;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lco/vine/android/util/image/UrlImage;->isValid()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 915
    const-string v5, "found for video: {}"

    iget-object v6, v2, Lco/vine/android/util/image/UrlImage;->url:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 916
    invoke-virtual {v0}, Lco/vine/android/widget/GenericFeedViewHolder;->getViewForVideoImage()Landroid/view/View;

    move-result-object v5

    iget-object v6, v2, Lco/vine/android/util/image/UrlImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v5, v6}, Lco/vine/android/widget/GenericVideoAdapter;->setImage(Landroid/view/View;Landroid/graphics/Bitmap;)Z

    move-result v5

    invoke-virtual {p0, v0, v5}, Lco/vine/android/widget/GenericVideoAdapter;->onVideoImageObtained(Lco/vine/android/widget/GenericFeedViewHolder;Z)V

    goto :goto_0

    .line 921
    .end local v0           #holder:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    .end local v2           #image:Lco/vine/android/util/image/UrlImage;
    .end local v3           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_3
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 922
    return-void
.end method

.method public setOffsetResolver(Lco/vine/android/ViewOffsetResolver;)V
    .locals 0
    .parameter "resolver"

    .prologue
    .line 378
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iput-object p1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewOffsetResolver:Lco/vine/android/ViewOffsetResolver;

    .line 379
    return-void
.end method

.method protected setRevinersCount(Lco/vine/android/widget/GenericFeedViewHolder;)V
    .locals 14
    .parameter "h"

    .prologue
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    const/16 v13, 0x21

    const/4 v12, 0x0

    .line 843
    iget-object v8, p1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    .line 844
    .local v8, post:Lco/vine/android/api/VinePost;
    iget v0, v8, Lco/vine/android/api/VinePost;->revinersCount:I

    if-lez v0, :cond_0

    .line 845
    iget-object v0, p1, Lco/vine/android/widget/GenericFeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v12}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 849
    :goto_0
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 850
    .local v9, res:Landroid/content/res/Resources;
    iget v0, v8, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-static {v9, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v7

    .line 851
    .local v7, numRevinersString:Ljava/lang/String;
    new-instance v10, Landroid/text/SpannableString;

    const v0, 0x7f0d0004

    iget v1, v8, Lco/vine/android/api/VinePost;->revinersCount:I

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v7, v2, v12

    invoke-virtual {v9, v0, v1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 853
    .local v10, reviners:Landroid/text/SpannableString;
    new-instance v6, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v11, 0x7

    new-instance v0, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    iget-wide v2, v8, Lco/vine/android/api/VinePost;->postId:J

    iget-wide v4, v8, Lco/vine/android/api/VinePost;->userId:J

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;-><init>(Lco/vine/android/widget/GenericVideoAdapter;JJ)V

    iget-object v1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    invoke-direct {v6, v11, v0, v1}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 855
    .local v6, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    iget v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    invoke-virtual {v6, v0}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 856
    invoke-virtual {v10}, Landroid/text/SpannableString;->length()I

    move-result v0

    invoke-virtual {v10, v6, v12, v0, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 857
    iget-object v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    invoke-virtual {v10}, Landroid/text/SpannableString;->length()I

    move-result v1

    invoke-virtual {v10, v0, v12, v1, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 858
    iget-object v0, p1, Lco/vine/android/widget/GenericFeedViewHolder;->reviners:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 859
    iget-object v0, p1, Lco/vine/android/widget/GenericFeedViewHolder;->reviners:Landroid/widget/TextView;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 860
    return-void

    .line 847
    .end local v6           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v7           #numRevinersString:Ljava/lang/String;
    .end local v9           #res:Landroid/content/res/Resources;
    .end local v10           #reviners:Landroid/text/SpannableString;
    :cond_0
    iget-object v0, p1, Lco/vine/android/widget/GenericFeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method protected setStyledComments(Lco/vine/android/widget/GenericFeedViewHolder;Lco/vine/android/api/VinePagedData;)V
    .locals 25
    .parameter "holder"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/widget/GenericFeedViewHolder;",
            "Lco/vine/android/api/VinePagedData",
            "<",
            "Lco/vine/android/api/VineComment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 661
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p2, commentData:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineComment;>;"
    move-object/from16 v0, p2

    iget-object v7, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    .line 662
    .local v7, comments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineComment;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v15

    .line 664
    .local v15, size:I
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments1:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 665
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments2:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 666
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments3:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 667
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments4:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 668
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments5:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 669
    if-nez v15, :cond_1

    .line 771
    :cond_0
    return-void

    .line 673
    :cond_1
    const/4 v8, 0x0

    .line 676
    .local v8, count:I
    add-int/lit8 v20, v15, -0x5

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->max(II)I

    move-result v14

    .local v14, index:I
    :goto_0
    if-ge v14, v15, :cond_0

    .line 677
    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/api/VineComment;

    .line 678
    .local v6, comment:Lco/vine/android/api/VineComment;
    const/16 v20, 0x5

    move/from16 v0, v20

    if-ge v8, v0, :cond_0

    .line 683
    packed-switch v8, :pswitch_data_0

    .line 702
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments5:Landroid/widget/TextView;

    move-object/from16 v18, v0

    .line 707
    .local v18, thisComment:Landroid/widget/TextView;
    :goto_1
    const/16 v20, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 709
    iget-object v0, v6, Lco/vine/android/api/VineComment;->commentSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v20, v0

    if-nez v20, :cond_6

    .line 710
    new-instance v20, Landroid/text/SpannableStringBuilder;

    invoke-direct/range {v20 .. v20}, Landroid/text/SpannableStringBuilder;-><init>()V

    move-object/from16 v0, v20

    iput-object v0, v6, Lco/vine/android/api/VineComment;->commentSb:Landroid/text/SpannableStringBuilder;

    .line 711
    iget-object v0, v6, Lco/vine/android/api/VineComment;->commentSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v19, v0

    .line 715
    .local v19, thisCommentSb:Landroid/text/SpannableStringBuilder;
    :try_start_0
    iget-object v0, v6, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v20

    const/16 v21, 0x20

    invoke-virtual/range {v20 .. v21}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v20

    iget-object v0, v6, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 722
    const/16 v17, 0x0

    .line 723
    .local v17, start:I
    iget-object v0, v6, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v10

    .line 725
    .local v10, end:I
    new-instance v16, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v20, 0x1

    iget-wide v0, v6, Lco/vine/android/api/VineComment;->userId:J

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v22, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 727
    .local v16, span:Lco/vine/android/widget/StyledClickableSpan;
    new-instance v4, Lco/vine/android/widget/TypefacesSpan;

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v21

    const/16 v22, 0x0

    const/16 v23, 0x3

    invoke-virtual/range {v21 .. v23}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v4, v0, v1}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 729
    .local v4, boldSpan:Lco/vine/android/widget/TypefacesSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    move/from16 v20, v0

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 730
    const/16 v20, 0x0

    const/16 v21, 0x21

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-static {v0, v1, v2, v10, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 731
    const/16 v20, 0x0

    const/16 v21, 0x21

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v4, v1, v10, v2}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 734
    iget-object v0, v6, Lco/vine/android/api/VineComment;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    if-nez v20, :cond_2

    iget-object v0, v6, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    if-eqz v20, :cond_2

    .line 735
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v20

    iput-object v0, v6, Lco/vine/android/api/VineComment;->transientEntities:Ljava/util/ArrayList;

    .line 736
    iget-object v0, v6, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lco/vine/android/api/VineEntity;

    .line 737
    .local v12, entity:Lco/vine/android/api/VineEntity;
    iget-object v0, v6, Lco/vine/android/api/VineComment;->transientEntities:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual {v12}, Lco/vine/android/api/VineEntity;->clone()Lco/vine/android/api/VineEntity;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 685
    .end local v4           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    .end local v10           #end:I
    .end local v12           #entity:Lco/vine/android/api/VineEntity;
    .end local v13           #i$:Ljava/util/Iterator;
    .end local v16           #span:Lco/vine/android/widget/StyledClickableSpan;
    .end local v17           #start:I
    .end local v18           #thisComment:Landroid/widget/TextView;
    .end local v19           #thisCommentSb:Landroid/text/SpannableStringBuilder;
    :pswitch_0
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments1:Landroid/widget/TextView;

    move-object/from16 v18, v0

    .line 686
    .restart local v18       #thisComment:Landroid/widget/TextView;
    goto/16 :goto_1

    .line 689
    .end local v18           #thisComment:Landroid/widget/TextView;
    :pswitch_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments2:Landroid/widget/TextView;

    move-object/from16 v18, v0

    .line 690
    .restart local v18       #thisComment:Landroid/widget/TextView;
    goto/16 :goto_1

    .line 693
    .end local v18           #thisComment:Landroid/widget/TextView;
    :pswitch_2
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments3:Landroid/widget/TextView;

    move-object/from16 v18, v0

    .line 694
    .restart local v18       #thisComment:Landroid/widget/TextView;
    goto/16 :goto_1

    .line 697
    .end local v18           #thisComment:Landroid/widget/TextView;
    :pswitch_3
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->comments4:Landroid/widget/TextView;

    move-object/from16 v18, v0

    .line 698
    .restart local v18       #thisComment:Landroid/widget/TextView;
    goto/16 :goto_1

    .line 716
    .restart local v19       #thisCommentSb:Landroid/text/SpannableStringBuilder;
    :catch_0
    move-exception v9

    .line 717
    .local v9, e:Ljava/lang/NullPointerException;
    const-string v20, "Comment attribute caused NPE: {} {} {}"

    const/16 v21, 0x3

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-wide v0, v6, Lco/vine/android/api/VineComment;->commentId:J

    move-wide/from16 v23, v0

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    iget-object v0, v6, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    move-object/from16 v23, v0

    aput-object v23, v21, v22

    const/16 v22, 0x2

    iget-object v0, v6, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    move-object/from16 v23, v0

    aput-object v23, v21, v22

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v9, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 676
    .end local v9           #e:Ljava/lang/NullPointerException;
    .end local v19           #thisCommentSb:Landroid/text/SpannableStringBuilder;
    :goto_3
    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 742
    .restart local v4       #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    .restart local v10       #end:I
    .restart local v16       #span:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v17       #start:I
    .restart local v19       #thisCommentSb:Landroid/text/SpannableStringBuilder;
    :cond_2
    iget-object v11, v6, Lco/vine/android/api/VineComment;->transientEntities:Ljava/util/ArrayList;

    .line 744
    .local v11, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    if-eqz v11, :cond_6

    .line 745
    add-int/lit8 v20, v10, 0x1

    const/16 v21, 0x0

    :try_start_1
    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v11, v0, v1, v2}, Lco/vine/android/util/Util;->adjustEntities(Ljava/util/ArrayList;Landroid/text/Editable;IZ)V

    .line 746
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13       #i$:Ljava/util/Iterator;
    :cond_3
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/vine/android/api/VineEntity;

    .line 747
    .local v9, e:Lco/vine/android/api/VineEntity;
    invoke-virtual {v9}, Lco/vine/android/api/VineEntity;->isUserType()Z

    move-result v20

    if-eqz v20, :cond_4

    .line 748
    new-instance v5, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v20, 0x1

    iget-wide v0, v9, Lco/vine/android/api/VineEntity;->id:J

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v22, v0

    move/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v5, v0, v1, v2}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 750
    .local v5, click:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 751
    iget v0, v9, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v20, v0

    iget v0, v9, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v21, v0

    const/16 v22, 0x21

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v5, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    .line 760
    .end local v5           #click:Lco/vine/android/widget/StyledClickableSpan;
    .end local v9           #e:Lco/vine/android/api/VineEntity;
    .end local v13           #i$:Ljava/util/Iterator;
    :catch_1
    move-exception v9

    .line 761
    .local v9, e:Ljava/lang/Exception;
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v20

    if-eqz v20, :cond_5

    .line 762
    new-instance v20, Ljava/lang/RuntimeException;

    move-object/from16 v0, v20

    invoke-direct {v0, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v20

    .line 752
    .local v9, e:Lco/vine/android/api/VineEntity;
    .restart local v13       #i$:Ljava/util/Iterator;
    :cond_4
    :try_start_2
    invoke-virtual {v9}, Lco/vine/android/api/VineEntity;->isTagType()Z

    move-result v20

    if-eqz v20, :cond_3

    .line 753
    new-instance v5, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v20, 0x4

    iget-object v0, v9, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v22, v0

    move/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v5, v0, v1, v2}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 755
    .restart local v5       #click:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 756
    iget v0, v9, Lco/vine/android/api/VineEntity;->start:I

    move/from16 v20, v0

    iget v0, v9, Lco/vine/android/api/VineEntity;->end:I

    move/from16 v21, v0

    const/16 v22, 0x21

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v5, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_4

    .line 764
    .end local v5           #click:Lco/vine/android/widget/StyledClickableSpan;
    .end local v13           #i$:Ljava/util/Iterator;
    .local v9, e:Ljava/lang/Exception;
    :cond_5
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Failed to adjust entities on "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget-wide v0, v6, Lco/vine/android/api/VineComment;->commentId:J

    move-wide/from16 v21, v0

    invoke-virtual/range {v20 .. v22}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v9, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 768
    .end local v4           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    .end local v9           #e:Ljava/lang/Exception;
    .end local v10           #end:I
    .end local v11           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    .end local v16           #span:Lco/vine/android/widget/StyledClickableSpan;
    .end local v17           #start:I
    .end local v19           #thisCommentSb:Landroid/text/SpannableStringBuilder;
    :cond_6
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 769
    iget-object v0, v6, Lco/vine/android/api/VineComment;->commentSb:Landroid/text/SpannableStringBuilder;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 683
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected setStyledCompactLikesComments(Lco/vine/android/widget/FeedViewHolder;III)V
    .locals 20
    .parameter "h"
    .parameter "likeCount"
    .parameter "commentCount"
    .parameter "revinersCount"

    .prologue
    .line 775
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 776
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->commentsContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 777
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 779
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    .line 780
    .local v15, res:Landroid/content/res/Resources;
    new-instance v17, Landroid/text/SpannableStringBuilder;

    invoke-direct/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 783
    .local v17, sb:Landroid/text/SpannableStringBuilder;
    if-lez p2, :cond_0

    .line 784
    move/from16 v0, p2

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v14

    .line 785
    .local v14, numberLikesString:Ljava/lang/String;
    const v2, 0x7f0d000e

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v14, v3, v4

    move/from16 v0, p2

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 787
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v2, 0x2

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v3, v3, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    invoke-direct {v9, v2, v3, v4}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 789
    .local v9, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v2, 0x7f090076

    invoke-virtual {v15, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 790
    const/16 v18, 0x0

    .line 791
    .local v18, start:I
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    .line 792
    .local v10, end:I
    const/4 v2, 0x0

    const/16 v3, 0x21

    move-object/from16 v0, v17

    invoke-static {v0, v9, v2, v10, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 796
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v10           #end:I
    .end local v14           #numberLikesString:Ljava/lang/String;
    .end local v18           #start:I
    :cond_0
    if-lez p3, :cond_2

    .line 797
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 798
    const/16 v2, 0x20

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const/16 v3, 0xb7

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 801
    :cond_1
    move/from16 v0, p3

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v13

    .line 802
    .local v13, numberCommentsString:Ljava/lang/String;
    const v2, 0x7f0d000d

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v13, v3, v4

    move/from16 v0, p3

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 804
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v19, 0x3

    new-instance v2, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v4, v3, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v6, v3, Lco/vine/android/api/VinePost;->userId:J

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;-><init>(Lco/vine/android/widget/GenericVideoAdapter;JJ)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move/from16 v0, v19

    invoke-direct {v9, v0, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 806
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v2, 0x7f090076

    invoke-virtual {v15, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 807
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xb7

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 808
    .local v11, interpunctIndex:I
    if-gez v11, :cond_4

    const/16 v18, 0x0

    .line 809
    .restart local v18       #start:I
    :goto_0
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    .line 810
    .restart local v10       #end:I
    const/16 v2, 0x21

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v9, v1, v10, v2}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 813
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v10           #end:I
    .end local v11           #interpunctIndex:I
    .end local v13           #numberCommentsString:Ljava/lang/String;
    .end local v18           #start:I
    :cond_2
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 814
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 815
    new-instance v8, Lco/vine/android/widget/TypefacesSpan;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-direct {v8, v2, v3}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 817
    .local v8, boldSpan:Lco/vine/android/widget/TypefacesSpan;
    const/4 v2, 0x0

    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/16 v4, 0x21

    move-object/from16 v0, v17

    invoke-static {v0, v8, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 818
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactLikesCommentsCounts:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 819
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactLikesCommentsCounts:Landroid/widget/TextView;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 823
    .end local v8           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    :cond_3
    if-lez p4, :cond_5

    .line 824
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 825
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersDivider:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 826
    move/from16 v0, p4

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v12

    .line 827
    .local v12, numRevinersString:Ljava/lang/String;
    new-instance v16, Landroid/text/SpannableString;

    const v2, 0x7f0d0004

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v12, v3, v4

    move/from16 v0, p4

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 829
    .local v16, reviners:Landroid/text/SpannableString;
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v19, 0x7

    new-instance v2, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v4, v3, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/FeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v6, v3, Lco/vine/android/api/VinePost;->userId:J

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;-><init>(Lco/vine/android/widget/GenericVideoAdapter;JJ)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move/from16 v0, v19

    invoke-direct {v9, v0, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 831
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 832
    const/4 v2, 0x0

    invoke-virtual/range {v16 .. v16}, Landroid/text/SpannableString;->length()I

    move-result v3

    const/16 v4, 0x21

    move-object/from16 v0, v16

    invoke-virtual {v0, v9, v2, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 833
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    const/4 v3, 0x0

    invoke-virtual/range {v16 .. v16}, Landroid/text/SpannableString;->length()I

    move-result v4

    const/16 v5, 0x21

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 834
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 835
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 840
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v12           #numRevinersString:Ljava/lang/String;
    .end local v16           #reviners:Landroid/text/SpannableString;
    :goto_1
    return-void

    .line 808
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v11       #interpunctIndex:I
    .restart local v13       #numberCommentsString:Ljava/lang/String;
    :cond_4
    add-int/lit8 v18, v11, 0x2

    goto/16 :goto_0

    .line 837
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v11           #interpunctIndex:I
    .end local v13           #numberCommentsString:Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 838
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/FeedViewHolder;->compactRevinersDivider:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method protected setStyledCompactLikesComments(Lco/vine/android/widget/GenericFeedViewHolder;III)V
    .locals 20
    .parameter "h"
    .parameter "likeCount"
    .parameter "commentCount"
    .parameter "revinersCount"

    .prologue
    .line 199
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 200
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->commentsContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 201
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->revinersContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 203
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    .line 204
    .local v15, res:Landroid/content/res/Resources;
    new-instance v17, Landroid/text/SpannableStringBuilder;

    invoke-direct/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 207
    .local v17, sb:Landroid/text/SpannableStringBuilder;
    if-lez p2, :cond_0

    .line 208
    move/from16 v0, p2

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v14

    .line 209
    .local v14, numberLikesString:Ljava/lang/String;
    const v2, 0x7f0d000e

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v14, v3, v4

    move/from16 v0, p2

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 211
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/4 v2, 0x2

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v3, v3, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    invoke-direct {v9, v2, v3, v4}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 213
    .local v9, clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v2, 0x7f090076

    invoke-virtual {v15, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 214
    const/16 v18, 0x0

    .line 215
    .local v18, start:I
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    .line 216
    .local v10, end:I
    const/4 v2, 0x0

    const/16 v3, 0x21

    move-object/from16 v0, v17

    invoke-static {v0, v9, v2, v10, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 221
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v10           #end:I
    .end local v14           #numberLikesString:Ljava/lang/String;
    .end local v18           #start:I
    :cond_0
    if-lez p3, :cond_2

    .line 222
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 223
    const/16 v2, 0x20

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const/16 v3, 0xb7

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 226
    :cond_1
    move/from16 v0, p3

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v13

    .line 227
    .local v13, numberCommentsString:Ljava/lang/String;
    const v2, 0x7f0d000d

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v13, v3, v4

    move/from16 v0, p3

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 229
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v19, 0x3

    new-instance v2, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v4, v3, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v6, v3, Lco/vine/android/api/VinePost;->userId:J

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;-><init>(Lco/vine/android/widget/GenericVideoAdapter;JJ)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move/from16 v0, v19

    invoke-direct {v9, v0, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 231
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v2, 0x7f090076

    invoke-virtual {v15, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 232
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xb7

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    .line 233
    .local v11, interpunctIndex:I
    if-gez v11, :cond_3

    const/16 v18, 0x0

    .line 234
    .restart local v18       #start:I
    :goto_0
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v10

    .line 235
    .restart local v10       #end:I
    const/16 v2, 0x21

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v9, v1, v10, v2}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 238
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v10           #end:I
    .end local v11           #interpunctIndex:I
    .end local v13           #numberCommentsString:Ljava/lang/String;
    .end local v18           #start:I
    :cond_2
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_4

    .line 239
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 240
    new-instance v8, Lco/vine/android/widget/TypefacesSpan;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-direct {v8, v2, v3}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 242
    .local v8, boldSpan:Lco/vine/android/widget/TypefacesSpan;
    const/4 v2, 0x0

    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/16 v4, 0x21

    move-object/from16 v0, v17

    invoke-static {v0, v8, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 243
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsCounts:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 244
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsCounts:Landroid/widget/TextView;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    .end local v8           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    :goto_1
    if-lez p4, :cond_5

    .line 251
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 252
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersDivider:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 253
    move/from16 v0, p4

    invoke-static {v15, v0}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v12

    .line 254
    .local v12, numRevinersString:Ljava/lang/String;
    new-instance v16, Landroid/text/SpannableString;

    const v2, 0x7f0d0004

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v12, v3, v4

    move/from16 v0, p4

    invoke-virtual {v15, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 256
    .local v16, reviners:Landroid/text/SpannableString;
    new-instance v9, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v19, 0x7

    new-instance v2, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v4, v3, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p1

    iget-object v3, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v6, v3, Lco/vine/android/api/VinePost;->userId:J

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v7}, Lco/vine/android/widget/GenericVideoAdapter$SpanCommentObjectTag;-><init>(Lco/vine/android/widget/GenericVideoAdapter;JJ)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move/from16 v0, v19

    invoke-direct {v9, v0, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 258
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mVineGreen:I

    invoke-virtual {v9, v2}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 259
    const/4 v2, 0x0

    invoke-virtual/range {v16 .. v16}, Landroid/text/SpannableString;->length()I

    move-result v3

    const/16 v4, 0x21

    move-object/from16 v0, v16

    invoke-virtual {v0, v9, v2, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 260
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    const/4 v3, 0x0

    invoke-virtual/range {v16 .. v16}, Landroid/text/SpannableString;->length()I

    move-result v4

    const/16 v5, 0x21

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 261
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 262
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v12           #numRevinersString:Ljava/lang/String;
    .end local v16           #reviners:Landroid/text/SpannableString;
    :goto_2
    return-void

    .line 233
    .restart local v9       #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .restart local v11       #interpunctIndex:I
    .restart local v13       #numberCommentsString:Ljava/lang/String;
    :cond_3
    add-int/lit8 v18, v11, 0x2

    goto/16 :goto_0

    .line 246
    .end local v9           #clickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v11           #interpunctIndex:I
    .end local v13           #numberCommentsString:Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactLikesCommentsContainer:Landroid/widget/RelativeLayout;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_1

    .line 264
    :cond_5
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersCount:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 265
    move-object/from16 v0, p1

    iget-object v2, v0, Lco/vine/android/widget/GenericFeedViewHolder;->compactRevinersDivider:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2
.end method

.method protected setStyledLikers(Lco/vine/android/widget/GenericFeedViewHolder;ILco/vine/android/api/VinePagedData;)V
    .locals 39
    .parameter "h"
    .parameter "hardSize"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/widget/GenericFeedViewHolder;",
            "I",
            "Lco/vine/android/api/VinePagedData",
            "<",
            "Lco/vine/android/api/VineLike;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 443
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    .local p3, likeData:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    move-object/from16 v0, p3

    iget-object v15, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    .line 444
    .local v15, likes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    if-nez v15, :cond_1

    .line 445
    new-instance v35, Lco/vine/android/VineException;

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Likes were null for post "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v37, v0

    invoke-virtual/range {v36 .. v38}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v35 .. v35}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 652
    :cond_0
    :goto_0
    return-void

    .line 450
    :cond_1
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 451
    .local v16, likesToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VineLike;

    .line 452
    .local v13, like:Lco/vine/android/api/VineLike;
    iget-object v0, v13, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    invoke-static/range {v35 .. v35}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v35

    if-eqz v35, :cond_2

    .line 453
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 456
    .end local v13           #like:Lco/vine/android/api/VineLike;
    :cond_3
    invoke-virtual/range {v15 .. v16}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 458
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v25

    .line 459
    .local v25, size:I
    if-eqz v25, :cond_0

    .line 463
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    .line 464
    .local v21, res:Landroid/content/res/Resources;
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    .line 465
    .local v31, text:Ljava/lang/StringBuilder;
    new-instance v12, Ljava/util/ArrayList;

    move/from16 v0, v25

    invoke-direct {v12, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 469
    .local v12, indices:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;>;"
    const/16 v35, 0xa

    move/from16 v0, p2

    move/from16 v1, v35

    if-le v0, v1, :cond_4

    .line 470
    const/16 v35, 0x3

    move/from16 v0, v35

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/GenericFeedViewHolder;->likeType:I

    .line 471
    move-object/from16 v0, v21

    move/from16 v1, p2

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->numberFormat(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v19

    .line 472
    .local v19, numberLikesString:Ljava/lang/String;
    const v35, 0x7f0d000f

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v19, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v35

    move/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    .line 474
    .local v17, manyLikeThis:Ljava/lang/String;
    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    const/16 v35, 0x1

    move/from16 v0, v35

    new-array v0, v0, [Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v37, v0

    aput-object v37, v35, v36

    const/16 v36, 0x22

    move-object/from16 v0, v35

    move-object/from16 v1, v17

    move/from16 v2, v36

    invoke-static {v0, v1, v2}, Lco/vine/android/util/Util;->getSpannedText([Ljava/lang/Object;Ljava/lang/String;C)Landroid/text/Spanned;

    move-result-object v27

    .line 478
    .local v27, spanned:Landroid/text/Spanned;
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->likers:Landroid/widget/TextView;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 479
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->likers:Landroid/widget/TextView;

    move-object/from16 v35, v0

    invoke-virtual/range {v35 .. v35}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v26

    check-cast v26, Landroid/text/Spannable;

    .line 480
    .local v26, spannable:Landroid/text/Spannable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v35, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v28

    .line 481
    .local v28, start:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mBoldSpan:Lco/vine/android/widget/TypefacesSpan;

    move-object/from16 v35, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v9

    .line 483
    .local v9, end:I
    new-instance v30, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v35, 0x2

    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v36, v0

    invoke-static/range {v36 .. v37}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v30

    move/from16 v1, v35

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 486
    .local v30, styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v35, 0x7f090076

    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v35

    move-object/from16 v0, v30

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 487
    const/16 v35, 0x21

    move-object/from16 v0, v26

    move-object/from16 v1, v30

    move/from16 v2, v28

    move/from16 v3, v35

    invoke-static {v0, v1, v2, v9, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    goto/16 :goto_0

    .line 488
    .end local v9           #end:I
    .end local v17           #manyLikeThis:Ljava/lang/String;
    .end local v19           #numberLikesString:Ljava/lang/String;
    .end local v26           #spannable:Landroid/text/Spannable;
    .end local v27           #spanned:Landroid/text/Spanned;
    .end local v28           #start:I
    .end local v30           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_4
    const/16 v35, 0x1

    move/from16 v0, v25

    move/from16 v1, v35

    if-ne v0, v1, :cond_5

    .line 489
    const/16 v35, 0x1

    move/from16 v0, v35

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/GenericFeedViewHolder;->likeType:I

    .line 490
    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lco/vine/android/api/VineLike;

    .line 491
    .local v23, singleLike:Lco/vine/android/api/VineLike;
    const v35, 0x7f0d000f

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    move-object/from16 v0, v23

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v38, v0

    aput-object v38, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v35

    move/from16 v2, v25

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    .line 494
    .local v24, singleLikeString:Ljava/lang/String;
    const/16 v35, 0x22

    move-object/from16 v0, v24

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v28

    .line 495
    .restart local v28       #start:I
    const/16 v35, 0x22

    add-int/lit8 v36, v28, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v35

    move/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v35

    add-int/lit8 v9, v35, -0x1

    .line 497
    .restart local v9       #end:I
    const/16 v35, 0x22

    invoke-static/range {v35 .. v35}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v35

    const-string v36, ""

    move-object/from16 v0, v24

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    new-instance v22, Landroid/text/SpannableStringBuilder;

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 500
    .local v22, sb:Landroid/text/SpannableStringBuilder;
    new-instance v30, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v36, 0x1

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-wide v0, v0, Lco/vine/android/api/VineLike;->userId:J

    move-wide/from16 v37, v0

    invoke-static/range {v37 .. v38}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v35

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v30

    move/from16 v1, v36

    move-object/from16 v2, v35

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 502
    .restart local v30       #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v35, 0x7f090076

    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v35

    move-object/from16 v0, v30

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 503
    const/16 v35, 0x21

    move-object/from16 v0, v22

    move-object/from16 v1, v30

    move/from16 v2, v28

    move/from16 v3, v35

    invoke-static {v0, v1, v2, v9, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 504
    new-instance v5, Lco/vine/android/widget/TypefacesSpan;

    const/16 v35, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v36

    const/16 v37, 0x0

    const/16 v38, 0x3

    invoke-virtual/range {v36 .. v38}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-direct {v5, v0, v1}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 507
    .local v5, boldSpan:Lco/vine/android/widget/TypefacesSpan;
    const/16 v35, 0x21

    move-object/from16 v0, v22

    move/from16 v1, v28

    move/from16 v2, v35

    invoke-static {v0, v5, v1, v9, v2}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 508
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->likers:Landroid/widget/TextView;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 510
    .end local v5           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    .end local v9           #end:I
    .end local v22           #sb:Landroid/text/SpannableStringBuilder;
    .end local v23           #singleLike:Lco/vine/android/api/VineLike;
    .end local v24           #singleLikeString:Ljava/lang/String;
    .end local v28           #start:I
    .end local v30           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    :cond_5
    const/16 v35, 0x2

    move/from16 v0, v35

    move-object/from16 v1, p1

    iput v0, v1, Lco/vine/android/widget/GenericFeedViewHolder;->likeType:I

    .line 511
    const/4 v6, 0x0

    .line 512
    .local v6, count:I
    new-instance v11, Ljava/util/ArrayList;

    move/from16 v0, v25

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 514
    .local v11, ids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Long;>;"
    const-string v14, ""

    .line 515
    .local v14, likeString:Ljava/lang/String;
    const/16 v29, 0x0

    .line 516
    .local v29, stringId:I
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v35

    packed-switch v35, :pswitch_data_0

    .line 583
    :goto_2
    const/4 v7, 0x0

    .line 586
    .local v7, current:I
    const/16 v35, 0x0

    const/16 v36, 0x22

    :try_start_0
    move/from16 v0, v36

    invoke-virtual {v14, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v36

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 591
    :goto_3
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VineLike;

    .line 593
    .restart local v13       #like:Lco/vine/android/api/VineLike;
    const/16 v35, 0x22

    move/from16 v0, v35

    invoke-virtual {v14, v0, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v28

    .line 594
    .restart local v28       #start:I
    const/16 v35, 0x22

    add-int/lit8 v36, v28, 0x1

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    .line 597
    .restart local v9       #end:I
    new-instance v32, Landroid/util/Pair;

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->length()I

    move-result v35

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v35

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->length()I

    move-result v36

    iget-object v0, v13, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/lang/String;->length()I

    move-result v37

    add-int v36, v36, v37

    invoke-static/range {v36 .. v36}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    move-object/from16 v0, v32

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 598
    .local v32, thisPair:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    move-object/from16 v0, v32

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 603
    add-int/lit8 v35, v28, 0x1

    add-int/lit8 v36, v28, 0x1

    :try_start_1
    iget-object v0, v13, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/lang/String;->length()I

    move-result v37

    add-int v36, v36, v37

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 609
    :goto_5
    const/16 v35, 0x22

    add-int/lit8 v36, v9, 0x1

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v18

    .line 613
    .local v18, nextMarker:I
    if-lez v18, :cond_6

    .line 615
    add-int/lit8 v35, v9, 0x1

    :try_start_2
    move/from16 v0, v35

    move/from16 v1, v18

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 624
    :goto_6
    iget-wide v0, v13, Lco/vine/android/api/VineLike;->userId:J

    move-wide/from16 v35, v0

    invoke-static/range {v35 .. v36}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 625
    move/from16 v7, v18

    .line 626
    goto/16 :goto_4

    .line 518
    .end local v7           #current:I
    .end local v9           #end:I
    .end local v13           #like:Lco/vine/android/api/VineLike;
    .end local v18           #nextMarker:I
    .end local v28           #start:I
    .end local v32           #thisPair:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :pswitch_0
    const v29, 0x7f0e012c

    .line 519
    const/16 v35, 0x2

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 520
    goto/16 :goto_2

    .line 523
    :pswitch_1
    const v29, 0x7f0e012d

    .line 524
    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 526
    goto/16 :goto_2

    .line 529
    :pswitch_2
    const v29, 0x7f0e012e

    .line 530
    const/16 v35, 0x4

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 532
    goto/16 :goto_2

    .line 535
    :pswitch_3
    const v29, 0x7f0e012f

    .line 536
    const/16 v35, 0x5

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 539
    goto/16 :goto_2

    .line 542
    :pswitch_4
    const v29, 0x7f0e0130

    .line 543
    const/16 v35, 0x6

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x5

    const/16 v35, 0x5

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 546
    goto/16 :goto_2

    .line 549
    :pswitch_5
    const v29, 0x7f0e0131

    .line 550
    const/16 v35, 0x7

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x5

    const/16 v35, 0x5

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x6

    const/16 v35, 0x6

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 553
    goto/16 :goto_2

    .line 556
    :pswitch_6
    const v29, 0x7f0e0132

    .line 557
    const/16 v35, 0x8

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x5

    const/16 v35, 0x5

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x6

    const/16 v35, 0x6

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x7

    const/16 v35, 0x7

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 561
    goto/16 :goto_2

    .line 564
    :pswitch_7
    const v29, 0x7f0e0133

    .line 565
    const/16 v35, 0x9

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x5

    const/16 v35, 0x5

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x6

    const/16 v35, 0x6

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x7

    const/16 v35, 0x7

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x8

    const/16 v35, 0x8

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 569
    goto/16 :goto_2

    .line 572
    :pswitch_8
    const v29, 0x7f0e012b

    .line 573
    const/16 v35, 0xa

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/16 v35, 0x0

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x1

    const/16 v35, 0x1

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x2

    const/16 v35, 0x2

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x3

    const/16 v35, 0x3

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x4

    const/16 v35, 0x4

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x5

    const/16 v35, 0x5

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x6

    const/16 v35, 0x6

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x7

    const/16 v35, 0x7

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x8

    const/16 v35, 0x8

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    const/16 v37, 0x9

    const/16 v35, 0x9

    move/from16 v0, v35

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lco/vine/android/api/VineLike;

    move-object/from16 v0, v35

    iget-object v0, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    move-object/from16 v35, v0

    aput-object v35, v36, v37

    move-object/from16 v0, v21

    move/from16 v1, v29

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_2

    .line 587
    .restart local v7       #current:I
    :catch_0
    move-exception v8

    .line 588
    .local v8, e:Ljava/lang/Throwable;
    const-string v35, "Attempted substring: {}"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v14, v36, v37

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-static {v8, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 604
    .end local v8           #e:Ljava/lang/Throwable;
    .restart local v9       #end:I
    .restart local v13       #like:Lco/vine/android/api/VineLike;
    .restart local v28       #start:I
    .restart local v32       #thisPair:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :catch_1
    move-exception v8

    .line 605
    .restart local v8       #e:Ljava/lang/Throwable;
    const-string v35, "Attempted substring: {}"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v14, v36, v37

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-static {v8, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 618
    .end local v8           #e:Ljava/lang/Throwable;
    .restart local v18       #nextMarker:I
    :cond_6
    add-int/lit8 v35, v9, 0x1

    :try_start_3
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v36

    move/from16 v0, v35

    move/from16 v1, v36

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v31

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_6

    .line 620
    :catch_2
    move-exception v8

    .line 621
    .restart local v8       #e:Ljava/lang/Throwable;
    const-string v35, "Attempted substring: {}"

    const/16 v36, 0x1

    move/from16 v0, v36

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    aput-object v14, v36, v37

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-static {v8, v0, v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 628
    .end local v8           #e:Ljava/lang/Throwable;
    .end local v9           #end:I
    .end local v13           #like:Lco/vine/android/api/VineLike;
    .end local v18           #nextMarker:I
    .end local v28           #start:I
    .end local v32           #thisPair:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    :cond_7
    new-instance v22, Landroid/text/SpannableStringBuilder;

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v22

    move-object/from16 v1, v35

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 630
    .restart local v22       #sb:Landroid/text/SpannableStringBuilder;
    const/4 v6, 0x0

    .line 634
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Landroid/util/Pair;

    .line 635
    .local v20, p:Landroid/util/Pair;
    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/lang/Long;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Long;->longValue()J

    move-result-wide v33

    .line 638
    .local v33, userId:J
    new-instance v30, Lco/vine/android/widget/StyledClickableSpan;

    const/16 v35, 0x1

    invoke-static/range {v33 .. v34}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v36

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mSpanClickListener:Lco/vine/android/widget/SpanClickListener;

    move-object/from16 v37, v0

    move-object/from16 v0, v30

    move/from16 v1, v35

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/widget/StyledClickableSpan;-><init>(ILjava/lang/Object;Lco/vine/android/widget/SpanClickListener;)V

    .line 640
    .restart local v30       #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    const v35, 0x7f090076

    move-object/from16 v0, v21

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v35

    move-object/from16 v0, v30

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lco/vine/android/widget/StyledClickableSpan;->setColor(I)V

    .line 641
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v35, v0

    check-cast v35, Ljava/lang/Integer;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v36

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v35, v0

    check-cast v35, Ljava/lang/Integer;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v35

    const/16 v37, 0x21

    move-object/from16 v0, v22

    move-object/from16 v1, v30

    move/from16 v2, v36

    move/from16 v3, v35

    move/from16 v4, v37

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 645
    new-instance v5, Lco/vine/android/widget/TypefacesSpan;

    const/16 v35, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/widget/GenericVideoAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v36, v0

    invoke-static/range {v36 .. v36}, Lco/vine/android/widget/Typefaces;->get(Landroid/content/Context;)Lco/vine/android/widget/Typefaces;

    move-result-object v36

    const/16 v37, 0x0

    const/16 v38, 0x3

    invoke-virtual/range {v36 .. v38}, Lco/vine/android/widget/Typefaces;->getContentTypeface(II)Landroid/graphics/Typeface;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-direct {v5, v0, v1}, Lco/vine/android/widget/TypefacesSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 647
    .restart local v5       #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    move-object/from16 v35, v0

    check-cast v35, Ljava/lang/Integer;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v36

    move-object/from16 v0, v20

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v35, v0

    check-cast v35, Ljava/lang/Integer;

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v35

    const/16 v37, 0x21

    move-object/from16 v0, v22

    move/from16 v1, v36

    move/from16 v2, v35

    move/from16 v3, v37

    invoke-static {v0, v5, v1, v2, v3}, Lco/vine/android/util/Util;->safeSetSpan(Landroid/text/Spannable;Ljava/lang/Object;III)V

    .line 648
    add-int/lit8 v6, v6, 0x1

    .line 649
    goto/16 :goto_7

    .line 650
    .end local v5           #boldSpan:Lco/vine/android/widget/TypefacesSpan;
    .end local v20           #p:Landroid/util/Pair;
    .end local v30           #styledClickableSpan:Lco/vine/android/widget/StyledClickableSpan;
    .end local v33           #userId:J
    :cond_8
    move-object/from16 v0, p1

    iget-object v0, v0, Lco/vine/android/widget/GenericFeedViewHolder;->likers:Landroid/widget/TextView;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 516
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public showLikedByMe(J)V
    .locals 11
    .parameter "postId"

    .prologue
    .line 271
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 272
    .local v7, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<TT;>;>;"
    iget-object v8, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/ref/WeakReference;

    .line 273
    .local v6, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/widget/GenericFeedViewHolder;

    .line 274
    .local v2, holder:Lco/vine/android/widget/GenericFeedViewHolder;
    if-nez v2, :cond_1

    .line 275
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 277
    :cond_1
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    if-eqz v8, :cond_0

    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v8, v8, Lco/vine/android/api/VinePost;->postId:J

    cmp-long v8, v8, p1

    if-nez v8, :cond_0

    .line 278
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v8, Lco/vine/android/api/VinePost;->likesCount:I

    add-int/lit8 v9, v9, 0x1

    iput v9, v8, Lco/vine/android/api/VinePost;->likesCount:I

    .line 279
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v4, v8, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    .line 280
    .local v4, likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    new-instance v5, Lco/vine/android/api/VineLike;

    invoke-direct {v5}, Lco/vine/android/api/VineLike;-><init>()V

    .line 281
    .local v5, newL:Lco/vine/android/api/VineLike;
    iget-object v8, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v8}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    .line 282
    .local v0, currentSession:Lco/vine/android/client/Session;
    const-wide/16 v8, -0x1

    iput-wide v8, v5, Lco/vine/android/api/VineLike;->likeId:J

    .line 283
    iput-wide p1, v5, Lco/vine/android/api/VineLike;->postId:J

    .line 284
    invoke-virtual {v0}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    .line 285
    invoke-virtual {v0}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v8

    iput-wide v8, v5, Lco/vine/android/api/VineLike;->userId:J

    .line 286
    if-nez v4, :cond_2

    .line 287
    new-instance v4, Lco/vine/android/api/VinePagedData;

    .end local v4           #likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    invoke-direct {v4}, Lco/vine/android/api/VinePagedData;-><init>()V

    .line 289
    .restart local v4       #likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    :cond_2
    iget-object v8, v4, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-nez v8, :cond_3

    .line 290
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v4, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    .line 292
    :cond_3
    iget-object v8, v4, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->liked:Landroid/widget/ImageButton;

    const v9, 0x7f0200d2

    invoke-virtual {v8, v9}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 294
    iget-boolean v8, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCompactLikesComments:Z

    if-eqz v8, :cond_4

    .line 295
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v8, v8, Lco/vine/android/api/VinePost;->likesCount:I

    iget-object v9, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v9, Lco/vine/android/api/VinePost;->commentsCount:I

    iget-object v10, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v10, v10, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-virtual {p0, v2, v8, v9, v10}, Lco/vine/android/widget/GenericVideoAdapter;->setStyledCompactLikesComments(Lco/vine/android/widget/GenericFeedViewHolder;III)V

    goto :goto_0

    .line 298
    :cond_4
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 299
    iget-object v8, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v8, v8, Lco/vine/android/api/VinePost;->likesCount:I

    iget-object v9, v2, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v9, v9, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    invoke-virtual {p0, v2, v8, v9}, Lco/vine/android/widget/GenericVideoAdapter;->setStyledLikers(Lco/vine/android/widget/GenericFeedViewHolder;ILco/vine/android/api/VinePagedData;)V

    goto/16 :goto_0

    .line 305
    .end local v0           #currentSession:Lco/vine/android/client/Session;
    .end local v2           #holder:Lco/vine/android/widget/GenericFeedViewHolder;
    .end local v4           #likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    .end local v5           #newL:Lco/vine/android/api/VineLike;
    .end local v6           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_5
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 306
    .local v1, h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    iget-object v8, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 308
    .end local v1           #h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_6
    return-void
.end method

.method public showUnlikedByMe(J)V
    .locals 13
    .parameter "postId"

    .prologue
    .line 152
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v8, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<TT;>;>;"
    iget-object v9, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ref/WeakReference;

    .line 154
    .local v7, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/GenericFeedViewHolder;

    .line 155
    .local v1, holder:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    if-nez v1, :cond_1

    .line 156
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 158
    :cond_1
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    if-eqz v9, :cond_0

    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v9, v9, Lco/vine/android/api/VinePost;->postId:J

    cmp-long v9, v9, p1

    if-nez v9, :cond_0

    .line 159
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v9, Lco/vine/android/api/VinePost;->likesCount:I

    if-lez v9, :cond_2

    .line 160
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v10, v9, Lco/vine/android/api/VinePost;->likesCount:I

    add-int/lit8 v10, v10, -0x1

    iput v10, v9, Lco/vine/android/api/VinePost;->likesCount:I

    .line 163
    :cond_2
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v9, v9, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    if-eqz v9, :cond_5

    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v9, v9, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v9, v9, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v9, :cond_5

    .line 164
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v9, v9, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v6, v9, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    .line 165
    .local v6, likes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    const/4 v5, 0x0

    .line 166
    .local v5, likeToRemove:Lco/vine/android/api/VineLike;
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/api/VineLike;

    .line 167
    .local v4, l:Lco/vine/android/api/VineLike;
    iget-wide v9, v4, Lco/vine/android/api/VineLike;->userId:J

    iget-object v11, p0, Lco/vine/android/widget/GenericVideoAdapter;->mAppController:Lco/vine/android/client/AppController;

    invoke-virtual {v11}, Lco/vine/android/client/AppController;->getActiveId()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-nez v9, :cond_3

    .line 168
    move-object v5, v4

    goto :goto_1

    .line 171
    .end local v4           #l:Lco/vine/android/api/VineLike;
    :cond_4
    if-eqz v5, :cond_5

    .line 172
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 175
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #likeToRemove:Lco/vine/android/api/VineLike;
    .end local v6           #likes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    :cond_5
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->liked:Landroid/widget/ImageButton;

    const v10, 0x7f02008f

    invoke-virtual {v9, v10}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 177
    iget-boolean v9, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCompactLikesComments:Z

    if-eqz v9, :cond_6

    .line 178
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v9, Lco/vine/android/api/VinePost;->likesCount:I

    iget-object v10, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v10, v10, Lco/vine/android/api/VinePost;->commentsCount:I

    iget-object v11, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v11, v11, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-virtual {p0, v1, v9, v10, v11}, Lco/vine/android/widget/GenericVideoAdapter;->setStyledCompactLikesComments(Lco/vine/android/widget/GenericFeedViewHolder;III)V

    goto/16 :goto_0

    .line 181
    :cond_6
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v9, Lco/vine/android/api/VinePost;->likesCount:I

    if-lez v9, :cond_7

    .line 182
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 186
    :goto_2
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v9, v9, Lco/vine/android/api/VinePost;->likesCount:I

    iget-object v10, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-object v10, v10, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    invoke-virtual {p0, v1, v9, v10}, Lco/vine/android/widget/GenericVideoAdapter;->setStyledLikers(Lco/vine/android/widget/GenericFeedViewHolder;ILco/vine/android/api/VinePagedData;)V

    goto/16 :goto_0

    .line 184
    :cond_7
    iget-object v9, v1, Lco/vine/android/widget/GenericFeedViewHolder;->likersContainer:Landroid/widget/RelativeLayout;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_2

    .line 192
    .end local v1           #holder:Lco/vine/android/widget/GenericFeedViewHolder;,"TT;"
    .end local v7           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_8
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 193
    .local v0, h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    iget-object v9, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_3

    .line 195
    .end local v0           #h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_9
    return-void
.end method

.method public startLoadingTimeProfiling(Ljava/lang/String;)V
    .locals 2
    .parameter "tag"

    .prologue
    .line 325
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    iput-object p1, p0, Lco/vine/android/widget/GenericVideoAdapter;->mLoadingTimeTag:Ljava/lang/String;

    .line 326
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lco/vine/android/widget/GenericVideoAdapter;->mStartLoadingTime:J

    .line 327
    return-void
.end method

.method public timeSinceStartLoadingTime()J
    .locals 4

    .prologue
    .line 330
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lco/vine/android/widget/GenericVideoAdapter;->mStartLoadingTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public toggleMute(Z)V
    .locals 0
    .parameter "mute"

    .prologue
    .line 348
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    return-void
.end method

.method public updateRevinedCount(JZ)V
    .locals 8
    .parameter "postId"
    .parameter "revined"

    .prologue
    .line 408
    .local p0, this:Lco/vine/android/widget/GenericVideoAdapter;,"Lco/vine/android/widget/GenericVideoAdapter<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 410
    .local v4, toRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/ref/WeakReference<TT;>;>;"
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 411
    .local v3, ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/widget/GenericFeedViewHolder;

    .line 412
    .local v1, holder:Lco/vine/android/widget/GenericFeedViewHolder;
    if-nez v1, :cond_1

    .line 413
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 415
    :cond_1
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    if-eqz v5, :cond_0

    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget-wide v5, v5, Lco/vine/android/api/VinePost;->postId:J

    cmp-long v5, v5, p1

    if-nez v5, :cond_0

    .line 416
    if-eqz p3, :cond_2

    .line 417
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v6, v5, Lco/vine/android/api/VinePost;->revinersCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lco/vine/android/api/VinePost;->revinersCount:I

    .line 418
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->revine:Landroid/widget/ImageButton;

    const v6, 0x7f0200d3

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 425
    :goto_1
    iget-boolean v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mCompactLikesComments:Z

    if-eqz v5, :cond_4

    .line 426
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v5, v5, Lco/vine/android/api/VinePost;->likesCount:I

    iget-object v6, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v6, v6, Lco/vine/android/api/VinePost;->commentsCount:I

    iget-object v7, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v7, v7, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-virtual {p0, v1, v5, v6, v7}, Lco/vine/android/widget/GenericVideoAdapter;->setStyledCompactLikesComments(Lco/vine/android/widget/GenericFeedViewHolder;III)V

    goto :goto_0

    .line 420
    :cond_2
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v5, v5, Lco/vine/android/api/VinePost;->revinersCount:I

    if-lez v5, :cond_3

    .line 421
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->post:Lco/vine/android/api/VinePost;

    iget v6, v5, Lco/vine/android/api/VinePost;->revinersCount:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Lco/vine/android/api/VinePost;->revinersCount:I

    .line 423
    :cond_3
    iget-object v5, v1, Lco/vine/android/widget/GenericFeedViewHolder;->revine:Landroid/widget/ImageButton;

    const v6, 0x7f0200b2

    invoke-virtual {v5, v6}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_1

    .line 430
    :cond_4
    invoke-virtual {p0, v1}, Lco/vine/android/widget/GenericVideoAdapter;->setRevinersCount(Lco/vine/android/widget/GenericFeedViewHolder;)V

    goto :goto_0

    .line 435
    .end local v1           #holder:Lco/vine/android/widget/GenericFeedViewHolder;
    .end local v3           #ref:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 436
    .local v0, h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    iget-object v5, p0, Lco/vine/android/widget/GenericVideoAdapter;->mViewHolders:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 438
    .end local v0           #h:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<TT;>;"
    :cond_6
    return-void
.end method
