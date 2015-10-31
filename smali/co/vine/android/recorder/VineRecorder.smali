.class public Lco/vine/android/recorder/VineRecorder;
.super Ljava/lang/Object;
.source "VineRecorder.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Lco/vine/android/recorder/RecordController$OnRecorderControllerStateChangedListener;
.implements Lco/vine/android/dragsort/DragSortWidget$SelectionChangedListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Lco/vine/android/dragsort/DragSortWidget$FloatViewInteractionListener;
.implements Lco/vine/android/dragsort/DragSortWidget$CurrentlyPlayingProvider;
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;,
        Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;,
        Lco/vine/android/recorder/VineRecorder$OnResumeTask;,
        Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;,
        Lco/vine/android/recorder/VineRecorder$FinishProcessTask;,
        Lco/vine/android/recorder/VineRecorder$EditModePreviewClickListener;,
        Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;,
        Lco/vine/android/recorder/VineRecorder$ReallocCameraBuffersTask;,
        Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;,
        Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;
    }
.end annotation


# static fields
.field public static final PREFS_CAPTURE:Ljava/lang/String; = "capture"

.field private static final PREF_BOTTOM_MASK_HEIGHT:Ljava/lang/String; = "bottomMaskHeightPx"

.field private static final REMOVE_THUMBNAIL_MILLIS:J = 0x64L

.field private static final TOUCH_EDGE_BOUNDARY:F = 0.05f

.field private static final TRANSITION_DURATION:J = 0xfaL

.field private static final TRASH_BRIGHT:I = 0x1

.field private static final TRASH_INVISIBLE:I = 0x2

.field private static final TRASH_VISIBLE:I


# instance fields
.field public volatile currentDuration:J

.field public final density:F

.field public detectedInvalidSession:Z

.field public volatile finalFile:Lco/vine/android/recorder/RecordingFile;

.field private mActivity:Landroid/app/Activity;

.field private final mAddedSegments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mAlreadyStoppingForUnspportedReasons:Z

.field private mAutoFocusing:Z

.field private final mBottomMaskId:I

.field private mBottomMaskView:Landroid/view/View;

.field private final mCameraFailString:I

.field private mCameraSwitcher:Landroid/view/ViewGroup;

.field private final mCameraSwitcherId:I

.field private final mCameraSwitcherViewListener:Landroid/view/View$OnClickListener;

.field private mCameraView:Landroid/view/View;

.field private final mCameraViewResourceId:I

.field private mCanKeepRecording:Z

.field private final mChangeProgressRunnable:Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;

.field private mCurrentFrameRate:I

.field private mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

.field private mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

.field private final mDeviceNotSupportedString:Ljava/lang/String;

.field public volatile mDiscardChanges:Z

.field private mDoNotDeleteSession:Z

.field private mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

.field private final mDragSortWidgetId:I

.field private final mEditedSegments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mEditing:Z

.field private mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

.field private mEditorButtons:Landroid/view/View;

.field private mEditorButtonsHeight:I

.field private final mEditorButtonsId:I

.field private mEditorCancelButton:Landroid/view/View;

.field private final mEditorCancelButtonId:I

.field private mEditorDoneButton:Landroid/view/View;

.field private final mEditorDoneButtonId:I

.field private mEnabled:Z

.field private mFinishButton:Landroid/view/View;

.field private final mFinishButtonId:I

.field private final mFinishClicker:Landroid/view/View$OnClickListener;

.field private mFinishLastSegmentString:Ljava/lang/CharSequence;

.field private final mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

.field private mFinishProgressDialog:Landroid/app/ProgressDialog;

.field private final mFinishProgressDialogMessage:[Ljava/lang/CharSequence;

.field private mFinished:Z

.field private mFlashSwitcher:Landroid/view/View;

.field private final mFlashSwitcherId:I

.field private final mFocusAnimationSet:Landroid/view/animation/AnimationSet;

.field private final mFocusDisabledDrawable:I

.field private final mFocusDismissAnimation:Landroid/view/animation/AlphaAnimation;

.field private final mFocusEnabledDrawable:I

.field private final mFocusIndicator:Landroid/widget/ImageView;

.field private mFocusView:Landroid/view/View;

.field private final mFocusViewResourceId:I

.field private mFrontFacing:Z

.field private final mGhostButton:Landroid/widget/ToggleButton;

.field private mGhostModeEnabled:Z

.field private final mGhostView:Landroid/widget/ImageView;

.field private final mGhostViewId:I

.field private mGridSwitch:Landroid/widget/ToggleButton;

.field private final mGridSwitchId:I

.field private final mHandler:Landroid/os/Handler;

.field private mHasPreviewedAlready:Z

.field private mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

.field private final mInitiallyStartedWithEditMode:Z

.field private mIsGridOn:Z

.field private volatile mIsSwitchingCamera:Z

.field private mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

.field private mLastSelectedPosition:I

.field private mNeverResumedRecorder:Z

.field public volatile mOnCompleteConsumer:Ljava/lang/Runnable;

.field private mOpenCameraDialog:Landroid/app/ProgressDialog;

.field private final mOpenCameraResource:Ljava/lang/CharSequence;

.field private mPickedUpPosition:I

.field private mPlayButton:Landroid/view/View;

.field private mPlayButtonContainer:Landroid/view/View;

.field private final mPlayButtonContainerId:I

.field private mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

.field private mPlayRefreshButton:Landroid/view/View;

.field private mPreviewLoadingOverlay:Landroid/view/View;

.field private final mPreviewLoadingOverlayId:I

.field private mProgressOverlay:Landroid/view/View;

.field private final mProgressOverlayId:I

.field private mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

.field private mProgressView:Lco/vine/android/recorder/ProgressView;

.field private final mProgressViewResourceId:I

.field private mRecordingFileDuration:I

.field private mRecordingOptions:Landroid/view/View;

.field private final mRecordingOptionsRowId:I

.field private mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

.field private mRelativeTimeStarted:Z

.field private mResources:Landroid/content/res/Resources;

.field private mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

.field private mReturnToPreview:Z

.field private final mRootLayoutId:I

.field private mRootLayoutView:Landroid/view/View;

.field private mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

.field private mSegmentChangeThread:Ljava/lang/Thread;

.field private mSession:Lco/vine/android/recorder/RecordSession;

.field private mShortAnimTime:I

.field private final mSize:Landroid/graphics/Point;

.field private mStartProgressDialog:Landroid/app/ProgressDialog;

.field private final mStartProgressDialogMessage:Ljava/lang/CharSequence;

.field private mStartWithEditMode:Z

.field private mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

.field private final mSwitchFlashViewListener:Landroid/view/View$OnClickListener;

.field private mThumbnailList:Landroid/view/View;

.field private mThumbnailOverlay:Landroid/widget/ImageView;

.field private final mThumbnailOverlayId:I

.field private mThumbnailPadding:I

.field private mThumbnailSegment:Lco/vine/android/recorder/RecordSegment;

.field private mToRemove:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;"
        }
    .end annotation
.end field

.field private mToast:Landroid/widget/Toast;

.field private final mTopMaskId:I

.field private mTopMaskView:Landroid/view/View;

.field private mTrashCanButton:Landroid/view/View;

.field private final mTrashCanButtonId:I

.field private mTrashUndoContainer:Landroid/view/View;

.field private final mTrashUndoContainerId:I

.field private mUndoButton:Landroid/view/View;

.field private final mUndoButtonId:I

.field private mVideoAttr:Landroid/util/AttributeSet;

.field private mVideoController:Lco/vine/android/recorder/RecordController;

.field private mVideoPlayer:Lco/vine/android/player/SdkVideoView;

.field private mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

.field private final onCameraReadyRunnable:Ljava/lang/Runnable;

.field public progressWidth:I


