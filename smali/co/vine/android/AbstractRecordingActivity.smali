.class public abstract Lco/vine/android/AbstractRecordingActivity;
.super Lco/vine/android/BaseActionBarActivity;
.source "AbstractRecordingActivity.java"

# interfaces
.implements Lco/vine/android/widgets/PromptDialogFragment$OnDialogDoneListener;
.implements Landroid/support/v4/view/DraftViewPager$OnPageChangeListener;
.implements Lco/vine/android/animation/SmoothAnimator$AnimationListener;
.implements Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;,
        Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;
    }
.end annotation


# static fields
.field private static final ANIMATION_CAMERA_ICON:I = 0x4

.field private static final ANIMATION_DELETE:I = 0x3

.field private static final ANIMATION_PREVIEW:I = 0x1

.field private static final ANIMATION_PROGRESS:I = 0x2

.field private static final ANIMATION_PROGRESS_TO_DRAFTS:I = 0x6

.field private static final ANIMATION_TO_DRAFTS:I = 0x5

.field private static final ANIMATION_TO_DRAFTS_CAMERA:I = 0x7

.field private static final ANIM_DURATION:I = 0x12c

.field public static final DIALOG_DELETE:I = 0x1

.field public static final DIALOG_DIRTY:I = 0x2

.field public static final DIALOG_TOO_MANY_DRAFTS:I = 0x3

.field public static final DIALOG_UNSAVED_CHANGES:I = 0x0

.field private static final EXTRA_TOP_OVERLAY:Ljava/lang/String; = "arg_top_overlay"

.field private static final PAGE_INVALID:I = -0x1

.field private static final SECRETS:[I = null

.field public static final START_SESSION_ID_CAMERA:Ljava/lang/String; = "camera_preview"

.field private static final STATE_FIRST_DRAFT_LAUNCH:Ljava/lang/String; = "first_launch"

.field private static final STATE_FIRST_PAGE_SET:Ljava/lang/String; = "state_fp"

.field private static final STEP_NONE:I = -0x1

.field private static final STEP_PREVIEW:I = 0x1

.field private static final STEP_RECORD:I

.field private static final sRunningStances:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/AbstractRecordingActivity;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private isSecretModeOn:Z

.field private mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

.field private mAnimatingIntoDrafts:Z

.field private mAnimationPreviewOverlay:Landroid/view/View;

.field private mBottomMaskHeight:I

.field private mCameraFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/DraftCameraPreviewFragment;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraIconFadeIn:Landroid/view/animation/Animation;

.field private mCameraIconOverlay:Landroid/view/View;

.field private mCameraIconOverlayImage:Landroid/view/View;

.field public mCurrentDuration:J

.field protected mCurrentFragment:Landroid/support/v4/app/Fragment;

.field mCurrentPage:I

.field private mCurrentSecret:I

.field private mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

.field private mCurrentSteadyCount:I

.field private mDeleteWasDrag:Z

.field private mDots:Lco/vine/android/widget/DotIndicators;

.field private final mDraftFragments:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/DraftFragment;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDraftFullMask:Landroid/view/View;

.field private mDraftMaskLeft:Landroid/view/View;

.field private mDraftMaskParent:Landroid/view/View;

.field private mDraftMaskRight:Landroid/view/View;

.field private mDraftMaskTop:Landroid/view/View;

.field private mDraftRoot:Landroid/view/View;

.field private mDraftTrashBackground:Landroid/view/View;

.field private mDraftTrashButton:Landroid/view/View;

.field private mDraftTrashContainer:Landroid/view/View;

.field private mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

.field private final mEmptyClicker:Landroid/view/View$OnClickListener;

.field private mFirstDraftLaunch:Z

.field private mFirstPageSet:Z

.field private final mHandler:Landroid/os/Handler;

.field private mHasPreviewedAlready:Z

.field private mIsGoingToRecord:Z

.field private mLargeThumbnailOverlay:Landroid/widget/ImageView;

.field final mOnMaskTouchListesner:Landroid/view/View$OnTouchListener;

.field private mOnPageIdleRunnable:Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

.field private final mOnResumeDraftRunnable:Ljava/lang/Runnable;

.field private mPageScrollState:I

.field mPreviewDimen:I

.field private mPreviewOverlay:Landroid/view/View;

.field mPreviewRatio:F

.field public mProgressContainerWidth:I

.field private mProgressOverlay:Landroid/view/View;

.field private mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

.field private mRegularUiMode:I

.field private mScreenSize:Landroid/graphics/Point;

.field private mSessions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSideMaskWidth:I

.field private mSlowFadeIn:Landroid/view/animation/Animation;

.field private mStartSessionId:Ljava/lang/String;

.field private mStep:I

.field private mTopMaskHeight:I

.field private mTopOverlay:Landroid/graphics/Bitmap;

.field protected mUploadFile:Ljava/lang/String;

.field private mVideoViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/player/SdkVideoView;",
            ">;"
        }
    .end annotation
.end field

.field private mViewPager:Landroid/support/v4/view/DraftViewPager;

.field private mWaitingForLogin:Z

