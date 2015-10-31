.class public Lco/vine/android/DraftFragment;
.super Lco/vine/android/BaseFragment;
.source "DraftFragment.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnInfoListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/DraftFragment$DraftPageViewHolder;
    }
.end annotation


# static fields
.field private static final VISIBILITY_DELAY:I = 0x64


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field public mCanUnhide:Z

.field private mDimen:I

.field private mExpired:Z

.field private mFadeIn:Landroid/view/animation/Animation;

.field private mFolder:Ljava/io/File;

.field private mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

.field private mIndex:I

.field private mListener:Landroid/view/View$OnClickListener;

.field private mProgress:I

.field private mQuickFadeOut:Landroid/view/animation/Animation;

.field private mSelected:Z

.field private final mStartPlayingRunnable:Ljava/lang/Runnable;

.field private mThumbUrl:Ljava/lang/String;

.field private mVideoUrl:Ljava/lang/String;

.field private mVideoView:Lco/vine/android/player/SdkVideoView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/DraftFragment;->mCanUnhide:Z

    .line 47
    new-instance v0, Lco/vine/android/DraftFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/DraftFragment$1;-><init>(Lco/vine/android/DraftFragment;)V

    iput-object v0, p0, Lco/vine/android/DraftFragment;->mStartPlayingRunnable:Ljava/lang/Runnable;

    .line 84
    return-void
.end method

.method public constructor <init>(ZILjava/lang/String;Ljava/lang/String;Ljava/io/File;II)V
    .locals 1
    .parameter "selected"
    .parameter "index"
    .parameter "videoUrl"
    .parameter "thumbUrl"
    .parameter "folder"
    .parameter "progress"
    .parameter "dimension"

    .prologue
    .line 98
    invoke-direct {p0}, Lco/vine/android/BaseFragment;-><init>()V

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/DraftFragment;->mCanUnhide:Z

    .line 47
    new-instance v0, Lco/vine/android/DraftFragment$1;

    invoke-direct {v0, p0}, Lco/vine/android/DraftFragment$1;-><init>(Lco/vine/android/DraftFragment;)V

    iput-object v0, p0, Lco/vine/android/DraftFragment;->mStartPlayingRunnable:Ljava/lang/Runnable;

    .line 99
    iput p2, p0, Lco/vine/android/DraftFragment;->mIndex:I

    .line 100
    iput-boolean p1, p0, Lco/vine/android/DraftFragment;->mSelected:Z

    .line 101
    iput-object p3, p0, Lco/vine/android/DraftFragment;->mVideoUrl:Ljava/lang/String;

    .line 102
    iput-object p5, p0, Lco/vine/android/DraftFragment;->mFolder:Ljava/io/File;

    .line 103
    iput p6, p0, Lco/vine/android/DraftFragment;->mProgress:I

    .line 104
    iput-object p4, p0, Lco/vine/android/DraftFragment;->mThumbUrl:Ljava/lang/String;

    .line 105
    iput p7, p0, Lco/vine/android/DraftFragment;->mDimen:I

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/DraftFragment;->mExpired:Z

    .line 107
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/DraftFragment;)Lco/vine/android/player/SdkVideoView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 26
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    return-object v0
.end method

.method private onSelected()V
    .locals 0

    .prologue
    .line 233
    invoke-virtual {p0}, Lco/vine/android/DraftFragment;->resumePlayer()V

    .line 234
    return-void
.end method

.method private onUnselected()V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 230
    return-void
.end method


# virtual methods
.method public getProgressView()Landroid/view/View;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

    iget-object v0, v0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    return-object v0
.end method

.method public getThumbnailView()Landroid/view/View;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

    iget-object v0, v0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    return-object v0
.end method

