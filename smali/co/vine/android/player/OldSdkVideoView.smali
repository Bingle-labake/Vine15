.class public Lco/vine/android/player/OldSdkVideoView;
.super Landroid/view/SurfaceView;
.source "OldSdkVideoView.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;
.implements Lco/vine/android/player/VideoViewInterface;


# static fields
.field private static final STATE_ERROR:I = -0x1

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_PAUSED:I = 0x4

.field private static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field private static final STATE_PLAYING:I = 0x3

.field private static final STATE_PREPARED:I = 0x2

.field private static final STATE_PREPARING:I = 0x1


# instance fields
.field private mAudioSession:I

.field private mAutoPlay:Z

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCanPause:Z

.field private mCanSeekBack:Z

.field private mCanSeekForward:Z

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mCurrentBufferPercentage:I

.field private mCurrentState:I

.field private mCustomOnPreParedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mLooping:Z

.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMuted:Z

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private final mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mReportVideoError:Z

.field mSHCallback:Landroid/view/SurfaceHolder$Callback;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceHeight:I

.field private mSurfaceHolder:Landroid/view/SurfaceHolder;

.field private mSurfaceWidth:I

.field private mTargetState:I

.field private mUri:Landroid/net/Uri;

.field private mVideoHeight:I

.field private mVideoWidth:I