.field private final mWeakSelf:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lco/vine/android/AbstractRecordingActivity;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 86
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lco/vine/android/AbstractRecordingActivity;->sRunningStances:Ljava/util/HashSet;

    .line 1134
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lco/vine/android/AbstractRecordingActivity;->SECRETS:[I

    return-void

    :array_0
    .array-data 0x4
        0x18t 0x0t 0x0t 0x0t
        0x19t 0x0t 0x0t 0x0t
        0x18t 0x0t 0x0t 0x0t
        0x18t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Lco/vine/android/BaseActionBarActivity;-><init>()V

    .line 115
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mWeakSelf:Ljava/lang/ref/WeakReference;

    .line 117
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mHandler:Landroid/os/Handler;

    .line 148
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mVideoViews:Ljava/util/ArrayList;

    .line 168
    const/4 v0, -0x1

    iput v0, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    .line 174
    iput-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDeleteWasDrag:Z

    .line 176
    new-instance v0, Lco/vine/android/AbstractRecordingActivity$1;

    invoke-direct {v0, p0}, Lco/vine/android/AbstractRecordingActivity$1;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mEmptyClicker:Landroid/view/View$OnClickListener;

    .line 188
    iput-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    .line 195
    new-instance v0, Lco/vine/android/AbstractRecordingActivity$2;

    invoke-direct {v0, p0}, Lco/vine/android/AbstractRecordingActivity$2;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnMaskTouchListesner:Landroid/view/View$OnTouchListener;

    .line 1141
    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    .line 1142
    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSteadyCount:I

    .line 1143
    iput-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->isSecretModeOn:Z

    .line 1367
    new-instance v0, Lco/vine/android/AbstractRecordingActivity$11;

    invoke-direct {v0, p0}, Lco/vine/android/AbstractRecordingActivity$11;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnResumeDraftRunnable:Ljava/lang/Runnable;

    .line 1383
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/AbstractRecordingActivity;)Landroid/util/SparseArray;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$1000(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$102(Lco/vine/android/AbstractRecordingActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lco/vine/android/AbstractRecordingActivity;->mDeleteWasDrag:Z

    return p1
.end method

.method static synthetic access$1100(Lco/vine/android/AbstractRecordingActivity;)Ljava/lang/Runnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnResumeDraftRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$1200(Lco/vine/android/AbstractRecordingActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1300(Lco/vine/android/AbstractRecordingActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->isResuming()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlayImage:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/animation/Animation;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mSlowFadeIn:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$1600(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/animation/Animation;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconFadeIn:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$1700(Lco/vine/android/AbstractRecordingActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    return v0
.end method

.method static synthetic access$1702(Lco/vine/android/AbstractRecordingActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    return p1
.end method

.method static synthetic access$1800(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFullMask:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1900(Lco/vine/android/AbstractRecordingActivity;)Landroid/support/v4/view/DraftViewPager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2002(Lco/vine/android/AbstractRecordingActivity;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput p1, p0, Lco/vine/android/AbstractRecordingActivity;->mPageScrollState:I

    return p1
.end method

.method static synthetic access$2100(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskTop:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2200(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskLeft:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2300(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskRight:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2408(Lco/vine/android/AbstractRecordingActivity;)I
    .locals 2
    .parameter "x0"

    .prologue
    .line 77
    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSteadyCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSteadyCount:I

    return v0
.end method

.method static synthetic access$2500(Lco/vine/android/AbstractRecordingActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->doStopMotion()V

    return-void
.end method

.method static synthetic access$2600(Lco/vine/android/AbstractRecordingActivity;)Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    return-object v0
.end method

.method static synthetic access$2702(Lco/vine/android/AbstractRecordingActivity;Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;)Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    return-object p1
.end method

.method static synthetic access$2800(Lco/vine/android/AbstractRecordingActivity;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2902(Lco/vine/android/AbstractRecordingActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraFragment:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic access$300(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3000(Lco/vine/android/AbstractRecordingActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    return v0
.end method

.method static synthetic access$3102(Lco/vine/android/AbstractRecordingActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    return p1
.end method

.method static synthetic access$3200(Lco/vine/android/AbstractRecordingActivity;Lco/vine/android/DraftFragment;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lco/vine/android/AbstractRecordingActivity;->buildAndShowFloatingView(Lco/vine/android/DraftFragment;)V

    return-void
.end method

.method static synthetic access$3300(Lco/vine/android/AbstractRecordingActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->releasePlayers()V

    return-void
.end method

.method static synthetic access$3400(Lco/vine/android/AbstractRecordingActivity;)Landroid/graphics/Point;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$3500(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3600(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3700(Lco/vine/android/AbstractRecordingActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    return v0
.end method

.method static synthetic access$3702(Lco/vine/android/AbstractRecordingActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 77
    iput-boolean p1, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    return p1
.end method

.method static synthetic access$3800(Lco/vine/android/AbstractRecordingActivity;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->setCurrentSession()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskParent:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lco/vine/android/AbstractRecordingActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 77
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->hideDraftsInternal()V

    return-void
.end method

.method static synthetic access$800(Lco/vine/android/AbstractRecordingActivity;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lco/vine/android/AbstractRecordingActivity;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 77
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mLargeThumbnailOverlay:Landroid/widget/ImageView;

    return-object v0
.end method

.method private buildAndShowFloatingView(Lco/vine/android/DraftFragment;)V
    .locals 13
    .parameter "ref"

    .prologue
    const/16 v12, 0x8

    const/4 v6, 0x2

    const/4 v7, 0x1

    const/4 v11, 0x0

    .line 1287
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->releasePlayers()V

    .line 1288
    invoke-virtual {p1}, Lco/vine/android/DraftFragment;->showImage()V

    .line 1289
    new-array v8, v6, [I

    .line 1290
    .local v8, previewLocation:[I
    invoke-virtual {p1}, Lco/vine/android/DraftFragment;->getThumbnailView()Landroid/view/View;

    move-result-object v1

    .line 1291
    .local v1, thumbnailView:Landroid/view/View;
    invoke-virtual {v1, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1293
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0b001c

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    .line 1295
    .local v10, yOffset:I
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    aget v4, v8, v11

    aget v0, v8, v7

    sub-int v5, v0, v10

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lco/vine/android/util/FloatingViewUtils;->buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;

    .line 1298
    new-array v9, v6, [I

    .line 1299
    .local v9, progressLocation:[I
    invoke-virtual {p1}, Lco/vine/android/DraftFragment;->getProgressView()Landroid/view/View;

    move-result-object v3

    .line 1300
    .local v3, progressView:Landroid/view/View;
    invoke-virtual {v3, v9}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1302
    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    aget v6, v9, v11

    aget v0, v9, v7

    sub-int v7, v0, v10

    move-object v2, p0

    invoke-static/range {v2 .. v7}, Lco/vine/android/util/FloatingViewUtils;->buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;

    .line 1304
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    invoke-virtual {v0, v11}, Landroid/view/View;->setVisibility(I)V

    .line 1305
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    invoke-virtual {v0, v11}, Landroid/view/View;->setVisibility(I)V

    .line 1306
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1307
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v0, v12}, Landroid/support/v4/view/DraftViewPager;->setVisibility(I)V

    .line 1308
    return-void
.end method

.method private doStopMotion()V
    .locals 4

    .prologue
    .line 1215
    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSteadyCount:I

    const/16 v1, 0x28

    if-ge v0, v1, :cond_0

    .line 1216
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lco/vine/android/AbstractRecordingActivity$10;

    invoke-direct {v1, p0}, Lco/vine/android/AbstractRecordingActivity$10;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1227
    :cond_0
    return-void
.end method

.method public static getIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "context"
    .parameter "flags"
    .parameter "tag"

    .prologue
    .line 205
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lco/vine/android/RecordingActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 206
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 207
    if-lez p1, :cond_0

    .line 208
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 210
    :cond_0
    return-object v0
.end method

.method private handleDelete()V
    .locals 33

    .prologue
    .line 1548
    const/16 v31, 0x0

    .line 1549
    .local v31, noAnimationDelete:Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/ref/WeakReference;

    .line 1550
    .local v25, currentFragmentRef:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v25, :cond_b

    .line 1551
    invoke-virtual/range {v25 .. v25}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lco/vine/android/DraftFragment;

    .line 1552
    .local v24, currentFragment:Lco/vine/android/DraftFragment;
    const v3, 0x7f040011

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v27

    .line 1553
    .local v27, fadeOut:Landroid/view/animation/Animation;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x7f0b001c

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    .line 1554
    .local v6, offset:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x7f0b0021

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    .line 1556
    .local v7, margin:I
    move-object/from16 v0, p0

    iget v3, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-lez v3, :cond_5

    .line 1557
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/vine/android/DraftFragment;

    .line 1558
    .local v8, prevFragment:Lco/vine/android/DraftFragment;
    if-eqz v8, :cond_4

    if-eqz v24, :cond_4

    .line 1559
    invoke-virtual {v8}, Lco/vine/android/DraftFragment;->getThumbnailView()Landroid/view/View;

    move-result-object v4

    .line 1560
    .local v4, prevView:Landroid/view/View;
    const/4 v3, 0x2

    new-array v5, v3, [I

    .line 1561
    .local v5, previewLocation:[I
    invoke-virtual {v4, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1563
    new-instance v2, Lco/vine/android/AbstractRecordingActivity$12;

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lco/vine/android/AbstractRecordingActivity$12;-><init>(Lco/vine/android/AbstractRecordingActivity;Landroid/view/View;[IIILco/vine/android/DraftFragment;)V

    .line 1579
    .local v2, l:Lco/vine/android/animation/SimpleAnimationListener;
    move-object/from16 v0, v27

    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1580
    invoke-virtual {v8}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v32

    .line 1581
    .local v32, view:Landroid/view/View;
    if-eqz v32, :cond_0

    .line 1582
    const/4 v3, 0x4

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1584
    :cond_0
    invoke-virtual/range {v24 .. v24}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v32

    .line 1585
    if-eqz v32, :cond_3

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/vine/android/AbstractRecordingActivity;->mDeleteWasDrag:Z

    if-nez v3, :cond_3

    .line 1586
    move-object/from16 v0, v32

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1652
    .end local v2           #l:Lco/vine/android/animation/SimpleAnimationListener;
    .end local v4           #prevView:Landroid/view/View;
    .end local v5           #previewLocation:[I
    .end local v6           #offset:I
    .end local v7           #margin:I
    .end local v8           #prevFragment:Lco/vine/android/DraftFragment;
    .end local v24           #currentFragment:Lco/vine/android/DraftFragment;
    .end local v27           #fadeOut:Landroid/view/animation/Animation;
    .end local v32           #view:Landroid/view/View;
    :cond_1
    :goto_0
    if-eqz v31, :cond_2

    .line 1655
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->deleteCurrentDraft()V

    .line 1657
    :cond_2
    return-void

    .line 1587
    .restart local v2       #l:Lco/vine/android/animation/SimpleAnimationListener;
    .restart local v4       #prevView:Landroid/view/View;
    .restart local v5       #previewLocation:[I
    .restart local v6       #offset:I
    .restart local v7       #margin:I
    .restart local v8       #prevFragment:Lco/vine/android/DraftFragment;
    .restart local v24       #currentFragment:Lco/vine/android/DraftFragment;
    .restart local v27       #fadeOut:Landroid/view/animation/Animation;
    .restart local v32       #view:Landroid/view/View;
    :cond_3
    if-eqz v32, :cond_1

    .line 1588
    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lco/vine/android/animation/SimpleAnimationListener;->onAnimationEnd(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 1591
    .end local v2           #l:Lco/vine/android/animation/SimpleAnimationListener;
    .end local v4           #prevView:Landroid/view/View;
    .end local v5           #previewLocation:[I
    .end local v32           #view:Landroid/view/View;
    :cond_4
    const/16 v31, 0x1

    goto :goto_0

    .line 1593
    .end local v8           #prevFragment:Lco/vine/android/DraftFragment;
    :cond_5
    move-object/from16 v0, p0

    iget v3, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-nez v3, :cond_1

    .line 1594
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v9, 0x1

    if-ne v3, v9, :cond_6

    .line 1596
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->deleteCurrentDraft()V

    .line 1597
    const/4 v3, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/AbstractRecordingActivity;->hideDrafts(Z)V

    .line 1598
    const-string v3, "Delete"

    const/4 v9, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v9}, Lco/vine/android/AbstractRecordingActivity;->swapFolder(Ljava/lang/String;Ljava/io/File;)V

    goto :goto_0

    .line 1601
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v3, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/ref/WeakReference;

    .line 1603
    .local v29, nextFragmentRef:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v29, :cond_a

    .line 1604
    invoke-virtual/range {v29 .. v29}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lco/vine/android/DraftFragment;

    .line 1605
    .local v28, nextFragment:Lco/vine/android/DraftFragment;
    if-eqz v28, :cond_9

    if-eqz v24, :cond_9

    .line 1606
    invoke-virtual/range {v28 .. v28}, Lco/vine/android/DraftFragment;->getThumbnailView()Landroid/view/View;

    move-result-object v10

    .line 1607
    .local v10, nextView:Landroid/view/View;
    const/4 v3, 0x2

    new-array v0, v3, [I

    move-object/from16 v30, v0

    .line 1608
    .local v30, nextLocation:[I
    move-object/from16 v0, v30

    invoke-virtual {v10, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1610
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v12

    const/4 v3, 0x0

    aget v13, v30, v3

    const/4 v3, 0x1

    aget v3, v30, v3

    sub-int v14, v3, v6

    move-object/from16 v9, p0

    invoke-static/range {v9 .. v14}, Lco/vine/android/util/FloatingViewUtils;->buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1617
    :goto_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1619
    new-instance v11, Lco/vine/android/animation/MoveResizeAnimator;

    const/4 v12, 0x3

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    int-to-float v3, v3

    const/high16 v9, 0x3f80

    move-object/from16 v0, p0

    iget v15, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    sub-float/2addr v9, v15

    mul-float/2addr v3, v9

    float-to-int v3, v3

    mul-int/lit8 v9, v7, 0x4

    sub-int v15, v3, v9

    const/4 v3, 0x1

    aget v3, v30, v3

    sub-int v16, v3, v6

    const-wide/high16 v17, 0x3ff0

    const-wide/high16 v19, 0x3ff0

    const/16 v21, 0x12c

    invoke-virtual/range {v28 .. v28}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v23

    move-object/from16 v22, p0

    invoke-direct/range {v11 .. v23}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    .line 1625
    .local v11, animator:Lco/vine/android/animation/MoveResizeAnimator;
    new-instance v3, Lco/vine/android/AbstractRecordingActivity$13;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v11}, Lco/vine/android/AbstractRecordingActivity$13;-><init>(Lco/vine/android/AbstractRecordingActivity;Lco/vine/android/animation/MoveResizeAnimator;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1631
    invoke-virtual/range {v28 .. v28}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v32

    .line 1632
    .restart local v32       #view:Landroid/view/View;
    if-eqz v32, :cond_7

    .line 1633
    const/4 v3, 0x4

    move-object/from16 v0, v32

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1635
    :cond_7
    invoke-virtual/range {v24 .. v24}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v32

    .line 1636
    if-eqz v32, :cond_8

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lco/vine/android/AbstractRecordingActivity;->mDeleteWasDrag:Z

    if-nez v3, :cond_8

    .line 1637
    move-object/from16 v0, v32

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto/16 :goto_0

    .line 1613
    .end local v11           #animator:Lco/vine/android/animation/MoveResizeAnimator;
    .end local v32           #view:Landroid/view/View;
    :catch_0
    move-exception v26

    .line 1615
    .local v26, e:Ljava/lang/Exception;
    invoke-static/range {v26 .. v26}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 1639
    .end local v26           #e:Ljava/lang/Exception;
    .restart local v11       #animator:Lco/vine/android/animation/MoveResizeAnimator;
    .restart local v32       #view:Landroid/view/View;
    :cond_8
    invoke-virtual {v11}, Lco/vine/android/animation/MoveResizeAnimator;->start()V

    goto/16 :goto_0

    .line 1642
    .end local v10           #nextView:Landroid/view/View;
    .end local v11           #animator:Lco/vine/android/animation/MoveResizeAnimator;
    .end local v30           #nextLocation:[I
    .end local v32           #view:Landroid/view/View;
    :cond_9
    const/16 v31, 0x1

    goto/16 :goto_0

    .line 1645
    .end local v28           #nextFragment:Lco/vine/android/DraftFragment;
    :cond_a
    const/16 v31, 0x1

    goto/16 :goto_0

    .line 1650
    .end local v6           #offset:I
    .end local v7           #margin:I
    .end local v24           #currentFragment:Lco/vine/android/DraftFragment;
    .end local v27           #fadeOut:Landroid/view/animation/Animation;
    .end local v29           #nextFragmentRef:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    :cond_b
    const/16 v31, 0x1

    goto/16 :goto_0
.end method

.method private hideCurrentFragment()V
    .locals 5

    .prologue
    .line 423
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v4, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 424
    .local v0, fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v0, :cond_0

    .line 425
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/DraftFragment;

    .line 426
    .local v1, ref:Lco/vine/android/DraftFragment;
    if-eqz v1, :cond_0

    .line 427
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->pausePlayer()V

    .line 428
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v2

    .line 429
    .local v2, toHide:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 430
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 434
    .end local v1           #ref:Lco/vine/android/DraftFragment;
    .end local v2           #toHide:Landroid/view/View;
    :cond_0
    return-void
.end method

.method private hideDraftsInternal()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 800
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 801
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 802
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 803
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 804
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    invoke-virtual {v0, v1}, Lco/vine/android/widget/DragUpToDeleteContainer;->setVisibility(I)V

    .line 805
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 806
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->onHideDrafts()V

    .line 808
    :cond_0
    return-void
.end method

.method private isResuming()Z
    .locals 1

    .prologue
    .line 1682
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_2

    .line 1683
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isResuming()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 1685
    :goto_0
    return v0

    .line 1683
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1685
    :cond_2
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    goto :goto_0
.end method

.method private releasePlayers()V
    .locals 5

    .prologue
    .line 1276
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 1277
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v4, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 1278
    .local v1, r:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/DraftFragment;

    .line 1279
    .local v2, ref:Lco/vine/android/DraftFragment;
    if-eqz v2, :cond_0

    .line 1280
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lco/vine/android/DraftFragment;->setSelected(Z)V

    .line 1281
    invoke-virtual {v2}, Lco/vine/android/DraftFragment;->release()V

    .line 1276
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1284
    .end local v1           #r:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v2           #ref:Lco/vine/android/DraftFragment;
    :cond_1
    return-void
.end method

.method private reload(Ljava/util/ArrayList;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1311
    .local p1, sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1312
    .local v0, size:I
    const/16 v1, 0x9

    if-le v0, v1, :cond_0

    .line 1313
    const/4 v1, 0x3

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogFragment;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    .line 1314
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    const v2, 0x7f0e01c3

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 1315
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    const v2, 0x7f0e010d

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 1316
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Lco/vine/android/widgets/PromptDialogFragment;->show(Landroid/app/FragmentManager;)V

    .line 1317
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1319
    :cond_0
    iput-object p1, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    .line 1320
    new-instance v1, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;-><init>(Lco/vine/android/AbstractRecordingActivity;Landroid/support/v4/app/FragmentManager;)V

    iput-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    .line 1321
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    invoke-virtual {v1, v2}, Landroid/support/v4/view/DraftViewPager;->setAdapter(Landroid/support/v4/app/DraftFragmentStatePagerAdapter;)V

    .line 1322
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/DraftViewPager;->setOnPageChangeListener(Landroid/support/v4/view/DraftViewPager$OnPageChangeListener;)V

    .line 1323
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    invoke-virtual {v2}, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v4/view/DraftViewPager;->setOffscreenPageLimit(I)V

    .line 1324
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDots:Lco/vine/android/widget/DotIndicators;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Lco/vine/android/widget/DotIndicators;->setNumberOfDots(I)V

    .line 1325
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDots:Lco/vine/android/widget/DotIndicators;

    invoke-virtual {v1}, Lco/vine/android/widget/DotIndicators;->invalidate()V

    .line 1326
    return-void
.end method

.method private setCurrentSession()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 1498
    const/4 v0, 0x0

    .line 1499
    .local v0, i:I
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v8}, Landroid/support/v4/view/DraftViewPager;->isDrawn()Z

    move-result v8

    if-eqz v8, :cond_4

    iget-boolean v8, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    if-nez v8, :cond_4

    .line 1500
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mStartSessionId:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string v8, "camera_preview"

    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mStartSessionId:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1501
    :cond_0
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    invoke-virtual {v9}, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->getCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v9, v7}, Landroid/support/v4/view/DraftViewPager;->setCurrentItem(IZ)V

    .line 1502
    iput-boolean v6, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    .line 1525
    :goto_0
    return v6

    .line 1505
    :cond_1
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    .line 1506
    .local v4, session:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mStartSessionId:Ljava/lang/String;

    iget-object v9, v4, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1507
    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v8, v0, v7}, Landroid/support/v4/view/DraftViewPager;->setCurrentItem(IZ)V

    .line 1508
    iput v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    .line 1509
    iput-boolean v6, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    .line 1510
    iget-object v7, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v8, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 1511
    .local v2, item:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    const/4 v5, 0x0

    .line 1512
    .local v5, toSet:Landroid/view/View;
    if-eqz v2, :cond_2

    .line 1513
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/DraftFragment;

    .line 1514
    .local v3, ref:Lco/vine/android/DraftFragment;
    if-eqz v3, :cond_2

    .line 1515
    invoke-virtual {v3}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v7

    const v8, 0x7f0a0080

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 1518
    .end local v3           #ref:Lco/vine/android/DraftFragment;
    :cond_2
    iget-object v7, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    iget-object v8, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v8}, Landroid/support/v4/view/DraftViewPager;->getLeftOfSelectedFragment()I

    move-result v8

    invoke-virtual {v7, v5, v8}, Lco/vine/android/widget/DragUpToDeleteContainer;->setView(Landroid/view/View;I)V

    goto :goto_0

    .line 1521
    .end local v2           #item:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v5           #toSet:Landroid/view/View;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 1522
    goto :goto_1

    .end local v1           #i$:Ljava/util/Iterator;
    .end local v4           #session:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;
    :cond_4
    move v6, v7

    .line 1525
    goto :goto_0
.end method

.method private showCurrentFragment()V
    .locals 5

    .prologue
    .line 462
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v4, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 463
    .local v0, fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v0, :cond_0

    .line 464
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/DraftFragment;

    .line 465
    .local v1, ref:Lco/vine/android/DraftFragment;
    if-eqz v1, :cond_0

    .line 466
    const/4 v3, 0x1

    iput-boolean v3, v1, Lco/vine/android/DraftFragment;->mCanUnhide:Z

    .line 467
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->resumePlayer()V

    .line 468
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v2

    .line 469
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_0

    .line 470
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 474
    .end local v1           #ref:Lco/vine/android/DraftFragment;
    .end local v2           #v:Landroid/view/View;
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addPlayerToPool(Lco/vine/android/player/SdkVideoView;)V
    .locals 1
    .parameter "videoView"

    .prologue
    .line 1355
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mVideoViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1356
    monitor-exit p0

    return-void

    .line 1355
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public cameraPreviewToRecorder(Landroid/view/View;Landroid/view/View;)V
    .locals 19
    .parameter "iconView"
    .parameter "previewIcon"

    .prologue
    .line 1660
    invoke-direct/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->isResuming()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1679
    :goto_0
    return-void

    .line 1663
    :cond_0
    const/4 v1, 0x1

    move-object/from16 v0, p0

    iput-boolean v1, v0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    .line 1664
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    int-to-float v14, v1

    .line 1665
    .local v14, fullSize:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v1, v1

    div-float v16, v14, v1

    .line 1666
    .local v16, ratio:F
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b0042

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v17

    .line 1668
    .local v17, top:I
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b001c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v18

    .line 1670
    .local v18, topOffset:I
    const/4 v1, 0x2

    new-array v15, v1, [I

    .line 1671
    .local v15, location:[I
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/view/View;->getLocationInWindow([I)V

    .line 1672
    const/16 v1, 0x8

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1674
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v4

    const/4 v1, 0x0

    aget v5, v15, v1

    const/4 v1, 0x1

    aget v1, v15, v1

    sub-int v6, v1, v18

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-static/range {v1 .. v6}, Lco/vine/android/util/FloatingViewUtils;->buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;

    .line 1676
    move-object/from16 v0, p0

    iget-object v1, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1677
    new-instance v1, Lco/vine/android/animation/MoveResizeAnimator;

    const/4 v2, 0x4

    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    const/4 v5, 0x0

    move/from16 v0, v16

    float-to-double v7, v0

    move/from16 v0, v16

    float-to-double v9, v0

    const/16 v11, 0x12c

    move/from16 v6, v17

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    invoke-direct/range {v1 .. v13}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    invoke-virtual {v1}, Lco/vine/android/animation/MoveResizeAnimator;->start()V

    goto :goto_0
.end method

.method protected createRecordingFragment()Lco/vine/android/RecordingFragment;
    .locals 1

    .prologue
    .line 1695
    new-instance v0, Lco/vine/android/RecordingFragment;

    invoke-direct {v0}, Lco/vine/android/RecordingFragment;-><init>()V

    return-object v0
.end method

.method protected createRecordingPreviewFragment(Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;)Lco/vine/android/RecordingPreviewFragment;
    .locals 3
    .parameter "finalFile"
    .parameter "thumbNailPath"

    .prologue
    .line 1690
    invoke-virtual {p1}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mUploadFile:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, p2, v2}, Lco/vine/android/RecordingPreviewFragment;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lco/vine/android/RecordingPreviewFragment;

    move-result-object v0

    return-object v0
.end method

.method protected currentlyHoldsRecordingFragment()Z
    .locals 1

    .prologue
    .line 639
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public deleteCurrentDraft()V
    .locals 8

    .prologue
    .line 1236
    :try_start_0
    iget v6, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-nez v6, :cond_2

    .line 1237
    const/4 v4, 0x0

    .line 1241
    .local v4, nextIndex:I
    :goto_0
    const/4 v6, -0x1

    iput v6, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    .line 1243
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v6}, Landroid/support/v4/view/DraftViewPager;->getCurrentItem()I

    move-result v0

    .line 1244
    .local v0, current:I
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v6, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 1245
    .local v3, fragRef:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v3, :cond_0

    .line 1246
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/DraftFragment;

    .line 1247
    .local v2, frag:Lco/vine/android/DraftFragment;
    if-eqz v2, :cond_0

    .line 1248
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lco/vine/android/DraftFragment;->setExpired(Z)V

    .line 1252
    .end local v2           #frag:Lco/vine/android/DraftFragment;
    :cond_0
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    if-eqz v6, :cond_1

    .line 1253
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    iget-object v6, v6, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;->folder:Ljava/io/File;

    const-string v7, "deleteCurrentDraft"

    invoke-static {v6, v7}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V

    .line 1256
    :cond_1
    const-string v6, "draft"

    invoke-static {v6}, Lco/vine/android/util/FlurryUtils;->trackAbandonedStage(Ljava/lang/String;)V

    .line 1258
    const/4 v6, 0x0

    iput-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mStartSessionId:Ljava/lang/String;

    .line 1260
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getValidSessions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v5

    .line 1262
    .local v5, sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    invoke-direct {p0, v5}, Lco/vine/android/AbstractRecordingActivity;->reload(Ljava/util/ArrayList;)V

    .line 1263
    iput-object v5, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    .line 1265
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v6}, Landroid/support/v4/view/DraftViewPager;->requestLayout()V

    .line 1266
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v6}, Landroid/support/v4/view/DraftViewPager;->invalidate()V

    .line 1267
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mAdapter:Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;

    invoke-virtual {v6}, Lco/vine/android/AbstractRecordingActivity$DraftPagerImpl;->notifyDataSetChanged()V

    .line 1268
    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Landroid/support/v4/view/DraftViewPager;->setCurrentItem(IZ)V

    .line 1269
    invoke-virtual {p0, v4}, Lco/vine/android/AbstractRecordingActivity;->onPageSelected(I)V

    .line 1273
    .end local v0           #current:I
    .end local v3           #fragRef:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v4           #nextIndex:I
    .end local v5           #sessions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;>;"
    :goto_1
    return-void

    .line 1239
    :cond_2
    iget v6, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v4, v6, -0x1

    .restart local v4       #nextIndex:I
    goto :goto_0

    .line 1270
    .end local v4           #nextIndex:I
    :catch_0
    move-exception v1

    .line 1271
    .local v1, e:Ljava/io/IOException;
    const-string v6, "Failed to delete current draft."

    invoke-static {v6, v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method protected discardUpload()V
    .locals 1

    .prologue
    .line 758
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mUploadFile:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 759
    const-string v0, "Upload discarded."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 760
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mUploadFile:Ljava/lang/String;

    invoke-static {p0, v0}, Lco/vine/android/util/UploadManager;->removeFromUploadQueue(Landroid/content/Context;Ljava/lang/String;)V

    .line 762
    :cond_0
    return-void
.end method

.method public getScreenSize()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 383
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    return-object v0
.end method

.method public hasPreviewedAlready()Z
    .locals 1

    .prologue
    .line 1230
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mHasPreviewedAlready:Z

    return v0
.end method

.method public hideDrafts(Z)V
    .locals 4
    .parameter "animate"

    .prologue
    const/4 v3, 0x0

    .line 765
    const-string v1, "Fading away drafts."

    invoke-static {v1}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 766
    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 767
    .local v0, as:Landroid/view/animation/AnimationSet;
    if-eqz p1, :cond_0

    .line 768
    sget-object v1, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->COLLAPSE_HEIGHT:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskTop:Landroid/view/View;

    invoke-static {v1, v2, v3}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 770
    sget-object v1, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->COLLAPSE_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskLeft:Landroid/view/View;

    invoke-static {v1, v2, v3}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 772
    sget-object v1, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->COLLAPSE_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskRight:Landroid/view/View;

    invoke-static {v1, v2, v3}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 775
    :cond_0
    const v1, 0x7f04000e

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 776
    new-instance v1, Lco/vine/android/AbstractRecordingActivity$7;

    invoke-direct {v1, p0, p1}, Lco/vine/android/AbstractRecordingActivity$7;-><init>(Lco/vine/android/AbstractRecordingActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 792
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 793
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/DraftViewPager;->getLeftOfSelectedFragment()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lco/vine/android/widget/DragUpToDeleteContainer;->setView(Landroid/view/View;I)V

    .line 794
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 795
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 796
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 797
    return-void
.end method

.method public initMasks(Landroid/view/View;Landroid/view/View;)V
    .locals 5
    .parameter "topMask"
    .parameter "bottomMask"

    .prologue
    const/4 v4, 0x0

    .line 614
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mOnMaskTouchListesner:Landroid/view/View$OnTouchListener;

    invoke-virtual {p1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 615
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mOnMaskTouchListesner:Landroid/view/View$OnTouchListener;

    invoke-virtual {p2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 619
    const-string v3, "capture"

    invoke-virtual {p0, v3, v4}, Lco/vine/android/AbstractRecordingActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 621
    .local v2, prefs:Landroid/content/SharedPreferences;
    invoke-static {}, Lco/vine/android/recorder/RecordConfigUtils;->isDefaultFrontFacing()Z

    move-result v3

    invoke-static {v3}, Lco/vine/android/recorder/VineRecorder;->getBottomMaskHeightPref(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 624
    .local v0, bottomMaskHeightPx:I
    if-lez v0, :cond_0

    .line 625
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 627
    .local v1, bottomMaskParams:Landroid/widget/RelativeLayout$LayoutParams;
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 629
    new-instance v3, Lco/vine/android/AbstractRecordingActivity$6;

    invoke-direct {v3, p0, p2, v1}, Lco/vine/android/AbstractRecordingActivity$6;-><init>(Lco/vine/android/AbstractRecordingActivity;Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;)V

    invoke-virtual {p0, v3}, Lco/vine/android/AbstractRecordingActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 636
    .end local v1           #bottomMaskParams:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method public isDraftsShowing()Z
    .locals 2

    .prologue
    .line 811
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 1123
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingPreviewFragment;

    if-eqz v0, :cond_0

    .line 1124
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 1132
    :goto_0
    return-void

    .line 1127
    :cond_0
    const/16 v0, 0x1f

    if-eq p2, v0, :cond_1

    const/16 v0, 0x20

    if-ne p2, v0, :cond_2

    .line 1128
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    goto :goto_0

    .line 1130
    :cond_2
    invoke-super {p0, p1, p2, p3}, Lco/vine/android/BaseActionBarActivity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onAnimationFinish(ILjava/lang/Object;)V
    .locals 4
    .parameter "id"
    .parameter "tag"

    .prologue
    const/4 v3, 0x0

    .line 1330
    packed-switch p1, :pswitch_data_0

    .line 1352
    .end local p2
    :goto_0
    :pswitch_0
    return-void

    .line 1332
    .restart local p2
    :pswitch_1
    const v1, 0x7f04000e

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1334
    .local v0, fadeOut:Landroid/view/animation/Animation;
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1335
    invoke-virtual {p0, v3}, Lco/vine/android/AbstractRecordingActivity;->hideDrafts(Z)V

    .line 1336
    const-string v1, "PreviewAnimationFinish"

    check-cast p2, Ljava/io/File;

    .end local p2
    invoke-virtual {p0, v1, p2}, Lco/vine/android/AbstractRecordingActivity;->swapFolder(Ljava/lang/String;Ljava/io/File;)V

    .line 1337
    iput-boolean v3, p0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    goto :goto_0

    .line 1341
    .end local v0           #fadeOut:Landroid/view/animation/Animation;
    .restart local p2
    :pswitch_2
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->deleteCurrentDraft()V

    .line 1342
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 1346
    :pswitch_3
    invoke-virtual {p0, v3}, Lco/vine/android/AbstractRecordingActivity;->hideDrafts(Z)V

    .line 1347
    const-string v1, "CameraAnimationFinish"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lco/vine/android/AbstractRecordingActivity;->swapFolder(Ljava/lang/String;Ljava/io/File;)V

    .line 1348
    iput-boolean v3, p0, Lco/vine/android/AbstractRecordingActivity;->mIsGoingToRecord:Z

    goto :goto_0

    .line 1330
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 4

    .prologue
    .line 663
    :try_start_0
    iget v2, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 664
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onBackPressed()V

    .line 695
    :cond_0
    :goto_0
    return-void

    .line 666
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->isDraftsShowing()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 667
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lco/vine/android/AbstractRecordingActivity;->hideDrafts(Z)V

    .line 668
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->releasePlayers()V

    .line 669
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    .line 670
    .local v0, fragment:Lco/vine/android/RecordingFragment;
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->resumeFromDraft()V

    goto :goto_0

    .line 692
    .end local v0           #fragment:Lco/vine/android/RecordingFragment;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 672
    :cond_2
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->currentlyHoldsRecordingFragment()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 673
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    .line 674
    .restart local v0       #fragment:Lco/vine/android/RecordingFragment;
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditing()Z

    move-result v1

    .line 675
    .local v1, isEditing:Z
    if-nez v1, :cond_3

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isSessionModified()Z

    move-result v2

    if-nez v2, :cond_3

    .line 676
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->setDiscardChangesOnStop()V

    .line 677
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onBackPressed()V

    goto :goto_0

    .line 679
    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditingDirty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 680
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->discardEditing()V

    goto :goto_0

    .line 682
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Lco/vine/android/AbstractRecordingActivity;->showUnSavedChangesDialog(ILco/vine/android/RecordingFragment;)V

    goto :goto_0

    .line 686
    .end local v0           #fragment:Lco/vine/android/RecordingFragment;
    .end local v1           #isEditing:Z
    :cond_5
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v2, v2, Lco/vine/android/RecordingPreviewFragment;

    if-eqz v2, :cond_0

    .line 687
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v2, Lco/vine/android/RecordingPreviewFragment;

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v3}, Lco/vine/android/RecordingPreviewFragment;->previewToRecord(Lco/vine/android/AbstractRecordingActivity;Z)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public onCameraSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1087
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1088
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackCameraSwitchPressed(Landroid/view/View;)V

    .line 1089
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/RecordingFragment;->onCameraSwitchPressed(Landroid/view/View;)V

    .line 1091
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 22
    .parameter "savedInstanceState"

    .prologue
    .line 223
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v12

    .line 224
    .local v12, intent:Landroid/content/Intent;
    const/4 v5, 0x0

    .line 225
    .local v5, action:Ljava/lang/String;
    if-eqz v12, :cond_0

    .line 226
    invoke-virtual {v12}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 228
    :cond_0
    const-string v18, "AbstractRecordingActivity {} pid: {}, action tag {}."

    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object p0, v19, v20

    const/16 v20, 0x1

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    aput-object v5, v19, v20

    invoke-static/range {v18 .. v19}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 230
    sget-object v18, Lco/vine/android/AbstractRecordingActivity;->sRunningStances:Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mWeakSelf:Ljava/lang/ref/WeakReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackRecordingStart()V

    .line 234
    const v18, 0x7f030056

    const/16 v19, 0x0

    const/16 v20, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v18

    move/from16 v3, v19

    move/from16 v4, v20

    invoke-super {v0, v1, v2, v3, v4}, Lco/vine/android/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;IZZ)V

    .line 235
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    .line 236
    .local v7, display:Landroid/view/Display;
    invoke-static {v7}, Lco/vine/android/util/Util;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    .line 237
    invoke-static/range {p0 .. p0}, Lco/vine/android/recorder/RecordConfigUtils;->getGenericConfig(Landroid/content/Context;)Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v18

    move-object/from16 v0, v18

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->zoomEnabled:Z

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/AbstractRecordingActivity;->mZoomEnabled:Z

    .line 239
    new-instance v11, Landroid/content/IntentFilter;

    invoke-direct {v11}, Landroid/content/IntentFilter;-><init>()V

    .line 240
    .local v11, filter:Landroid/content/IntentFilter;
    const-string v18, "co.vine.android.session.logout"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 241
    const-string v18, "co.vine.android.session.login"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 243
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v16

    .line 245
    .local v16, rs:Landroid/content/res/Resources;
    if-nez p1, :cond_2

    .line 246
    if-eqz v12, :cond_1

    .line 247
    invoke-virtual {v12}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v10

    .line 248
    .local v10, extras:Landroid/os/Bundle;
    if-eqz v10, :cond_1

    .line 249
    const-string v18, "arg_top_overlay"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v18

    check-cast v18, Landroid/graphics/Bitmap;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mTopOverlay:Landroid/graphics/Bitmap;

    .line 252
    .end local v10           #extras:Landroid/os/Bundle;
    :cond_1
    const/16 v18, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/AbstractRecordingActivity;->toRecord(ZZLco/vine/android/recorder/RecordingFile;)V

    .line 254
    :cond_2
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->resetActiveSession()V

    .line 255
    invoke-static/range {p0 .. p0}, Lco/vine/android/service/VineUploadService;->getClearNotificationsIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 258
    const v18, 0x7f0c0003

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v18

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    const/high16 v19, 0x42c8

    div-float v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    .line 259
    const v18, 0x7f0a012f

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    .line 260
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    move-object/from16 v18, v0

    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setVisibility(I)V

    .line 261
    const v18, 0x7f0a0086

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/support/v4/view/DraftViewPager;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    .line 262
    const v18, 0x7f0a0087

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lco/vine/android/widget/DotIndicators;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDots:Lco/vine/android/widget/DotIndicators;

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/AbstractRecordingActivity;->mPreviewDimen:I

    .line 264
    const v18, 0x7f0a0089

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mPreviewOverlay:Landroid/view/View;

    .line 265
    const v18, 0x7f0a0088

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mProgressOverlay:Landroid/view/View;

    .line 267
    const v18, 0x7f0a0135

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskTop:Landroid/view/View;

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskTop:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mEmptyClicker:Landroid/view/View$OnClickListener;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    const v18, 0x7f0a0136

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskLeft:Landroid/view/View;

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskLeft:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mEmptyClicker:Landroid/view/View$OnClickListener;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    const v18, 0x7f0a0137

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskRight:Landroid/view/View;

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskRight:Landroid/view/View;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mEmptyClicker:Landroid/view/View$OnClickListener;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    const v18, 0x7f0a0134

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskParent:Landroid/view/View;

    .line 274
    const v18, 0x7f0a0138

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    .line 275
    const v18, 0x7f0a0139

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    .line 276
    const v18, 0x7f0a013a

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    .line 277
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    move-object/from16 v18, v0

    new-instance v19, Lco/vine/android/AbstractRecordingActivity$3;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/AbstractRecordingActivity$3;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    move-object/from16 v18, v0

    new-instance v19, Lco/vine/android/AbstractRecordingActivity$4;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lco/vine/android/AbstractRecordingActivity$4;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 316
    const v18, 0x7f0a012e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Lco/vine/android/widget/DragUpToDeleteContainer;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    move-object/from16 v18, v0

    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/widget/DragUpToDeleteContainer;->setVisibility(I)V

    .line 318
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lco/vine/android/widget/DragUpToDeleteContainer;->setInteractionListner(Lco/vine/android/widget/DragUpToDeleteContainer$DragUpListener;)V

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    move-object/from16 v18, v0

    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setVisibility(I)V

    .line 321
    const v18, 0x7f0b001e

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    .line 322
    .local v9, draftProgDimen:I
    const v18, 0x7f0b0042

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v15

    .line 324
    .local v15, progressDimen:I
    add-int v18, v15, v9

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/AbstractRecordingActivity;->mTopMaskHeight:I

    .line 325
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->y:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mTopMaskHeight:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewDimen:I

    move/from16 v20, v0

    add-int v20, v20, v9

    add-int v19, v19, v20

    sub-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/AbstractRecordingActivity;->mBottomMaskHeight:I

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v18, v0

    div-int/lit8 v18, v18, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewDimen:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    sub-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/AbstractRecordingActivity;->mSideMaskWidth:I

    .line 328
    const v18, 0x7f0a0085

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v13

    .line 329
    .local v13, pagerLeftMask:Landroid/view/View;
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    .line 330
    .local v14, params:Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f80

    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    move/from16 v21, v0

    sub-float v20, v20, v21

    const/high16 v21, 0x4000

    div-float v20, v20, v21

    mul-float v19, v19, v20

    add-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    iput v0, v14, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 331
    invoke-virtual {v13, v14}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    if-eqz p1, :cond_5

    .line 334
    const-string v18, "state_fp"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 335
    const-string v18, "state_fp"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    .line 337
    :cond_3
    const-string v18, "first_launch"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 338
    const-string v18, "first_launch"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    .line 346
    :goto_0
    const v18, 0x7f0b001b

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    .line 347
    .local v6, bottomRowDimen:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/support/v4/view/DraftViewPager;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    .line 348
    .local v17, viewPagerLayout:Landroid/view/ViewGroup$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v18, v0

    add-int v18, v18, v15

    add-int v18, v18, v6

    move/from16 v0, v18

    move-object/from16 v1, v17

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/support/v4/view/DraftViewPager;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    const v18, 0x7f0b001b

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    .line 352
    .local v8, dotsHeight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mDots:Lco/vine/android/widget/DotIndicators;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v19, v0

    add-int v19, v19, v15

    div-int/lit8 v20, v8, 0x4

    add-int v19, v19, v20

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Lco/vine/android/widget/DotIndicators;->setY(F)V

    .line 354
    const v18, 0x7f0a0131

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    check-cast v18, Landroid/widget/ImageView;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mLargeThumbnailOverlay:Landroid/widget/ImageView;

    .line 355
    const v18, 0x7f0a0132

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    .line 357
    const v18, 0x7f0a0133

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    .line 358
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    move-object/from16 v18, v0

    const/16 v19, 0x8

    invoke-virtual/range {v18 .. v19}, Landroid/view/View;->setVisibility(I)V

    .line 360
    const v18, 0x7f0a007e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlayImage:Landroid/view/View;

    .line 362
    const v18, 0x7f0a0130

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/AbstractRecordingActivity;->findViewById(I)Landroid/view/View;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mDraftFullMask:Landroid/view/View;

    .line 364
    const v18, 0x7f040015

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mSlowFadeIn:Landroid/view/animation/Animation;

    .line 365
    const v18, 0x7f040015

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mCameraIconFadeIn:Landroid/view/animation/Animation;

    .line 366
    return-void

    .line 340
    .end local v6           #bottomRowDimen:I
    .end local v8           #dotsHeight:I
    .end local v17           #viewPagerLayout:Landroid/view/ViewGroup$LayoutParams;
    :cond_4
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    goto/16 :goto_0

    .line 343
    :cond_5
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 4

    .prologue
    .line 1530
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onDestroy()V

    .line 1532
    :try_start_0
    sget-object v1, Lco/vine/android/AbstractRecordingActivity;->sRunningStances:Ljava/util/HashSet;

    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mWeakSelf:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 1533
    sget-object v1, Lco/vine/android/AbstractRecordingActivity;->sRunningStances:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 1534
    const-string v1, "Clean up folders because we are the last one."

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 1535
    invoke-static {p0}, Lco/vine/android/recorder/RecordSessionManager;->getInstance(Landroid/content/Context;)Lco/vine/android/recorder/RecordSessionManager;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSessionManager;->cleanUnusedFolders()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1542
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    .line 1543
    const-string v1, "AbstractRecordingActivity {} Destroyed."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1544
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackRecordingDestroy()V

    .line 1545
    return-void

    .line 1537
    :cond_0
    :try_start_1
    new-instance v1, Lco/vine/android/VineException;

    const-string v2, "Double instance violation, but it\'s ok."

    invoke-direct {v1, v2}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1539
    :catch_0
    move-exception v0

    .line 1540
    .local v0, e:Ljava/io/IOException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onDialogDone(Landroid/content/DialogInterface;II)V
    .locals 2
    .parameter "dialog"
    .parameter "id"
    .parameter "which"

    .prologue
    const/4 v1, 0x0

    .line 699
    packed-switch p2, :pswitch_data_0

    .line 755
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 704
    :pswitch_1
    packed-switch p3, :pswitch_data_1

    goto :goto_0

    .line 712
    :pswitch_2
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->showCurrentFragment()V

    .line 713
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 714
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    .line 706
    :pswitch_3
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->handleDelete()V

    .line 707
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 708
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    .line 720
    :pswitch_4
    packed-switch p3, :pswitch_data_2

    goto :goto_0

    .line 722
    :pswitch_5
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 723
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->startDrafts(Z)V

    goto :goto_0

    .line 728
    :pswitch_6
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 729
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->startDrafts(Z)V

    goto :goto_0

    .line 737
    :pswitch_7
    packed-switch p3, :pswitch_data_3

    goto :goto_0

    .line 739
    :pswitch_8
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->currentlyHoldsRecordingFragment()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 740
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->setDiscardChangesOnStop()V

    .line 742
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->discardUpload()V

    .line 743
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    goto :goto_0

    .line 747
    :pswitch_9
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->currentlyHoldsRecordingFragment()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 748
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->saveSessionAndQuit()V

    goto :goto_0

    .line 699
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_1
        :pswitch_4
        :pswitch_0
    .end packed-switch

    .line 704
    :pswitch_data_1
    .packed-switch -0x2
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 720
    :pswitch_data_2
    .packed-switch -0x2
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 737
    :pswitch_data_3
    .packed-switch -0x2
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public onFinishPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1081
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1082
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/RecordingFragment;->onFinishPressed(Landroid/view/View;)V

    .line 1084
    :cond_0
    return-void
.end method

.method public onFocusSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1094
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1095
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackFocusSwitchPressed(Landroid/view/View;)V

    .line 1096
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/RecordingFragment;->onFocusSwitchPressed(Landroid/view/View;)V

    .line 1098
    :cond_0
    return-void
.end method

.method public onGhostSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1108
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1109
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackGhostSwitchPressed(Landroid/view/View;)V

    .line 1110
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/RecordingFragment;->onGhostSwitchPressed(Landroid/view/View;)V

    .line 1112
    :cond_0
    return-void
.end method

.method public onGridSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1101
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1102
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackGridSwitchPressed(Landroid/view/View;)V

    .line 1103
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->onGridSwitchPressed()V

    .line 1105
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 7
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/16 v6, 0xa8

    const/16 v5, 0x19

    const/16 v4, 0x18

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1165
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->isSecretModeOn:Z

    if-nez v0, :cond_6

    .line 1166
    sget-object v0, Lco/vine/android/AbstractRecordingActivity;->SECRETS:[I

    iget v3, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    aget v0, v0, v3

    if-ne p1, v0, :cond_3

    .line 1167
    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    .line 1168
    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    sget-object v3, Lco/vine/android/AbstractRecordingActivity;->SECRETS:[I

    array-length v3, v3

    if-ne v0, v3, :cond_0

    .line 1169
    iput-boolean v2, p0, Lco/vine/android/AbstractRecordingActivity;->isSecretModeOn:Z

    .line 1170
    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    .line 1171
    const-string v0, "Secret mode enabled."

    invoke-static {p0, v0}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1176
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->isDraftsShowing()Z

    move-result v0

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mZoomEnabled:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    if-nez v0, :cond_5

    if-eq p1, v5, :cond_1

    if-eq p1, v4, :cond_1

    if-eq p1, v6, :cond_1

    const/16 v0, 0xa9

    if-ne p1, v0, :cond_5

    :cond_1
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_5

    .line 1181
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditing()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1182
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    if-ne p1, v4, :cond_2

    move v1, v2

    :cond_2
    invoke-virtual {v0, v1}, Lco/vine/android/RecordingFragment;->modifyZoom(Z)V

    .line 1209
    :goto_1
    return v2

    .line 1174
    :cond_3
    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSecret:I

    goto :goto_0

    .line 1185
    :cond_4
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseActionBarActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_1

    .line 1188
    :cond_5
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseActionBarActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_1

    .line 1191
    :cond_6
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->isDraftsShowing()Z

    move-result v0

    if-nez v0, :cond_a

    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    if-nez v0, :cond_a

    if-eq p1, v5, :cond_7

    if-eq p1, v4, :cond_7

    if-eq p1, v6, :cond_7

    const/16 v0, 0xa9

    if-ne p1, v0, :cond_a

    :cond_7
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_a

    .line 1196
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 1197
    if-ne p1, v5, :cond_8

    .line 1198
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->doOneFrame()V

    goto :goto_1

    .line 1200
    :cond_8
    iput v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSteadyCount:I

    .line 1201
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->doStopMotion()V

    goto :goto_1

    .line 1204
    :cond_9
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Reversed."

    invoke-static {v0, v1}, Lco/vine/android/util/Util;->showCenteredToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1205
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->reverseFrames()V

    goto :goto_1

    .line 1209
    :cond_a
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseActionBarActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto :goto_1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 1147
    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->isSecretModeOn:Z

    if-nez v0, :cond_1

    .line 1148
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->isDraftsShowing()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lco/vine/android/AbstractRecordingActivity;->mZoomEnabled:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    if-nez v0, :cond_1

    const/16 v0, 0x19

    if-eq p1, v0, :cond_0

    const/16 v0, 0x18

    if-eq p1, v0, :cond_0

    const/16 v0, 0xa8

    if-eq p1, v0, :cond_0

    const/16 v0, 0xa9

    if-ne p1, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_1

    .line 1154
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isEditing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1156
    const/4 v0, 0x1

    .line 1160
    :goto_0
    return v0

    :cond_1
    invoke-super {p0, p1, p2}, Lco/vine/android/BaseActionBarActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1
    .parameter "i"

    .prologue
    .line 605
    iput p1, p0, Lco/vine/android/AbstractRecordingActivity;->mPageScrollState:I

    .line 606
    if-nez p1, :cond_0

    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnPageIdleRunnable:Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

    if-eqz v0, :cond_0

    .line 607
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnPageIdleRunnable:Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

    invoke-virtual {v0}, Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;->run()V

    .line 608
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mOnPageIdleRunnable:Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

    .line 610
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .parameter "i"
    .parameter "v"
    .parameter "i2"

    .prologue
    .line 395
    return-void
.end method

.method public onPageSelected(I)V
    .locals 14
    .parameter "i"

    .prologue
    const/4 v13, 0x0

    const/4 v9, 0x1

    const/4 v12, -0x1

    const/4 v10, 0x0

    .line 498
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    if-eqz v11, :cond_2

    .line 499
    const/4 v2, 0x0

    .line 500
    .local v2, fragmentToSetSelectedFalse:Lco/vine/android/DraftFragment;
    const/4 v3, 0x0

    .line 501
    .local v3, fragmentToSetSelectedTrue:Lco/vine/android/DraftFragment;
    iget v11, p0, Lco/vine/android/AbstractRecordingActivity;->mPageScrollState:I

    if-nez v11, :cond_3

    move v4, v9

    .line 502
    .local v4, isPageStateIdle:Z
    :goto_0
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 503
    .local v5, numDrafts:I
    if-ne p1, v12, :cond_5

    .line 507
    iget v9, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-gt v9, v5, :cond_0

    .line 508
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v11, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v9, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 509
    .local v1, fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v1, :cond_0

    .line 510
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/vine/android/DraftFragment;

    .line 511
    .local v7, ref:Lco/vine/android/DraftFragment;
    if-eqz v7, :cond_0

    .line 512
    if-eqz v4, :cond_4

    .line 513
    invoke-virtual {v7, v10}, Lco/vine/android/DraftFragment;->setSelected(Z)V

    .line 597
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v7           #ref:Lco/vine/android/DraftFragment;
    :cond_0
    :goto_1
    if-nez v2, :cond_1

    if-eqz v3, :cond_2

    .line 598
    :cond_1
    new-instance v9, Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

    invoke-direct {v9, p0, v2, v3}, Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;-><init>(Lco/vine/android/AbstractRecordingActivity;Lco/vine/android/DraftFragment;Lco/vine/android/DraftFragment;)V

    iput-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mOnPageIdleRunnable:Lco/vine/android/AbstractRecordingActivity$SetSelectedRunnable;

    .line 601
    .end local v2           #fragmentToSetSelectedFalse:Lco/vine/android/DraftFragment;
    .end local v3           #fragmentToSetSelectedTrue:Lco/vine/android/DraftFragment;
    .end local v4           #isPageStateIdle:Z
    .end local v5           #numDrafts:I
    :cond_2
    return-void

    .restart local v2       #fragmentToSetSelectedFalse:Lco/vine/android/DraftFragment;
    .restart local v3       #fragmentToSetSelectedTrue:Lco/vine/android/DraftFragment;
    :cond_3
    move v4, v10

    .line 501
    goto :goto_0

    .line 515
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .restart local v4       #isPageStateIdle:Z
    .restart local v5       #numDrafts:I
    .restart local v7       #ref:Lco/vine/android/DraftFragment;
    :cond_4
    move-object v2, v7

    goto :goto_1

    .line 521
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v7           #ref:Lco/vine/android/DraftFragment;
    :cond_5
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDots:Lco/vine/android/widget/DotIndicators;

    invoke-virtual {v11, p1}, Lco/vine/android/widget/DotIndicators;->setActiveDot(I)V

    .line 522
    if-ge p1, v5, :cond_c

    .line 523
    iget v11, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-eq v11, v12, :cond_6

    .line 524
    iget v11, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-gt v11, v5, :cond_6

    .line 525
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v12, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v11, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 526
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v1, :cond_6

    .line 527
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/vine/android/DraftFragment;

    .line 528
    .restart local v7       #ref:Lco/vine/android/DraftFragment;
    if-eqz v7, :cond_6

    .line 529
    if-eqz v4, :cond_a

    .line 530
    invoke-virtual {v7, v10}, Lco/vine/android/DraftFragment;->setSelected(Z)V

    .line 538
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v7           #ref:Lco/vine/android/DraftFragment;
    :cond_6
    :goto_2
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v11, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 539
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v1, :cond_9

    .line 540
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/vine/android/DraftFragment;

    .line 541
    .restart local v7       #ref:Lco/vine/android/DraftFragment;
    if-eqz v7, :cond_9

    .line 542
    invoke-virtual {v7}, Lco/vine/android/DraftFragment;->getView()Landroid/view/View;

    move-result-object v0

    .line 543
    .local v0, fragView:Landroid/view/View;
    if-eqz v0, :cond_9

    .line 544
    const v11, 0x7f0a0080

    invoke-virtual {v0, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    .line 545
    .local v8, toSet:Landroid/view/View;
    if-eqz v8, :cond_9

    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    if-eqz v11, :cond_9

    .line 546
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    iget-object v12, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v12}, Landroid/support/v4/view/DraftViewPager;->getLeftOfSelectedFragment()I

    move-result v12

    invoke-virtual {v11, v8, v12}, Lco/vine/android/widget/DragUpToDeleteContainer;->setView(Landroid/view/View;I)V

    .line 547
    iget-boolean v11, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    if-eqz v11, :cond_7

    if-ge p1, v5, :cond_8

    .line 548
    :cond_7
    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v11, v10}, Landroid/view/View;->setVisibility(I)V

    .line 549
    iget-object v10, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v10

    const/high16 v11, 0x3f80

    invoke-virtual {v10, v11}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 551
    :cond_8
    iget-object v10, p0, Lco/vine/android/AbstractRecordingActivity;->mHandler:Landroid/os/Handler;

    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mOnResumeDraftRunnable:Ljava/lang/Runnable;

    invoke-virtual {v10, v11}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 552
    iget v10, p0, Lco/vine/android/AbstractRecordingActivity;->mPageScrollState:I

    if-nez v10, :cond_b

    .line 553
    invoke-virtual {v7, v9}, Lco/vine/android/DraftFragment;->setSelected(Z)V

    .line 561
    .end local v0           #fragView:Landroid/view/View;
    .end local v7           #ref:Lco/vine/android/DraftFragment;
    .end local v8           #toSet:Landroid/view/View;
    :cond_9
    :goto_3
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mSessions:Ljava/util/ArrayList;

    invoke-virtual {v9, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    iput-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    .line 595
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    :goto_4
    iput p1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    goto/16 :goto_1

    .line 532
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .restart local v7       #ref:Lco/vine/android/DraftFragment;
    :cond_a
    move-object v2, v7

    goto :goto_2

    .line 555
    .restart local v0       #fragView:Landroid/view/View;
    .restart local v8       #toSet:Landroid/view/View;
    :cond_b
    move-object v3, v7

    goto :goto_3

    .line 563
    .end local v0           #fragView:Landroid/view/View;
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v7           #ref:Lco/vine/android/DraftFragment;
    .end local v8           #toSet:Landroid/view/View;
    :cond_c
    iget v9, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    if-eq v9, v12, :cond_d

    .line 564
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v11, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v9, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 565
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v1, :cond_10

    .line 566
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/DraftFragment;

    .line 567
    .local v6, prev:Lco/vine/android/DraftFragment;
    if-eqz v6, :cond_d

    .line 568
    if-eqz v4, :cond_f

    .line 569
    invoke-virtual {v6, v10}, Lco/vine/android/DraftFragment;->setSelected(Z)V

    .line 579
    .end local v1           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v6           #prev:Lco/vine/android/DraftFragment;
    :cond_d
    :goto_5
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraFragment:Ljava/lang/ref/WeakReference;

    if-eqz v9, :cond_e

    .line 580
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mCameraFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/vine/android/DraftCameraPreviewFragment;

    .line 581
    .local v7, ref:Lco/vine/android/DraftCameraPreviewFragment;
    if-eqz v7, :cond_e

    .line 582
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mHandler:Landroid/os/Handler;

    iget-object v10, p0, Lco/vine/android/AbstractRecordingActivity;->mOnResumeDraftRunnable:Ljava/lang/Runnable;

    invoke-virtual {v9, v10}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 585
    .end local v7           #ref:Lco/vine/android/DraftCameraPreviewFragment;
    :cond_e
    iput-object v13, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentSession:Lco/vine/android/recorder/RecordSessionManager$RecordSessionInfo;

    .line 586
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    iget-object v10, p0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    invoke-virtual {v10}, Landroid/support/v4/view/DraftViewPager;->getLeftOfSelectedFragment()I

    move-result v10

    invoke-virtual {v9, v13, v10}, Lco/vine/android/widget/DragUpToDeleteContainer;->setView(Landroid/view/View;I)V

    .line 587
    iget-object v9, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    new-instance v10, Lco/vine/android/AbstractRecordingActivity$5;

    invoke-direct {v10, p0}, Lco/vine/android/AbstractRecordingActivity$5;-><init>(Lco/vine/android/AbstractRecordingActivity;)V

    invoke-virtual {v9, v10}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_4

    .line 571
    .restart local v1       #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .restart local v6       #prev:Lco/vine/android/DraftFragment;
    :cond_f
    move-object v2, v6

    goto :goto_5

    .line 576
    .end local v6           #prev:Lco/vine/android/DraftFragment;
    :cond_10
    const-string v9, "Fragment {} is null: size: {}."

    iget v10, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    iget-object v11, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v11}, Landroid/util/SparseArray;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_5
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 375
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onPause()V

    .line 376
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    invoke-virtual {v0}, Lco/vine/android/widgets/PromptDialogFragment;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    invoke-virtual {v0}, Lco/vine/android/widgets/PromptDialogFragment;->dismiss()V

    .line 379
    :cond_0
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->releasePlayers()V

    .line 380
    return-void
.end method

.method public onRecorderBackPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 645
    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->onBackPressed()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 649
    :goto_0
    return-void

    .line 646
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 370
    invoke-super {p0}, Lco/vine/android/BaseActionBarActivity;->onResume()V

    .line 371
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 388
    invoke-super {p0, p1}, Lco/vine/android/BaseActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 389
    const-string v0, "state_fp"

    iget-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 390
    const-string v0, "first_launch"

    iget-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstDraftLaunch:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 391
    return-void
.end method

.method public onSessionSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1115
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v0, v0, Lco/vine/android/RecordingFragment;

    if-eqz v0, :cond_0

    .line 1116
    invoke-static {p1}, Lco/vine/android/util/FlurryUtils;->trackSessionSwitchPressed(Landroid/view/View;)V

    .line 1117
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    invoke-virtual {v0, p1}, Lco/vine/android/RecordingFragment;->onSessionSwitchPressed(Landroid/view/View;)V

    .line 1119
    :cond_0
    return-void
.end method

.method public preSetContentView()V
    .locals 1

    .prologue
    .line 215
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasCamera()Z

    move-result v0

    if-nez v0, :cond_0

    .line 216
    invoke-static {p0}, Lco/vine/android/util/Util;->showNoCameraToast(Landroid/content/Context;)V

    .line 217
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->finish()V

    .line 219
    :cond_0
    return-void
.end method

.method public prepareForPickup()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 399
    iget-boolean v3, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    if-nez v3, :cond_0

    .line 400
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    iget v4, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    invoke-virtual {v3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 401
    .local v0, fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    if-eqz v0, :cond_0

    .line 402
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/DraftFragment;

    .line 403
    .local v1, ref:Lco/vine/android/DraftFragment;
    iput-boolean v2, v1, Lco/vine/android/DraftFragment;->mCanUnhide:Z

    .line 404
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->pausePlayer()V

    .line 405
    invoke-virtual {v1}, Lco/vine/android/DraftFragment;->showImage()V

    .line 408
    .end local v0           #fragment:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Lco/vine/android/DraftFragment;>;"
    .end local v1           #ref:Lco/vine/android/DraftFragment;
    :cond_0
    iget-boolean v3, p0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    if-nez v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public declared-synchronized releaseOtherPlayers(Lco/vine/android/player/SdkVideoView;)V
    .locals 3
    .parameter "videoView"

    .prologue
    .line 1359
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mVideoViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/player/SdkVideoView;

    .line 1360
    .local v1, v:Lco/vine/android/player/SdkVideoView;
    if-eq v1, p1, :cond_0

    .line 1361
    invoke-virtual {v1}, Lco/vine/android/player/SdkVideoView;->suspend()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1359
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #v:Lco/vine/android/player/SdkVideoView;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1364
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    iget-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mVideoViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1365
    monitor-exit p0

    return-void
.end method

.method public setWaitingForLogin(Z)V
    .locals 0
    .parameter "waiting"

    .prologue
    .line 1705
    iput-boolean p1, p0, Lco/vine/android/AbstractRecordingActivity;->mWaitingForLogin:Z

    .line 1706
    return-void
.end method

.method public showDeleteDialog()V
    .locals 2

    .prologue
    .line 1482
    const/4 v1, 0x1

    invoke-static {v1}, Lco/vine/android/widgets/PromptDialogFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogFragment;

    move-result-object v0

    .line 1484
    .local v0, p:Lco/vine/android/widgets/PromptDialogFragment;
    invoke-virtual {v0, p0}, Lco/vine/android/widgets/PromptDialogFragment;->setListener(Lco/vine/android/widgets/PromptDialogFragment$OnDialogDoneListener;)V

    .line 1485
    const v1, 0x7f0e0091

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 1486
    const v1, 0x7f0e0092

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 1487
    const v1, 0x7f0e0052

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 1488
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->show(Landroid/app/FragmentManager;)V

    .line 1489
    return-void
.end method

.method public showDrafts(Ljava/lang/String;)V
    .locals 29
    .parameter "sessionId"

    .prologue
    .line 816
    :try_start_0
    const-string v2, "Started showing drafts."

    invoke-static {v2}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 817
    const-string v2, "camera_preview"

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    .line 818
    .local v21, goToCamera:Z
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lco/vine/android/AbstractRecordingActivity;->mAnimatingIntoDrafts:Z

    .line 819
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/AbstractRecordingActivity;->mStartSessionId:Ljava/lang/String;

    .line 820
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    .line 821
    invoke-static/range {p0 .. p0}, Lco/vine/android/recorder/RecordSessionManager;->getValidSessions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lco/vine/android/AbstractRecordingActivity;->reload(Ljava/util/ArrayList;)V

    .line 822
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftFullMask:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 823
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskParent:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 824
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlayImage:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 826
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    .line 827
    .local v25, r:Landroid/content/res/Resources;
    const v2, 0x7f0b0042

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v24

    .line 828
    .local v24, progressDimen:I
    const v2, 0x7f0b001e

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v18

    .line 831
    .local v18, draftProgressDimen:I
    move-object/from16 v0, p0

    iget v0, v0, Lco/vine/android/AbstractRecordingActivity;->mTopMaskHeight:I

    move/from16 v28, v0

    .line 832
    .local v28, topMaskHeight:I
    if-eqz v21, :cond_0

    .line 833
    add-int v28, v28, v18

    .line 836
    :cond_0
    if-nez v21, :cond_4

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v2, v2, Lco/vine/android/RecordingFragment;

    if-eqz v2, :cond_4

    .line 837
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/AbstractRecordingActivity;->mLargeThumbnailOverlay:Landroid/widget/ImageView;

    move-object/from16 v26, v0

    .line 839
    .local v26, thumb:Landroid/widget/ImageView;
    invoke-virtual/range {v26 .. v26}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v27

    check-cast v27, Landroid/widget/RelativeLayout$LayoutParams;

    .line 841
    .local v27, thumbnailParams:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v27

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 842
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v27

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 843
    const/4 v2, 0x0

    move-object/from16 v0, v27

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 844
    move/from16 v0, v24

    move-object/from16 v1, v27

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 845
    invoke-virtual/range {v26 .. v27}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 847
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v2, Lco/vine/android/RecordingFragment;

    invoke-virtual {v2}, Lco/vine/android/RecordingFragment;->getThumbnailPath()Ljava/lang/String;

    move-result-object v23

    .line 848
    .local v23, path:Ljava/lang/String;
    new-instance v19, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-direct {v0, v2, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Ljava/lang/String;)V

    .line 849
    .local v19, drawable:Landroid/graphics/drawable/BitmapDrawable;
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lco/vine/android/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 850
    const/4 v2, 0x0

    move-object/from16 v0, v26

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 863
    .end local v19           #drawable:Landroid/graphics/drawable/BitmapDrawable;
    .end local v23           #path:Ljava/lang/String;
    .end local v26           #thumb:Landroid/widget/ImageView;
    .end local v27           #thumbnailParams:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mViewPager:Landroid/support/v4/view/DraftViewPager;

    new-instance v4, Lco/vine/android/AbstractRecordingActivity$8;

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v4, v0, v1}, Lco/vine/android/AbstractRecordingActivity$8;-><init>(Lco/vine/android/AbstractRecordingActivity;Z)V

    invoke-virtual {v2, v4}, Landroid/support/v4/view/DraftViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 876
    new-instance v17, Landroid/view/animation/AnimationSet;

    const/4 v2, 0x1

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 877
    .local v17, as:Landroid/view/animation/AnimationSet;
    sget-object v2, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_HEIGHT:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskTop:Landroid/view/View;

    move/from16 v0, v28

    invoke-static {v2, v4, v0}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 879
    sget-object v2, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskLeft:Landroid/view/View;

    move-object/from16 v0, p0

    iget v5, v0, Lco/vine/android/AbstractRecordingActivity;->mSideMaskWidth:I

    invoke-static {v2, v4, v5}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 881
    sget-object v2, Lco/vine/android/util/ViewUtil$ResizeAnimationType;->EXPAND_WIDTH:Lco/vine/android/util/ViewUtil$ResizeAnimationType;

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftMaskRight:Landroid/view/View;

    move-object/from16 v0, p0

    iget v5, v0, Lco/vine/android/AbstractRecordingActivity;->mSideMaskWidth:I

    invoke-static {v2, v4, v5}, Lco/vine/android/util/ViewUtil;->makeResizeAnimation(Lco/vine/android/util/ViewUtil$ResizeAnimationType;Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 884
    new-instance v2, Lco/vine/android/AbstractRecordingActivity$9;

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v2, v0, v1}, Lco/vine/android/AbstractRecordingActivity$9;-><init>(Lco/vine/android/AbstractRecordingActivity;Z)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 959
    const-wide/16 v4, 0x12c

    move-object/from16 v0, v17

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 960
    invoke-direct/range {p0 .. p0}, Lco/vine/android/AbstractRecordingActivity;->setCurrentSession()Z

    .line 961
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mDragUpToDeleteView:Lco/vine/android/widget/DragUpToDeleteContainer;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lco/vine/android/widget/DragUpToDeleteContainer;->setVisibility(I)V

    .line 963
    if-nez v21, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v2, v2, Lco/vine/android/RecordingFragment;

    if-eqz v2, :cond_3

    .line 964
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v2, Lco/vine/android/RecordingFragment;

    invoke-virtual {v2}, Lco/vine/android/RecordingFragment;->getProgressView()Landroid/view/View;

    move-result-object v3

    .line 965
    .local v3, progress:Landroid/view/View;
    if-eqz v3, :cond_2

    .line 966
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v7}, Lco/vine/android/util/FloatingViewUtils;->buildFloatingViewFor(Landroid/content/Context;Landroid/view/View;Landroid/view/View;III)Landroid/graphics/Bitmap;

    .line 969
    :cond_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 972
    .end local v3           #progress:Landroid/view/View;
    :cond_3
    if-eqz v21, :cond_5

    .line 973
    new-instance v4, Lco/vine/android/animation/MoveResizeAnimator;

    const/4 v5, 0x7

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/high16 v8, 0x3f80

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    sub-float/2addr v8, v9

    mul-float/2addr v2, v8

    const/high16 v8, 0x4000

    div-float/2addr v2, v8

    float-to-int v8, v2

    mul-int/lit8 v2, v18, 0x2

    add-int v9, v24, v2

    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    float-to-double v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    float-to-double v12, v2

    const/16 v14, 0x12c

    const/16 v16, 0x0

    move-object/from16 v15, p0

    invoke-direct/range {v4 .. v16}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lco/vine/android/animation/MoveResizeAnimator;->start()V

    .line 993
    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mDraftRoot:Landroid/view/View;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 999
    .end local v17           #as:Landroid/view/animation/AnimationSet;
    .end local v18           #draftProgressDimen:I
    .end local v21           #goToCamera:Z
    .end local v24           #progressDimen:I
    .end local v25           #r:Landroid/content/res/Resources;
    .end local v28           #topMaskHeight:I
    :goto_2
    return-void

    .line 851
    .restart local v18       #draftProgressDimen:I
    .restart local v21       #goToCamera:Z
    .restart local v24       #progressDimen:I
    .restart local v25       #r:Landroid/content/res/Resources;
    .restart local v28       #topMaskHeight:I
    :cond_4
    if-eqz v21, :cond_1

    .line 852
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 853
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    check-cast v22, Landroid/widget/RelativeLayout$LayoutParams;

    .line 855
    .local v22, iconParams:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v22

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 856
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v22

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 857
    move/from16 v0, v24

    move-object/from16 v1, v22

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 858
    const/4 v2, 0x0

    move-object/from16 v0, v22

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 859
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mCameraIconOverlay:Landroid/view/View;

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 994
    .end local v18           #draftProgressDimen:I
    .end local v21           #goToCamera:Z
    .end local v22           #iconParams:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v24           #progressDimen:I
    .end local v25           #r:Landroid/content/res/Resources;
    .end local v28           #topMaskHeight:I
    :catch_0
    move-exception v20

    .line 995
    .local v20, e:Ljava/io/IOException;
    const-string v2, "Error refresh reloading drafts."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v20

    invoke-static {v0, v2, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    .line 980
    .end local v20           #e:Ljava/io/IOException;
    .restart local v17       #as:Landroid/view/animation/AnimationSet;
    .restart local v18       #draftProgressDimen:I
    .restart local v21       #goToCamera:Z
    .restart local v24       #progressDimen:I
    .restart local v25       #r:Landroid/content/res/Resources;
    .restart local v28       #topMaskHeight:I
    :cond_5
    :try_start_1
    new-instance v4, Lco/vine/android/animation/MoveResizeAnimator;

    const/4 v5, 0x6

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/AbstractRecordingActivity;->mAnimationPreviewOverlay:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/high16 v8, 0x3f80

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    sub-float/2addr v8, v9

    mul-float/2addr v2, v8

    const/high16 v8, 0x4000

    div-float/2addr v2, v8

    float-to-int v8, v2

    add-int v9, v24, v18

    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    float-to-double v10, v2

    const-wide/high16 v12, 0x3fe0

    const/16 v14, 0x12c

    const/16 v16, 0x0

    move-object/from16 v15, p0

    invoke-direct/range {v4 .. v16}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lco/vine/android/animation/MoveResizeAnimator;->start()V

    .line 986
    new-instance v4, Lco/vine/android/animation/MoveResizeAnimator;

    const/4 v5, 0x5

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/AbstractRecordingActivity;->mLargeThumbnailOverlay:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v7, v0, Lco/vine/android/AbstractRecordingActivity;->mLargeThumbnailOverlay:Landroid/widget/ImageView;

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    const/high16 v8, 0x3f80

    move-object/from16 v0, p0

    iget v9, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    sub-float/2addr v8, v9

    mul-float/2addr v2, v8

    const/high16 v8, 0x4000

    div-float/2addr v2, v8

    float-to-int v8, v2

    mul-int/lit8 v2, v18, 0x2

    add-int v9, v24, v2

    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    float-to-double v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lco/vine/android/AbstractRecordingActivity;->mPreviewRatio:F

    float-to-double v12, v2

    const/16 v14, 0x12c

    const/16 v16, 0x0

    move-object/from16 v15, p0

    invoke-direct/range {v4 .. v16}, Lco/vine/android/animation/MoveResizeAnimator;-><init>(ILandroid/view/View;Landroid/view/View;IIDDILco/vine/android/animation/SmoothAnimator$AnimationListener;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lco/vine/android/animation/MoveResizeAnimator;->start()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 996
    .end local v17           #as:Landroid/view/animation/AnimationSet;
    .end local v18           #draftProgressDimen:I
    .end local v21           #goToCamera:Z
    .end local v24           #progressDimen:I
    .end local v25           #r:Landroid/content/res/Resources;
    .end local v28           #topMaskHeight:I
    :catch_1
    move-exception v20

    .line 997
    .local v20, e:Ljava/lang/Exception;
    const-string v2, "Error showing reloading drafts."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v20

    invoke-static {v0, v2, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_2
.end method

.method public showUnSavedChangesDialog(ILco/vine/android/RecordingFragment;)V
    .locals 2
    .parameter "dialogId"
    .parameter "fragment"

    .prologue
    .line 652
    invoke-static {p1}, Lco/vine/android/widgets/PromptDialogFragment;->newInstance(I)Lco/vine/android/widgets/PromptDialogFragment;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    .line 653
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    invoke-virtual {p2}, Lco/vine/android/RecordingFragment;->isSavedSession()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0e014c

    :goto_0
    invoke-virtual {v1, v0}, Lco/vine/android/widgets/PromptDialogFragment;->setMessage(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 655
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    const v1, 0x7f0e0149

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->setPositiveButton(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 656
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    const v1, 0x7f0e0097

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->setNegativeButton(I)Lco/vine/android/widgets/PromptDialogFragment;

    .line 657
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mPromptDialog:Lco/vine/android/widgets/PromptDialogFragment;

    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/vine/android/widgets/PromptDialogFragment;->show(Landroid/app/FragmentManager;)V

    .line 658
    return-void

    .line 653
    :cond_0
    const v0, 0x7f0e014b

    goto :goto_0
.end method

.method public swapFolder(Ljava/lang/String;Ljava/io/File;)V
    .locals 2
    .parameter "tag"
    .parameter "folder"

    .prologue
    .line 1030
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v1, v1, Lco/vine/android/RecordingFragment;

    if-eqz v1, :cond_0

    .line 1031
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    check-cast v0, Lco/vine/android/RecordingFragment;

    .line 1032
    .local v0, rf:Lco/vine/android/RecordingFragment;
    invoke-virtual {v0}, Lco/vine/android/RecordingFragment;->isResuming()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1033
    invoke-virtual {v0, p1, p2}, Lco/vine/android/RecordingFragment;->swapFolder(Ljava/lang/String;Ljava/io/File;)V

    .line 1036
    .end local v0           #rf:Lco/vine/android/RecordingFragment;
    :cond_0
    return-void
.end method

.method public toPreview(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;)V
    .locals 8
    .parameter "source"
    .parameter "finalFile"
    .parameter "thumbNailPath"

    .prologue
    const/4 v7, 0x1

    .line 1039
    const-string v4, "From {} to preview fragment: {} {}"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    aput-object p2, v5, v7

    const/4 v6, 0x2

    aput-object p3, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1040
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    iget v5, p0, Lco/vine/android/AbstractRecordingActivity;->mRegularUiMode:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1042
    :try_start_0
    iget-object v4, p2, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 1043
    .local v3, reference:Ljava/lang/String;
    invoke-static {p0, v3}, Lco/vine/android/util/UploadManager;->getReferenceCursor(Landroid/content/Context;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 1044
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1045
    const-string v4, "User have edited the vine already, discard until new one comes in."

    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 1046
    const/4 v4, 0x1

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lco/vine/android/service/VineUploadService;->getDiscardIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {p0, v4}, Lco/vine/android/AbstractRecordingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1049
    :cond_0
    if-eqz v0, :cond_1

    .line 1050
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1055
    .end local v0           #cursor:Landroid/database/Cursor;
    .end local v3           #reference:Ljava/lang/String;
    :cond_1
    :goto_0
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1057
    :try_start_1
    iget-object v4, p2, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, p2, p3, v4}, Lco/vine/android/util/UploadManager;->addToUploadQueue(Landroid/content/Context;Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mUploadFile:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1064
    :cond_2
    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    instance-of v4, v4, Lco/vine/android/RecordingFragment;

    if-eqz v4, :cond_3

    .line 1065
    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v4}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 1068
    :cond_3
    invoke-virtual {p0, p2, p3}, Lco/vine/android/AbstractRecordingActivity;->createRecordingPreviewFragment(Lco/vine/android/recorder/RecordingFile;Ljava/lang/String;)Lco/vine/android/RecordingPreviewFragment;

    move-result-object v2

    .line 1070
    .local v2, fragment:Lco/vine/android/RecordingPreviewFragment;
    invoke-virtual {v2, p2}, Lco/vine/android/RecordingPreviewFragment;->setFinalFile(Lco/vine/android/recorder/RecordingFile;)V

    .line 1071
    iput v7, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    .line 1072
    iput-boolean v7, p0, Lco/vine/android/AbstractRecordingActivity;->mHasPreviewedAlready:Z

    .line 1073
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    const v5, 0x7f0a00a1

    invoke-virtual {v4, v5, v2}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 1077
    iput-object v2, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    .line 1078
    return-void

    .line 1052
    .end local v2           #fragment:Lco/vine/android/RecordingPreviewFragment;
    :catch_0
    move-exception v1

    .line 1053
    .local v1, e:Ljava/lang/Exception;
    const-string v4, "Failed to delete previous vines."

    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1060
    .end local v1           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 1061
    .restart local v1       #e:Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public toRecord(ZZLco/vine/android/recorder/RecordingFile;)V
    .locals 10
    .parameter "isNew"
    .parameter "startWithEdit"
    .parameter "fileToUse"

    .prologue
    const v9, 0x7f0a00a1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1002
    iput v5, p0, Lco/vine/android/AbstractRecordingActivity;->mStep:I

    .line 1003
    iput-boolean v5, p0, Lco/vine/android/AbstractRecordingActivity;->mFirstPageSet:Z

    .line 1004
    const/4 v6, -0x1

    invoke-virtual {p0, v6}, Lco/vine/android/AbstractRecordingActivity;->onPageSelected(I)V

    .line 1005
    if-eqz p3, :cond_2

    move v2, v4

    .line 1006
    .local v2, fromPreview:Z
    :goto_0
    const-string v6, "To recording fragment: {} {} {}"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v4

    const/4 v8, 0x2

    if-eqz p3, :cond_0

    move v5, v4

    :cond_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v7, v8

    invoke-static {v6, v7}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1007
    if-eqz v2, :cond_1

    .line 1008
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->discardUpload()V

    .line 1010
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->createRecordingFragment()Lco/vine/android/RecordingFragment;

    move-result-object v1

    .line 1011
    .local v1, fragment:Lco/vine/android/RecordingFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1012
    .local v0, args:Landroid/os/Bundle;
    const-string v5, "arg_top_overlay"

    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mTopOverlay:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1013
    const-string v5, "screen_size"

    iget-object v6, p0, Lco/vine/android/AbstractRecordingActivity;->mScreenSize:Landroid/graphics/Point;

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 1014
    invoke-virtual {v1, v0}, Lco/vine/android/RecordingFragment;->setArguments(Landroid/os/Bundle;)V

    .line 1015
    invoke-virtual {v1, p3}, Lco/vine/android/RecordingFragment;->setFileFileToUse(Lco/vine/android/recorder/RecordingFile;)V

    .line 1016
    invoke-virtual {v1, p2}, Lco/vine/android/RecordingFragment;->setStartWithEdit(Z)V

    .line 1017
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v3

    .line 1018
    .local v3, ft:Landroid/support/v4/app/FragmentTransaction;
    if-eqz p1, :cond_3

    .line 1019
    invoke-virtual {v3, v9, v1}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 1023
    :goto_1
    invoke-virtual {v3}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 1024
    iput-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentFragment:Landroid/support/v4/app/Fragment;

    .line 1025
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v5

    iput v5, p0, Lco/vine/android/AbstractRecordingActivity;->mRegularUiMode:I

    .line 1026
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1027
    return-void

    .end local v0           #args:Landroid/os/Bundle;
    .end local v1           #fragment:Lco/vine/android/RecordingFragment;
    .end local v2           #fromPreview:Z
    .end local v3           #ft:Landroid/support/v4/app/FragmentTransaction;
    :cond_2
    move v2, v5

    .line 1005
    goto :goto_0

    .line 1021
    .restart local v0       #args:Landroid/os/Bundle;
    .restart local v1       #fragment:Lco/vine/android/RecordingFragment;
    .restart local v2       #fromPreview:Z
    .restart local v3       #ft:Landroid/support/v4/app/FragmentTransaction;
    :cond_3
    invoke-virtual {v3, v9, v1}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_1
.end method

.method public viewDestroyFinished()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 418
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 419
    iget-object v0, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 420
    return-void
.end method

.method public viewDropped(I)Z
    .locals 5
    .parameter "viewTopY"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 446
    if-gtz p1, :cond_0

    move v0, v1

    .line 447
    .local v0, delete:Z
    :goto_0
    if-eqz v0, :cond_1

    iget v3, p0, Lco/vine/android/AbstractRecordingActivity;->mCurrentPage:I

    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftFragments:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 448
    iput-boolean v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDeleteWasDrag:Z

    .line 449
    invoke-virtual {p0}, Lco/vine/android/AbstractRecordingActivity;->showDeleteDialog()V

    .line 453
    :goto_1
    return v0

    .end local v0           #delete:Z
    :cond_0
    move v0, v2

    .line 446
    goto :goto_0

    .line 451
    .restart local v0       #delete:Z
    :cond_1
    iget-object v1, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1
.end method

.method public viewLanded()V
    .locals 0

    .prologue
    .line 458
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->showCurrentFragment()V

    .line 459
    return-void
.end method

.method public viewMoved(I)Z
    .locals 5
    .parameter "viewTopY"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 438
    if-gez p1, :cond_0

    move v0, v1

    .line 439
    .local v0, lightTrash:Z
    :goto_0
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashBackground:Landroid/view/View;

    invoke-virtual {v3, v0}, Landroid/view/View;->setActivated(Z)V

    .line 440
    iget-object v3, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashButton:Landroid/view/View;

    iget-object v4, p0, Lco/vine/android/AbstractRecordingActivity;->mDraftTrashContainer:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v4

    if-ge p1, v4, :cond_1

    :goto_1
    invoke-virtual {v3, v1}, Landroid/view/View;->setActivated(Z)V

    .line 441
    return v0

    .end local v0           #lightTrash:Z
    :cond_0
    move v0, v2

    .line 438
    goto :goto_0

    .restart local v0       #lightTrash:Z
    :cond_1
    move v1, v2

    .line 440
    goto :goto_1
.end method

.method public viewPickedUp()V
    .locals 0

    .prologue
    .line 413
    invoke-direct {p0}, Lco/vine/android/AbstractRecordingActivity;->hideCurrentFragment()V

    .line 414
    return-void
.end method