.method public isExpired()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lco/vine/android/DraftFragment;->mExpired:Z

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 16
    .parameter "inflater"
    .parameter "root"
    .parameter "savedInstanceState"

    .prologue
    .line 148
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/DraftFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 149
    .local v9, res:Landroid/content/res/Resources;
    const v13, 0x7f030029

    const/4 v14, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v13, v1, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    .line 150
    .local v11, v:Landroid/view/View;
    new-instance v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoUrl:Ljava/lang/String;

    invoke-direct {v4, v11, v13}, Lco/vine/android/DraftFragment$DraftPageViewHolder;-><init>(Landroid/view/View;Ljava/lang/String;)V

    .line 151
    .local v4, holder:Lco/vine/android/DraftFragment$DraftPageViewHolder;
    const v13, 0x7f0b0042

    invoke-virtual {v9, v13}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    .line 152
    .local v7, progressHeight:I
    const v13, 0x7f0b001e

    invoke-virtual {v9, v13}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 154
    .local v3, draftProgressHeight:I
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->draftContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v13}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 156
    .local v2, containerParams:Landroid/widget/RelativeLayout$LayoutParams;
    add-int v13, v7, v3

    iput v13, v2, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 157
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->draftContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v13, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    const v13, 0x7f0a0081

    invoke-virtual {v11, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/RelativeLayout;

    .line 161
    .local v12, videoContainer:Landroid/widget/RelativeLayout;
    const/4 v13, 0x1

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->setDrawingCacheEnabled(Z)V

    .line 163
    invoke-virtual {v12}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 164
    .local v6, params:Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 165
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 166
    invoke-virtual {v12, v6}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mFolder:Ljava/io/File;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->setTag(Ljava/lang/Object;)V

    .line 169
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v13}, Lco/vine/android/recorder/ProgressView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    .line 173
    .local v8, progressLayoutParams:Landroid/view/ViewGroup$LayoutParams;
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    move-object/from16 v0, p0

    iget v14, v0, Lco/vine/android/DraftFragment;->mProgress:I

    int-to-float v14, v14

    const v15, 0x45bb8000

    div-float/2addr v14, v15

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/DraftFragment;->mDimen:I

    int-to-float v15, v15

    mul-float/2addr v14, v15

    float-to-int v14, v14

    iput v14, v13, Lco/vine/android/recorder/ProgressView;->shouldBeWidth:I

    .line 174
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v8, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 175
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v13, v8}, Lco/vine/android/recorder/ProgressView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->progressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v13}, Lco/vine/android/recorder/ProgressView;->invalidate()V

    .line 178
    const v13, 0x7f0a007f

    invoke-virtual {v11, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 180
    .local v5, mask:Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 181
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v6, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 182
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/DraftFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    check-cast v13, Lco/vine/android/AbstractRecordingActivity;

    invoke-virtual {v13}, Lco/vine/android/AbstractRecordingActivity;->getScreenSize()Landroid/graphics/Point;

    move-result-object v13

    iget v13, v13, Landroid/graphics/Point;->y:I

    iput v13, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 184
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mThumbUrl:Ljava/lang/String;

    invoke-static {v13}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/DraftFragment;->mBitmap:Landroid/graphics/Bitmap;

    .line 188
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    invoke-virtual {v13}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    .line 189
    .local v10, thumbLayoutParams:Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 190
    move-object/from16 v0, p0

    iget v13, v0, Lco/vine/android/DraftFragment;->mDimen:I

    iput v13, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 191
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    invoke-virtual {v13, v10}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/DraftFragment;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13, v14}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 193
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 195
    move-object/from16 v0, p0

    iput-object v4, v0, Lco/vine/android/DraftFragment;->mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

    .line 196
    iget-object v13, v4, Lco/vine/android/DraftFragment$DraftPageViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    .line 198
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/DraftFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    check-cast v13, Lco/vine/android/AbstractRecordingActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v13, v14}, Lco/vine/android/AbstractRecordingActivity;->addPlayerToPool(Lco/vine/android/player/SdkVideoView;)V

    .line 199
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lco/vine/android/player/SdkVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 200
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lco/vine/android/player/SdkVideoView;->setKeepScreenOn(Z)V

    .line 201
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lco/vine/android/player/SdkVideoView;->setLooping(Z)V

    .line 202
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lco/vine/android/player/SdkVideoView;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 203
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lco/vine/android/player/SdkVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 204
    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lco/vine/android/player/SdkVideoView;->setSurfaceReadyListener(Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;)V

    .line 206
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/DraftFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    const v14, 0x7f04000d

    invoke-static {v13, v14}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/DraftFragment;->mFadeIn:Landroid/view/animation/Animation;

    .line 207
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/DraftFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    const v14, 0x7f040011

    invoke-static {v13, v14}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v13

    move-object/from16 v0, p0

    iput-object v13, v0, Lco/vine/android/DraftFragment;->mQuickFadeOut:Landroid/view/animation/Animation;

    .line 209
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 210
    const/high16 v13, 0x10

    invoke-virtual {v11, v13}, Landroid/view/View;->setDrawingCacheQuality(I)V

    .line 212
    return-object v11
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 123
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onDestroyView()V

    .line 124
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 127
    :cond_0
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    if-eqz v0, :cond_1

    .line 128
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 130
    :cond_1
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 273
    invoke-virtual {p0}, Lco/vine/android/DraftFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lco/vine/android/AbstractRecordingActivity;

    .line 274
    .local v0, activity:Lco/vine/android/AbstractRecordingActivity;
    if-eqz v0, :cond_0

    .line 275
    iget-object v1, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V

    .line 276
    iget-object v1, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lco/vine/android/player/SdkVideoView;->retryOpenVideo(Z)Z

    .line 278
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 252
    const/4 v0, 0x0

    return v0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 115
    invoke-super {p0}, Lco/vine/android/BaseFragment;->onPause()V

    .line 116
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 119
    :cond_0
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 4
    .parameter "mp"

    .prologue
    .line 257
    iget-boolean v0, p0, Lco/vine/android/DraftFragment;->mSelected:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 258
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 259
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    iget-object v1, p0, Lco/vine/android/DraftFragment;->mStartPlayingRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/player/SdkVideoView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 261
    :cond_0
    return-void