# direct methods
.method public varargs constructor <init>(ZLandroid/graphics/Point;ZZLco/vine/android/recorder/RecordingFile;Landroid/app/Activity;Lco/vine/android/player/SdkVideoView;IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIILjava/lang/String;Landroid/widget/ToggleButton;[Ljava/lang/CharSequence;)V
    .locals 4
    .parameter "startWithEditMode"
    .parameter "screenSize"
    .parameter "returnToPreview"
    .parameter "hasPreviewedAlready"
    .parameter "file"
    .parameter "activity"
    .parameter "videoPlayer"
    .parameter "recordingOptionsRowId"
    .parameter "dragSortWidgetId"
    .parameter "gridButton"
    .parameter "ghostViewId"
    .parameter "focusIndicatorId"
    .parameter "focusEnabledDrawable"
    .parameter "focusDisabledDrawable"
    .parameter "focusViewResourceId"
    .parameter "progressViewResourceId"
    .parameter "cameraViewResourceId"
    .parameter "cameraSwitcher"
    .parameter "flashSwitcherId"
    .parameter "finishButtonId"
    .parameter "topMaskId"
    .parameter "bottomMaskId"
    .parameter "editorButtonsId"
    .parameter "editorDoneButtonId"
    .parameter "editorCancelButtonId"
    .parameter "trashUndoContainerId"
    .parameter "trashCanButtonId"
    .parameter "unDoButtonId"
    .parameter "lastSegmentString"
    .parameter "cameraFailString"
    .parameter "openCameraString"
    .parameter "playButtonContainerId"
    .parameter "thumbnailOverlayId"
    .parameter "rootLayoutId"
    .parameter "editorPadding"
    .parameter "editorButtonsHeight"
    .parameter "previewLoadingOverlayId"
    .parameter "progressOverlay"
    .parameter "deviceNotSupportedString"
    .parameter "ghostButton"
    .parameter "messages"

    .prologue
    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    .line 167
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    .line 168
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    .line 171
    new-instance v1, Lco/vine/android/recorder/RecordSegment;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Lco/vine/android/recorder/RecordSegment;-><init>(J)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    .line 175
    new-instance v1, Lco/vine/android/recorder/VineRecorder$1;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$1;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishClicker:Landroid/view/View$OnClickListener;

    .line 202
    new-instance v1, Lco/vine/android/recorder/VineRecorder$2;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$2;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchFlashViewListener:Landroid/view/View$OnClickListener;

    .line 209
    new-instance v1, Lco/vine/android/recorder/VineRecorder$3;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$3;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherViewListener:Landroid/view/View$OnClickListener;

    .line 225
    new-instance v1, Lco/vine/android/recorder/VineRecorder$4;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$4;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->onCameraReadyRunnable:Ljava/lang/Runnable;

    .line 248
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mEnabled:Z

    .line 275
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    .line 276
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mAddedSegments:Ljava/util/ArrayList;

    .line 277
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    .line 278
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mNeverResumedRecorder:Z

    .line 279
    iput-boolean p3, p0, Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z

    .line 280
    iput-boolean p4, p0, Lco/vine/android/recorder/VineRecorder;->mHasPreviewedAlready:Z

    .line 281
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mStartWithEditMode:Z

    .line 282
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mInitiallyStartedWithEditMode:Z

    .line 283
    move/from16 v0, p26

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainerId:I

    .line 284
    move/from16 v0, p36

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I

    .line 285
    iput-object p7, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    .line 286
    const/4 v1, 0x0

    aget-object v1, p41, v1

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialogMessage:Ljava/lang/CharSequence;

    .line 287
    move-object/from16 v0, p41

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;

    .line 288
    new-instance v1, Lco/vine/android/recorder/RecordController;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/RecordController;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    .line 289
    iput-object p6, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    .line 290
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    .line 291
    move/from16 v0, p35

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailPadding:I

    .line 292
    move/from16 v0, p28

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButtonId:I

    .line 293
    move-object/from16 v0, p40

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostButton:Landroid/widget/ToggleButton;

    .line 294
    invoke-static {}, Lco/vine/android/recorder/RecordConfigUtils;->isDefaultFrontFacing()Z

    move-result v1

    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z

    .line 295
    new-instance v1, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;-><init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    .line 296
    new-instance v1, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;-><init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mChangeProgressRunnable:Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;

    .line 297
    move/from16 v0, p29

    invoke-virtual {p6, v0}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishLastSegmentString:Ljava/lang/CharSequence;

    .line 298
    move/from16 v0, p31

    invoke-virtual {p6, v0}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraResource:Ljava/lang/CharSequence;

    .line 299
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    .line 300
    invoke-virtual {p6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lco/vine/android/recorder/VineRecorder;->density:F

    .line 301
    move/from16 v0, p16

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressViewResourceId:I

    .line 302
    move/from16 v0, p17

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraViewResourceId:I

    .line 303
    move/from16 v0, p34

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mRootLayoutId:I

    .line 304
    move/from16 v0, p33

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlayId:I

    .line 305
    move/from16 v0, p19

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcherId:I

    .line 306
    move/from16 v0, p18

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherId:I

    .line 307
    move/from16 v0, p20

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButtonId:I

    .line 308
    iput p10, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitchId:I

    .line 309
    move/from16 v0, p32

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainerId:I

    .line 310
    move/from16 v0, p21

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskId:I

    .line 311
    move/from16 v0, p22

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskId:I

    .line 312
    move/from16 v0, p37

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlayId:I

    .line 313
    move/from16 v0, p23

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsId:I

    .line 314
    move/from16 v0, p24

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButtonId:I

    .line 315
    move/from16 v0, p25

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButtonId:I

    .line 316
    move/from16 v0, p27

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButtonId:I

    .line 317
    iput p8, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptionsRowId:I

    .line 318
    move/from16 v0, p30

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraFailString:I

    .line 319
    move/from16 v0, p15

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusViewResourceId:I

    .line 320
    move/from16 v0, p13

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusEnabledDrawable:I

    .line 321
    move/from16 v0, p14

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusDisabledDrawable:I

    .line 322
    iput p11, p0, Lco/vine/android/recorder/VineRecorder;->mGhostViewId:I

    .line 323
    iput p9, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidgetId:I

    .line 324
    move/from16 v0, p12

    invoke-virtual {p6, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    .line 325
    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostViewId:I

    invoke-virtual {p6, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    .line 326
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    const v2, 0x3eb33333

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 327
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    invoke-static {v1}, Lco/vine/android/recorder/RecordingAnimations;->getFocusDismissAnimation(Landroid/widget/ImageView;)Landroid/view/animation/AlphaAnimation;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusDismissAnimation:Landroid/view/animation/AlphaAnimation;

    .line 328
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusDismissAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    invoke-static {v1, v2}, Lco/vine/android/recorder/RecordingAnimations;->getFocusAnimationSet(Landroid/view/animation/AlphaAnimation;Landroid/widget/ImageView;)Landroid/view/animation/AnimationSet;

    move-result-object v1

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusAnimationSet:Landroid/view/animation/AnimationSet;

    .line 330
    move/from16 v0, p38

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressOverlayId:I

    .line 331
    move-object/from16 v0, p39

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDeviceNotSupportedString:Ljava/lang/String;

    .line 333
    const-string v1, "Init"

    invoke-virtual {p0, v1, p5}, Lco/vine/android/recorder/VineRecorder;->swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;

    .line 334
    return-void
.end method

.method static synthetic access$000(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->finish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    return-object v0
.end method

.method static synthetic access$1000(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/ToggleButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$1100(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mIsGridOn:Z

    return v0
.end method

.method static synthetic access$1400(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$1500(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDeviceNotSupportedString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600(Lco/vine/android/recorder/VineRecorder;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1700(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1800(Lco/vine/android/recorder/VineRecorder;)Landroid/content/res/Resources;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method static synthetic access$1900(Lco/vine/android/recorder/VineRecorder;)Ljava/util/ArrayList;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z

    return v0
.end method

.method static synthetic access$2000(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$202(Lco/vine/android/recorder/VineRecorder;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z

    return p1
.end method

.method static synthetic access$2100(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2200(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ProgressView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    return-object v0
.end method

.method static synthetic access$2300(Lco/vine/android/recorder/VineRecorder;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I

    return v0
.end method

.method static synthetic access$2400(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/player/SdkVideoView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    return-object v0
.end method

.method static synthetic access$2700(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    return-object v0
.end method

.method static synthetic access$2800(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->endRelativeTime()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2900(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z

    return v0
.end method

.method static synthetic access$2902(Lco/vine/android/recorder/VineRecorder;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z

    return p1
.end method

.method static synthetic access$300(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    return v0
.end method

.method static synthetic access$3000(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    return-object v0
.end method

.method static synthetic access$3100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSegment;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    return-object v0
.end method

.method static synthetic access$3102(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    return-object p1
.end method

.method static synthetic access$3200(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mInitiallyStartedWithEditMode:Z

    return v0
.end method

.method static synthetic access$3300(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinished:Z

    return v0
.end method

.method static synthetic access$3400(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->startHashTask(Z)V

    return-void
.end method

.method static synthetic access$3500(Lco/vine/android/recorder/VineRecorder;)Ljava/util/HashSet;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$3600(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

    return-object v0
.end method

.method static synthetic access$3700(Lco/vine/android/recorder/VineRecorder;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I

    return v0
.end method

.method static synthetic access$3702(Lco/vine/android/recorder/VineRecorder;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput p1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I

    return p1
.end method

.method static synthetic access$3800(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->showCameraFailedToast()V

    return-void
.end method

.method static synthetic access$3900(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    return-object v0
.end method

.method static synthetic access$4000(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$402(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;)Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    return-object p1
.end method

.method static synthetic access$4100(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->guardedStartRecording(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4200(Lco/vine/android/recorder/VineRecorder;)Landroid/widget/Toast;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mToast:Landroid/widget/Toast;

    return-object v0
.end method

.method static synthetic access$4300(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->refreshFullPreview()V

    return-void
.end method

.method static synthetic access$4400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/SegmentEditorAdapter;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    return-object v0
.end method

.method static synthetic access$4500(Lco/vine/android/recorder/VineRecorder;)Landroid/util/AttributeSet;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoAttr:Landroid/util/AttributeSet;

    return-object v0
.end method

.method static synthetic access$4502(Lco/vine/android/recorder/VineRecorder;Landroid/util/AttributeSet;)Landroid/util/AttributeSet;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoAttr:Landroid/util/AttributeSet;

    return-object p1
.end method

.method static synthetic access$4700(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/dragsort/DragSortWidget;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    return-object v0
.end method

.method static synthetic access$4800(Lco/vine/android/recorder/VineRecorder;)Landroid/graphics/Point;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$4900(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->adjustEditBoundaries()V

    return-void
.end method

.method static synthetic access$500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5000(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V

    return-void
.end method

.method static synthetic access$5100(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    return-object v0
.end method

.method static synthetic access$5200(Lco/vine/android/recorder/VineRecorder;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$5300(Lco/vine/android/recorder/VineRecorder;)[Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$5400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    return-object v0
.end method

.method static synthetic access$5500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5700(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$5800(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z

    return v0
.end method

.method static synthetic access$5900(Lco/vine/android/recorder/VineRecorder;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->getDurationFromSegments()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$600(Lco/vine/android/recorder/VineRecorder;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusEnabledDrawable:I

    return v0
.end method

.method static synthetic access$6000(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->animateEditModeControlsOut(Z)V

    return-void
.end method

.method static synthetic access$6100(Lco/vine/android/recorder/VineRecorder;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->returnToPreview(Z)V

    return-void
.end method

.method static synthetic access$6200(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6300(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    return v0
.end method

.method static synthetic access$6400(Lco/vine/android/recorder/VineRecorder;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    return-void
.end method

.method static synthetic access$6500(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6600(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButton:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6700(Lco/vine/android/recorder/VineRecorder;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    return v0
.end method

.method static synthetic access$6702(Lco/vine/android/recorder/VineRecorder;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput p1, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    return p1
.end method

.method static synthetic access$6800(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$6900(Lco/vine/android/recorder/VineRecorder;)Landroid/view/View;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lco/vine/android/recorder/VineRecorder;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusDisabledDrawable:I

    return v0
.end method

.method static synthetic access$7000(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishLastSegmentString:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$7100(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialogMessage:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$7200(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->stopProgressTimer()V

    return-void
.end method

.method static synthetic access$7300(Lco/vine/android/recorder/VineRecorder;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 56
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->startProgressTimer()V

    return-void
.end method

.method static synthetic access$7400(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    return-object v0
.end method

.method static synthetic access$800(Lco/vine/android/recorder/VineRecorder;)Landroid/view/ViewGroup;
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$900(Lco/vine/android/recorder/VineRecorder;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 56
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z

    return v0
.end method

.method static synthetic access$902(Lco/vine/android/recorder/VineRecorder;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z

    return p1
.end method

.method private adjustBoundaries(Lco/vine/android/recorder/CameraSetting;)V
    .locals 20
    .parameter "cs"

    .prologue
    .line 2301
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    .line 2302
    .local v3, activity:Landroid/app/Activity;
    if-eqz v3, :cond_3

    .line 2303
    if-eqz p1, :cond_3

    .line 2305
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v10, v0

    .line 2306
    .local v10, previewWidth:F
    move-object/from16 v0, p1

    iget-boolean v0, v0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    move/from16 v17, v0

    const/16 v18, 0x0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_4

    .line 2307
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    move/from16 v18, v0

    mul-float v10, v17, v18

    .line 2311
    :cond_0
    :goto_0
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->frontFacingAspectRatio:F

    move/from16 v17, v0

    const/16 v18, 0x0

    cmpl-float v17, v17, v18

    if-gtz v17, :cond_1

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    move/from16 v17, v0

    const/16 v18, 0x0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_2

    .line 2312
    :cond_1
    new-instance v17, Lco/vine/android/VineException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Adjusting ratio originalW = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalW:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " originalH = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    move/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " hardware "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "Hardware Version: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " - "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " ("

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sget-object v19, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ")"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lco/vine/android/VineException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v17 .. v17}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 2317
    :cond_2
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v9, v0

    .line 2318
    .local v9, previewHeight:F
    div-float v4, v10, v9

    .line 2320
    .local v4, aspectRatio:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    mul-float v17, v17, v4

    move/from16 v0, v17

    float-to-int v13, v0

    .line 2323
    .local v13, surfaceViewHeightPx:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskView:Landroid/view/View;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 2324
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v17

    move-object/from16 v0, v17

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v16, v0

    .line 2325
    .local v16, topMaskHeightPx:I
    div-int/lit8 v14, v13, 0x2

    .line 2326
    .local v14, surfaceViewMidpoint:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v17, v0

    div-int/lit8 v17, v17, 0x2

    add-int v8, v17, v16

    .line 2327
    .local v8, midpointYOffset:I
    sub-int v15, v8, v14

    .line 2329
    .local v15, surfaceViewYPos:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/widget/RelativeLayout$LayoutParams;

    .line 2331
    .local v7, cameraViewParams:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v17, v0

    move/from16 v0, v17

    iput v0, v7, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 2332
    iput v13, v7, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 2333
    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v7, v0, v15, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 2336
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mRootLayoutView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    .line 2337
    .local v11, rootHeight:I
    sub-int v17, v11, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Landroid/graphics/Point;->x:I

    move/from16 v18, v0

    sub-int v5, v17, v18

    .line 2339
    .local v5, bottomMaskHeightPx:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskView:Landroid/view/View;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout$LayoutParams;

    .line 2341
    .local v6, bottomMaskParams:Landroid/widget/RelativeLayout$LayoutParams;
    iput v5, v6, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 2342
    const-string v17, "capture"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 2343
    .local v12, sp:Landroid/content/SharedPreferences;
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lco/vine/android/recorder/CameraSetting;->frontFacing:Z

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lco/vine/android/recorder/VineRecorder;->getBottomMaskHeightPref(Z)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2345
    new-instance v17, Lco/vine/android/recorder/VineRecorder$25;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v7, v6}, Lco/vine/android/recorder/VineRecorder$25;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/widget/RelativeLayout$LayoutParams;Landroid/widget/RelativeLayout$LayoutParams;)V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2362
    .end local v4           #aspectRatio:F
    .end local v5           #bottomMaskHeightPx:I
    .end local v6           #bottomMaskParams:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7           #cameraViewParams:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v8           #midpointYOffset:I
    .end local v9           #previewHeight:F
    .end local v10           #previewWidth:F
    .end local v11           #rootHeight:I
    .end local v12           #sp:Landroid/content/SharedPreferences;
    .end local v13           #surfaceViewHeightPx:I
    .end local v14           #surfaceViewMidpoint:I
    .end local v15           #surfaceViewYPos:I
    .end local v16           #topMaskHeightPx:I
    :cond_3
    return-void

    .line 2308
    .restart local v10       #previewWidth:F
    :cond_4
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    move/from16 v17, v0

    const/16 v18, 0x0

    cmpl-float v17, v17, v18

    if-lez v17, :cond_0

    .line 2309
    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->originalH:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p1

    iget v0, v0, Lco/vine/android/recorder/CameraSetting;->backFacingAspectRatio:F

    move/from16 v18, v0

    mul-float v10, v17, v18

    goto/16 :goto_0
.end method

.method private adjustEditBoundaries()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 865
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v1, :cond_0

    .line 866
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v1}, Lco/vine/android/player/SdkVideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    .line 867
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 868
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 870
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    if-eqz v1, :cond_1

    .line 871
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 873
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    .line 874
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 876
    :cond_2
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    if-eqz v1, :cond_3

    .line 877
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoViewParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 881
    :cond_3
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    if-eqz v1, :cond_5

    .line 882
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 885
    .local v0, thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;
    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    add-int/2addr v1, v2

    iget v2, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailPadding:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v3, v1, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 891
    :goto_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_4

    .line 892
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    new-instance v2, Lco/vine/android/recorder/VineRecorder$10;

    invoke-direct {v2, p0, v0}, Lco/vine/android/recorder/VineRecorder$10;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/widget/RelativeLayout$LayoutParams;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 906
    :cond_4
    return-void

    .line 888
    .end local v0           #thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_5
    const/4 v0, 0x0

    .restart local v0       #thumbListParams:Landroid/widget/RelativeLayout$LayoutParams;
    goto :goto_0
.end method

.method private animateCaptureControlsIn()V
    .locals 4

    .prologue
    .line 549
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/VineRecorder$7;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$7;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 571
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 574
    :cond_0
    return-void
.end method

.method private animateCaptureControlsOut()V
    .locals 7

    .prologue
    const-wide/16 v5, 0xfa

    const/4 v4, 0x0

    .line 577
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    .line 578
    .local v1, v:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 579
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 580
    .local v0, am:Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_0

    .line 581
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsHeight:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lco/vine/android/recorder/ViewGoneAnimationListener;

    invoke-direct {v3, v1}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 585
    .end local v0           #am:Landroid/view/ViewPropertyAnimator;
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    .line 586
    if-eqz v1, :cond_1

    .line 587
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 588
    .restart local v0       #am:Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_1

    .line 589
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lco/vine/android/recorder/ViewGoneAnimationListener;

    invoke-direct {v3, v1}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 593
    .end local v0           #am:Landroid/view/ViewPropertyAnimator;
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    .line 594
    if-eqz v1, :cond_2

    .line 595
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 596
    .restart local v0       #am:Landroid/view/ViewPropertyAnimator;
    if-eqz v0, :cond_2

    .line 597
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lco/vine/android/recorder/ViewGoneAnimationListener;

    invoke-direct {v3, v1}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 601
    .end local v0           #am:Landroid/view/ViewPropertyAnimator;
    :cond_2
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    if-eqz v2, :cond_3

    .line 602
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 604
    :cond_3
    return-void
.end method

.method private animateEditModeControlsIn()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x4

    .line 622
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/VineRecorder$8;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$8;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 641
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0, v6}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 643
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 645
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 646
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    .line 649
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 650
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 651
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setAlpha(F)V

    .line 654
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 655
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 656
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 659
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 660
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 663
    :cond_3
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    if-eqz v0, :cond_4

    .line 664
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 667
    :cond_4
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    if-eqz v0, :cond_5

    .line 668
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 670
    :cond_5
    return-void
.end method

.method private animateEditModeControlsOut(Z)V
    .locals 6
    .parameter "hideVideo"

    .prologue
    const-wide/16 v4, 0xfa

    const/4 v3, 0x0

    .line 673
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButton:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 676
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 678
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 680
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 682
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 684
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 686
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 690
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 691
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 692
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->setSelection(I)V

    .line 694
    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v0, :cond_1

    .line 695
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    .line 697
    :cond_1
    return-void
.end method

.method private animatePlayButton(Z)V
    .locals 3
    .parameter "visible"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 1153
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayRefreshButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1154
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1155
    if-nez p1, :cond_1

    .line 1156
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1177
    :cond_0
    :goto_0
    return-void

    .line 1162
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    iget-object v0, v0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    if-eqz v0, :cond_2

    .line 1163
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1164
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayRefreshButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1170
    :goto_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1171
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 1166
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1167
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayRefreshButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1
.end method

.method private animatePreviewSpinner(Z)V
    .locals 3
    .parameter "visible"

    .prologue
    const/4 v2, 0x0

    .line 1180
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1181
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1182
    if-nez p1, :cond_1

    .line 1183
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1197
    :cond_0
    :goto_0
    return-void

    .line 1189
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1190
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 1191
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method private animateTopButtons(I)V
    .locals 4
    .parameter "animation"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1126
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1127
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1128
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 1129
    packed-switch p1, :pswitch_data_0

    .line 1150
    :cond_0
    :goto_0
    return-void

    .line 1131
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1132
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1133
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 1134
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    .line 1137
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    .line 1138
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    .line 1141
    :pswitch_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1142
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 1143
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 1144
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->canUndoDelete()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1145
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 1129
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private changeFocusTo(FF)V
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1793
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    float-to-int v1, p1

    float-to-int v2, p2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/RecordController;->autoFocus(II)V

    .line 1794
    return-void
.end method

.method private commitChanges()Z
    .locals 11

    .prologue
    const/4 v2, 0x0

    const/4 v7, 0x1

    .line 824
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    .line 825
    .local v0, adapter:Lco/vine/android/recorder/SegmentEditorAdapter;
    if-eqz v0, :cond_5

    .line 826
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->commitDelete()V

    .line 827
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 828
    .local v6, size:I
    const/4 v3, 0x0

    .line 830
    .local v3, lastSegment:Lco/vine/android/recorder/RecordSegment;
    if-lez v6, :cond_0

    .line 831
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    add-int/lit8 v9, v6, -0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #lastSegment:Lco/vine/android/recorder/RecordSegment;
    check-cast v3, Lco/vine/android/recorder/RecordSegment;

    .line 834
    .restart local v3       #lastSegment:Lco/vine/android/recorder/RecordSegment;
    :cond_0
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getData()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 838
    .local v4, modifiedSize:I
    if-lez v4, :cond_2

    .line 839
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getData()Ljava/util/ArrayList;

    move-result-object v8

    add-int/lit8 v9, v4, -0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    if-eq v3, v8, :cond_1

    move v2, v7

    .line 844
    .local v2, lastChanged:Z
    :cond_1
    :goto_0
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 845
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getData()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 846
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getDeleted()Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 847
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getDeleted()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/vine/android/recorder/RecordSegment;

    .line 848
    .local v5, segment:Lco/vine/android/recorder/RecordSegment;
    iput-boolean v7, v5, Lco/vine/android/recorder/RecordSegment;->removed:Z

    goto :goto_1

    .line 841
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lastChanged:Z
    .end local v5           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_2
    if-eqz v3, :cond_3

    move v2, v7

    .restart local v2       #lastChanged:Z
    :cond_3
    goto :goto_0

    .line 850
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_4
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-direct {p0, v8}, Lco/vine/android/recorder/VineRecorder;->swapTimestampsFromSegments(Ljava/util/ArrayList;)V

    .line 851
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v9}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v9

    iget-object v10, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-static {v9, v10}, Lco/vine/android/recorder/RecordSegment;->applyEditedChanges(Lco/vine/android/recorder/RecordSession;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 853
    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iput-boolean v7, v8, Lco/vine/android/recorder/RecordingFile;->isDirty:Z

    .line 855
    const-string v7, "Changes commited, last segment has changed? {}."

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 859
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lastChanged:Z
    .end local v3           #lastSegment:Lco/vine/android/recorder/RecordSegment;
    .end local v4           #modifiedSize:I
    .end local v6           #size:I
    :cond_5
    return v2
.end method

.method private dismissFocusIndicator()V
    .locals 2

    .prologue
    .line 430
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 431
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFocusDismissAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 433
    :cond_0
    return-void
.end method

.method private declared-synchronized endRelativeTime()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1821
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    if-eqz v0, :cond_0

    .line 1822
    const-string v0, "END RELATIVE TIME."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 1823
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/RecordController;->offerLastFrame(Lco/vine/android/recorder/RecordSegment;Lco/vine/android/recorder/VideoData;)V

    .line 1824
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->getTimestamp()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingFileDuration:I

    .line 1825
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordSession;->add(Lco/vine/android/recorder/RecordSegment;)V

    .line 1826
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1827
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mAddedSegments:Ljava/util/ArrayList;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1828
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lco/vine/android/recorder/RecordingFile;->isDirty:Z

    .line 1829
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 1830
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingFileDuration:I

    int-to-long v0, v0

    iput-wide v0, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    .line 1831
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordController;->setRecording(Lco/vine/android/recorder/RecordSegment;)V

    .line 1832
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    if-eqz v0, :cond_0

    .line 1833
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordController;->requestGhostDrawing(Z)V

    .line 1836
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mRelativeTimeStarted:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1837
    monitor-exit p0

    return v3

    .line 1821
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private finish(Ljava/lang/String;)V
    .locals 3
    .parameter "tag"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 183
    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinished:Z

    .line 184
    iput-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mHasPreviewedAlready:Z

    .line 185
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->setHasPreviewedAlreadyIfNeeded()V

    .line 186
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 187
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->stop(Ljava/lang/String;Ljava/lang/Runnable;ZZ)V

    .line 188
    iput-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 190
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOnCompleteConsumer:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOnCompleteConsumer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method private floatViewIntersectsTrashCan()Z
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1081
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v3, :cond_3

    .line 1082
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, v3, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 1084
    .local v1, vidPlayerMarginTop:I
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v3}, Lco/vine/android/dragsort/DragSortWidget;->getFloatViewBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 1085
    .local v0, floatViewBounds:Landroid/graphics/Rect;
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v3}, Lco/vine/android/dragsort/DragSortWidget;->floatViewIsFromContentView()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1086
    iget v3, v0, Landroid/graphics/Rect;->top:I

    if-ge v3, v1, :cond_0

    move v3, v4

    .line 1093
    .end local v0           #floatViewBounds:Landroid/graphics/Rect;
    .end local v1           #vidPlayerMarginTop:I
    :goto_0
    return v3

    .restart local v0       #floatViewBounds:Landroid/graphics/Rect;
    .restart local v1       #vidPlayerMarginTop:I
    :cond_0
    move v3, v5

    .line 1086
    goto :goto_0

    .line 1088
    :cond_1
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v3}, Lco/vine/android/player/SdkVideoView;->getBottom()I

    move-result v3

    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v6}, Lco/vine/android/player/SdkVideoView;->getTop()I

    move-result v6

    sub-int/2addr v3, v6

    div-int/lit8 v3, v3, 0x2

    add-int v2, v3, v1

    .line 1090
    .local v2, videoPlayerMiddle:I
    iget v3, v0, Landroid/graphics/Rect;->top:I

    if-ge v3, v2, :cond_2

    :goto_1
    move v3, v4

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1

    .end local v0           #floatViewBounds:Landroid/graphics/Rect;
    .end local v1           #vidPlayerMarginTop:I
    .end local v2           #videoPlayerMiddle:I
    :cond_3
    move v3, v5

    .line 1093
    goto :goto_0
.end method

.method public static getBottomMaskHeightPref(Z)Ljava/lang/String;
    .locals 2
    .parameter "frontFacing"

    .prologue
    .line 2297
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bottomMaskHeightPx"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDurationFromSegments()J
    .locals 7

    .prologue
    .line 2141
    const/4 v0, 0x0

    .line 2142
    .local v0, audioProgress:I
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v3}, Lco/vine/android/recorder/SegmentEditorAdapter;->getData()Ljava/util/ArrayList;

    move-result-object v3

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

    check-cast v2, Lco/vine/android/recorder/RecordSegment;

    .line 2143
    .local v2, segment:Lco/vine/android/recorder/RecordSegment;
    iget-boolean v3, v2, Lco/vine/android/recorder/RecordSegment;->removed:Z

    if-nez v3, :cond_0

    .line 2144
    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v3

    iget v3, v3, Lco/vine/android/recorder/AudioData;->size:I

    add-int/2addr v0, v3

    goto :goto_0

    .line 2147
    .end local v2           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v3

    int-to-long v3, v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    return-wide v3
.end method

.method private guardedStartRecording(Ljava/lang/String;)V
    .locals 1
    .parameter "tag"

    .prologue
    .line 197
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 198
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->startRecording(Ljava/lang/String;)V

    .line 200
    :cond_0
    return-void
.end method

.method private hideCaptureControls()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 607
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    if-eqz v0, :cond_0

    .line 608
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/ProgressView;->setVisibility(I)V

    .line 610
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 611
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 613
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 614
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 616
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 617
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 619
    :cond_3
    return-void
.end method

.method private invalidateFinishButton()V
    .locals 5

    .prologue
    .line 538
    iget-wide v1, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    const-wide/16 v3, 0x3e8

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 539
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButton:Landroid/view/View;

    .line 540
    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 541
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 546
    .end local v0           #view:Landroid/view/View;
    :cond_0
    :goto_0
    return-void

    .line 544
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->onProgressThresholdReached()V

    goto :goto_0
.end method

.method private invalidateGhostView()V
    .locals 4

    .prologue
    .line 531
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v0, :cond_0

    .line 532
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordingFile;->getLastFramePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 534
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->invalidateGhostFrame()V

    .line 535
    return-void
.end method

.method private refreshFullPreview()V
    .locals 13

    .prologue
    .line 1684
    const-string v10, "Refresh full preview."

    invoke-static {v10}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 1685
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v2

    .line 1686
    .local v2, file:Lco/vine/android/recorder/RecordingFile;
    const/4 v8, 0x0

    .line 1687
    .local v8, session:Lco/vine/android/recorder/RecordSession;
    if-eqz v2, :cond_0

    .line 1688
    invoke-virtual {v2}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v8

    .line 1690
    :cond_0
    if-eqz v8, :cond_2

    .line 1691
    invoke-virtual {v8}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v10

    array-length v10, v10

    new-array v9, v10, [B

    .line 1692
    .local v9, videoData:[B
    invoke-virtual {v8}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v10

    array-length v10, v10

    new-array v0, v10, [S

    .line 1693
    .local v0, audioData:[S
    iget-object v10, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v10}, Lco/vine/android/recorder/SegmentEditorAdapter;->getData()Ljava/util/ArrayList;

    move-result-object v1

    .line 1695
    .local v1, data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_1

    .line 1696
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v10}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v10

    iget v3, v10, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    .line 1700
    .local v3, framerate:I
    :goto_0
    iget-object v10, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v11

    invoke-virtual {v11}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v11

    invoke-static {v11, v9, v0, v1}, Lco/vine/android/recorder/RecordSegment;->applyForEditedChanges(Lco/vine/android/recorder/RecordSession;[B[SLjava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v10, v11, v9, v0, v3}, Lco/vine/android/recorder/RecordController;->writeToFile(Ljava/util/ArrayList;[B[SI)V

    .line 1702
    const-wide/16 v5, 0x0

    .line 1703
    .local v5, lastTime:J
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v4, v10, :cond_2

    .line 1704
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/vine/android/recorder/RecordSegment;

    .line 1705
    .local v7, segment:Lco/vine/android/recorder/RecordSegment;
    iput v4, v7, Lco/vine/android/recorder/RecordSegment;->index:I

    .line 1706
    iput-wide v5, v7, Lco/vine/android/recorder/RecordSegment;->startTimestamp:J

    .line 1707
    invoke-virtual {v7}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v10

    iget v10, v10, Lco/vine/android/recorder/AudioData;->size:I

    invoke-static {v10}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v10

    div-int/lit16 v10, v10, 0x3e8

    int-to-long v10, v10

    add-long/2addr v5, v10

    .line 1708
    const-string v10, "Timestamp modified to: {}."

    iget-wide v11, v7, Lco/vine/android/recorder/RecordSegment;->startTimestamp:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1703
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1698
    .end local v3           #framerate:I
    .end local v4           #i:I
    .end local v5           #lastTime:J
    .end local v7           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    const/16 v3, 0x1e

    .restart local v3       #framerate:I
    goto :goto_0

    .line 1711
    .end local v0           #audioData:[S
    .end local v1           #data:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    .end local v3           #framerate:I
    .end local v9           #videoData:[B
    :cond_2
    return-void
.end method

.method private releaseSegmentChangeDetector()V
    .locals 2

    .prologue
    .line 2228
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 2229
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->runThread:Z

    .line 2231
    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2234
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeThread:Ljava/lang/Thread;

    .line 2236
    :cond_0
    return-void

    .line 2232
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private returnToPreview(Z)V
    .locals 1
    .parameter "discard"

    .prologue
    const/4 v0, 0x0

    .line 2131
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->releaseSegmentChangeDetector()V

    .line 2132
    if-nez p1, :cond_0

    .line 2133
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->commitChanges()Z

    .line 2135
    :cond_0
    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    .line 2136
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->writePreviewToFile()V

    .line 2137
    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->startHashTask(Z)V

    .line 2138
    return-void
.end method

.method private setHasPreviewedAlreadyIfNeeded()V
    .locals 4

    .prologue
    .line 817
    iget-wide v0, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v2

    iget v2, v2, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mHasPreviewedAlready:Z

    .line 818
    return-void

    .line 817
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private showCameraFailedToast()V
    .locals 2

    .prologue
    .line 1558
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$14;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$14;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1566
    return-void
.end method

.method private showCameraSwitcher()V
    .locals 3

    .prologue
    .line 1569
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    .line 1570
    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    .line 1571
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 1573
    :cond_0
    return-void
.end method

.method private startHashTask(Z)V
    .locals 4
    .parameter "detectedInvalidSession"

    .prologue
    .line 2365
    new-instance v0, Lco/vine/android/recorder/ReusableHashAsyncTask;

    invoke-direct {v0, p0}, Lco/vine/android/recorder/ReusableHashAsyncTask;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

    .line 2366
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->detectedInvalidSession:Z

    .line 2367
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

    const/4 v1, 0x1

    new-array v1, v1, [Lco/vine/android/recorder/RecordingFile;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/ReusableHashAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 2368
    return-void
.end method

.method private startProgressTimer()V
    .locals 2

    .prologue
    .line 2378
    new-instance v0, Lco/vine/android/recorder/ProgressTimer;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lco/vine/android/recorder/ProgressTimer;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/os/Handler;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    .line 2379
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressTimer;->start()V

    .line 2380
    return-void
.end method

.method private declared-synchronized startRecording(Ljava/lang/String;)V
    .locals 9
    .parameter "tag"

    .prologue
    .line 1524
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    .line 1525
    .local v0, activity:Landroid/app/Activity;
    const-string v4, "Start recording called from {}."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1526
    if-eqz v0, :cond_2

    .line 1527
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->isCameraReady()Z

    move-result v2

    .line 1528
    .local v2, isCameraReady:Z
    if-nez v2, :cond_0

    .line 1529
    const-string v4, "Start recording."

    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 1530
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mFrontFacing:Z

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lco/vine/android/recorder/RecordController;->openDefaultCamera(ZZ)Z

    move-result v2

    .line 1532
    :cond_0
    if-eqz v2, :cond_3

    .line 1533
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v3

    .line 1534
    .local v3, session:Lco/vine/android/recorder/RecordSession;
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1535
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->calculateAudioCount()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/vine/android/recorder/RecordSession;->setAudioDataCount(I)V

    .line 1536
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->calculateVideoCount()I

    move-result v4

    invoke-virtual {v3, v4}, Lco/vine/android/recorder/RecordSession;->setVideoDataCount(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1538
    :try_start_1
    invoke-static {}, Lco/vine/android/recorder/EncoderManager;->tryLoad()V

    .line 1539
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->getAudioDataCount()I

    move-result v6

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->getVideoDataCount()I

    move-result v7

    invoke-virtual {v4, v0, v5, v6, v7}, Lco/vine/android/recorder/RecordController;->start(Landroid/app/Activity;Ljava/lang/String;II)Z

    .line 1540
    const-string v4, "Start recording: {} at {}."

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v7}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1551
    .end local v3           #session:Lco/vine/android/recorder/RecordSession;
    :cond_1
    :goto_0
    :try_start_2
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->isPreviewing()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1552
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->startPreview()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1555
    .end local v2           #isCameraReady:Z
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    .line 1541
    .restart local v2       #isCameraReady:Z
    .restart local v3       #session:Lco/vine/android/recorder/RecordSession;
    :catch_0
    move-exception v1

    .line 1542
    .local v1, e:Ljava/lang/LinkageError;
    :try_start_3
    invoke-virtual {p0, v1}, Lco/vine/android/recorder/VineRecorder;->onDeviceNotSupported(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 1524
    .end local v0           #activity:Landroid/app/Activity;
    .end local v1           #e:Ljava/lang/LinkageError;
    .end local v2           #isCameraReady:Z
    .end local v3           #session:Lco/vine/android/recorder/RecordSession;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1544
    .restart local v0       #activity:Landroid/app/Activity;
    .restart local v2       #isCameraReady:Z
    .restart local v3       #session:Lco/vine/android/recorder/RecordSession;
    :catch_1
    move-exception v1

    .line 1545
    .local v1, e:Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;
    :try_start_4
    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1549
    .end local v1           #e:Lco/vine/android/recorder/RecordController$RecordControllerReadyStartedException;
    .end local v3           #session:Lco/vine/android/recorder/RecordSession;
    :cond_3
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->showCameraFailedToast()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method private startRelativeTime()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1797
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mRelativeTimeStarted:Z

    if-eqz v2, :cond_0

    .line 1815
    :goto_0
    return v0

    .line 1800
    :cond_0
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isCameraReady()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v4

    iget v4, v4, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_2

    .line 1802
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    if-eqz v2, :cond_1

    .line 1803
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->endRelativeTime()Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v1

    .line 1804
    goto :goto_0

    .line 1807
    :cond_1
    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingFileDuration:I

    int-to-long v1, v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    .line 1808
    const-string v1, "START RELATIVE TIME."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;)V

    .line 1809
    new-instance v1, Lco/vine/android/recorder/RecordSegment;

    iget-wide v2, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    invoke-direct {v1, v2, v3}, Lco/vine/android/recorder/RecordSegment;-><init>(J)V

    iput-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 1810
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1, v0}, Lco/vine/android/recorder/RecordController;->setRecordingAudio(Z)V

    .line 1811
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/RecordController;->setRecording(Lco/vine/android/recorder/RecordSegment;)V

    .line 1812
    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mRelativeTimeStarted:Z

    goto :goto_0

    :cond_2
    move v0, v1

    .line 1815
    goto :goto_0
.end method

.method private stop(Ljava/lang/String;Ljava/lang/Runnable;ZZ)V
    .locals 8
    .parameter "tag"
    .parameter "onComplete"
    .parameter "releasePreview"
    .parameter "saveSession"

    .prologue
    const/4 v7, 0x0

    .line 1841
    iget-object v6, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    .line 1842
    .local v6, dialog:Landroid/app/ProgressDialog;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1843
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    new-instance v2, Lco/vine/android/recorder/VineRecorder$15;

    invoke-direct {v2, p0, v6}, Lco/vine/android/recorder/VineRecorder$15;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/app/ProgressDialog;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1849
    new-instance v0, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    if-nez p4, :cond_0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-boolean v1, v1, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z

    if-eqz v1, :cond_1

    :cond_0
    const/4 v5, 0x1

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;-><init>(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;Ljava/lang/Runnable;ZZ)V

    .line 1851
    .local v0, finishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1, v0}, Lco/vine/android/recorder/RecordController;->setFinishProcessTask(Lco/vine/android/recorder/VineRecorder$FinishProcessTask;)V

    .line 1852
    new-array v1, v7, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$FinishProcessTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1856
    .end local v0           #finishProcessTask:Lco/vine/android/recorder/VineRecorder$FinishProcessTask;
    :goto_1
    return-void

    :cond_1
    move v5, v7

    .line 1849
    goto :goto_0

    .line 1854
    :cond_2
    const-string v1, "Stop twice? wtf."

    invoke-static {v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private stopProgressTimer()V
    .locals 1

    .prologue
    .line 2371
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    if-eqz v0, :cond_0

    .line 2372
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressTimer;->release()V

    .line 2373
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    .line 2375
    :cond_0
    return-void
.end method

.method private swapTimestampsFromSegments(Ljava/util/ArrayList;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/recorder/RecordSegment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 909
    .local p1, segments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/recorder/RecordSegment;>;"
    const/4 v0, 0x0

    .line 910
    .local v0, audioProgress:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/vine/android/recorder/RecordSegment;

    .line 911
    .local v3, segment:Lco/vine/android/recorder/RecordSegment;
    iget-boolean v4, v3, Lco/vine/android/recorder/RecordSegment;->removed:Z

    if-nez v4, :cond_0

    .line 912
    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSegment;->getCombinedAudioData()Lco/vine/android/recorder/AudioData;

    move-result-object v4

    iget v4, v4, Lco/vine/android/recorder/AudioData;->size:I

    add-int/2addr v0, v4

    goto :goto_0

    .line 915
    .end local v3           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    invoke-static {v0}, Lco/vine/android/recorder/RecordConfigUtils;->getTimeStampInNsFromSampleCounted(I)I

    move-result v1

    .line 916
    .local v1, audioTimestamp:I
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4, v1}, Lco/vine/android/recorder/RecordController;->setAudioTimestamp(I)V

    .line 917
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    int-to-long v5, v1

    invoke-virtual {v4, v5, v6}, Lco/vine/android/recorder/RecordController;->setVideoTimeStamp(J)V

    .line 918
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v4}, Lco/vine/android/recorder/RecordController;->getTimestamp()J

    move-result-wide v4

    iput-wide v4, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    .line 919
    iget-wide v4, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    long-to-int v4, v4

    iput v4, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingFileDuration:I

    .line 920
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->invalidateFinishButton()V

    .line 921
    return-void
.end method


# virtual methods
.method public canChangeFocus()Z
    .locals 1

    .prologue
    .line 436
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->canChangeFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canKeepRecording()Z
    .locals 1

    .prologue
    .line 1406
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canPickUpFloatView()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1034
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 1035
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 1037
    :cond_0
    return v0
.end method

.method public canSwitchCamera()Z
    .locals 1

    .prologue
    .line 1410
    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasFrontFacingCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lco/vine/android/recorder/CameraManager;->hasBackFacingCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecording()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public changeProgress(J)V
    .locals 5
    .parameter "progress"

    .prologue
    .line 2567
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    if-eqz v0, :cond_1

    .line 2568
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->progressWidth:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2569
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v0

    iput v0, p0, Lco/vine/android/recorder/VineRecorder;->progressWidth:I

    .line 2571
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->progressWidth:I

    int-to-long v1, v1

    mul-long/2addr v1, p1

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v3

    iget v3, v3, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-long v3, v3

    div-long/2addr v1, v3

    long-to-int v1, v1

    iput v1, v0, Lco/vine/android/recorder/ProgressView;->shouldBeWidth:I

    .line 2572
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressView;->invalidate()V

    .line 2573
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressOverlay:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2575
    :cond_1
    return-void
.end method

.method public cleanThumbnails(Z)V
    .locals 5
    .parameter "discardNewOnes"

    .prologue
    .line 944
    new-instance v3, Ljava/util/HashSet;

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 945
    .local v3, toRemove:Ljava/util/HashSet;,"Ljava/util/HashSet<Lco/vine/android/recorder/RecordSegment;>;"
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->clear()V

    .line 946
    if-eqz p1, :cond_0

    .line 947
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mAddedSegments:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 949
    :cond_0
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    .line 950
    .local v1, segment:Lco/vine/android/recorder/RecordSegment;
    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSegment;->getThumbnailPath()Ljava/lang/String;

    move-result-object v2

    .line 951
    .local v2, thumbnailPath:Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 952
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    goto :goto_0

    .line 955
    .end local v1           #segment:Lco/vine/android/recorder/RecordSegment;
    .end local v2           #thumbnailPath:Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public doOneFrame()V
    .locals 4

    .prologue
    .line 1242
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    if-eqz v0, :cond_0

    .line 1243
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->startRelativeTime()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1244
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$12;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$12;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    const-wide/16 v2, 0x19

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1252
    :cond_0
    return-void
.end method

.method public floatViewDropped(I)Z
    .locals 4
    .parameter "to"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1098
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->floatViewIntersectsTrashCan()Z

    move-result v0

    .line 1099
    .local v0, intersects:Z
    invoke-direct {p0, v2}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    .line 1100
    if-eqz v0, :cond_0

    .line 1101
    if-nez p1, :cond_5

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    if-le v1, v3, :cond_5

    .line 1102
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1, v3}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {p0, v1}, Lco/vine/android/recorder/VineRecorder;->showThumbnailOverlay(Lco/vine/android/recorder/RecordSegment;)V

    .line 1107
    :cond_0
    :goto_0
    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mPickedUpPosition:I

    if-ne v1, p1, :cond_1

    if-eqz v0, :cond_2

    .line 1108
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    const/4 v2, 0x0

    iput-object v2, v1, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    .line 1109
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    iput-boolean v3, v1, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->forceRefresh:Z

    .line 1111
    :cond_2
    if-eqz v0, :cond_3

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    if-eq v1, v3, :cond_4

    .line 1112
    :cond_3
    invoke-direct {p0, v3}, Lco/vine/android/recorder/VineRecorder;->animatePlayButton(Z)V

    .line 1114
    :cond_4
    return v0

    .line 1103
    :cond_5
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    if-le v1, v3, :cond_0

    .line 1104
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {p0, v1}, Lco/vine/android/recorder/VineRecorder;->showThumbnailOverlay(Lco/vine/android/recorder/RecordSegment;)V

    goto :goto_0
.end method

.method public floatViewLanded(I)V
    .locals 0
    .parameter "to"

    .prologue
    .line 1119
    return-void
.end method

.method public floatViewMoved()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1072
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->floatViewIntersectsTrashCan()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v3}, Lco/vine/android/dragsort/DragSortWidget;->canDelete()Z

    move-result v3

    if-eqz v3, :cond_0

    move v0, v1

    .line 1073
    .local v0, canDelete:Z
    :goto_0
    if-eqz v0, :cond_1

    .line 1074
    invoke-direct {p0, v1}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    .line 1078
    :goto_1
    return-void

    .end local v0           #canDelete:Z
    :cond_0
    move v0, v2

    .line 1072
    goto :goto_0

    .line 1076
    .restart local v0       #canDelete:Z
    :cond_1
    invoke-direct {p0, v2}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    goto :goto_1
.end method

.method public floatViewPickedUp(I)V
    .locals 3
    .parameter "item"

    .prologue
    const/4 v2, 0x0

    .line 1043
    iput p1, p0, Lco/vine/android/recorder/VineRecorder;->mPickedUpPosition:I

    .line 1044
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    if-eqz v1, :cond_0

    .line 1045
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1, p1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/RecordSegment;

    .line 1046
    .local v0, segment:Lco/vine/android/recorder/RecordSegment;
    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineRecorder;->showThumbnailOverlay(Lco/vine/android/recorder/RecordSegment;)V

    .line 1047
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    iput-object v0, v1, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->toPlay:Lco/vine/android/recorder/RecordSegment;

    .line 1048
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    iput-boolean v2, v1, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;->forceRefresh:Z

    .line 1050
    .end local v0           #segment:Lco/vine/android/recorder/RecordSegment;
    :cond_0
    invoke-virtual {p0, v2}, Lco/vine/android/recorder/VineRecorder;->pausePreview(Z)V

    .line 1051
    return-void
.end method

.method public getCameraView()Landroid/view/View;
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    return-object v0
.end method

.method public getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
    .locals 2

    .prologue
    .line 2578
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    .line 2579
    .local v0, session:Lco/vine/android/recorder/RecordSession;
    if-eqz v0, :cond_0

    .line 2580
    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    .line 2582
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCurrentlyPlayingPosition()I
    .locals 2

    .prologue
    .line 1224
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    if-eqz v0, :cond_1

    .line 1226
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget v0, v0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->lastFirstItem:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget v0, v0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->lastFirstItem:I

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1229
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    iget v0, v0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;->lastFirstItem:I

    .line 1233
    :goto_0
    return v0

    .line 1231
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1233
    :cond_1
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    goto :goto_0
.end method

.method public getFile()Lco/vine/android/recorder/RecordingFile;
    .locals 1

    .prologue
    .line 1928
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    return-object v0
.end method

.method public getGhostView()Landroid/view/View;
    .locals 1

    .prologue
    .line 1219
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 1215
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getProgressView()Landroid/view/View;
    .locals 1

    .prologue
    .line 2257
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    return-object v0
.end method

.method public getSize()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 2650
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    return-object v0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2253
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordingFile;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 367
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->getTimestamp()J

    move-result-wide v0

    return-wide v0
.end method

.method public hideThumbnailOverlay()V
    .locals 3

    .prologue
    .line 1014
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 1015
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Lco/vine/android/recorder/VineRecorder;->mShortAnimTime:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/ViewGoneAnimationListener;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-direct {v1, v2}, Lco/vine/android/recorder/ViewGoneAnimationListener;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 1017
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1019
    :cond_0
    return-void
.end method

.method public hideThumbnailOverlayDelayed()V
    .locals 4

    .prologue
    .line 1004
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lco/vine/android/recorder/VineRecorder$11;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$11;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1011
    return-void
.end method

.method public isAutoFocusing()Z
    .locals 1

    .prologue
    .line 415
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    return v0
.end method

.method public isEditing()Z
    .locals 1

    .prologue
    .line 924
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEditingDirty()Z
    .locals 2

    .prologue
    .line 1122
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->compareTo(Ljava/util/ArrayList;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRecordingSegment()Z
    .locals 1

    .prologue
    .line 1200
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isResuming()Z
    .locals 2

    .prologue
    .line 2383
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    .line 2384
    .local v0, task:Lco/vine/android/recorder/VineRecorder$OnResumeTask;
    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->isRunning:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isSavedSession()Z
    .locals 1

    .prologue
    .line 1238
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z

    return v0
.end method

.method public isSessionDirty()Z
    .locals 1

    .prologue
    .line 928
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordingFile;->isDirty:Z

    return v0
.end method

.method public modifyZoom(Z)V
    .locals 1
    .parameter "zoomIn"

    .prologue
    .line 375
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 376
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/RecordController;->modifyZoom(Z)V

    .line 378
    :cond_0
    return-void
.end method

.method public onAutoFocusComplete(Z)V
    .locals 2
    .parameter "success"

    .prologue
    .line 450
    const-string v0, "Auto focus {}."

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 451
    return-void
.end method

.method public onCameraReady(Lco/vine/android/recorder/RecordController;)V
    .locals 4
    .parameter "controller"

    .prologue
    const/4 v2, 0x0

    .line 2276
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    if-eqz v1, :cond_1

    .line 2277
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v1

    iget-boolean v1, v1, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->flashSwitchEnabled:Z

    if-eqz v1, :cond_0

    .line 2278
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    .line 2279
    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 2280
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordController;->isFlashSupported()Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2283
    .end local v0           #view:Landroid/view/View;
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->onCameraReadyRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2284
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordController;->isSurfaceReady()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v1

    if-nez v1, :cond_3

    .line 2285
    const-string v1, "Camera ready"

    invoke-virtual {p0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->start(Ljava/lang/String;Z)V

    .line 2290
    :cond_1
    :goto_1
    return-void

    .line 2280
    .restart local v0       #view:Landroid/view/View;
    :cond_2
    const/16 v1, 0x8

    goto :goto_0

    .line 2287
    .end local v0           #view:Landroid/view/View;
    :cond_3
    const-string v1, "Do not start recording: {} {}"

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isSurfaceReady()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v3}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onCameraSwitcherPressed(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 1936
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherViewListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 1937
    return-void
.end method

.method public onDeviceNotSupported(Ljava/lang/Throwable;)V
    .locals 3
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    .line 480
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mAlreadyStoppingForUnspportedReasons:Z

    if-nez v0, :cond_1

    .line 481
    iput-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mAlreadyStoppingForUnspportedReasons:Z

    .line 482
    if-eqz p1, :cond_0

    .line 483
    invoke-static {p1}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 485
    :cond_0
    const-string v0, "OnDeviceNotSupported"

    new-instance v1, Lco/vine/android/recorder/VineRecorder$5;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$5;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {p0, v0, v1, v2}, Lco/vine/android/recorder/VineRecorder;->stopAndDiscardChanges(Ljava/lang/String;Ljava/lang/Runnable;Z)V

    .line 500
    :cond_1
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .parameter "mp"
    .parameter "what"
    .parameter "extra"

    .prologue
    .line 1205
    const/4 v0, 0x0

    return v0
.end method

.method public onFinishPressed(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 1932
    const-string v0, "onFinishPressed"

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->finish(Ljava/lang/String;)V

    .line 1933
    return-void
.end method

.method public onGhostSwitchPressed()Z
    .locals 1

    .prologue
    .line 454
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineRecorder;->setGhostMode(Z)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 1772
    monitor-enter p0

    packed-switch p2, :pswitch_data_0

    .line 1787
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    .line 1774
    :pswitch_0
    :try_start_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_1

    .line 1784
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 1776
    :pswitch_1
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->startRelativeTime()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 1772
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1780
    :pswitch_2
    :try_start_1
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->endRelativeTime()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1772
    nop

    :pswitch_data_0
    .packed-switch 0x1b
        :pswitch_0
    .end packed-switch

    .line 1774
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1387
    iput-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mNeverResumedRecorder:Z

    .line 1388
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    if-eqz v0, :cond_0

    .line 1389
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchCameraTask:Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;

    invoke-virtual {v0, v3}, Lco/vine/android/recorder/VineRecorder$ResumeCameraAsyncTask;->cancel(Z)Z

    .line 1391
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    if-eqz v0, :cond_1

    .line 1392
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    invoke-virtual {v0, v3}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->cancel(Z)Z

    .line 1394
    :cond_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    const-string v1, "onPause"

    invoke-virtual {v0, v1, v3, v2}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->run(Ljava/lang/String;ZZ)V

    .line 1395
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->onPause()V

    .line 1396
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

    if-eqz v0, :cond_2

    .line 1397
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHashTask:Lco/vine/android/recorder/ReusableHashAsyncTask;

    invoke-virtual {v0, v2}, Lco/vine/android/recorder/ReusableHashAsyncTask;->cancel(Z)Z

    .line 1399
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    if-eqz v0, :cond_3

    .line 1400
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    invoke-virtual {v0}, Lco/vine/android/recorder/ProgressTimer;->release()V

    .line 1401
    const/4 v0, 0x0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressTimer:Lco/vine/android/recorder/ProgressTimer;

    .line 1403
    :cond_3
    return-void
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2
    .parameter "mp"

    .prologue
    const/4 v1, 0x0

    .line 1023
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v0, :cond_1

    .line 1024
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0}, Lco/vine/android/dragsort/DragSortWidget;->hasFloatView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1025
    invoke-virtual {p0, v1}, Lco/vine/android/recorder/VineRecorder;->pausePreview(Z)V

    .line 1027
    :cond_0
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->hideThumbnailOverlayDelayed()V

    .line 1028
    invoke-direct {p0, v1}, Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V

    .line 1030
    :cond_1
    return-void
.end method

.method public onProgressMaxReached()V
    .locals 1

    .prologue
    .line 2240
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mHasPreviewedAlready:Z

    if-nez v0, :cond_0

    .line 2241
    const-string v0, "progressMaxReached"

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->finish(Ljava/lang/String;)V

    .line 2243
    :cond_0
    return-void
.end method

.method public onProgressThresholdReached()V
    .locals 2

    .prologue
    .line 2246
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButton:Landroid/view/View;

    .line 2247
    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 2248
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 2250
    :cond_0
    return-void
.end method

.method public onResume(Ljava/lang/String;Z)V
    .locals 8
    .parameter "tag"
    .parameter "delayDialog"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1349
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v0

    .line 1350
    .local v0, canKeepRecording:Z
    const-string v5, "Resume VineRecorder: delayDialog: {} canKeepRecording: {} isEditing: {} NullFinalFile: {}."

    const/4 v2, 0x4

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v6, v4

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v6, v3

    const/4 v2, 0x2

    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v2

    const/4 v7, 0x3

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->finalFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v2, :cond_1

    move v2, v3

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1351
    if-eqz v0, :cond_6

    .line 1352
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1354
    :try_start_0
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v2, v5}, Lco/vine/android/recorder/RecordController;->setPreviewSurface(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1358
    :goto_1
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mStartWithEditMode:Z

    if-eqz v2, :cond_2

    .line 1359
    invoke-virtual {p0, v3, v4}, Lco/vine/android/recorder/VineRecorder;->setEditMode(ZZ)V

    .line 1384
    :cond_0
    :goto_2
    return-void

    :cond_1
    move v2, v4

    .line 1350
    goto :goto_0

    .line 1355
    :catch_0
    move-exception v1

    .line 1356
    .local v1, e:Ljava/lang/Exception;
    const-string v2, "Cannot resume."

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {v1, v2, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    .line 1361
    .end local v1           #e:Ljava/lang/Exception;
    :cond_2
    new-instance v2, Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "OnResume_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, p0, v5, v6}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/view/View;Ljava/lang/String;)V

    iput-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    .line 1362
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    if-nez p2, :cond_3

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-boolean v5, v5, Lco/vine/android/recorder/RecordingFile;->isSavedSession:Z

    if-eqz v5, :cond_4

    iget-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mNeverResumedRecorder:Z

    if-eqz v5, :cond_4

    :cond_3
    :goto_3
    iput-boolean v3, v2, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->showDialogDelayed:Z

    .line 1363
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    new-array v3, v4, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_2

    :cond_4
    move v3, v4

    .line 1362
    goto :goto_3

    .line 1366
    :cond_5
    invoke-virtual {p0, v3, v4}, Lco/vine/android/recorder/VineRecorder;->setEditMode(ZZ)V

    goto :goto_2

    .line 1369
    :cond_6
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->finalFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v2, :cond_7

    .line 1370
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mOnCompleteConsumer:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 1372
    :cond_7
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v2, :cond_0

    .line 1373
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFinishLastSegmentString:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1374
    if-nez p2, :cond_0

    .line 1376
    :try_start_1
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V
    :try_end_1
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 1377
    :catch_1
    move-exception v2

    goto :goto_2
.end method

.method public onSelectionChanged(IZ)V
    .locals 6
    .parameter "position"
    .parameter "listViewClick"

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 959
    iput p1, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    .line 960
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    .line 961
    .local v0, editor:Lco/vine/android/recorder/SegmentEditorAdapter;
    if-eqz v0, :cond_1

    .line 962
    const/4 v2, -0x1

    if-eq p1, v2, :cond_2

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_2

    .line 963
    invoke-direct {p0, v3}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    .line 964
    invoke-virtual {v0, p1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    .line 965
    .local v1, toPlay:Lco/vine/android/recorder/RecordSegment;
    if-eqz p2, :cond_0

    .line 966
    invoke-virtual {p0, v1, v4}, Lco/vine/android/recorder/VineRecorder;->playPreview(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 968
    :cond_0
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->commitDelete()V

    .line 988
    .end local v1           #toPlay:Lco/vine/android/recorder/RecordSegment;
    :cond_1
    :goto_0
    return-void

    .line 969
    :cond_2
    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v2

    if-lez v2, :cond_5

    .line 970
    invoke-direct {p0, v5}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    .line 971
    if-eqz p2, :cond_4

    .line 972
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v4}, Lco/vine/android/recorder/VineRecorder;->playPreview(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 976
    :cond_3
    :goto_1
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v2, :cond_1

    .line 977
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v2, v3}, Lco/vine/android/dragsort/DragSortWidget;->setFocused(I)V

    goto :goto_0

    .line 973
    :cond_4
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    if-eqz v2, :cond_3

    if-nez p2, :cond_3

    .line 974
    invoke-virtual {p0, v4}, Lco/vine/android/recorder/VineRecorder;->pausePreview(Z)V

    goto :goto_1

    .line 980
    :cond_5
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 981
    invoke-direct {p0, v3}, Lco/vine/android/recorder/VineRecorder;->animatePlayButton(Z)V

    .line 982
    invoke-direct {p0, v3}, Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V

    .line 983
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->hideThumbnailOverlay()V

    .line 984
    invoke-direct {p0, v5}, Lco/vine/android/recorder/VineRecorder;->animateTopButtons(I)V

    .line 985
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lco/vine/android/player/SdkVideoView;->setVisibility(I)V

    goto :goto_0
.end method

.method public onSurfaceReady(Lco/vine/android/recorder/RecordController;)V
    .locals 3
    .parameter "controller"

    .prologue
    const/4 v1, 0x0

    .line 2262
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isCameraReady()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2263
    const-string v0, "Start recording on surface ready."

    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 2264
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2265
    const-string v0, "Surface Ready"

    invoke-virtual {p0, v0, v1}, Lco/vine/android/recorder/VineRecorder;->start(Ljava/lang/String;Z)V

    .line 2272
    :goto_0
    return-void

    .line 2267
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->startPreview()V

    goto :goto_0

    .line 2270
    :cond_1
    const-string v0, "Do not start recording: {} {}."

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public declared-synchronized onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1736
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1737
    .local v0, action:I
    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lco/vine/android/recorder/VineRecorder;->mEnabled:Z

    if-eqz v4, :cond_2

    .line 1738
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1739
    iget-boolean v3, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    .line 1740
    packed-switch v0, :pswitch_data_0

    .line 1766
    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    .line 1743
    :pswitch_0
    const/4 v3, 0x0

    :try_start_1
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v1

    .line 1744
    .local v1, axisX:F
    const v3, 0x3d4ccccd

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    cmpl-float v3, v1, v3

    if-lez v3, :cond_0

    const v3, 0x3f733333

    iget-object v4, p0, Lco/vine/android/recorder/VineRecorder;->mSize:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    cmpg-float v3, v1, v3

    if-gez v3, :cond_0

    .line 1746
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->startRelativeTime()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1736
    .end local v0           #action:I
    .end local v1           #axisX:F
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1751
    .restart local v0       #action:I
    :pswitch_1
    :try_start_2
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->endRelativeTime()Z

    goto :goto_0

    .line 1756
    :cond_1
    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 1758
    :pswitch_2
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v4

    invoke-direct {p0, v3, v4}, Lco/vine/android/recorder/VineRecorder;->changeFocusTo(FF)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_2
    move v2, v3

    .line 1766
    goto :goto_0

    .line 1740
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 1756
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
    .end packed-switch
.end method

.method public onUiPaused()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 2168
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->releaseSegmentChangeDetector()V

    .line 2169
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 2170
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2172
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v1, :cond_1

    .line 2173
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v1}, Lco/vine/android/dragsort/DragSortWidget;->releaseReferences()V

    .line 2175
    :cond_1
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    .line 2176
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mResources:Landroid/content/res/Resources;

    .line 2178
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_2

    .line 2179
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2181
    :cond_2
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_3

    .line 2182
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2184
    :cond_3
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_4

    .line 2185
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 2187
    :cond_4
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    if-eqz v1, :cond_5

    .line 2188
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->cancel(Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2193
    :cond_5
    :goto_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v1, :cond_6

    .line 2194
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v1, v3}, Lco/vine/android/player/SdkVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 2195
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v1, v3}, Lco/vine/android/player/SdkVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 2197
    :cond_6
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    .line 2198
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    .line 2199
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    .line 2200
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    .line 2201
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    .line 2202
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    .line 2203
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mOnCompleteConsumer:Ljava/lang/Runnable;

    .line 2204
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    .line 2205
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    .line 2206
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButton:Landroid/view/View;

    .line 2207
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    .line 2208
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    .line 2209
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    .line 2210
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailSegment:Lco/vine/android/recorder/RecordSegment;

    .line 2211
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    .line 2212
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    .line 2213
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    .line 2214
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskView:Landroid/view/View;

    .line 2215
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButton:Landroid/view/View;

    .line 2216
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButton:Landroid/view/View;

    .line 2217
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    .line 2218
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    .line 2219
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    .line 2220
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFocusView:Landroid/view/View;

    .line 2221
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mToast:Landroid/widget/Toast;

    .line 2222
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    .line 2223
    iput-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    .line 2224
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->onPause()V

    .line 2225
    return-void

    .line 2190
    :catch_0
    move-exception v0

    .line 2191
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "It\'s probably detached already."

    invoke-static {v1, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onUiResumed(Landroid/app/Activity;Ljava/lang/Runnable;Z)V
    .locals 8
    .parameter "activity"
    .parameter "onCompleteAsyncTask"
    .parameter "doNotResumeRecorder"
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ShowToast"
        }
    .end annotation

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x0

    const/4 v5, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1941
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    .line 1942
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mResources:Landroid/content/res/Resources;

    .line 1943
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1, v5}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    .line 1944
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialogMessage:[Ljava/lang/CharSequence;

    aget-object v1, v1, v3

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1945
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 1946
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1947
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 1948
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 1949
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lco/vine/android/recorder/R$drawable;->progress_horizontal:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1950
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1, v5}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    .line 1951
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1, v5}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    .line 1952
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraResource:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1953
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mOpenCameraDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1954
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0, p1}, Lco/vine/android/recorder/RecordController;->updateRotation(Landroid/app/Activity;)V

    .line 1955
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mRootLayoutId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRootLayoutView:Landroid/view/View;

    .line 1956
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraViewResourceId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    .line 1957
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1958
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1959
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1960
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptionsRowId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRecordingOptions:Landroid/view/View;

    .line 1961
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTopMaskView:Landroid/view/View;

    .line 1962
    const v0, 0x102000a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailList:Landroid/view/View;

    .line 1963
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlayId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    .line 1964
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainerId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    .line 1965
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$16;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$16;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1974
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainerId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    .line 1975
    new-instance v0, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    invoke-direct {v0, p0, v6}, Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;-><init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/VineRecorder$1;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    .line 1976
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonOnClickListener:Lco/vine/android/recorder/VineRecorder$PlayButtonOnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1977
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$17;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$17;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1988
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButton:Landroid/view/View;

    .line 1989
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayButtonContainer:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPlayRefreshButton:Landroid/view/View;

    .line 1990
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidgetId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/dragsort/DragSortWidget;

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    .line 1991
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/DragSortWidget;->setSelectionChangedListener(Lco/vine/android/dragsort/DragSortWidget$SelectionChangedListener;)V

    .line 1992
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/DragSortWidget;->setFloatViewInteractionListener(Lco/vine/android/dragsort/DragSortWidget$FloatViewInteractionListener;)V

    .line 1993
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, p0}, Lco/vine/android/dragsort/DragSortWidget;->setCurrentlyPlayingProvider(Lco/vine/android/dragsort/DragSortWidget$CurrentlyPlayingProvider;)V

    .line 1994
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mBottomMaskView:Landroid/view/View;

    .line 1995
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtonsId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    .line 1996
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorButtons:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$18;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$18;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2002
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButtonId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButton:Landroid/view/View;

    .line 2003
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlayId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mPreviewLoadingOverlay:Landroid/view/View;

    .line 2004
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorDoneButton:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$19;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$19;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2015
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButtonId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    .line 2016
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$20;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$20;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2027
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButtonId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    .line 2028
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$21;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$21;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2047
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashCanButton:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$22;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$22;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2067
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButtonId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButton:Landroid/view/View;

    .line 2068
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorCancelButton:Landroid/view/View;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$23;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$23;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2079
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressViewResourceId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/vine/android/recorder/ProgressView;

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    .line 2080
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2081
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    invoke-virtual {v0, v3}, Lco/vine/android/recorder/ProgressView;->setKeepScreenOn(Z)V

    .line 2082
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitchId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    .line 2083
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusViewResourceId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFocusView:Landroid/view/View;

    .line 2084
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButtonId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButton:Landroid/view/View;

    .line 2085
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishButton:Landroid/view/View;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mFinishClicker:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2086
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    const-wide/16 v2, 0x3e8

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 2087
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->onProgressThresholdReached()V

    .line 2089
    :cond_0
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherId:I

    if-lez v0, :cond_4

    .line 2090
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    .line 2091
    invoke-static {p1}, Lco/vine/android/recorder/RecordConfigUtils;->getGenericConfig(Landroid/content/Context;)Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v0

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->cameraSwitchEnabled:Z

    if-nez v0, :cond_3

    .line 2092
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2099
    :goto_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressView:Lco/vine/android/recorder/ProgressView;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$24;

    invoke-direct {v1, p0}, Lco/vine/android/recorder/VineRecorder$24;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/ProgressView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2105
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcherId:I

    if-lez v0, :cond_6

    .line 2106
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcherId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    .line 2107
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v0

    iget-boolean v0, v0, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->flashSwitchEnabled:Z

    if-eqz v0, :cond_5

    .line 2108
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 2109
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSwitchFlashViewListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2116
    :goto_1
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->canSwitchCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2117
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->showCameraSwitcher()V

    .line 2119
    :cond_1
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder;->mOnCompleteConsumer:Ljava/lang/Runnable;

    .line 2120
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    invoke-virtual {v0}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->reset()V

    .line 2121
    iput-boolean v4, p0, Lco/vine/android/recorder/VineRecorder;->mIsSwitchingCamera:Z

    .line 2122
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraFailString:I

    invoke-static {p1, v0, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mToast:Landroid/widget/Toast;

    .line 2124
    iget v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressOverlayId:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mProgressOverlay:Landroid/view/View;

    .line 2125
    if-nez p3, :cond_2

    .line 2126
    const-string v0, "UI Resume"

    invoke-virtual {p0, v0, v4}, Lco/vine/android/recorder/VineRecorder;->onResume(Ljava/lang/String;Z)V

    .line 2128
    :cond_2
    return-void

    .line 2094
    :cond_3
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcherViewListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 2097
    :cond_4
    iput-object v6, p0, Lco/vine/android/recorder/VineRecorder;->mCameraSwitcher:Landroid/view/ViewGroup;

    goto :goto_0

    .line 2111
    :cond_5
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 2114
    :cond_6
    iput-object v6, p0, Lco/vine/android/recorder/VineRecorder;->mFlashSwitcher:Landroid/view/View;

    goto :goto_1
.end method

.method public pausePreview(Z)V
    .locals 2
    .parameter "showPlayButton"

    .prologue
    const/4 v1, 0x1

    .line 1054
    if-eqz p1, :cond_1

    .line 1055
    invoke-direct {p0, v1}, Lco/vine/android/recorder/VineRecorder;->animatePlayButton(Z)V

    .line 1059
    :goto_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    if-eqz v0, :cond_0

    .line 1060
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->cancel(Z)Z

    .line 1062
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->pause()V

    .line 1063
    return-void

    .line 1057
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->animatePlayButton(Z)V

    goto :goto_0
.end method

.method public playPreview(Lco/vine/android/recorder/RecordSegment;Z)V
    .locals 1
    .parameter "toPlay"
    .parameter "forceRefresh"

    .prologue
    .line 1066
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->animatePlayButton(Z)V

    .line 1067
    invoke-virtual {p0, p1, p2}, Lco/vine/android/recorder/VineRecorder;->refreshVideoView(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 1068
    return-void
.end method

.method public postProgressUpdate(I)V
    .locals 2
    .parameter "progress"

    .prologue
    .line 2587
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mChangeProgressRunnable:Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;

    iput p1, v0, Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;->progress:I

    .line 2588
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mChangeProgressRunnable:Lco/vine/android/recorder/VineRecorder$ChangeProgressRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2589
    return-void
.end method

.method public refreshVideoView(Lco/vine/android/recorder/RecordSegment;Z)V
    .locals 4
    .parameter "segment"
    .parameter "forceRefresh"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1576
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->releaseSegmentChangeDetector()V

    .line 1577
    new-instance v0, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    invoke-direct {v0, p0}, Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;-><init>(Lco/vine/android/recorder/VineRecorder;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    .line 1578
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeDetector:Lco/vine/android/recorder/VineRecorder$SegmentChangeDetector;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeThread:Ljava/lang/Thread;

    .line 1579
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSegmentChangeThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1580
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    if-ne v0, p1, :cond_0

    if-eqz p2, :cond_4

    .line 1581
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 1582
    invoke-virtual {p0, p1}, Lco/vine/android/recorder/VineRecorder;->showThumbnailOverlay(Lco/vine/android/recorder/RecordSegment;)V

    .line 1584
    :cond_1
    if-nez p1, :cond_2

    .line 1585
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v0, :cond_2

    .line 1586
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, v2}, Lco/vine/android/dragsort/DragSortWidget;->setFocused(I)V

    .line 1589
    :cond_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    if-eqz v0, :cond_3

    .line 1590
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    invoke-virtual {v0, v3}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->cancel(Z)Z

    .line 1592
    :cond_3
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->suspend()V

    .line 1593
    invoke-direct {p0, v3}, Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V

    .line 1594
    new-instance v0, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    invoke-direct {v0, p0, p1}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;-><init>(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    .line 1595
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1601
    :goto_0
    return-void

    .line 1597
    :cond_4
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v0}, Lco/vine/android/player/SdkVideoView;->resume()V

    .line 1598
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->hideThumbnailOverlayDelayed()V

    .line 1599
    invoke-direct {p0, v2}, Lco/vine/android/recorder/VineRecorder;->animatePreviewSpinner(Z)V

    goto :goto_0
.end method

.method public release()Z
    .locals 8

    .prologue
    const/4 v0, 0x0

    const/4 v7, 0x0

    .line 381
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordController;->releaseParent()V

    .line 382
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordController;->releaseCameraResources()V

    .line 383
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordController;->releaseCallbacks()V

    .line 384
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v5}, Lco/vine/android/recorder/RecordController;->logPreviewSizeExceptionIfNeeded()V

    .line 385
    const/4 v3, 0x0

    .line 386
    .local v3, sessionDeleted:Z
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v5, :cond_1

    .line 387
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v2, v5, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    .line 388
    .local v2, folder:Ljava/io/File;
    iget-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mDoNotDeleteSession:Z

    if-nez v5, :cond_3

    invoke-static {v2}, Lco/vine/android/recorder/RecordSessionManager;->isSessionSaved(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 390
    :try_start_0
    const-string v5, "Release"

    invoke-static {v2, v5}, Lco/vine/android/recorder/RecordSessionManager;->deleteSession(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 391
    const/4 v3, 0x1

    .line 401
    :cond_0
    :goto_0
    const-string v5, "Session deleted: {}"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 403
    .end local v2           #folder:Ljava/io/File;
    :cond_1
    iput-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    .line 404
    iput-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    .line 405
    iput-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentSegment:Lco/vine/android/recorder/RecordSegment;

    .line 406
    iput-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    .line 407
    iput-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    .line 408
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mAddedSegments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 409
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_2

    if-eqz v3, :cond_2

    const/4 v0, 0x1

    .line 410
    .local v0, abandoned:Z
    :cond_2
    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 411
    return v0

    .line 392
    .end local v0           #abandoned:Z
    .restart local v2       #folder:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 393
    .local v1, e:Ljava/io/IOException;
    const-string v5, "Failed to delete session: {}."

    invoke-static {v5, v1}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 396
    .end local v1           #e:Ljava/io/IOException;
    :cond_3
    invoke-static {v2, v0}, Lco/vine/android/recorder/RecordSessionManager;->getDataFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v4

    .line 397
    .local v4, temporaryDataFile:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 398
    invoke-static {v4}, Lorg/apache/commons/io/FileUtils;->deleteQuietly(Ljava/io/File;)Z

    goto :goto_0
.end method

.method public reverseFrames()V
    .locals 1

    .prologue
    .line 1209
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->isEditing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1210
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->reverse()V

    .line 1212
    :cond_0
    return-void
.end method

.method public saveSession(Ljava/lang/Runnable;Z)V
    .locals 2
    .parameter "onSaveSessionCompleteRunnable"
    .parameter "releaseCamera"

    .prologue
    .line 939
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    .line 940
    const-string v0, "saveSession"

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, p2, v1}, Lco/vine/android/recorder/VineRecorder;->stop(Ljava/lang/String;Ljava/lang/Runnable;ZZ)V

    .line 941
    return-void
.end method

.method public setAutoFocusing(Z)V
    .locals 3
    .parameter "autoFocusing"

    .prologue
    .line 419
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    .line 420
    .local v0, controller:Lco/vine/android/recorder/RecordController;
    if-eqz v0, :cond_0

    .line 421
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    .line 422
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    invoke-virtual {v1, v2}, Lco/vine/android/recorder/RecordController;->setAutoFocus(Z)V

    .line 423
    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mAutoFocusing:Z

    if-eqz v1, :cond_0

    .line 424
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->dismissFocusIndicator()V

    .line 427
    :cond_0
    return-void
.end method

.method public setDiscardChanges(Z)V
    .locals 0
    .parameter "discardChanges"

    .prologue
    .line 1493
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    .line 1494
    return-void
.end method

.method public setEditMode(Landroid/view/View;ZZ)V
    .locals 7
    .parameter "view"
    .parameter "on"
    .parameter "discard"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 747
    const-string v2, "Set edit mode: {} {}."

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 748
    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    .line 749
    .local v1, wasEditingAlready:Z
    iput-boolean p2, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    .line 750
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 751
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordingFile;->hasData()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 752
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    if-eqz v2, :cond_2

    .line 753
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mStartWithEditMode:Z

    .line 754
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->canKeepRecording()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 755
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 756
    const-string v2, "editMode"

    new-instance v3, Lco/vine/android/recorder/VineRecorder$9;

    invoke-direct {v3, p0, v1}, Lco/vine/android/recorder/VineRecorder$9;-><init>(Lco/vine/android/recorder/VineRecorder;Z)V

    invoke-direct {p0, v2, v3, v6, v5}, Lco/vine/android/recorder/VineRecorder;->stop(Ljava/lang/String;Ljava/lang/Runnable;ZZ)V

    .line 810
    :goto_0
    return-void

    .line 763
    :cond_0
    invoke-virtual {p0, v1}, Lco/vine/android/recorder/VineRecorder;->startEditMode(Z)V

    goto :goto_0

    .line 766
    :cond_1
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    goto :goto_0

    .line 769
    :cond_2
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->releaseSegmentChangeDetector()V

    .line 770
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    if-eqz v2, :cond_3

    .line 771
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mRefreshPreviewTask:Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;

    invoke-virtual {v2, v6}, Lco/vine/android/recorder/VineRecorder$RefreshPreviewTask;->cancel(Z)Z

    .line 773
    :cond_3
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    if-eqz v2, :cond_4

    .line 774
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoPlayer:Lco/vine/android/player/SdkVideoView;

    invoke-virtual {v2}, Lco/vine/android/player/SdkVideoView;->stopPlayback()V

    .line 776
    :cond_4
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v2, :cond_5

    .line 777
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v2}, Lco/vine/android/dragsort/DragSortWidget;->cleanUp()V

    .line 779
    :cond_5
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mIsGridOn:Z

    if-eqz v2, :cond_6

    .line 780
    invoke-virtual {p0, v5}, Lco/vine/android/recorder/VineRecorder;->setGridOn(Z)V

    .line 781
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    iget-boolean v3, p0, Lco/vine/android/recorder/VineRecorder;->mIsGridOn:Z

    invoke-virtual {v2, v3}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 783
    :cond_6
    iget-boolean v2, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    if-eqz v2, :cond_7

    .line 784
    invoke-virtual {p0, v5}, Lco/vine/android/recorder/VineRecorder;->setGhostMode(Z)Z

    .line 786
    :cond_7
    if-nez p3, :cond_9

    .line 787
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->commitChanges()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 788
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 789
    .local v0, size:I
    if-lez v0, :cond_8

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    if-eqz v2, :cond_8

    .line 790
    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v3, v2, v6}, Lco/vine/android/recorder/RecordController;->makePreview(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 793
    .end local v0           #size:I
    :cond_8
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    if-eqz v2, :cond_9

    .line 794
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordingFile;->invalidateGhostThumbnail()V

    .line 797
    :cond_9
    invoke-direct {p0, v6}, Lco/vine/android/recorder/VineRecorder;->animateEditModeControlsOut(Z)V

    .line 798
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->animateCaptureControlsIn()V

    .line 799
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->invalidateGhostView()V

    .line 800
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->invalidateFinishButton()V

    .line 801
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->setHasPreviewedAlreadyIfNeeded()V

    .line 802
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z

    .line 803
    new-instance v2, Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    const-string v3, "Set EditMode."

    invoke-direct {v2, p0, p1, v3}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/view/View;Ljava/lang/String;)V

    iput-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    .line 804
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mResumeTask:Lco/vine/android/recorder/VineRecorder$OnResumeTask;

    new-array v3, v5, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lco/vine/android/recorder/VineRecorder$OnResumeTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 805
    const/4 v2, 0x0

    iput-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    goto/16 :goto_0

    .line 808
    :cond_a
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mEditing:Z

    goto/16 :goto_0
.end method

.method public setEditMode(ZZ)V
    .locals 1
    .parameter "on"
    .parameter "discard"

    .prologue
    .line 813
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lco/vine/android/recorder/VineRecorder;->setEditMode(Landroid/view/View;ZZ)V

    .line 814
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 1488
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mEnabled:Z

    .line 1489
    return-void
.end method

.method public setGhostMode(Z)Z
    .locals 3
    .parameter "enable"

    .prologue
    const/4 v0, 0x0

    .line 458
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    .line 459
    if-eqz p1, :cond_0

    .line 460
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 464
    :goto_0
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    .line 465
    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostModeEnabled:Z

    if-eqz v1, :cond_1

    .line 466
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v1, v0}, Lco/vine/android/recorder/RecordController;->requestGhostDrawing(Z)V

    .line 470
    :goto_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGhostButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 473
    .end local p1
    :goto_2
    return p1

    .line 462
    .restart local p1
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mGhostView:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 468
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineRecorder;->updateGhostBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1

    :cond_2
    move p1, v0

    .line 473
    goto :goto_2
.end method

.method public setGridOn(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 527
    iput-boolean p1, p0, Lco/vine/android/recorder/VineRecorder;->mIsGridOn:Z

    .line 528
    return-void
.end method

.method public showFocusIndicator(II)V
    .locals 7
    .parameter "x"
    .parameter "y"

    .prologue
    .line 440
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 441
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v1

    .line 442
    .local v1, width:I
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v0

    .line 443
    .local v0, height:I
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    div-int/lit8 v3, v1, 0x2

    sub-int v3, p1, v3

    div-int/lit8 v4, v0, 0x2

    sub-int v4, p2, v4

    div-int/lit8 v5, v1, 0x2

    add-int/2addr v5, p1

    div-int/lit8 v6, v0, 0x2

    add-int/2addr v6, p2

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/ImageView;->layout(IIII)V

    .line 444
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 445
    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mFocusIndicator:Landroid/widget/ImageView;

    iget-object v3, p0, Lco/vine/android/recorder/VineRecorder;->mFocusAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 447
    .end local v0           #height:I
    .end local v1           #width:I
    :cond_0
    return-void
.end method

.method public showInitializationDialog()V
    .locals 1

    .prologue
    .line 2551
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 2552
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mStartProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 2554
    :cond_0
    return-void
.end method

.method public showThumbnailOverlay(Lco/vine/android/recorder/RecordSegment;)V
    .locals 4
    .parameter "segment"

    .prologue
    const/4 v3, 0x0

    .line 991
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailSegment:Lco/vine/android/recorder/RecordSegment;

    if-eq p1, v1, :cond_2

    .line 992
    :cond_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 993
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    const/high16 v2, 0x3f80

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 994
    if-nez p1, :cond_1

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1}, Lco/vine/android/recorder/SegmentEditorAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 995
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v1, v3}, Lco/vine/android/recorder/SegmentEditorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    .end local p1
    check-cast p1, Lco/vine/android/recorder/RecordSegment;

    .line 997
    .restart local p1
    :cond_1
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1, v1}, Lco/vine/android/recorder/RecordSegment;->getDrawableCopy(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 998
    .local v0, thumbDrawable:Landroid/graphics/drawable/Drawable;
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailOverlay:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1000
    .end local v0           #thumbDrawable:Landroid/graphics/drawable/Drawable;
    :cond_2
    iput-object p1, p0, Lco/vine/android/recorder/VineRecorder;->mThumbnailSegment:Lco/vine/android/recorder/RecordSegment;

    .line 1001
    return-void
.end method

.method public start(Ljava/lang/String;Z)V
    .locals 4
    .parameter "tag"
    .parameter "stopPrevious"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1497
    const-string v0, "Start called from {}."

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1498
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    if-nez v0, :cond_0

    .line 1499
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot start recording again if it is finished."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 1500
    const-string v0, "Start failed."

    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 1514
    :goto_0
    return-void

    .line 1502
    :cond_0
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->adjustBoundaries(Lco/vine/android/recorder/CameraSetting;)V

    .line 1503
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->isRecordingStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 1504
    const-string v0, "stopPrevious"

    new-instance v1, Lco/vine/android/recorder/VineRecorder$13;

    invoke-direct {v1, p0, p1}, Lco/vine/android/recorder/VineRecorder$13;-><init>(Lco/vine/android/recorder/VineRecorder;Ljava/lang/String;)V

    invoke-direct {p0, v0, v1, v3, v2}, Lco/vine/android/recorder/VineRecorder;->stop(Ljava/lang/String;Ljava/lang/Runnable;ZZ)V

    goto :goto_0

    .line 1511
    :cond_1
    invoke-direct {p0, p1}, Lco/vine/android/recorder/VineRecorder;->guardedStartRecording(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public startEditMode(Z)V
    .locals 7
    .parameter "wasRecordingAlready"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 700
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->adjustEditBoundaries()V

    .line 701
    iget-boolean v0, p0, Lco/vine/android/recorder/VineRecorder;->mReturnToPreview:Z

    if-nez v0, :cond_3

    .line 702
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->animateCaptureControlsOut()V

    .line 706
    :goto_0
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->animateEditModeControlsIn()V

    .line 708
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 709
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mTrashUndoContainer:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setActivated(Z)V

    .line 712
    :cond_0
    iput v5, p0, Lco/vine/android/recorder/VineRecorder;->mLastSelectedPosition:I

    .line 714
    iput-object v6, p0, Lco/vine/android/recorder/VineRecorder;->mLastPlayingSegment:Lco/vine/android/recorder/RecordSegment;

    .line 716
    if-nez p1, :cond_4

    .line 717
    new-instance v0, Lco/vine/android/recorder/SegmentEditorAdapter;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mActivity:Landroid/app/Activity;

    iget v3, p0, Lco/vine/android/recorder/VineRecorder;->density:F

    invoke-direct {v0, v1, v2, v3}, Lco/vine/android/recorder/SegmentEditorAdapter;-><init>(Ljava/util/ArrayList;Landroid/content/Context;F)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    .line 722
    :goto_1
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->canUndoDelete()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 723
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 728
    :goto_2
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    if-eqz v0, :cond_1

    .line 729
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0, v1}, Lco/vine/android/dragsort/DragSortWidget;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 731
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-virtual {v0}, Lco/vine/android/recorder/SegmentEditorAdapter;->notifyDataSetChanged()V

    .line 733
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, v5}, Lco/vine/android/dragsort/DragSortWidget;->setSelection(I)V

    .line 734
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mDragSortWidget:Lco/vine/android/dragsort/DragSortWidget;

    invoke-virtual {v0, v4}, Lco/vine/android/dragsort/DragSortWidget;->setFocused(I)V

    .line 737
    :cond_1
    invoke-virtual {p0, v4}, Lco/vine/android/recorder/VineRecorder;->setGhostMode(Z)Z

    .line 739
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    if-eqz v0, :cond_2

    .line 740
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mGridSwitch:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v4}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 743
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v6, v0}, Lco/vine/android/recorder/VineRecorder;->refreshVideoView(Lco/vine/android/recorder/RecordSegment;Z)V

    .line 744
    return-void

    .line 704
    :cond_3
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->hideCaptureControls()V

    goto :goto_0

    .line 720
    :cond_4
    new-instance v0, Lco/vine/android/recorder/SegmentEditorAdapter;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    invoke-direct {v0, v1}, Lco/vine/android/recorder/SegmentEditorAdapter;-><init>(Lco/vine/android/recorder/SegmentEditorAdapter;)V

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditorAdapter:Lco/vine/android/recorder/SegmentEditorAdapter;

    goto :goto_1

    .line 725
    :cond_5
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mUndoButton:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2
.end method

.method public stopAndDiscardChanges(Ljava/lang/String;Ljava/lang/Runnable;Z)V
    .locals 2
    .parameter "tag"
    .parameter "onComplete"
    .parameter "releasePreview"

    .prologue
    .line 1859
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lco/vine/android/recorder/VineRecorder;->setDiscardChanges(Z)V

    .line 1860
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mFinishProcessRunnable:Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p3, v1}, Lco/vine/android/recorder/VineRecorder$FinishProcessRunnable;->run(Ljava/lang/String;ZZ)V

    .line 1861
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 1862
    return-void
.end method

.method public swapSession(Ljava/lang/String;Lco/vine/android/recorder/RecordingFile;)Lco/vine/android/recorder/RecordingFile;
    .locals 6
    .parameter "tag"
    .parameter "file"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 337
    if-eqz p2, :cond_1

    .line 338
    const-string v0, "Swap new Recorder for {} from {}."

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    iget-object v2, p2, Lco/vine/android/recorder/RecordingFile;->folder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 339
    invoke-virtual {p2}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    .line 340
    iput-object p2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    .line 341
    iput-boolean v4, p0, Lco/vine/android/recorder/VineRecorder;->mFinished:Z

    .line 342
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 343
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSession;->getSegments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 344
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mToRemove:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 345
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mAddedSegments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 346
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    iput-object v1, v0, Lco/vine/android/recorder/RecordingFile;->editedSegments:Ljava/util/ArrayList;

    .line 347
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->swapTimestampsFromSegments(Ljava/util/ArrayList;)V

    .line 348
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mCanKeepRecording:Z

    .line 349
    iget-wide v0, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    invoke-virtual {p0, v0, v1}, Lco/vine/android/recorder/VineRecorder;->changeProgress(J)V

    .line 350
    iget-wide v0, p0, Lco/vine/android/recorder/VineRecorder;->currentDuration:J

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordSession;->getConfig()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;

    move-result-object v2

    iget v2, v2, Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;->maxDuration:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 351
    iput-boolean v5, p0, Lco/vine/android/recorder/VineRecorder;->mHasPreviewedAlready:Z

    .line 353
    :cond_0
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->setHasPreviewedAlreadyIfNeeded()V

    .line 354
    iput-boolean v4, p0, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    .line 355
    invoke-direct {p0}, Lco/vine/android/recorder/VineRecorder;->invalidateGhostView()V

    .line 356
    invoke-virtual {p0, v4}, Lco/vine/android/recorder/VineRecorder;->setGhostMode(Z)Z

    .line 357
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->swapSession()V

    .line 359
    :cond_1
    return-object p2
.end method

.method public switchFlash()V
    .locals 1

    .prologue
    .line 371
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v0}, Lco/vine/android/recorder/RecordController;->switchFlash()V

    .line 372
    return-void
.end method

.method public switchModes()V
    .locals 3

    .prologue
    .line 1517
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordingFile;->setSession(Lco/vine/android/recorder/RecordSession;)V

    .line 1518
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mSession:Lco/vine/android/recorder/RecordSession;

    invoke-virtual {v0, v1}, Lco/vine/android/recorder/RecordController;->refreshBufferMax(Lco/vine/android/recorder/RecordSession;)V

    .line 1519
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    iget-boolean v1, p0, Lco/vine/android/recorder/VineRecorder;->mDiscardChanges:Z

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/recorder/RecordController;->stop(ZZ)V

    .line 1520
    const-string v0, "switchModes"

    invoke-direct {p0, v0}, Lco/vine/android/recorder/VineRecorder;->startRecording(Ljava/lang/String;)V

    .line 1521
    return-void
.end method

.method protected updateGhostBitmap(Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "ghostBitmap"

    .prologue
    .line 503
    iget-object v0, p0, Lco/vine/android/recorder/VineRecorder;->mHandler:Landroid/os/Handler;

    new-instance v1, Lco/vine/android/recorder/VineRecorder$6;

    invoke-direct {v1, p0, p1}, Lco/vine/android/recorder/VineRecorder$6;-><init>(Lco/vine/android/recorder/VineRecorder;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 524
    return-void
.end method

.method public writePreviewToFile()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 1715
    :try_start_0
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1716
    iget-object v1, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/recorder/RecordSegment;

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordSegment;->getCameraSetting()Lco/vine/android/recorder/CameraSetting;

    move-result-object v1

    iget v1, v1, Lco/vine/android/recorder/CameraSetting;->frameRate:I

    iput v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I

    .line 1721
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentRecordingFile:Lco/vine/android/recorder/RecordingFile;

    invoke-virtual {v2}, Lco/vine/android/recorder/RecordingFile;->getVideoPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".video.mp4"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I

    const/16 v3, 0x1e0

    invoke-static {v1, v2, v3}, Lco/vine/android/recorder/RecordConfigUtils;->newViewRecorder(Ljava/lang/String;II)Lco/vine/android/recorder/VineFFmpegFrameRecorder;

    move-result-object v6

    .line 1723
    .local v6, videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    invoke-virtual {v6}, Lco/vine/android/recorder/VineFFmpegFrameRecorder;->start()V

    .line 1724
    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/recorder/RecordingFile;->getSession()Lco/vine/android/recorder/RecordSession;

    move-result-object v11

    .line 1725
    .local v11, recordSession:Lco/vine/android/recorder/RecordSession;
    new-instance v0, Lco/vine/android/recorder/CombingRunnable;

    invoke-virtual {p0}, Lco/vine/android/recorder/VineRecorder;->getFile()Lco/vine/android/recorder/RecordingFile;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v11}, Lco/vine/android/recorder/RecordSession;->getAudioData()[S

    move-result-object v3

    invoke-virtual {v11}, Lco/vine/android/recorder/RecordSession;->getVideoData()[B

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/recorder/VineRecorder;->mEditedSegments:Ljava/util/ArrayList;

    iget-object v7, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v7}, Lco/vine/android/recorder/RecordController;->getFinishProcessTask()Lco/vine/android/recorder/VineRecorder$FinishProcessTask;

    move-result-object v7

    iget-object v8, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v8}, Lco/vine/android/recorder/RecordController;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v8

    iget-object v9, p0, Lco/vine/android/recorder/VineRecorder;->mVideoController:Lco/vine/android/recorder/RecordController;

    invoke-virtual {v9}, Lco/vine/android/recorder/RecordController;->getFrameBuffer()Lcom/googlecode/javacv/cpp/opencv_core$IplImage;

    move-result-object v9

    invoke-direct/range {v0 .. v9}, Lco/vine/android/recorder/CombingRunnable;-><init>(Lco/vine/android/recorder/RecordingFile;Z[S[BLjava/util/ArrayList;Lco/vine/android/recorder/VineFFmpegFrameRecorder;Lco/vine/android/recorder/VineRecorder$FinishProcessTask;Landroid/graphics/Bitmap;Lcom/googlecode/javacv/cpp/opencv_core$IplImage;)V

    .line 1728
    .local v0, combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    invoke-virtual {v0}, Lco/vine/android/recorder/CombingRunnable;->run()V

    .line 1732
    .end local v0           #combiningRunnable:Lco/vine/android/recorder/CombingRunnable;
    .end local v6           #videoRecorder:Lco/vine/android/recorder/VineFFmpegFrameRecorder;
    .end local v11           #recordSession:Lco/vine/android/recorder/RecordSession;
    :goto_1
    return-void

    .line 1718
    :cond_0
    const/16 v1, 0x1e

    iput v1, p0, Lco/vine/android/recorder/VineRecorder;->mCurrentFrameRate:I
    :try_end_0
    .catch Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1729
    :catch_0
    move-exception v10

    .line 1730
    .local v10, e:Lco/vine/android/recorder/VineFFmpegFrameRecorder$Exception;
    const-string v1, "Cannot start audio/video recorder. "

    new-array v2, v12, [Ljava/lang/Object;

    invoke-static {v10, v1, v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1
.end method