.field private mWasMuted:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 38
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$1;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$1;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 67
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 68
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 71
    iput-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 72
    iput-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 87
    iput-boolean v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    .line 88
    iput-boolean v1, p0, Lco/vine/android/player/OldSdkVideoView;->mWasMuted:Z

    .line 315
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$2;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$2;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 327
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$3;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$3;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 376
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$4;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$4;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 390
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$5;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$5;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 400
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$6;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$6;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 422
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$7;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$7;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 461
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$8;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$8;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 93
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->initVideoView()V

    .line 94
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/vine/android/player/OldSdkVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->initVideoView()V

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 102
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$1;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$1;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 67
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 68
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 71
    iput-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    .line 72
    iput-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 87
    iput-boolean v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    .line 88
    iput-boolean v1, p0, Lco/vine/android/player/OldSdkVideoView;->mWasMuted:Z

    .line 315
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$2;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$2;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 327
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$3;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$3;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 376
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$4;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$4;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 390
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$5;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$5;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 400
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$6;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$6;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 422
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$7;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$7;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 461
    new-instance v0, Lco/vine/android/player/OldSdkVideoView$8;

    invoke-direct {v0, p0}, Lco/vine/android/player/OldSdkVideoView$8;-><init>(Lco/vine/android/player/OldSdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    .line 103
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->initVideoView()V

    .line 104
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/player/OldSdkVideoView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mAutoPlay:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/player/OldSdkVideoView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mLooping:Z

    return v0
.end method

.method static synthetic access$1000(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$1100(Lco/vine/android/player/OldSdkVideoView;)Landroid/widget/MediaController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    return-object v0
.end method

.method static synthetic access$1200(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$1300(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceWidth:I

    return v0
.end method

.method static synthetic access$1302(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceWidth:I

    return p1
.end method

.method static synthetic access$1400(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHeight:I

    return v0
.end method

.method static synthetic access$1402(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHeight:I

    return p1
.end method

.method static synthetic access$1500(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$1502(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    return p1
.end method

.method static synthetic access$1600(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$1700(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnInfoListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    return-object v0
.end method

.method static synthetic access$1800(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$1902(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$200(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCustomOnPreParedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$2002(Lco/vine/android/player/OldSdkVideoView;Landroid/view/SurfaceHolder;)Landroid/view/SurfaceHolder;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    return-object p1
.end method

.method static synthetic access$2100(Lco/vine/android/player/OldSdkVideoView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 28
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$2200(Lco/vine/android/player/OldSdkVideoView;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lco/vine/android/player/OldSdkVideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$300(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    return v0
.end method

.method static synthetic access$302(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    return p1
.end method

.method static synthetic access$400(Lco/vine/android/player/OldSdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    return v0
.end method

.method static synthetic access$402(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    return p1
.end method

.method static synthetic access$502(Lco/vine/android/player/OldSdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    return p1
.end method

.method static synthetic access$602(Lco/vine/android/player/OldSdkVideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCanPause:Z

    return p1
.end method

.method static synthetic access$702(Lco/vine/android/player/OldSdkVideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCanSeekBack:Z

    return p1
.end method

.method static synthetic access$802(Lco/vine/android/player/OldSdkVideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 28
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCanSeekForward:Z

    return p1
.end method

.method static synthetic access$900(Lco/vine/android/player/OldSdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method private attachMediaController()V
    .locals 3

    .prologue
    .line 306
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v1, :cond_0

    .line 307
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 308
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    move-object v0, v1

    .line 310
    .local v0, anchorView:Landroid/view/View;
    :goto_0
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 311
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 313
    .end local v0           #anchorView:Landroid/view/View;
    :cond_0
    return-void

    :cond_1
    move-object v0, p0

    .line 308
    goto :goto_0
.end method

.method private initVideoView()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 175
    iput v2, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    .line 176
    iput v2, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    .line 177
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mSHCallback:Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 178
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 179
    invoke-virtual {p0, v3}, Lco/vine/android/player/OldSdkVideoView;->setFocusable(Z)V

    .line 180
    invoke-virtual {p0, v3}, Lco/vine/android/player/OldSdkVideoView;->setFocusableInTouchMode(Z)V

    .line 181
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->requestFocus()Z

    .line 182
    iput v2, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 183
    iput v2, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 184
    return-void
.end method

.method private isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 663
    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    if-eqz v1, :cond_0

    iget v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private openVideo()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 240
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    if-nez v3, :cond_1

    .line 295
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.music.musicservicecommand"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 246
    .local v2, i:Landroid/content/Intent;
    const-string v3, "command"

    const-string v4, "pause"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 251
    invoke-direct {p0, v6}, Lco/vine/android/player/OldSdkVideoView;->release(Z)V

    .line 253
    :try_start_0
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 255
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 257
    .local v0, context:Landroid/content/Context;
    iget v3, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I

    if-eqz v3, :cond_4

    .line 258
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v4, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setAudioSessionId(I)V

    .line 262
    :goto_1
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 263
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 264
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 265
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 266
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 267
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 268
    const/4 v3, 0x0

    iput v3, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentBufferPercentage:I

    .line 269
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    invoke-virtual {v3, v0, v4}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 270
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mSurfaceHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 271
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 272
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 273
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 275
    iget-boolean v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    if-eqz v3, :cond_2

    .line 276
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 281
    :cond_2
    const/4 v3, 0x1

    iput v3, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 282
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->attachMediaController()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 283
    .end local v0           #context:Landroid/content/Context;
    :catch_0
    move-exception v1

    .line 284
    .local v1, ex:Ljava/lang/Exception;
    iget-boolean v3, p0, Lco/vine/android/player/OldSdkVideoView;->mReportVideoError:Z

    if-eqz v3, :cond_3

    .line 285
    const-string v3, "Unable to open content {}, {}."

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    aput-object v5, v4, v6

    invoke-static {v1, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 287
    :cond_3
    iput v8, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 288
    iput v8, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 289
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    iget-object v4, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v3, v4, v7, v6}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    goto/16 :goto_0

    .line 260
    .end local v1           #ex:Ljava/lang/Exception;
    .restart local v0       #context:Landroid/content/Context;
    :cond_4
    :try_start_1
    iget-object v3, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v3

    iput v3, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 290
    .end local v0           #context:Landroid/content/Context;
    :catch_1
    move-exception v1

    .line 291
    .local v1, ex:Ljava/lang/IllegalStateException;
    iput v8, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 292
    iput v8, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 293
    const-string v3, "IllegalState error {}, {}."

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    aput-object v5, v4, v6

    invoke-static {v1, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method private release(Z)V
    .locals 2
    .parameter "cleartargetstate"

    .prologue
    const/4 v1, 0x0

    .line 493
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 495
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 496
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 497
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 498
    if-eqz p1, :cond_0

    .line 499
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 502
    :cond_0
    return-void
.end method

.method private toggleMediaControlsVisiblity()V
    .locals 1

    .prologue
    .line 562
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 563
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 567
    :goto_0
    return-void

    .line 565
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 671
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCanPause:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 676
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCanSeekBack:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 681
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCanSeekForward:Z

    return v0
.end method

.method public getAudioSessionId()I
    .locals 2

    .prologue
    .line 686
    iget v1, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I

    if-nez v1, :cond_0

    .line 687
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 688
    .local v0, foo:Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v1

    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I

    .line 689
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 691
    .end local v0           #foo:Landroid/media/MediaPlayer;
    :cond_0
    iget v1, p0, Lco/vine/android/player/OldSdkVideoView;->mAudioSession:I

    return v1
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 656
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 657
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentBufferPercentage:I

    .line 659
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 614
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 615
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    .line 617
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 1

    .prologue
    .line 605
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 606
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    .line 609
    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public hasStarted()Z
    .locals 1

    .prologue
    .line 642
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    return v0
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 637
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 632
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReportErrorOn()Z
    .locals 1

    .prologue
    .line 726
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mReportVideoError:Z

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v1, 0x1

    .line 522
    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/16 v2, 0x18

    if-eq p1, v2, :cond_2

    const/16 v2, 0x19

    if-eq p1, v2, :cond_2

    const/16 v2, 0xa4

    if-eq p1, v2, :cond_2

    const/16 v2, 0x52

    if-eq p1, v2, :cond_2

    const/4 v2, 0x5

    if-eq p1, v2, :cond_2

    const/4 v2, 0x6

    if-eq p1, v2, :cond_2

    move v0, v1

    .line 529
    .local v0, isKeyCodeSupported:Z
    :goto_0
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v2

    if-eqz v2, :cond_8

    if-eqz v0, :cond_8

    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v2, :cond_8

    .line 530
    const/16 v2, 0x4f

    if-eq p1, v2, :cond_0

    const/16 v2, 0x55

    if-ne p1, v2, :cond_4

    .line 532
    :cond_0
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 533
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->pause()V

    .line 534
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    .line 558
    :cond_1
    :goto_1
    return v1

    .line 522
    .end local v0           #isKeyCodeSupported:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 536
    .restart local v0       #isKeyCodeSupported:Z
    :cond_3
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->start()V

    .line 537
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 540
    :cond_4
    const/16 v2, 0x7e

    if-ne p1, v2, :cond_5

    .line 541
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-nez v2, :cond_1

    .line 542
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->start()V

    .line 543
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 546
    :cond_5
    const/16 v2, 0x56

    if-eq p1, v2, :cond_6

    const/16 v2, 0x7f

    if-ne p1, v2, :cond_7

    .line 548
    :cond_6
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 549
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->pause()V

    .line 550
    iget-object v2, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    goto :goto_1

    .line 554
    :cond_7
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->toggleMediaControlsVisiblity()V

    .line 558
    :cond_8
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 9
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/high16 v7, 0x4000

    const/high16 v8, -0x8000

    .line 111
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    invoke-static {v6, p1}, Lco/vine/android/player/OldSdkVideoView;->getDefaultSize(II)I

    move-result v3

    .line 112
    .local v3, width:I
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    invoke-static {v6, p2}, Lco/vine/android/player/OldSdkVideoView;->getDefaultSize(II)I

    move-result v0

    .line 113
    .local v0, height:I
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    if-lez v6, :cond_0

    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    if-lez v6, :cond_0

    .line 115
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 116
    .local v4, widthSpecMode:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 117
    .local v5, widthSpecSize:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 118
    .local v1, heightSpecMode:I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 120
    .local v2, heightSpecSize:I
    if-ne v4, v7, :cond_2

    if-ne v1, v7, :cond_2

    .line 122
    move v3, v5

    .line 123
    move v0, v2

    .line 126
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    mul-int/2addr v6, v0

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    mul-int/2addr v7, v3

    if-ge v6, v7, :cond_1

    .line 128
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    mul-int/2addr v6, v0

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    div-int v3, v6, v7

    .line 167
    .end local v1           #heightSpecMode:I
    .end local v2           #heightSpecSize:I
    .end local v4           #widthSpecMode:I
    .end local v5           #widthSpecSize:I
    :cond_0
    :goto_0
    invoke-virtual {p0, v3, v0}, Lco/vine/android/player/OldSdkVideoView;->setMeasuredDimension(II)V

    .line 168
    return-void

    .line 129
    .restart local v1       #heightSpecMode:I
    .restart local v2       #heightSpecSize:I
    .restart local v4       #widthSpecMode:I
    .restart local v5       #widthSpecSize:I
    :cond_1
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    mul-int/2addr v6, v0

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    mul-int/2addr v7, v3

    if-le v6, v7, :cond_0

    .line 131
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    mul-int/2addr v6, v3

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    div-int v0, v6, v7

    goto :goto_0

    .line 133
    :cond_2
    if-ne v4, v7, :cond_3

    .line 135
    move v3, v5

    .line 136
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    mul-int/2addr v6, v3

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    div-int v0, v6, v7

    .line 137
    if-ne v1, v8, :cond_0

    if-le v0, v2, :cond_0

    .line 139
    move v0, v2

    goto :goto_0

    .line 141
    :cond_3
    if-ne v1, v7, :cond_4

    .line 143
    move v0, v2

    .line 144
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    mul-int/2addr v6, v0

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    div-int v3, v6, v7

    .line 145
    if-ne v4, v8, :cond_0

    if-le v3, v5, :cond_0

    .line 147
    move v3, v5

    goto :goto_0

    .line 151
    :cond_4
    iget v3, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    .line 152
    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    .line 153
    if-ne v1, v8, :cond_5

    if-le v0, v2, :cond_5

    .line 155
    move v0, v2

    .line 156
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    mul-int/2addr v6, v0

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    div-int v3, v6, v7

    .line 158
    :cond_5
    if-ne v4, v8, :cond_0

    if-le v3, v5, :cond_0

    .line 160
    move v3, v5

    .line 161
    iget v6, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoHeight:I

    mul-int/2addr v6, v3

    iget v7, p0, Lco/vine/android/player/OldSdkVideoView;->mVideoWidth:I

    div-int v0, v6, v7

    goto :goto_0
.end method

.method public onPrepared()V
    .locals 2

    .prologue
    .line 647
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 648
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 649
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    iget-object v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-interface {v0, v1}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 652
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 506
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 507
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->toggleMediaControlsVisiblity()V

    .line 509
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 514
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 515
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->toggleMediaControlsVisiblity()V

    .line 517
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 580
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 581
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 582
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 583
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 586
    :cond_0
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 587
    return-void
.end method

.method public removeVideoUri()V
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    .line 212
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I

    .line 213
    return-void
.end method

.method public resolveAdjustedSize(II)I
    .locals 1
    .parameter "desiredSize"
    .parameter "measureSpec"

    .prologue
    .line 171
    invoke-static {p1, p2}, Lco/vine/android/player/OldSdkVideoView;->getDefaultSize(II)I

    move-result v0

    return v0
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 594
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mWasMuted:Z

    .line 595
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    invoke-virtual {p0, v0}, Lco/vine/android/player/OldSdkVideoView;->setMute(Z)V

    .line 596
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 597
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 601
    :goto_1
    return-void

    .line 594
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 599
    :cond_1
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->openVideo()V

    goto :goto_1
.end method

.method public seekTo(I)V
    .locals 1
    .parameter "msec"

    .prologue
    .line 622
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 623
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 624
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I

    .line 628
    :goto_0
    return-void

    .line 626
    :cond_0
    iput p1, p0, Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setAutoPlayOnPrepared(Z)V
    .locals 0
    .parameter "autoPlay"

    .prologue
    .line 700
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mAutoPlay:Z

    .line 701
    return-void
.end method

.method public setLooping(Z)V
    .locals 1
    .parameter "b"

    .prologue
    .line 705
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mLooping:Z

    .line 706
    return-void
.end method

.method public setMediaController(Landroid/widget/MediaController;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 298
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 299
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 301
    :cond_0
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaController:Landroid/widget/MediaController;

    .line 302
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->attachMediaController()V

    .line 303
    return-void
.end method

.method public setMute(Z)V
    .locals 4
    .parameter "mute"

    .prologue
    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    .line 709
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    .line 710
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mWasMuted:Z

    iget-boolean v1, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    if-eq v0, v1, :cond_0

    .line 711
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    if-eqz v0, :cond_1

    .line 712
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v2, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 717
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMuted:Z

    iput-boolean v0, p0, Lco/vine/android/player/OldSdkVideoView;->mWasMuted:Z

    .line 718
    return-void

    .line 714
    :cond_1
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v3, v3}, Landroid/media/MediaPlayer;->setVolume(FF)V

    goto :goto_0
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 436
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 437
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 448
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 449
    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 458
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 459
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 695
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mCustomOnPreParedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 696
    return-void
.end method

.method public setReportOpenVideoError(Z)V
    .locals 0
    .parameter "reportVideoError"

    .prologue
    .line 721
    iput-boolean p1, p0, Lco/vine/android/player/OldSdkVideoView;->mReportVideoError:Z

    .line 722
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 2
    .parameter "path"

    .prologue
    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/provider/VineVideoProvider;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/player/OldSdkVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 192
    return-void
.end method

.method public setVideoPathDirect(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 199
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lco/vine/android/player/OldSdkVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 200
    return-void
.end method

.method public setVideoURI(Landroid/net/Uri;)V
    .locals 1
    .parameter "uri"

    .prologue
    .line 203
    iput-object p1, p0, Lco/vine/android/player/OldSdkVideoView;->mUri:Landroid/net/Uri;

    .line 204
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/player/OldSdkVideoView;->mSeekWhenPrepared:I

    .line 205
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->openVideo()V

    .line 206
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->requestLayout()V

    .line 207
    invoke-virtual {p0}, Lco/vine/android/player/OldSdkVideoView;->invalidate()V

    .line 208
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 571
    invoke-direct {p0}, Lco/vine/android/player/OldSdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 573
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 575
    :cond_0
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 576
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 216
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 217
    const-string v0, "Playback stopped."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 219
    :try_start_0
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 224
    :goto_0
    :try_start_1
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 229
    :goto_1
    :try_start_2
    iget-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 233
    :goto_2
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/OldSdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 234
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mCurrentState:I

    .line 235
    iput v1, p0, Lco/vine/android/player/OldSdkVideoView;->mTargetState:I

    .line 237
    :cond_0
    return-void

    .line 230
    :catch_0
    move-exception v0

    goto :goto_2

    .line 225
    :catch_1
    move-exception v0

    goto :goto_1

    .line 220
    :catch_2
    move-exception v0

    goto :goto_0
.end method

.method public suspend()V
    .locals 1

    .prologue
    .line 590
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/player/OldSdkVideoView;->release(Z)V

    .line 591
    return-void
.end method