.end method

.method public onSurfaceTextureAvailable(Lco/vine/android/player/SdkVideoView;)V
    .locals 1
    .parameter "videoView"

    .prologue
    .line 59
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 60
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->startOpenVideo()V

    .line 61
    return-void
.end method

.method public pausePlayer()V
    .locals 1

    .prologue
    .line 282
    iget-boolean v0, p0, Lco/vine/android/DraftFragment;->mSelected:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->canPause()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 285
    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 226
    return-void
.end method

.method public resumePlayer()V
    .locals 2

    .prologue
    .line 237
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    iget-object v1, p0, Lco/vine/android/DraftFragment;->mVideoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->isPathPlaying(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 238
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 248
    :goto_0
    return-void

    .line 240
    :cond_0
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->isSurfaceReady()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 241
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 242
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    iget-object v1, p0, Lco/vine/android/DraftFragment;->mVideoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V

    goto :goto_0

    .line 244
    :cond_1
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    iget-object v1, p0, Lco/vine/android/DraftFragment;->mVideoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 245
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mVideoView:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    goto :goto_0
.end method

.method public setExpired(Z)V
    .locals 0
    .parameter "expired"

    .prologue
    .line 264
    iput-boolean p1, p0, Lco/vine/android/DraftFragment;->mExpired:Z

    .line 265
    return-void
.end method

.method public setListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 110
    iput-object p1, p0, Lco/vine/android/DraftFragment;->mListener:Landroid/view/View$OnClickListener;

    .line 111
    return-void
.end method

.method public setSelected(Z)V
    .locals 0
    .parameter "selected"

    .prologue
    .line 216
    iput-boolean p1, p0, Lco/vine/android/DraftFragment;->mSelected:Z

    .line 217
    if-eqz p1, :cond_0

    .line 218
    invoke-direct {p0}, Lco/vine/android/DraftFragment;->onSelected()V

    .line 222
    :goto_0
    return-void

    .line 220
    :cond_0
    invoke-direct {p0}, Lco/vine/android/DraftFragment;->onUnselected()V

    goto :goto_0
.end method

.method public showImage()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

    iget-object v0, v0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->thumb:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 134
    iget-object v0, p0, Lco/vine/android/DraftFragment;->mHolder:Lco/vine/android/DraftFragment$DraftPageViewHolder;

    iget-object v0, v0, Lco/vine/android/DraftFragment$DraftPageViewHolder;->videoView:Lco/vine/android/player/SdkVideoView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 135
    return-void
.end method
