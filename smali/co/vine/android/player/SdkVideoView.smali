.class public Lco/vine/android/player/SdkVideoView;
.super Landroid/view/TextureView;
.source "SdkVideoView.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;
.implements Lco/vine/android/player/VideoViewInterface;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;
    }
.end annotation


# static fields
.field private static final LOCK:[I = null

.field public static final STATE_ERROR:I = -0x1

.field public static final STATE_IDLE:I = 0x0

.field public static final STATE_PAUSED:I = 0x4

.field public static final STATE_PLAYBACK_COMPLETED:I = 0x5

.field public static final STATE_PLAYING:I = 0x3

.field public static final STATE_PREPARED:I = 0x2

.field public static final STATE_PREPARING:I = 0x1

.field private static final TAG:Ljava/lang/String;

.field private static currentState:I

.field private static currentUri:Landroid/net/Uri;

.field private static currentView:Landroid/view/View;

.field private static singlePlayer:Landroid/media/MediaPlayer;


# instance fields
.field private final SINGLE_PLAYER:Z

.field private mAttributes:Landroid/util/AttributeSet;

.field private mAudioSession:I

.field private mAutoPlayOnPrepared:Z

.field private mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

.field private mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mContext:Landroid/content/Context;

.field private mCurrentBufferPercentage:I

.field public mCurrentState:I

.field private mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mHasNotRetriedBefore:Z

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsPrepared:Z

.field private final mLock:[I

.field private mLooping:Z

.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mMuted:Z

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mPath:Ljava/lang/String;

.field mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mReportOpenError:Z

.field private mSHCallback:Landroid/view/TextureView$SurfaceTextureListener;

.field private mSeekWhenPrepared:I

.field mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

.field private mSurfaceHeight:I

.field private mSurfaceHolder:Landroid/view/Surface;

.field private mSurfaceReadyListener:Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;

.field private mSurfaceWidth:I

.field private mTag:Ljava/lang/Object;

.field private mTargetState:I

.field private mUri:Landroid/net/Uri;

.field protected mVideoHeight:I

.field protected mVideoWidth:I

.field private mWasMuted:Z

.field private playingPosition:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 40
    const-class v0, Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/player/SdkVideoView;->TAG:Ljava/lang/String;

    .line 73
    const/4 v0, 0x0

    sput-object v0, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    .line 76
    sput v1, Lco/vine/android/player/SdkVideoView;->currentState:I

    .line 77
    new-array v0, v1, [I

    sput-object v0, Lco/vine/android/player/SdkVideoView;->LOCK:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 84
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    .line 85
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 93
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/player/SdkVideoView;->playingPosition:I

    .line 95
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mLock:[I

    .line 96
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    .line 97
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    .line 98
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    .line 323
    new-instance v0, Lco/vine/android/player/SdkVideoView$1;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$1;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 335
    new-instance v0, Lco/vine/android/player/SdkVideoView$2;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$2;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 389
    new-instance v0, Lco/vine/android/player/SdkVideoView$3;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$3;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 403
    new-instance v0, Lco/vine/android/player/SdkVideoView$4;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$4;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 423
    new-instance v0, Lco/vine/android/player/SdkVideoView$5;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$5;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 495
    new-instance v0, Lco/vine/android/player/SdkVideoView$6;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$6;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSHCallback:Landroid/view/TextureView$SurfaceTextureListener;

    .line 120
    invoke-static {p1}, Lco/vine/android/util/SystemUtil;->isSinglePlayerEnabled(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    .line 121
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->initVideoView()V

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, 0x0

    .line 125
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 84
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    .line 85
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 93
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/player/SdkVideoView;->playingPosition:I

    .line 95
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mLock:[I

    .line 96
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    .line 97
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    .line 98
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    .line 323
    new-instance v0, Lco/vine/android/player/SdkVideoView$1;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$1;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 335
    new-instance v0, Lco/vine/android/player/SdkVideoView$2;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$2;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 389
    new-instance v0, Lco/vine/android/player/SdkVideoView$3;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$3;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 403
    new-instance v0, Lco/vine/android/player/SdkVideoView$4;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$4;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 423
    new-instance v0, Lco/vine/android/player/SdkVideoView$5;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$5;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 495
    new-instance v0, Lco/vine/android/player/SdkVideoView$6;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$6;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSHCallback:Landroid/view/TextureView$SurfaceTextureListener;

    .line 126
    invoke-static {p1}, Lco/vine/android/util/SystemUtil;->isSinglePlayerEnabled(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    .line 127
    iput-object p2, p0, Lco/vine/android/player/SdkVideoView;->mAttributes:Landroid/util/AttributeSet;

    .line 128
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->initVideoView()V

    .line 129
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v1, 0x0

    .line 132
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 84
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    .line 85
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 93
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/player/SdkVideoView;->playingPosition:I

    .line 95
    new-array v0, v1, [I

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mLock:[I

    .line 96
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    .line 97
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    .line 98
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    .line 323
    new-instance v0, Lco/vine/android/player/SdkVideoView$1;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$1;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    .line 335
    new-instance v0, Lco/vine/android/player/SdkVideoView$2;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$2;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 389
    new-instance v0, Lco/vine/android/player/SdkVideoView$3;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$3;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 403
    new-instance v0, Lco/vine/android/player/SdkVideoView$4;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$4;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 423
    new-instance v0, Lco/vine/android/player/SdkVideoView$5;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$5;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    .line 495
    new-instance v0, Lco/vine/android/player/SdkVideoView$6;

    invoke-direct {v0, p0}, Lco/vine/android/player/SdkVideoView$6;-><init>(Lco/vine/android/player/SdkVideoView;)V

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSHCallback:Landroid/view/TextureView$SurfaceTextureListener;

    .line 133
    invoke-static {p1}, Lco/vine/android/util/SystemUtil;->isSinglePlayerEnabled(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    .line 134
    iput-object p2, p0, Lco/vine/android/player/SdkVideoView;->mAttributes:Landroid/util/AttributeSet;

    .line 135
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->initVideoView()V

    .line 136
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/player/SdkVideoView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mAutoPlayOnPrepared:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/player/SdkVideoView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    return-void
.end method

.method static synthetic access$1000(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    return-object v0
.end method

.method static synthetic access$1100(Lco/vine/android/player/SdkVideoView;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1102(Lco/vine/android/player/SdkVideoView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1200(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    return-object v0
.end method

.method static synthetic access$1302(Lco/vine/android/player/SdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentBufferPercentage:I

    return p1
.end method

.method static synthetic access$1402(Lco/vine/android/player/SdkVideoView;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$1500(Lco/vine/android/player/SdkVideoView;)Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceReadyListener:Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;

    return-object v0
.end method

.method static synthetic access$1600(Lco/vine/android/player/SdkVideoView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 38
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->openVideo()V

    return-void
.end method

.method static synthetic access$1700(Lco/vine/android/player/SdkVideoView;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lco/vine/android/player/SdkVideoView;->release(Z)V

    return-void
.end method

.method static synthetic access$202(Lco/vine/android/player/SdkVideoView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput-boolean p1, p0, Lco/vine/android/player/SdkVideoView;->mIsPrepared:Z

    return p1
.end method

.method static synthetic access$300(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer$OnPreparedListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/player/SdkVideoView;)Landroid/media/MediaPlayer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/player/SdkVideoView;)Landroid/widget/MediaController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/player/SdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I

    return v0
.end method

.method static synthetic access$700(Lco/vine/android/player/SdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceWidth:I

    return v0
.end method

.method static synthetic access$702(Lco/vine/android/player/SdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceWidth:I

    return p1
.end method

.method static synthetic access$800(Lco/vine/android/player/SdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHeight:I

    return v0
.end method

.method static synthetic access$802(Lco/vine/android/player/SdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHeight:I

    return p1
.end method

.method static synthetic access$900(Lco/vine/android/player/SdkVideoView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 38
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    return v0
.end method

.method static synthetic access$902(Lco/vine/android/player/SdkVideoView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 38
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    return p1
.end method

.method private attachMediaController()V
    .locals 3

    .prologue
    .line 314
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v1, :cond_0

    .line 315
    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, p0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 316
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    move-object v0, v1

    .line 318
    .local v0, anchorView:Landroid/view/View;
    :goto_0
    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    .line 319
    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/MediaController;->setEnabled(Z)V

    .line 321
    .end local v0           #anchorView:Landroid/view/View;
    :cond_0
    return-void

    :cond_1
    move-object v0, p0

    .line 316
    goto :goto_0
.end method

.method private getCurrentState()I
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    sget v0, Lco/vine/android/player/SdkVideoView;->currentState:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    goto :goto_0
.end method

.method public static getCurrentUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 868
    sget-object v0, Lco/vine/android/player/SdkVideoView;->currentUri:Landroid/net/Uri;

    return-object v0
.end method

.method private getPlayer()Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 103
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    sget-object v0, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0
.end method

.method private initVideoView()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 161
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mContext:Landroid/content/Context;

    .line 162
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    .line 163
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    .line 164
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSHCallback:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p0, v0}, Lco/vine/android/player/SdkVideoView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 165
    invoke-virtual {p0, v2}, Lco/vine/android/player/SdkVideoView;->setFocusable(Z)V

    .line 166
    invoke-virtual {p0, v2}, Lco/vine/android/player/SdkVideoView;->setFocusableInTouchMode(Z)V

    .line 167
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->requestFocus()Z

    .line 168
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 169
    return-void
.end method

.method private openVideo()V
    .locals 8

    .prologue
    .line 231
    sget-object v4, Lco/vine/android/player/SdkVideoView;->LOCK:[I

    monitor-enter v4

    .line 232
    :try_start_0
    sput-object p0, Lco/vine/android/player/SdkVideoView;->currentView:Landroid/view/View;

    .line 233
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    if-nez v3, :cond_0

    .line 234
    sget-object v3, Lco/vine/android/player/SdkVideoView;->TAG:Ljava/lang/String;

    const-string v5, "mUri  is not ready yet."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    monitor-exit v4

    .line 299
    :goto_0
    return-void

    .line 238
    :cond_0
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    if-nez v3, :cond_1

    .line 239
    sget-object v3, Lco/vine/android/player/SdkVideoView;->TAG:Ljava/lang/String;

    const-string v5, "Surface is not ready yet."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    monitor-exit v4

    goto :goto_0

    .line 298
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 242
    :cond_1
    :try_start_1
    sget-object v3, Lco/vine/android/player/SdkVideoView;->TAG:Ljava/lang/String;

    const-string v5, "Opening video."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.android.music.musicservicecommand"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 247
    .local v1, i:Landroid/content/Intent;
    const-string v3, "command"

    const-string v5, "pause"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 248
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 251
    iget-boolean v3, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v3, :cond_2

    .line 252
    sget-object v3, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    if-nez v3, :cond_2

    .line 253
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    sput-object v3, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    .line 256
    :cond_2
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lco/vine/android/player/SdkVideoView;->release(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 258
    :try_start_2
    iget-boolean v3, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-nez v3, :cond_3

    .line 259
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    invoke-direct {p0, v3}, Lco/vine/android/player/SdkVideoView;->setPlayer(Landroid/media/MediaPlayer;)V

    .line 261
    :cond_3
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v2

    .line 262
    .local v2, player:Landroid/media/MediaPlayer;
    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    if-eqz v3, :cond_6

    .line 263
    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioSessionId(I)V

    .line 267
    :goto_1
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 268
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mSizeChangedListener:Landroid/media/MediaPlayer$OnVideoSizeChangedListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 269
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 270
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 271
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 272
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mBufferingUpdateListener:Landroid/media/MediaPlayer$OnBufferingUpdateListener;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnBufferingUpdateListener(Landroid/media/MediaPlayer$OnBufferingUpdateListener;)V

    .line 273
    const/4 v3, 0x0

    iput v3, p0, Lco/vine/android/player/SdkVideoView;->mCurrentBufferPercentage:I

    .line 274
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    iget-object v6, p0, Lco/vine/android/player/SdkVideoView;->mHeaders:Ljava/util/Map;

    invoke-virtual {v2, v3, v5, v6}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;Ljava/util/Map;)V

    .line 275
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 276
    iget-boolean v3, p0, Lco/vine/android/player/SdkVideoView;->mLooping:Z

    if-eqz v3, :cond_4

    .line 277
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 279
    :cond_4
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lco/vine/android/player/SdkVideoView;->setKeepScreenOn(Z)V

    .line 280
    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 281
    iget-boolean v3, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    if-eqz v3, :cond_5

    .line 282
    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 284
    :cond_5
    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 287
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 288
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->attachMediaController()V

    .line 289
    sget-object v3, Lco/vine/android/player/SdkVideoView;->TAG:Ljava/lang/String;

    const-string v5, "Successfully prepared the new MediaPlayer."

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0

    .line 298
    .end local v2           #player:Landroid/media/MediaPlayer;
    :goto_2
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 265
    .restart local v2       #player:Landroid/media/MediaPlayer;
    :cond_6
    :try_start_4
    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v3

    iput v3, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 290
    .end local v2           #player:Landroid/media/MediaPlayer;
    :catch_0
    move-exception v0

    .line 291
    .local v0, ex:Ljava/lang/Exception;
    :try_start_5
    iget-boolean v3, p0, Lco/vine/android/player/SdkVideoView;->mReportOpenError:Z

    if-eqz v3, :cond_7

    .line 292
    const-string v3, "Unable to open content {}, {}."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lco/vine/android/player/SdkVideoView;->mTag:Ljava/lang/Object;

    aput-object v7, v5, v6

    invoke-static {v0, v3, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 294
    :cond_7
    const/4 v3, -0x1

    invoke-direct {p0, v3}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 295
    const/4 v3, -0x1

    iput v3, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 296
    iget-object v3, p0, Lco/vine/android/player/SdkVideoView;->mErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v5

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-interface {v3, v5, v6, v7}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2
.end method

.method private declared-synchronized release(Z)V
    .locals 3
    .parameter "cleartargetstate"

    .prologue
    .line 590
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mLock:[I

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 591
    :try_start_1
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 592
    .local v0, player:Landroid/media/MediaPlayer;
    if-eqz v0, :cond_2

    .line 594
    :try_start_2
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 595
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1

    .line 601
    :cond_0
    :goto_0
    :try_start_3
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_0

    .line 605
    :goto_1
    :try_start_4
    iget-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-nez v1, :cond_1

    .line 606
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 607
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lco/vine/android/player/SdkVideoView;->setPlayer(Landroid/media/MediaPlayer;)V

    .line 609
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mIsPrepared:Z

    .line 610
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 611
    if-eqz p1, :cond_2

    .line 612
    const/4 v1, 0x0

    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 613
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    .line 616
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lco/vine/android/player/SdkVideoView;->setKeepScreenOn(Z)V

    .line 617
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 618
    monitor-exit p0

    return-void

    .line 617
    .end local v0           #player:Landroid/media/MediaPlayer;
    :catchall_0
    move-exception v1

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 590
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1

    .line 602
    .restart local v0       #player:Landroid/media/MediaPlayer;
    :catch_0
    move-exception v1

    goto :goto_1

    .line 597
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method public static releaseStaticIfNeeded()V
    .locals 3

    .prologue
    .line 542
    sget-object v2, Lco/vine/android/player/SdkVideoView;->LOCK:[I

    monitor-enter v2

    .line 544
    :try_start_0
    sget-object v1, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 545
    sget-object v1, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 546
    const/4 v1, 0x0

    sput-object v1, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 551
    .local v0, e:Ljava/lang/Exception;
    :cond_0
    :goto_0
    :try_start_1
    monitor-exit v2

    .line 552
    return-void

    .line 548
    .end local v0           #e:Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 549
    .restart local v0       #e:Ljava/lang/Exception;
    const-string v1, "Failed to release static player."

    invoke-static {v1, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 551
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private setCurrentState(I)V
    .locals 1
    .parameter "state"

    .prologue
    .line 111
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    .line 112
    sput p1, Lco/vine/android/player/SdkVideoView;->currentState:I

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_0
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    goto :goto_0
.end method

.method private setPlayer(Landroid/media/MediaPlayer;)V
    .locals 1
    .parameter "player"

    .prologue
    .line 559
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    .line 560
    sput-object p1, Lco/vine/android/player/SdkVideoView;->singlePlayer:Landroid/media/MediaPlayer;

    .line 564
    :goto_0
    return-void

    .line 562
    :cond_0
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mMediaPlayer:Landroid/media/MediaPlayer;

    goto :goto_0
.end method

.method private setVideoURI(Landroid/net/Uri;)V
    .locals 1
    .parameter "uri"

    .prologue
    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lco/vine/android/player/SdkVideoView;->setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V

    .line 199
    return-void
.end method

.method private setVideoURI(Landroid/net/Uri;Ljava/util/Map;)V
    .locals 1
    .parameter "uri"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 202
    .local p2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    .line 203
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    sput-object v0, Lco/vine/android/player/SdkVideoView;->currentUri:Landroid/net/Uri;

    .line 204
    iput-object p2, p0, Lco/vine/android/player/SdkVideoView;->mHeaders:Ljava/util/Map;

    .line 205
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I

    .line 206
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->openVideo()V

    .line 207
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->requestLayout()V

    .line 208
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->postInvalidate()V

    .line 209
    return-void
.end method

.method private stopPlaybackInternal()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 577
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 578
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 579
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 580
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/player/SdkVideoView;->setPlayer(Landroid/media/MediaPlayer;)V

    .line 581
    invoke-direct {p0, v1}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 582
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 584
    :cond_0
    return-void
.end method

.method private toggleMediaControlsVisibility()V
    .locals 1

    .prologue
    .line 685
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 686
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 690
    :goto_0
    return-void

    .line 688
    :cond_0
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->show()V

    goto :goto_0
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    .prologue
    .line 807
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mIsPrepared:Z

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    .prologue
    .line 811
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mIsPrepared:Z

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    .prologue
    .line 815
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mIsPrepared:Z

    return v0
.end method

.method public getAttributes()Landroid/util/AttributeSet;
    .locals 1

    .prologue
    .line 828
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mAttributes:Landroid/util/AttributeSet;

    return-object v0
.end method

.method public getAudioSessionId()I
    .locals 2

    .prologue
    .line 819
    iget v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    if-nez v1, :cond_0

    .line 820
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 821
    .local v0, foo:Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getAudioSessionId()I

    move-result v1

    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    .line 822
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 824
    .end local v0           #foo:Landroid/media/MediaPlayer;
    :cond_0
    iget v1, p0, Lco/vine/android/player/SdkVideoView;->mAudioSession:I

    return v1
.end method

.method public getBufferPercentage()I
    .locals 1

    .prologue
    .line 789
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 790
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->mCurrentBufferPercentage:I

    .line 792
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 2

    .prologue
    .line 762
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 763
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 768
    :goto_0
    return v1

    .line 765
    :catch_0
    move-exception v0

    .line 766
    .local v0, e:Ljava/lang/Exception;
    const/4 v1, -0x1

    goto :goto_0

    .line 768
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getDuration()I
    .locals 5

    .prologue
    const/4 v2, -0x1

    .line 748
    :try_start_0
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v1

    .line 749
    .local v1, player:Landroid/media/MediaPlayer;
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz v1, :cond_0

    .line 750
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 756
    .end local v1           #player:Landroid/media/MediaPlayer;
    :cond_0
    :goto_0
    return v2

    .line 754
    :catch_0
    move-exception v0

    .line 755
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "It\'s ok. probably a race condition."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getMediaPlayer()Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 555
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPlayingPosition()I
    .locals 1

    .prologue
    .line 153
    iget v0, p0, Lco/vine/android/player/SdkVideoView;->playingPosition:I

    return v0
.end method

.method public hasControlOfPlayer()Z
    .locals 2

    .prologue
    .line 796
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    sget-object v0, Lco/vine/android/player/SdkVideoView;->currentView:Landroid/view/View;

    if-ne v0, p0, :cond_1

    sget-object v0, Lco/vine/android/player/SdkVideoView;->currentUri:Landroid/net/Uri;

    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mUri:Landroid/net/Uri;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasStarted()Z
    .locals 1

    .prologue
    .line 718
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    return v0
.end method

.method public isInPlaybackState()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 800
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getCurrentState()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getCurrentState()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getCurrentState()I

    move-result v1

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPathPlaying(Ljava/lang/String;)Z
    .locals 1
    .parameter "newPath"

    .prologue
    .line 864
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->hasControlOfPlayer()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPaused()Z
    .locals 2

    .prologue
    .line 722
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getCurrentState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPlaying()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 782
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 784
    :cond_0
    :goto_0
    return v1

    .line 783
    :catch_0
    move-exception v0

    .line 784
    .local v0, e:Ljava/lang/Exception;
    goto :goto_0
.end method

.method public isSurfaceReady()Z
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 834
    :try_start_0
    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 849
    :goto_0
    return-void

    .line 835
    :catch_0
    move-exception v0

    .line 836
    .local v0, e:Ljava/lang/Exception;
    const/4 v3, 0x0

    .line 837
    .local v3, tx:Landroid/graphics/SurfaceTexture;
    const/4 v2, 0x1

    .line 839
    .local v2, success:Z
    :try_start_1
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v3

    .line 840
    if-eqz v3, :cond_0

    .line 841
    invoke-virtual {v3}, Landroid/graphics/SurfaceTexture;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 847
    :cond_0
    :goto_1
    const-string v4, "Failed to detach from window, but it\'s ok, since we won\'t use this anyways: {}, {}."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object v3, v5, v8

    invoke-static {v0, v4, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 843
    :catch_1
    move-exception v1

    .line 844
    .local v1, e2:Ljava/lang/Exception;
    const/4 v2, 0x0

    .line 845
    const-string v4, "Failed to release: {}."

    new-array v5, v8, [Ljava/lang/Object;

    aput-object v1, v5, v7

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 173
    invoke-super {p0, p1}, Landroid/view/TextureView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 174
    const-class v0, Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 175
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .parameter "info"

    .prologue
    .line 179
    invoke-super {p0, p1}, Landroid/view/TextureView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 180
    const-class v0, Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 181
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v1, 0x1

    .line 645
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

    .line 652
    .local v0, isKeyCodeSupported:Z
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v2

    if-eqz v2, :cond_8

    if-eqz v0, :cond_8

    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v2, :cond_8

    .line 653
    const/16 v2, 0x4f

    if-eq p1, v2, :cond_0

    const/16 v2, 0x55

    if-ne p1, v2, :cond_4

    .line 655
    :cond_0
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 656
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 657
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    .line 681
    :cond_1
    :goto_1
    return v1

    .line 645
    .end local v0           #isKeyCodeSupported:Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 659
    .restart local v0       #isKeyCodeSupported:Z
    :cond_3
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 660
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 663
    :cond_4
    const/16 v2, 0x7e

    if-ne p1, v2, :cond_5

    .line 664
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-nez v2, :cond_1

    .line 665
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 666
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->hide()V

    goto :goto_1

    .line 669
    :cond_5
    const/16 v2, 0x56

    if-eq p1, v2, :cond_6

    const/16 v2, 0x7f

    if-ne p1, v2, :cond_7

    .line 671
    :cond_6
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 672
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 673
    iget-object v2, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v2}, Landroid/widget/MediaController;->show()V

    goto :goto_1

    .line 677
    :cond_7
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->toggleMediaControlsVisibility()V

    .line 681
    :cond_8
    invoke-super {p0, p1, p2}, Landroid/view/TextureView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_1
.end method

.method protected onMeasure(II)V
    .locals 4
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 140
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    invoke-static {v2, p1}, Lco/vine/android/player/SdkVideoView;->getDefaultSize(II)I

    move-result v1

    .line 141
    .local v1, width:I
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    invoke-static {v2, p2}, Lco/vine/android/player/SdkVideoView;->getDefaultSize(II)I

    move-result v0

    .line 142
    .local v0, height:I
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    if-lez v2, :cond_0

    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    if-lez v2, :cond_0

    .line 143
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-le v2, v3, :cond_1

    .line 144
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    mul-int/2addr v2, v1

    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    div-int v0, v2, v3

    .line 149
    :cond_0
    :goto_0
    invoke-virtual {p0, v1, v0}, Lco/vine/android/player/SdkVideoView;->setMeasuredDimension(II)V

    .line 150
    return-void

    .line 145
    :cond_1
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    mul-int/2addr v3, v1

    if-ge v2, v3, :cond_0

    .line 146
    iget v2, p0, Lco/vine/android/player/SdkVideoView;->mVideoWidth:I

    mul-int/2addr v2, v0

    iget v3, p0, Lco/vine/android/player/SdkVideoView;->mVideoHeight:I

    div-int v1, v2, v3

    goto :goto_0
.end method

.method public onPrepared()V
    .locals 3

    .prologue
    .line 727
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Lco/vine/android/player/SdkVideoView;->mCurrentState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 728
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getMediaPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    .line 729
    .local v0, player:Landroid/media/MediaPlayer;
    if-eqz v0, :cond_0

    .line 730
    iget-object v1, p0, Lco/vine/android/player/SdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-interface {v1, v0}, Landroid/media/MediaPlayer$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 733
    .end local v0           #player:Landroid/media/MediaPlayer;
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 629
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 630
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->toggleMediaControlsVisibility()V

    .line 632
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 637
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 638
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->toggleMediaControlsVisibility()V

    .line 640
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public pause()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 704
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 705
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 706
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 707
    invoke-direct {p0, v1}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 710
    :cond_0
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 711
    return-void
.end method

.method public releaseSurface()V
    .locals 1

    .prologue
    .line 621
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 622
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 623
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceHolder:Landroid/view/Surface;

    .line 625
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 740
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    .line 741
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    invoke-virtual {p0, v0}, Lco/vine/android/player/SdkVideoView;->setMute(Z)V

    .line 742
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->start()V

    .line 743
    return-void

    .line 740
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public retryOpenVideo(Z)Z
    .locals 4
    .parameter "forced"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 212
    const-string v3, "Retry open video: {}"

    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mHasNotRetriedBefore:Z

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 213
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mHasNotRetriedBefore:Z

    if-nez v0, :cond_1

    .line 214
    :cond_0
    iput-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mHasNotRetriedBefore:Z

    .line 215
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->openVideo()V

    move v2, v1

    .line 218
    :cond_1
    return v2

    :cond_2
    move v0, v2

    .line 212
    goto :goto_0
.end method

.method public seekTo(I)V
    .locals 1
    .parameter "msec"

    .prologue
    .line 772
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 773
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 774
    const/4 v0, 0x0

    iput v0, p0, Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I

    .line 778
    :goto_0
    return-void

    .line 776
    :cond_0
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->mSeekWhenPrepared:I

    goto :goto_0
.end method

.method public setAutoPlayOnPrepared(Z)V
    .locals 0
    .parameter "autoPlay"

    .prologue
    .line 441
    iput-boolean p1, p0, Lco/vine/android/player/SdkVideoView;->mAutoPlayOnPrepared:Z

    .line 442
    return-void
.end method

.method public setLooping(Z)V
    .locals 0
    .parameter "looping"

    .prologue
    .line 736
    iput-boolean p1, p0, Lco/vine/android/player/SdkVideoView;->mLooping:Z

    .line 737
    return-void
.end method

.method public setMediaController(Landroid/widget/MediaController;)V
    .locals 1
    .parameter "controller"

    .prologue
    .line 302
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    .line 305
    :cond_0
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mMediaController:Landroid/widget/MediaController;

    .line 306
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->attachMediaController()V

    .line 307
    return-void
.end method

.method public setMute(Z)V
    .locals 4
    .parameter "mute"

    .prologue
    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    .line 852
    iput-boolean p1, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    .line 853
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    iget-boolean v1, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    if-eq v0, v1, :cond_0

    .line 854
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    if-eqz v0, :cond_1

    .line 855
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 860
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mMuted:Z

    iput-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->mWasMuted:Z

    .line 861
    return-void

    .line 857
    :cond_1
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0, v3, v3}, Landroid/media/MediaPlayer;->setVolume(FF)V

    goto :goto_0
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 451
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 452
    return-void
.end method

.method public setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 463
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    .line 464
    return-void
.end method

.method public setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 473
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mOnInfoListener:Landroid/media/MediaPlayer$OnInfoListener;

    .line 474
    return-void
.end method

.method public setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 437
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 438
    return-void
.end method

.method public setPlayingPosition(I)V
    .locals 0
    .parameter "playingPosition"

    .prologue
    .line 157
    iput p1, p0, Lco/vine/android/player/SdkVideoView;->playingPosition:I

    .line 158
    return-void
.end method

.method public setReportOpenError(Z)V
    .locals 0
    .parameter "reportError"

    .prologue
    .line 477
    iput-boolean p1, p0, Lco/vine/android/player/SdkVideoView;->mReportOpenError:Z

    .line 478
    return-void
.end method

.method public setSurfaceReadyListener(Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 492
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mSurfaceReadyListener:Lco/vine/android/player/SdkVideoView$SurfaceReadyListener;

    .line 493
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0
    .parameter "tag"

    .prologue
    .line 310
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mTag:Ljava/lang/Object;

    .line 311
    return-void
.end method

.method public setVideoPath(Ljava/lang/String;)V
    .locals 0
    .parameter "path"

    .prologue
    .line 185
    invoke-virtual {p0, p1}, Lco/vine/android/player/SdkVideoView;->setVideoPathDirect(Ljava/lang/String;)V

    .line 186
    return-void
.end method

.method public setVideoPathDirect(Ljava/lang/String;)V
    .locals 1
    .parameter "path"

    .prologue
    .line 189
    iput-object p1, p0, Lco/vine/android/player/SdkVideoView;->mPath:Ljava/lang/String;

    .line 190
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/vine/android/player/SdkVideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 191
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 693
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 694
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 696
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/player/SdkVideoView;->isInPlaybackState()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 697
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->getPlayer()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 698
    invoke-direct {p0, v1}, Lco/vine/android/player/SdkVideoView;->setCurrentState(I)V

    .line 700
    :cond_1
    iput v1, p0, Lco/vine/android/player/SdkVideoView;->mTargetState:I

    .line 701
    return-void
.end method

.method public startOpenVideo()V
    .locals 0

    .prologue
    .line 227
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->openVideo()V

    .line 228
    return-void
.end method

.method public stopPlayback()V
    .locals 2

    .prologue
    .line 567
    iget-boolean v0, p0, Lco/vine/android/player/SdkVideoView;->SINGLE_PLAYER:Z

    if-eqz v0, :cond_0

    .line 568
    sget-object v1, Lco/vine/android/player/SdkVideoView;->LOCK:[I

    monitor-enter v1

    .line 569
    :try_start_0
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->stopPlaybackInternal()V

    .line 570
    monitor-exit v1

    .line 574
    :goto_0
    return-void

    .line 570
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 572
    :cond_0
    invoke-direct {p0}, Lco/vine/android/player/SdkVideoView;->stopPlaybackInternal()V

    goto :goto_0
.end method

.method public suspend()V
    .locals 1

    .prologue
    .line 714
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/player/SdkVideoView;->release(Z)V

    .line 715
    return-void
.end method
