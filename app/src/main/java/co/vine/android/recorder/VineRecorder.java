package co.vine.android.recorder;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewPropertyAnimator;
import android.view.WindowManager.BadTokenException;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.Toast;
import android.widget.ToggleButton;
import co.vine.android.VineException;
import co.vine.android.dragsort.DragSortWidget;
import co.vine.android.dragsort.DragSortWidget.CurrentlyPlayingProvider;
import co.vine.android.dragsort.DragSortWidget.FloatViewInteractionListener;
import co.vine.android.dragsort.DragSortWidget.SelectionChangedListener;
import co.vine.android.player.SdkVideoView;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import org.apache.commons.io.FileUtils;

@TargetApi(14)
public class VineRecorder
  implements View.OnTouchListener, RecordController.OnRecorderControllerStateChangedListener, DragSortWidget.SelectionChangedListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnErrorListener, DragSortWidget.FloatViewInteractionListener, DragSortWidget.CurrentlyPlayingProvider, View.OnKeyListener
{
  public static final String PREFS_CAPTURE = "capture";
  private static final String PREF_BOTTOM_MASK_HEIGHT = "bottomMaskHeightPx";
  private static final long REMOVE_THUMBNAIL_MILLIS = 100L;
  private static final float TOUCH_EDGE_BOUNDARY = 0.05F;
  private static final long TRANSITION_DURATION = 250L;
  private static final int TRASH_BRIGHT = 1;
  private static final int TRASH_INVISIBLE = 2;
  private static final int TRASH_VISIBLE;
  public volatile long currentDuration;
  public final float density;
  public boolean detectedInvalidSession;
  public volatile RecordingFile finalFile;
  private Activity mActivity;
  private final ArrayList<RecordSegment> mAddedSegments = new ArrayList();
  private boolean mAlreadyStoppingForUnspportedReasons;
  private boolean mAutoFocusing = true;
  private final int mBottomMaskId;
  private View mBottomMaskView;
  private final int mCameraFailString;
  private ViewGroup mCameraSwitcher;
  private final int mCameraSwitcherId;
  private final View.OnClickListener mCameraSwitcherViewListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if ((!VineRecorder.this.mIsSwitchingCamera) && (VineRecorder.this.mCanKeepRecording))
      {
        if (VineRecorder.this.canSwitchCamera())
        {
          VineRecorder.access$402(VineRecorder.this, new VineRecorder.ResumeCameraAsyncTask(VineRecorder.this, true));
          VineRecorder.this.mSwitchCameraTask.execute(new Void[0]);
        }
      }
      else
        return;
      CrashUtil.logException(new VineException("You can not switch camera after recording has started."), "Person trying to record and switch? not cool.", new Object[0]);
    }
  };
  private View mCameraView;
  private final int mCameraViewResourceId;
  private boolean mCanKeepRecording;
  private final ChangeProgressRunnable mChangeProgressRunnable;
  private int mCurrentFrameRate;
  private RecordingFile mCurrentRecordingFile;
  private RecordSegment mCurrentSegment;
  private final String mDeviceNotSupportedString;
  public volatile boolean mDiscardChanges;
  private boolean mDoNotDeleteSession;
  private DragSortWidget mDragSortWidget;
  private final int mDragSortWidgetId;
  private final ArrayList<RecordSegment> mEditedSegments = new ArrayList();
  private boolean mEditing;
  private SegmentEditorAdapter mEditorAdapter;
  private View mEditorButtons;
  private int mEditorButtonsHeight;
  private final int mEditorButtonsId;
  private View mEditorCancelButton;
  private final int mEditorCancelButtonId;
  private View mEditorDoneButton;
  private final int mEditorDoneButtonId;
  private boolean mEnabled = true;
  private View mFinishButton;
  private final int mFinishButtonId;
  private final View.OnClickListener mFinishClicker = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      VineRecorder.this.finish("finishClicker");
    }
  };
  private CharSequence mFinishLastSegmentString;
  private final FinishProcessRunnable mFinishProcessRunnable;
  private ProgressDialog mFinishProgressDialog;
  private final CharSequence[] mFinishProgressDialogMessage;
  private boolean mFinished;
  private View mFlashSwitcher;
  private final int mFlashSwitcherId;
  private final AnimationSet mFocusAnimationSet;
  private final int mFocusDisabledDrawable;
  private final AlphaAnimation mFocusDismissAnimation;
  private final int mFocusEnabledDrawable;
  private final ImageView mFocusIndicator;
  private View mFocusView;
  private final int mFocusViewResourceId;
  private boolean mFrontFacing;
  private final ToggleButton mGhostButton;
  private boolean mGhostModeEnabled = false;
  private final ImageView mGhostView;
  private final int mGhostViewId;
  private ToggleButton mGridSwitch;
  private final int mGridSwitchId;
  private final Handler mHandler = new Handler();
  private boolean mHasPreviewedAlready;
  private ReusableHashAsyncTask mHashTask;
  private final boolean mInitiallyStartedWithEditMode;
  private boolean mIsGridOn;
  private volatile boolean mIsSwitchingCamera;
  private RecordSegment mLastPlayingSegment = new RecordSegment(0L);
  private int mLastSelectedPosition;
  private boolean mNeverResumedRecorder = true;
  public volatile Runnable mOnCompleteConsumer;
  private ProgressDialog mOpenCameraDialog;
  private final CharSequence mOpenCameraResource;
  private int mPickedUpPosition;
  private View mPlayButton;
  private View mPlayButtonContainer;
  private final int mPlayButtonContainerId;
  private PlayButtonOnClickListener mPlayButtonOnClickListener;
  private View mPlayRefreshButton;
  private View mPreviewLoadingOverlay;
  private final int mPreviewLoadingOverlayId;
  private View mProgressOverlay;
  private final int mProgressOverlayId;
  private ProgressTimer mProgressTimer;
  private ProgressView mProgressView;
  private final int mProgressViewResourceId;
  private int mRecordingFileDuration;
  private View mRecordingOptions;
  private final int mRecordingOptionsRowId;
  private RefreshPreviewTask mRefreshPreviewTask;
  private boolean mRelativeTimeStarted;
  private Resources mResources;
  private OnResumeTask mResumeTask;
  private boolean mReturnToPreview;
  private final int mRootLayoutId;
  private View mRootLayoutView;
  private SegmentChangeDetector mSegmentChangeDetector;
  private Thread mSegmentChangeThread;
  private RecordSession mSession;
  private int mShortAnimTime;
  private final Point mSize;
  private ProgressDialog mStartProgressDialog;
  private final CharSequence mStartProgressDialogMessage;
  private boolean mStartWithEditMode;
  private ResumeCameraAsyncTask mSwitchCameraTask;
  private final View.OnClickListener mSwitchFlashViewListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      VineRecorder.this.mVideoController.switchFlash();
    }
  };
  private View mThumbnailList;
  private ImageView mThumbnailOverlay;
  private final int mThumbnailOverlayId;
  private int mThumbnailPadding;
  private RecordSegment mThumbnailSegment;
  private HashSet<RecordSegment> mToRemove = new HashSet();
  private Toast mToast;
  private final int mTopMaskId;
  private View mTopMaskView;
  private View mTrashCanButton;
  private final int mTrashCanButtonId;
  private View mTrashUndoContainer;
  private final int mTrashUndoContainerId;
  private View mUndoButton;
  private final int mUndoButtonId;
  private AttributeSet mVideoAttr;
  private RecordController mVideoController;
  private SdkVideoView mVideoPlayer;
  private RelativeLayout.LayoutParams mVideoViewParams;
  private final Runnable onCameraReadyRunnable = new Runnable()
  {
    public void run()
    {
      View localView;
      if (VineRecorder.this.mFocusView != null)
      {
        localView = VineRecorder.this.mFocusView;
        if (!VineRecorder.this.mVideoController.canChangeFocus())
          break label111;
      }
      label111: for (int i = VineRecorder.this.mFocusEnabledDrawable; ; i = VineRecorder.this.mFocusDisabledDrawable)
      {
        localView.setBackgroundResource(i);
        VineRecorder.this.setAutoFocusing(true);
        if (VineRecorder.this.mCameraSwitcher != null)
          VineRecorder.this.mCameraSwitcher.getChildAt(0).setPressed(VineRecorder.this.mFrontFacing);
        if (VineRecorder.this.mGridSwitch != null)
          VineRecorder.this.mGridSwitch.setChecked(VineRecorder.this.mIsGridOn);
        return;
      }
    }
  };
  public int progressWidth;

  public VineRecorder(boolean paramBoolean1, Point paramPoint, boolean paramBoolean2, boolean paramBoolean3, RecordingFile paramRecordingFile, Activity paramActivity, SdkVideoView paramSdkVideoView, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10, int paramInt11, int paramInt12, int paramInt13, int paramInt14, int paramInt15, int paramInt16, int paramInt17, int paramInt18, int paramInt19, int paramInt20, int paramInt21, int paramInt22, int paramInt23, int paramInt24, int paramInt25, int paramInt26, int paramInt27, int paramInt28, int paramInt29, int paramInt30, int paramInt31, String paramString, ToggleButton paramToggleButton, CharSequence[] paramArrayOfCharSequence)
  {
    this.mReturnToPreview = paramBoolean2;
    this.mHasPreviewedAlready = paramBoolean3;
    this.mStartWithEditMode = paramBoolean1;
    this.mInitiallyStartedWithEditMode = paramBoolean1;
    this.mTrashUndoContainerId = paramInt19;
    this.mEditorButtonsHeight = paramInt29;
    this.mVideoPlayer = paramSdkVideoView;
    this.mStartProgressDialogMessage = paramArrayOfCharSequence[0];
    this.mFinishProgressDialogMessage = paramArrayOfCharSequence;
    this.mVideoController = new RecordController(this);
    this.mActivity = paramActivity;
    this.mShortAnimTime = this.mActivity.getResources().getInteger(17694720);
    this.mThumbnailPadding = paramInt28;
    this.mUndoButtonId = paramInt21;
    this.mGhostButton = paramToggleButton;
    this.mFrontFacing = RecordConfigUtils.isDefaultFrontFacing();
    this.mFinishProcessRunnable = new FinishProcessRunnable(null);
    this.mChangeProgressRunnable = new ChangeProgressRunnable(null);
    this.mFinishLastSegmentString = paramActivity.getText(paramInt22);
    this.mOpenCameraResource = paramActivity.getText(paramInt24);
    this.mSize = paramPoint;
    this.density = paramActivity.getResources().getDisplayMetrics().density;
    this.mProgressViewResourceId = paramInt9;
    this.mCameraViewResourceId = paramInt10;
    this.mRootLayoutId = paramInt27;
    this.mThumbnailOverlayId = paramInt26;
    this.mFlashSwitcherId = paramInt12;
    this.mCameraSwitcherId = paramInt11;
    this.mFinishButtonId = paramInt13;
    this.mGridSwitchId = paramInt3;
    this.mPlayButtonContainerId = paramInt25;
    this.mTopMaskId = paramInt14;
    this.mBottomMaskId = paramInt15;
    this.mPreviewLoadingOverlayId = paramInt30;
    this.mEditorButtonsId = paramInt16;
    this.mEditorDoneButtonId = paramInt17;
    this.mEditorCancelButtonId = paramInt18;
    this.mTrashCanButtonId = paramInt20;
    this.mRecordingOptionsRowId = paramInt1;
    this.mCameraFailString = paramInt23;
    this.mFocusViewResourceId = paramInt8;
    this.mFocusEnabledDrawable = paramInt6;
    this.mFocusDisabledDrawable = paramInt7;
    this.mGhostViewId = paramInt4;
    this.mDragSortWidgetId = paramInt2;
    this.mFocusIndicator = ((ImageView)paramActivity.findViewById(paramInt5));
    this.mGhostView = ((ImageView)paramActivity.findViewById(this.mGhostViewId));
    this.mGhostView.setAlpha(0.35F);
    this.mFocusDismissAnimation = RecordingAnimations.getFocusDismissAnimation(this.mFocusIndicator);
    this.mFocusAnimationSet = RecordingAnimations.getFocusAnimationSet(this.mFocusDismissAnimation, this.mFocusIndicator);
    this.mProgressOverlayId = paramInt31;
    this.mDeviceNotSupportedString = paramString;
    swapSession("Init", paramRecordingFile);
  }

  private void adjustBoundaries(CameraSetting paramCameraSetting)
  {
    Activity localActivity = this.mActivity;
    float f;
    if ((localActivity != null) && (paramCameraSetting != null))
    {
      f = paramCameraSetting.originalW;
      if ((!paramCameraSetting.frontFacing) || (paramCameraSetting.frontFacingAspectRatio <= 0.0F))
        break label419;
      f = paramCameraSetting.originalH * paramCameraSetting.frontFacingAspectRatio;
    }
    while (true)
    {
      if ((paramCameraSetting.frontFacingAspectRatio > 0.0F) || (paramCameraSetting.backFacingAspectRatio > 0.0F))
        CrashUtil.logException(new VineException("Adjusting ratio originalW = " + paramCameraSetting.originalW + " originalH = " + paramCameraSetting.originalH + " hardware " + "Hardware Version: " + Build.DEVICE + " - " + Build.MODEL + " (" + Build.CPU_ABI + "." + Build.HARDWARE + "." + Build.BRAND + "." + Build.PRODUCT + "." + Build.MANUFACTURER + "." + Build.CPU_ABI2 + ")"));
      int i = (int)(f / paramCameraSetting.originalH * this.mSize.x);
      if ((this.mTopMaskView != null) && (this.mBottomMaskView != null))
      {
        int j = this.mTopMaskView.getLayoutParams().height;
        int k = i / 2;
        int m = j + this.mSize.x / 2 - k;
        final RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)this.mCameraView.getLayoutParams();
        localLayoutParams1.width = this.mSize.x;
        localLayoutParams1.height = i;
        localLayoutParams1.setMargins(0, m, 0, 0);
        int n = this.mRootLayoutView.getMeasuredHeight() - j - this.mSize.x;
        final RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)this.mBottomMaskView.getLayoutParams();
        localLayoutParams2.height = n;
        localActivity.getSharedPreferences("capture", 0).edit().putInt(getBottomMaskHeightPref(paramCameraSetting.frontFacing), n).commit();
        Runnable local25 = new Runnable()
        {
          public void run()
          {
            View localView1 = VineRecorder.this.mCameraView;
            if (localView1 != null)
            {
              SLog.d("Setting preview sizes to {} {}.", Integer.valueOf(localLayoutParams1.width), Integer.valueOf(localLayoutParams1.height));
              localView1.setLayoutParams(localLayoutParams1);
            }
            View localView2 = VineRecorder.this.mBottomMaskView;
            if (localView2 != null)
              localView2.setLayoutParams(localLayoutParams2);
          }
        };
        localActivity.runOnUiThread(local25);
      }
      return;
      label419: if (paramCameraSetting.backFacingAspectRatio > 0.0F)
        f = paramCameraSetting.originalH * paramCameraSetting.backFacingAspectRatio;
    }
  }

  private void adjustEditBoundaries()
  {
    if (this.mVideoPlayer != null)
    {
      this.mVideoViewParams = ((RelativeLayout.LayoutParams)this.mVideoPlayer.getLayoutParams());
      this.mVideoViewParams.width = this.mSize.x;
      this.mVideoViewParams.height = this.mSize.x;
    }
    if (this.mPlayButtonContainer != null)
      this.mPlayButtonContainer.setLayoutParams(this.mVideoViewParams);
    if (this.mThumbnailOverlay != null)
      this.mThumbnailOverlay.setLayoutParams(this.mVideoViewParams);
    if (this.mPreviewLoadingOverlay != null)
      this.mPreviewLoadingOverlay.setLayoutParams(this.mVideoViewParams);
    final RelativeLayout.LayoutParams localLayoutParams;
    if (this.mThumbnailList != null)
    {
      localLayoutParams = (RelativeLayout.LayoutParams)this.mThumbnailList.getLayoutParams();
      localLayoutParams.setMargins(0, this.mEditorButtonsHeight + this.mSize.x + this.mThumbnailPadding, 0, 0);
    }
    while (true)
    {
      if (this.mActivity != null)
        this.mActivity.runOnUiThread(new Runnable()
        {
          public void run()
          {
            SdkVideoView localSdkVideoView = VineRecorder.this.mVideoPlayer;
            if (localSdkVideoView != null)
              localSdkVideoView.setLayoutParams(VineRecorder.this.mVideoViewParams);
            View localView = VineRecorder.this.mThumbnailList;
            if (localView != null)
              localView.setLayoutParams(localLayoutParams);
          }
        });
      return;
      localLayoutParams = null;
    }
  }

  private void animateCaptureControlsIn()
  {
    getHandler().postDelayed(new Runnable()
    {
      public void run()
      {
        if (VineRecorder.this.mRecordingOptions != null)
        {
          VineRecorder.this.mRecordingOptions.setAlpha(0.0F);
          VineRecorder.this.mRecordingOptions.setVisibility(0);
          VineRecorder.this.mRecordingOptions.animate().alpha(1.0F).setDuration(250L).start();
        }
        if (VineRecorder.this.mTopMaskView != null)
        {
          VineRecorder.this.mTopMaskView.setAlpha(0.0F);
          VineRecorder.this.mTopMaskView.setVisibility(0);
          VineRecorder.this.mTopMaskView.animate().alpha(1.0F).setDuration(250L).start();
        }
        if (VineRecorder.this.mProgressView != null)
        {
          VineRecorder.this.mProgressView.setTranslationY(VineRecorder.this.mEditorButtonsHeight);
          VineRecorder.this.mProgressView.setScaleY(0.0F);
          VineRecorder.this.mProgressView.setVisibility(0);
          VineRecorder.this.mProgressView.animate().scaleY(1.0F).translationY(0.0F).setDuration(250L).start();
        }
      }
    }
    , 250L);
    if (this.mCameraView != null)
      this.mCameraView.setVisibility(0);
  }

  private void animateCaptureControlsOut()
  {
    ProgressView localProgressView = this.mProgressView;
    if (localProgressView != null)
    {
      ViewPropertyAnimator localViewPropertyAnimator3 = localProgressView.animate();
      if (localViewPropertyAnimator3 != null)
        localViewPropertyAnimator3.scaleY(0.0F).translationY(this.mEditorButtonsHeight).setDuration(250L).setListener(new ViewGoneAnimationListener(localProgressView)).start();
    }
    View localView1 = this.mTopMaskView;
    if (localView1 != null)
    {
      ViewPropertyAnimator localViewPropertyAnimator2 = localView1.animate();
      if (localViewPropertyAnimator2 != null)
        localViewPropertyAnimator2.alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(localView1)).start();
    }
    View localView2 = this.mRecordingOptions;
    if (localView2 != null)
    {
      ViewPropertyAnimator localViewPropertyAnimator1 = localView2.animate();
      if (localViewPropertyAnimator1 != null)
        localViewPropertyAnimator1.alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(localView2)).start();
    }
    if (this.mCameraView != null)
      this.mCameraView.setVisibility(4);
  }

  private void animateEditModeControlsIn()
  {
    getHandler().postDelayed(new Runnable()
    {
      public void run()
      {
        if (VineRecorder.this.mEditorButtons != null)
        {
          VineRecorder.this.mEditorButtons.setAlpha(0.0F);
          VineRecorder.this.mEditorButtons.setVisibility(0);
          VineRecorder.this.mEditorButtons.animate().alpha(1.0F).setDuration(250L).start();
        }
        if (VineRecorder.this.mThumbnailList != null)
        {
          int i = VineRecorder.this.mThumbnailList.getHeight();
          VineRecorder.this.mThumbnailList.setTranslationY(-i / 2);
          VineRecorder.this.mThumbnailList.setScaleY(0.0F);
          VineRecorder.this.mThumbnailList.setVisibility(0);
          VineRecorder.this.mThumbnailList.animate().scaleY(1.0F).translationY(0.0F).setDuration(250L).start();
        }
      }
    }
    , 250L);
    this.mVideoPlayer.setVisibility(0);
    if (this.mPreviewLoadingOverlay != null)
    {
      this.mPreviewLoadingOverlay.setVisibility(4);
      this.mPreviewLoadingOverlay.setAlpha(0.0F);
    }
    if (this.mPlayButtonContainer != null)
    {
      this.mPlayButtonContainer.setVisibility(4);
      this.mPlayButtonContainer.setAlpha(0.0F);
    }
    if (this.mTrashUndoContainer != null)
    {
      this.mTrashUndoContainer.setVisibility(0);
      this.mTrashUndoContainer.setAlpha(1.0F);
    }
    if (this.mTrashCanButton != null)
      this.mTrashCanButton.setVisibility(4);
    if (this.mUndoButton != null)
      this.mUndoButton.setVisibility(4);
    if (this.mThumbnailOverlay != null)
      this.mThumbnailOverlay.setVisibility(4);
  }

  private void animateEditModeControlsOut(boolean paramBoolean)
  {
    if ((this.mEditorAdapter != null) && (this.mThumbnailOverlay != null) && (this.mTrashUndoContainer != null) && (this.mPlayButtonContainer != null) && (this.mPreviewLoadingOverlay != null) && (this.mThumbnailList != null) && (this.mPlayButton != null))
    {
      this.mEditorButtons.animate().alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mEditorButtons)).start();
      this.mThumbnailOverlay.animate().alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mThumbnailOverlay)).start();
      this.mTrashUndoContainer.animate().alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mTrashUndoContainer)).start();
      this.mPlayButtonContainer.animate().alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mPlayButtonContainer)).start();
      this.mPreviewLoadingOverlay.animate().alpha(0.0F).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mPreviewLoadingOverlay)).start();
      this.mThumbnailList.animate().scaleY(0.0F).translationY(-this.mThumbnailList.getHeight() / 2).setDuration(250L).setListener(new ViewGoneAnimationListener(this.mThumbnailList)).start();
      this.mPlayButtonContainer.animate().alpha(0.0F).setDuration(250L).start();
      this.mTrashUndoContainer.setActivated(false);
      this.mDragSortWidget.setSelection(-1);
    }
    if ((paramBoolean) && (this.mVideoPlayer != null))
      this.mVideoPlayer.setVisibility(4);
  }

  private void animatePlayButton(boolean paramBoolean)
  {
    if ((this.mPlayButton != null) && (this.mPlayRefreshButton != null) && (this.mPlayButtonContainer != null))
    {
      this.mPlayButtonContainer.animate().cancel();
      if (!paramBoolean)
        this.mPlayButtonContainer.animate().alpha(0.0F).setDuration(this.mShortAnimTime).setListener(new ViewGoneAnimationListener(this.mPlayButtonContainer)).start();
    }
    else
    {
      return;
    }
    if (this.mPlayButtonOnClickListener.toPlay != null)
    {
      this.mPlayButton.setVisibility(8);
      this.mPlayRefreshButton.setVisibility(0);
    }
    while (true)
    {
      this.mPlayButtonContainer.setVisibility(0);
      this.mPlayButtonContainer.animate().alpha(1.0F).setDuration(this.mShortAnimTime).start();
      return;
      this.mPlayButton.setVisibility(0);
      this.mPlayRefreshButton.setVisibility(8);
    }
  }

  private void animatePreviewSpinner(boolean paramBoolean)
  {
    if (this.mPreviewLoadingOverlay != null)
    {
      this.mPreviewLoadingOverlay.animate().cancel();
      if (!paramBoolean)
        this.mPreviewLoadingOverlay.animate().alpha(0.0F).setDuration(this.mShortAnimTime).setListener(new ViewGoneAnimationListener(this.mPreviewLoadingOverlay)).start();
    }
    else
    {
      return;
    }
    this.mPreviewLoadingOverlay.setVisibility(0);
    this.mPreviewLoadingOverlay.setAlpha(0.0F);
    this.mPreviewLoadingOverlay.animate().alpha(1.0F).setDuration(this.mShortAnimTime).start();
  }

  private void animateTopButtons(int paramInt)
  {
    if ((this.mTrashUndoContainer != null) && (this.mTrashCanButton != null))
    {
      this.mTrashUndoContainer.animate().cancel();
      this.mTrashCanButton.animate().cancel();
      switch (paramInt)
      {
      default:
      case 0:
      case 1:
      case 2:
      }
    }
    do
    {
      return;
      this.mTrashCanButton.setVisibility(0);
      this.mUndoButton.setVisibility(8);
      this.mTrashUndoContainer.setActivated(false);
      this.mTrashCanButton.setActivated(false);
      return;
      this.mTrashUndoContainer.setActivated(true);
      this.mTrashCanButton.setActivated(true);
      return;
      this.mTrashCanButton.setVisibility(8);
      this.mTrashUndoContainer.setActivated(false);
      this.mTrashCanButton.setActivated(false);
    }
    while ((this.mEditorAdapter == null) || (!this.mEditorAdapter.canUndoDelete()));
    this.mUndoButton.setVisibility(0);
  }

  private void changeFocusTo(float paramFloat1, float paramFloat2)
  {
    this.mVideoController.autoFocus((int)paramFloat1, (int)paramFloat2);
  }

  private boolean commitChanges()
  {
    SegmentEditorAdapter localSegmentEditorAdapter = this.mEditorAdapter;
    boolean bool = false;
    if (localSegmentEditorAdapter != null)
    {
      localSegmentEditorAdapter.commitDelete();
      int i = this.mEditedSegments.size();
      RecordSegment localRecordSegment = null;
      if (i > 0)
        localRecordSegment = (RecordSegment)this.mEditedSegments.get(i - 1);
      int j = localSegmentEditorAdapter.getData().size();
      if (j > 0)
      {
        Object localObject = localSegmentEditorAdapter.getData().get(j - 1);
        bool = false;
        if (localRecordSegment != localObject)
          bool = true;
      }
      while (true)
      {
        this.mEditedSegments.clear();
        this.mEditedSegments.addAll(localSegmentEditorAdapter.getData());
        this.mEditedSegments.addAll(localSegmentEditorAdapter.getDeleted());
        Iterator localIterator = localSegmentEditorAdapter.getDeleted().iterator();
        while (localIterator.hasNext())
          ((RecordSegment)localIterator.next()).removed = true;
        bool = false;
        if (localRecordSegment != null)
          bool = true;
      }
      swapTimestampsFromSegments(this.mEditedSegments);
      this.mToRemove.addAll(RecordSegment.applyEditedChanges(this.mCurrentRecordingFile.getSession(), this.mEditedSegments));
      this.mCurrentRecordingFile.isDirty = true;
      SLog.d("Changes commited, last segment has changed? {}.", Boolean.valueOf(bool));
    }
    return bool;
  }

  private void dismissFocusIndicator()
  {
    if ((this.mFocusIndicator != null) && (this.mFocusIndicator.getVisibility() == 0))
      this.mFocusIndicator.startAnimation(this.mFocusDismissAnimation);
  }

  private boolean endRelativeTime()
  {
    try
    {
      if (this.mCurrentSegment != null)
      {
        SLog.i("END RELATIVE TIME.");
        this.mVideoController.offerLastFrame(this.mCurrentSegment, null);
        this.mRecordingFileDuration = ((int)this.mVideoController.getTimestamp());
        this.mCurrentRecordingFile.getSession().add(this.mCurrentSegment);
        this.mEditedSegments.add(this.mCurrentSegment);
        this.mAddedSegments.add(this.mCurrentSegment);
        this.mCurrentRecordingFile.isDirty = true;
        this.mCurrentSegment = null;
        this.currentDuration = this.mRecordingFileDuration;
        this.mVideoController.setRecording(this.mCurrentSegment);
        if (this.mGhostModeEnabled)
          this.mVideoController.requestGhostDrawing(false);
      }
      this.mRelativeTimeStarted = false;
      return true;
    }
    finally
    {
    }
  }

  private void finish(String paramString)
  {
    this.mFinished = true;
    this.mHasPreviewedAlready = true;
    setHasPreviewedAlreadyIfNeeded();
    if (this.mVideoController.isRecordingStarted())
    {
      stop(paramString, null, true, false);
      this.mCanKeepRecording = false;
    }
    while (this.mOnCompleteConsumer == null)
      return;
    this.mOnCompleteConsumer.run();
  }

  private boolean floatViewIntersectsTrashCan()
  {
    boolean bool = true;
    if (this.mVideoPlayer != null)
    {
      int i = ((RelativeLayout.LayoutParams)this.mVideoPlayer.getLayoutParams()).topMargin;
      Rect localRect = this.mDragSortWidget.getFloatViewBounds();
      if (this.mDragSortWidget.floatViewIsFromContentView())
      {
        if (localRect.top < i)
          return bool;
        return false;
      }
      int j = i + (this.mVideoPlayer.getBottom() - this.mVideoPlayer.getTop()) / 2;
      if (localRect.top < j);
      while (true)
      {
        return bool;
        bool = false;
      }
    }
    return false;
  }

  public static String getBottomMaskHeightPref(boolean paramBoolean)
  {
    return "bottomMaskHeightPx" + paramBoolean;
  }

  private long getDurationFromSegments()
  {
    int i = 0;
    Iterator localIterator = this.mEditorAdapter.getData().iterator();
    while (localIterator.hasNext())
    {
      RecordSegment localRecordSegment = (RecordSegment)localIterator.next();
      if (!localRecordSegment.removed)
        i += localRecordSegment.getCombinedAudioData().size;
    }
    return RecordConfigUtils.getTimeStampInNsFromSampleCounted(i) / 1000L;
  }

  private void guardedStartRecording(String paramString)
  {
    if ((canKeepRecording()) && (!this.mVideoController.isRecordingStarted()))
      startRecording(paramString);
  }

  private void hideCaptureControls()
  {
    if (this.mProgressView != null)
      this.mProgressView.setVisibility(4);
    if (this.mCameraView != null)
      this.mCameraView.setVisibility(4);
    if (this.mTopMaskView != null)
      this.mTopMaskView.setVisibility(4);
    if (this.mRecordingOptions != null)
      this.mRecordingOptions.setVisibility(4);
  }

  private void invalidateFinishButton()
  {
    if (this.currentDuration < 1000L)
    {
      View localView = this.mFinishButton;
      if (localView != null)
        localView.setVisibility(8);
      return;
    }
    onProgressThresholdReached();
  }

  private void invalidateGhostView()
  {
    if ((this.mEditedSegments.size() > 0) && (this.mGhostView != null) && (this.mActivity != null) && (this.mCurrentRecordingFile != null))
      this.mGhostView.setImageDrawable(new BitmapDrawable(this.mActivity.getResources(), this.mCurrentRecordingFile.getLastFramePath()));
    this.mVideoController.invalidateGhostFrame();
  }

  private void refreshFullPreview()
  {
    SLog.i("Refresh full preview.");
    RecordingFile localRecordingFile = getFile();
    RecordSession localRecordSession = null;
    if (localRecordingFile != null)
      localRecordSession = localRecordingFile.getSession();
    if (localRecordSession != null)
    {
      byte[] arrayOfByte = new byte[localRecordSession.getVideoData().length];
      short[] arrayOfShort = new short[localRecordSession.getAudioData().length];
      ArrayList localArrayList = this.mEditorAdapter.getData();
      if (localArrayList.size() > 0);
      for (int i = ((RecordSegment)localArrayList.get(0)).getCameraSetting().frameRate; ; i = 30)
      {
        this.mVideoController.writeToFile(RecordSegment.applyForEditedChanges(getFile().getSession(), arrayOfByte, arrayOfShort, localArrayList), arrayOfByte, arrayOfShort, i);
        long l = 0L;
        for (int j = 0; j < localArrayList.size(); j++)
        {
          RecordSegment localRecordSegment = (RecordSegment)localArrayList.get(j);
          localRecordSegment.index = j;
          localRecordSegment.startTimestamp = l;
          l += RecordConfigUtils.getTimeStampInNsFromSampleCounted(localRecordSegment.getCombinedAudioData().size) / 1000;
          SLog.i("Timestamp modified to: {}.", Long.valueOf(localRecordSegment.startTimestamp));
        }
      }
    }
  }

  private void releaseSegmentChangeDetector()
  {
    if (this.mSegmentChangeThread != null)
      this.mSegmentChangeDetector.runThread = false;
    try
    {
      this.mSegmentChangeThread.join();
      label22: this.mSegmentChangeThread = null;
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label22;
    }
  }

  private void returnToPreview(boolean paramBoolean)
  {
    releaseSegmentChangeDetector();
    if (!paramBoolean)
      commitChanges();
    this.mCanKeepRecording = false;
    writePreviewToFile();
    startHashTask(false);
  }

  private void setHasPreviewedAlreadyIfNeeded()
  {
    if (this.currentDuration >= this.mSession.getConfig().maxDuration);
    for (boolean bool = true; ; bool = false)
    {
      this.mHasPreviewedAlready = bool;
      return;
    }
  }

  private void showCameraFailedToast()
  {
    this.mHandler.post(new Runnable()
    {
      public void run()
      {
        if (VineRecorder.this.mToast != null)
          VineRecorder.this.mToast.show();
      }
    });
  }

  private void showCameraSwitcher()
  {
    ViewGroup localViewGroup = this.mCameraSwitcher;
    if ((localViewGroup != null) && (localViewGroup.getVisibility() != 8))
      localViewGroup.setVisibility(0);
  }

  private void startHashTask(boolean paramBoolean)
  {
    this.mHashTask = new ReusableHashAsyncTask(this);
    this.detectedInvalidSession = paramBoolean;
    ReusableHashAsyncTask localReusableHashAsyncTask = this.mHashTask;
    RecordingFile[] arrayOfRecordingFile = new RecordingFile[1];
    arrayOfRecordingFile[0] = this.mCurrentRecordingFile;
    localReusableHashAsyncTask.execute(arrayOfRecordingFile);
  }

  private void startProgressTimer()
  {
    this.mProgressTimer = new ProgressTimer(this, this.mHandler);
    this.mProgressTimer.start();
  }

  // ERROR //
  private void startRecording(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 298	co/vine/android/recorder/VineRecorder:mActivity	Landroid/app/Activity;
    //   6: astore_3
    //   7: ldc_w 1257
    //   10: iconst_1
    //   11: anewarray 4	java/lang/Object
    //   14: dup
    //   15: iconst_0
    //   16: aload_1
    //   17: aastore
    //   18: invokestatic 1261	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   21: aload_3
    //   22: ifnull +162 -> 184
    //   25: aload_0
    //   26: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   29: invokevirtual 1264	co/vine/android/recorder/RecordController:isCameraReady	()Z
    //   32: istore 4
    //   34: iload 4
    //   36: ifne +23 -> 59
    //   39: ldc_w 1266
    //   42: invokestatic 1268	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   45: aload_0
    //   46: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   49: aload_0
    //   50: getfield 327	co/vine/android/recorder/VineRecorder:mFrontFacing	Z
    //   53: iconst_0
    //   54: invokevirtual 1272	co/vine/android/recorder/RecordController:openDefaultCamera	(ZZ)Z
    //   57: istore 4
    //   59: iload 4
    //   61: ifeq +152 -> 213
    //   64: aload_0
    //   65: getfield 518	co/vine/android/recorder/VineRecorder:mCurrentRecordingFile	Lco/vine/android/recorder/RecordingFile;
    //   68: invokevirtual 992	co/vine/android/recorder/RecordingFile:getSession	()Lco/vine/android/recorder/RecordSession;
    //   71: astore 5
    //   73: aload_0
    //   74: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   77: invokevirtual 1063	co/vine/android/recorder/RecordController:isRecordingStarted	()Z
    //   80: ifne +87 -> 167
    //   83: aload 5
    //   85: aload 5
    //   87: invokevirtual 1275	co/vine/android/recorder/RecordSession:calculateAudioCount	()I
    //   90: invokevirtual 1278	co/vine/android/recorder/RecordSession:setAudioDataCount	(I)V
    //   93: aload 5
    //   95: aload 5
    //   97: invokevirtual 1281	co/vine/android/recorder/RecordSession:calculateVideoCount	()I
    //   100: invokevirtual 1284	co/vine/android/recorder/RecordSession:setVideoDataCount	(I)V
    //   103: invokestatic 1289	co/vine/android/recorder/EncoderManager:tryLoad	()V
    //   106: aload_0
    //   107: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   110: aload_3
    //   111: aload_0
    //   112: getfield 518	co/vine/android/recorder/VineRecorder:mCurrentRecordingFile	Lco/vine/android/recorder/RecordingFile;
    //   115: invokevirtual 1292	co/vine/android/recorder/RecordingFile:getVideoPath	()Ljava/lang/String;
    //   118: aload 5
    //   120: invokevirtual 1295	co/vine/android/recorder/RecordSession:getAudioDataCount	()I
    //   123: aload 5
    //   125: invokevirtual 1298	co/vine/android/recorder/RecordSession:getVideoDataCount	()I
    //   128: invokevirtual 1301	co/vine/android/recorder/RecordController:start	(Landroid/app/Activity;Ljava/lang/String;II)Z
    //   131: pop
    //   132: iconst_2
    //   133: anewarray 4	java/lang/Object
    //   136: astore 9
    //   138: aload 9
    //   140: iconst_0
    //   141: aload_0
    //   142: getfield 518	co/vine/android/recorder/VineRecorder:mCurrentRecordingFile	Lco/vine/android/recorder/RecordingFile;
    //   145: invokevirtual 1292	co/vine/android/recorder/RecordingFile:getVideoPath	()Ljava/lang/String;
    //   148: aastore
    //   149: aload 9
    //   151: iconst_1
    //   152: invokestatic 1306	java/lang/System:currentTimeMillis	()J
    //   155: invokestatic 1186	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   158: aastore
    //   159: ldc_w 1308
    //   162: aload 9
    //   164: invokestatic 1261	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   167: aload_0
    //   168: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   171: invokevirtual 1311	co/vine/android/recorder/RecordController:isPreviewing	()Z
    //   174: ifne +10 -> 184
    //   177: aload_0
    //   178: getfield 296	co/vine/android/recorder/VineRecorder:mVideoController	Lco/vine/android/recorder/RecordController;
    //   181: invokevirtual 1314	co/vine/android/recorder/RecordController:startPreview	()V
    //   184: aload_0
    //   185: monitorexit
    //   186: return
    //   187: astore 7
    //   189: aload_0
    //   190: aload 7
    //   192: invokevirtual 1317	co/vine/android/recorder/VineRecorder:onDeviceNotSupported	(Ljava/lang/Throwable;)V
    //   195: goto -11 -> 184
    //   198: astore_2
    //   199: aload_0
    //   200: monitorexit
    //   201: aload_2
    //   202: athrow
    //   203: astore 6
    //   205: aload 6
    //   207: invokestatic 767	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
    //   210: goto -43 -> 167
    //   213: aload_0
    //   214: invokespecial 547	co/vine/android/recorder/VineRecorder:showCameraFailedToast	()V
    //   217: goto -50 -> 167
    //
    // Exception table:
    //   from	to	target	type
    //   103	167	187	java/lang/NoClassDefFoundError
    //   103	167	187	java/lang/UnsatisfiedLinkError
    //   103	167	187	java/lang/ExceptionInInitializerError
    //   2	21	198	finally
    //   25	34	198	finally
    //   39	59	198	finally
    //   64	103	198	finally
    //   103	167	198	finally
    //   167	184	198	finally
    //   189	195	198	finally
    //   205	210	198	finally
    //   213	217	198	finally
    //   103	167	203	co/vine/android/recorder/RecordController$RecordControllerReadyStartedException
  }

  private boolean startRelativeTime()
  {
    if (this.mRelativeTimeStarted)
      return true;
    if ((!this.mIsSwitchingCamera) && (this.mVideoController.isRecordingStarted()) && (this.mCanKeepRecording) && (this.mVideoController.isCameraReady()) && (this.currentDuration < this.mSession.getConfig().maxDuration))
    {
      if ((this.mCurrentSegment != null) && (!endRelativeTime()))
        return false;
      this.currentDuration = (this.mRecordingFileDuration - System.currentTimeMillis());
      SLog.i("START RELATIVE TIME.");
      this.mCurrentSegment = new RecordSegment(this.currentDuration);
      this.mVideoController.setRecordingAudio(true);
      this.mVideoController.setRecording(this.mCurrentSegment);
      this.mRelativeTimeStarted = true;
      return true;
    }
    return false;
  }

  private void stop(String paramString, Runnable paramRunnable, boolean paramBoolean1, boolean paramBoolean2)
  {
    final ProgressDialog localProgressDialog = this.mFinishProgressDialog;
    if ((localProgressDialog != null) && (!localProgressDialog.isShowing()))
    {
      this.mActivity.runOnUiThread(new Runnable()
      {
        public void run()
        {
          localProgressDialog.show();
        }
      });
      if ((paramBoolean2) || (this.mCurrentRecordingFile.isSavedSession));
      for (boolean bool = true; ; bool = false)
      {
        FinishProcessTask localFinishProcessTask = new FinishProcessTask(paramString, paramRunnable, paramBoolean1, bool);
        this.mVideoController.setFinishProcessTask(localFinishProcessTask);
        localFinishProcessTask.execute(new Void[0]);
        return;
      }
    }
    SLog.d("Stop twice? wtf.");
  }

  private void stopProgressTimer()
  {
    if (this.mProgressTimer != null)
    {
      this.mProgressTimer.release();
      this.mProgressTimer = null;
    }
  }

  private void swapTimestampsFromSegments(ArrayList<RecordSegment> paramArrayList)
  {
    int i = 0;
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      RecordSegment localRecordSegment = (RecordSegment)localIterator.next();
      if (!localRecordSegment.removed)
        i += localRecordSegment.getCombinedAudioData().size;
    }
    int j = RecordConfigUtils.getTimeStampInNsFromSampleCounted(i);
    this.mVideoController.setAudioTimestamp(j);
    this.mVideoController.setVideoTimeStamp(j);
    this.currentDuration = this.mVideoController.getTimestamp();
    this.mRecordingFileDuration = ((int)this.currentDuration);
    invalidateFinishButton();
  }

  public boolean canChangeFocus()
  {
    return (this.mCurrentSegment == null) && (this.mVideoController.canChangeFocus());
  }

  public boolean canKeepRecording()
  {
    return (this.mCanKeepRecording) && (!this.mDiscardChanges);
  }

  public boolean canPickUpFloatView()
  {
    View localView = this.mPreviewLoadingOverlay;
    boolean bool = false;
    if (localView != null)
    {
      int i = this.mPreviewLoadingOverlay.getVisibility();
      bool = false;
      if (i != 0)
        bool = true;
    }
    return bool;
  }

  public boolean canSwitchCamera()
  {
    return (CameraManager.hasFrontFacingCamera()) && (CameraManager.hasBackFacingCamera()) && (!this.mVideoController.isRecording());
  }

  public void changeProgress(long paramLong)
  {
    if (this.mProgressView != null)
    {
      if ((this.progressWidth == 0) && (this.mCameraView.getParent() != null))
        this.progressWidth = ((ViewGroup)this.mProgressView.getParent()).getMeasuredWidth();
      this.mProgressView.shouldBeWidth = ((int)(paramLong * this.progressWidth / this.mSession.getConfig().maxDuration));
      this.mProgressView.invalidate();
      this.mProgressOverlay.setVisibility(8);
    }
  }

  public void cleanThumbnails(boolean paramBoolean)
  {
    HashSet localHashSet = new HashSet(this.mToRemove);
    this.mToRemove.clear();
    if (paramBoolean)
      localHashSet.addAll(this.mAddedSegments);
    Iterator localIterator = localHashSet.iterator();
    while (localIterator.hasNext())
    {
      String str = ((RecordSegment)localIterator.next()).getThumbnailPath();
      if (!TextUtils.isEmpty(str))
        FileUtils.deleteQuietly(new File(str));
    }
  }

  public void doOneFrame()
  {
    if ((this.mCurrentRecordingFile != null) && (!isEditing()) && (this.mAutoFocusing) && (startRelativeTime()))
      this.mHandler.postDelayed(new Runnable()
      {
        public void run()
        {
          VineRecorder.this.endRelativeTime();
        }
      }
      , 25L);
  }

  public boolean floatViewDropped(int paramInt)
  {
    boolean bool = floatViewIntersectsTrashCan();
    animateTopButtons(0);
    if (bool)
    {
      if ((paramInt != 0) || (this.mEditorAdapter.getCount() <= 1))
        break label94;
      showThumbnailOverlay((RecordSegment)this.mEditorAdapter.getItem(1));
    }
    while (true)
    {
      if ((this.mPickedUpPosition != paramInt) || (bool))
      {
        this.mPlayButtonOnClickListener.toPlay = null;
        this.mPlayButtonOnClickListener.forceRefresh = true;
      }
      if ((!bool) || (this.mEditorAdapter.getCount() != 1))
        animatePlayButton(true);
      return bool;
      label94: if (this.mEditorAdapter.getCount() > 1)
        showThumbnailOverlay((RecordSegment)this.mEditorAdapter.getItem(0));
    }
  }

  public void floatViewLanded(int paramInt)
  {
  }

  public void floatViewMoved()
  {
    if ((floatViewIntersectsTrashCan()) && (this.mDragSortWidget.canDelete()));
    for (int i = 1; i != 0; i = 0)
    {
      animateTopButtons(1);
      return;
    }
    animateTopButtons(0);
  }

  public void floatViewPickedUp(int paramInt)
  {
    this.mPickedUpPosition = paramInt;
    if (this.mEditorAdapter != null)
    {
      RecordSegment localRecordSegment = (RecordSegment)this.mEditorAdapter.getItem(paramInt);
      showThumbnailOverlay(localRecordSegment);
      this.mPlayButtonOnClickListener.toPlay = localRecordSegment;
      this.mPlayButtonOnClickListener.forceRefresh = false;
    }
    pausePreview(false);
  }

  public View getCameraView()
  {
    return this.mCameraView;
  }

  public RecordConfigUtils.RecordConfig getConfig()
  {
    RecordSession localRecordSession = this.mSession;
    if (localRecordSession != null)
      return localRecordSession.getConfig();
    return null;
  }

  public int getCurrentlyPlayingPosition()
  {
    if ((this.mLastSelectedPosition == -1) && (this.mSegmentChangeDetector != null))
    {
      if ((this.mSegmentChangeDetector.lastFirstItem >= 0) && (this.mEditorAdapter != null) && (this.mSegmentChangeDetector.lastFirstItem < this.mEditorAdapter.getCount()))
        return this.mSegmentChangeDetector.lastFirstItem;
      return 0;
    }
    return this.mLastSelectedPosition;
  }

  public RecordingFile getFile()
  {
    return this.mCurrentRecordingFile;
  }

  public View getGhostView()
  {
    return this.mGhostView;
  }

  public Handler getHandler()
  {
    return this.mHandler;
  }

  public View getProgressView()
  {
    return this.mProgressView;
  }

  public Point getSize()
  {
    return this.mSize;
  }

  public String getThumbnailPath()
  {
    return this.mCurrentRecordingFile.getThumbnailPath();
  }

  public long getTimestamp()
  {
    return this.mVideoController.getTimestamp();
  }

  public void hideThumbnailOverlay()
  {
    if (this.mThumbnailOverlay != null)
    {
      this.mThumbnailOverlay.animate().setDuration(this.mShortAnimTime).alpha(0.0F).setListener(new ViewGoneAnimationListener(this.mThumbnailOverlay)).start();
      this.mThumbnailOverlay.setImageDrawable(null);
    }
  }

  public void hideThumbnailOverlayDelayed()
  {
    getHandler().postDelayed(new Runnable()
    {
      public void run()
      {
        VineRecorder.this.hideThumbnailOverlay();
      }
    }
    , 100L);
  }

  public boolean isAutoFocusing()
  {
    return this.mAutoFocusing;
  }

  public boolean isEditing()
  {
    return (this.mEditing) && (this.mEditorAdapter != null);
  }

  public boolean isEditingDirty()
  {
    return (isEditing()) && (!this.mEditorAdapter.compareTo(this.mEditedSegments));
  }

  public boolean isRecordingSegment()
  {
    return this.mCurrentSegment != null;
  }

  public boolean isResuming()
  {
    OnResumeTask localOnResumeTask = this.mResumeTask;
    return (localOnResumeTask != null) && (localOnResumeTask.isRunning);
  }

  public boolean isSavedSession()
  {
    return this.mCurrentRecordingFile.isSavedSession;
  }

  public boolean isSessionDirty()
  {
    return this.mCurrentRecordingFile.isDirty;
  }

  public void modifyZoom(boolean paramBoolean)
  {
    if (this.mVideoController.isRecordingStarted())
      this.mVideoController.modifyZoom(paramBoolean);
  }

  public void onAutoFocusComplete(boolean paramBoolean)
  {
    SLog.d("Auto focus {}.", Boolean.valueOf(paramBoolean));
  }

  public void onCameraReady(RecordController paramRecordController)
  {
    View localView;
    if (this.mActivity != null)
      if (this.mSession.getConfig().flashSwitchEnabled)
      {
        localView = this.mFlashSwitcher;
        if (localView != null)
          if (!this.mVideoController.isFlashSupported())
            break label89;
      }
    label89: for (int i = 0; ; i = 8)
    {
      localView.setVisibility(i);
      this.mHandler.post(this.onCameraReadyRunnable);
      if ((!this.mVideoController.isSurfaceReady()) || (this.mVideoController.isRecordingStarted()))
        break;
      start("Camera ready", false);
      return;
    }
    SLog.d("Do not start recording: {} {}", Boolean.valueOf(this.mVideoController.isSurfaceReady()), Boolean.valueOf(this.mVideoController.isRecordingStarted()));
  }

  public void onCameraSwitcherPressed(View paramView)
  {
    this.mCameraSwitcherViewListener.onClick(paramView);
  }

  public void onDeviceNotSupported(Throwable paramThrowable)
  {
    if (!this.mAlreadyStoppingForUnspportedReasons)
    {
      this.mAlreadyStoppingForUnspportedReasons = true;
      if (paramThrowable != null)
        CrashUtil.logException(paramThrowable);
      stopAndDiscardChanges("OnDeviceNotSupported", new Runnable()
      {
        public void run()
        {
          VineRecorder.this.mHandler.post(new Runnable()
          {
            public void run()
            {
              if (VineRecorder.this.mActivity != null)
              {
                Toast.makeText(VineRecorder.this.mActivity, VineRecorder.this.mDeviceNotSupportedString, 0).show();
                VineRecorder.this.mActivity.finish();
              }
            }
          });
        }
      }
      , true);
    }
  }

  public boolean onError(MediaPlayer paramMediaPlayer, int paramInt1, int paramInt2)
  {
    return false;
  }

  public void onFinishPressed(View paramView)
  {
    finish("onFinishPressed");
  }

  public boolean onGhostSwitchPressed()
  {
    if (!this.mGhostModeEnabled);
    for (boolean bool = true; ; bool = false)
      return setGhostMode(bool);
  }

  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    switch (paramInt)
    {
    default:
    case 27:
    }
    for (boolean bool = false; ; bool = true)
    {
      return bool;
      try
      {
        switch (paramKeyEvent.getAction())
        {
        case 0:
          startRelativeTime();
        case 1:
        }
      }
      finally
      {
      }
      endRelativeTime();
    }
  }

  public void onPause()
  {
    this.mNeverResumedRecorder = false;
    if (this.mSwitchCameraTask != null)
      this.mSwitchCameraTask.cancel(true);
    if (this.mResumeTask != null)
      this.mResumeTask.cancel(true);
    this.mFinishProcessRunnable.run("onPause", true, false);
    this.mVideoController.onPause();
    if (this.mHashTask != null)
      this.mHashTask.cancel(false);
    if (this.mProgressTimer != null)
    {
      this.mProgressTimer.release();
      this.mProgressTimer = null;
    }
  }

  public void onPrepared(MediaPlayer paramMediaPlayer)
  {
    if (this.mDragSortWidget != null)
    {
      if (this.mDragSortWidget.hasFloatView())
        pausePreview(false);
      hideThumbnailOverlayDelayed();
      animatePreviewSpinner(false);
    }
  }

  public void onProgressMaxReached()
  {
    if (!this.mHasPreviewedAlready)
      finish("progressMaxReached");
  }

  public void onProgressThresholdReached()
  {
    View localView = this.mFinishButton;
    if (localView != null)
      localView.setVisibility(0);
  }

  public void onResume(String paramString, boolean paramBoolean)
  {
    boolean bool1 = true;
    boolean bool2 = canKeepRecording();
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Boolean.valueOf(paramBoolean);
    arrayOfObject[bool1] = Boolean.valueOf(bool2);
    arrayOfObject[2] = Boolean.valueOf(isEditing());
    boolean bool3;
    if (this.finalFile != null)
    {
      bool3 = bool1;
      arrayOfObject[3] = Boolean.valueOf(bool3);
      CrashUtil.log("Resume VineRecorder: delayDialog: {} canKeepRecording: {} isEditing: {} NullFinalFile: {}.", arrayOfObject);
      if (!bool2)
        break label220;
      if (isEditing())
        break label213;
    }
    label189: label213: label220: 
    do
    {
      do
      {
        OnResumeTask localOnResumeTask;
        try
        {
          this.mVideoController.setPreviewSurface(this.mCameraView);
          if (this.mStartWithEditMode)
          {
            setEditMode(bool1, false);
            return;
            bool3 = false;
          }
        }
        catch (Exception localException)
        {
          while (true)
            CrashUtil.logException(localException, "Cannot resume.", new Object[0]);
          this.mResumeTask = new OnResumeTask(null, "OnResume_" + paramString);
          localOnResumeTask = this.mResumeTask;
          if (paramBoolean)
            break label189;
        }
        if ((this.mCurrentRecordingFile.isSavedSession) && (this.mNeverResumedRecorder));
        while (true)
        {
          localOnResumeTask.showDialogDelayed = bool1;
          this.mResumeTask.execute(new Void[0]);
          return;
          bool1 = false;
        }
        setEditMode(bool1, false);
        return;
        if (this.finalFile != null)
        {
          this.mOnCompleteConsumer.run();
          return;
        }
      }
      while (this.mStartProgressDialog == null);
      this.mStartProgressDialog.setMessage(this.mFinishLastSegmentString);
    }
    while (paramBoolean);
    try
    {
      this.mStartProgressDialog.show();
      return;
    }
    catch (WindowManager.BadTokenException localBadTokenException)
    {
    }
  }

  public void onSelectionChanged(int paramInt, boolean paramBoolean)
  {
    this.mLastSelectedPosition = paramInt;
    SegmentEditorAdapter localSegmentEditorAdapter = this.mEditorAdapter;
    if (localSegmentEditorAdapter != null)
    {
      if ((paramInt == -1) || (paramInt >= this.mEditedSegments.size()))
        break label61;
      animateTopButtons(0);
      RecordSegment localRecordSegment = (RecordSegment)localSegmentEditorAdapter.getItem(paramInt);
      if (paramBoolean)
        playPreview(localRecordSegment, true);
      localSegmentEditorAdapter.commitDelete();
    }
    while (true)
    {
      return;
      label61: if (localSegmentEditorAdapter.getCount() <= 0)
        break;
      animateTopButtons(2);
      if (paramBoolean)
        playPreview(null, true);
      while (this.mDragSortWidget != null)
      {
        this.mDragSortWidget.setFocused(0);
        return;
        if ((this.mLastPlayingSegment != null) && (!paramBoolean))
          pausePreview(true);
      }
    }
    this.mVideoPlayer.suspend();
    animatePlayButton(false);
    animatePreviewSpinner(false);
    hideThumbnailOverlay();
    animateTopButtons(2);
    this.mVideoPlayer.setVisibility(8);
  }

  public void onSurfaceReady(RecordController paramRecordController)
  {
    if (this.mVideoController.isCameraReady())
    {
      SLog.d("Start recording on surface ready.");
      if (!this.mVideoController.isRecordingStarted())
      {
        start("Surface Ready", false);
        return;
      }
      this.mVideoController.startPreview();
      return;
    }
    SLog.d("Do not start recording: {} {}.", Boolean.valueOf(false), Boolean.valueOf(this.mVideoController.isRecordingStarted()));
  }

  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    boolean bool1 = true;
    while (true)
    {
      int i;
      try
      {
        i = paramMotionEvent.getAction();
        if ((this.mCurrentRecordingFile == null) || (!this.mEnabled) || (isEditing()))
          break label154;
        boolean bool2 = this.mAutoFocusing;
        if (!bool2)
          break label159;
        switch (i)
        {
        default:
          return bool1;
        case 0:
          float f = paramMotionEvent.getAxisValue(0);
          if ((f <= 0.05F * this.mSize.x) || (f >= 0.95F * this.mSize.x))
            continue;
          startRelativeTime();
          continue;
        case 1:
        }
      }
      finally
      {
      }
      endRelativeTime();
      continue;
      changeFocusTo(paramMotionEvent.getAxisValue(0), paramMotionEvent.getAxisValue(1));
      continue;
      label154: bool1 = false;
      continue;
      label159: switch (i)
      {
      case 1:
      }
    }
  }

  public void onUiPaused()
  {
    releaseSegmentChangeDetector();
    if (this.mCameraView != null)
      this.mCameraView.setOnTouchListener(null);
    if (this.mDragSortWidget != null)
      this.mDragSortWidget.releaseReferences();
    this.mActivity = null;
    this.mResources = null;
    try
    {
      if (this.mFinishProgressDialog != null)
        this.mFinishProgressDialog.dismiss();
      if (this.mStartProgressDialog != null)
        this.mStartProgressDialog.dismiss();
      if (this.mOpenCameraDialog != null)
        this.mOpenCameraDialog.dismiss();
      if (this.mRefreshPreviewTask != null)
        this.mRefreshPreviewTask.cancel(false);
      if (this.mVideoPlayer != null)
      {
        this.mVideoPlayer.setOnErrorListener(null);
        this.mVideoPlayer.setOnPreparedListener(null);
      }
      this.mRefreshPreviewTask = null;
      this.mRecordingOptions = null;
      this.mStartProgressDialog = null;
      this.mFinishProgressDialog = null;
      this.mOpenCameraDialog = null;
      this.mPreviewLoadingOverlay = null;
      this.mOnCompleteConsumer = null;
      this.mFlashSwitcher = null;
      this.mCameraSwitcher = null;
      this.mFinishButton = null;
      this.mTrashUndoContainer = null;
      this.mThumbnailList = null;
      this.mPlayButtonContainer = null;
      this.mThumbnailSegment = null;
      this.mProgressView = null;
      this.mCameraView = null;
      this.mTopMaskView = null;
      this.mBottomMaskView = null;
      this.mEditorCancelButton = null;
      this.mEditorDoneButton = null;
      this.mTrashCanButton = null;
      this.mEditorButtons = null;
      this.mThumbnailOverlay = null;
      this.mFocusView = null;
      this.mToast = null;
      this.mDragSortWidget = null;
      this.mGridSwitch = null;
      onPause();
      return;
    }
    catch (Exception localException)
    {
      while (true)
        SLog.e("It's probably detached already.", localException);
    }
  }

  @SuppressLint({"ShowToast"})
  public void onUiResumed(Activity paramActivity, Runnable paramRunnable, boolean paramBoolean)
  {
    this.mActivity = paramActivity;
    this.mResources = paramActivity.getResources();
    this.mFinishProgressDialog = new ProgressDialog(paramActivity, 2);
    this.mFinishProgressDialog.setMessage(this.mFinishProgressDialogMessage[1]);
    this.mFinishProgressDialog.setMax(100);
    this.mFinishProgressDialog.setCancelable(false);
    this.mFinishProgressDialog.setIndeterminate(false);
    this.mFinishProgressDialog.setProgressStyle(1);
    this.mFinishProgressDialog.setProgressDrawable(paramActivity.getResources().getDrawable(R.drawable.progress_horizontal));
    this.mStartProgressDialog = new ProgressDialog(paramActivity, 2);
    this.mOpenCameraDialog = new ProgressDialog(paramActivity, 2);
    this.mOpenCameraDialog.setMessage(this.mOpenCameraResource);
    this.mOpenCameraDialog.setCancelable(false);
    this.mVideoController.updateRotation(paramActivity);
    this.mRootLayoutView = paramActivity.findViewById(this.mRootLayoutId);
    this.mCameraView = paramActivity.findViewById(this.mCameraViewResourceId);
    this.mCameraView.setVisibility(0);
    this.mCameraView.setOnTouchListener(this);
    this.mCameraView.setOnKeyListener(this);
    this.mRecordingOptions = paramActivity.findViewById(this.mRecordingOptionsRowId);
    this.mTopMaskView = paramActivity.findViewById(this.mTopMaskId);
    this.mThumbnailList = paramActivity.findViewById(16908298);
    this.mThumbnailOverlay = ((ImageView)paramActivity.findViewById(this.mThumbnailOverlayId));
    this.mTrashUndoContainer = paramActivity.findViewById(this.mTrashUndoContainerId);
    this.mTrashUndoContainer.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        if (VineRecorder.this.mTrashUndoContainer != null)
          return VineRecorder.this.mTrashUndoContainer.isActivated();
        return false;
      }
    });
    this.mPlayButtonContainer = paramActivity.findViewById(this.mPlayButtonContainerId);
    this.mPlayButtonOnClickListener = new PlayButtonOnClickListener(null);
    this.mPlayButtonContainer.setOnClickListener(this.mPlayButtonOnClickListener);
    this.mPlayButtonContainer.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        if (VineRecorder.this.mDragSortWidget != null)
          return VineRecorder.this.mDragSortWidget.onTouch((View)VineRecorder.this.mVideoPlayer.getParent(), paramAnonymousMotionEvent, VineRecorder.this.mPlayButtonContainer.getLeft(), VineRecorder.this.mPlayButtonContainer.getTop());
        return false;
      }
    });
    this.mPlayButton = ((ViewGroup)this.mPlayButtonContainer).getChildAt(0);
    this.mPlayRefreshButton = ((ViewGroup)this.mPlayButtonContainer).getChildAt(1);
    this.mDragSortWidget = ((DragSortWidget)paramActivity.findViewById(this.mDragSortWidgetId));
    this.mDragSortWidget.setSelectionChangedListener(this);
    this.mDragSortWidget.setFloatViewInteractionListener(this);
    this.mDragSortWidget.setCurrentlyPlayingProvider(this);
    this.mBottomMaskView = paramActivity.findViewById(this.mBottomMaskId);
    this.mEditorButtons = paramActivity.findViewById(this.mEditorButtonsId);
    this.mEditorButtons.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    });
    this.mEditorDoneButton = paramActivity.findViewById(this.mEditorDoneButtonId);
    this.mPreviewLoadingOverlay = paramActivity.findViewById(this.mPreviewLoadingOverlayId);
    this.mEditorDoneButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        boolean bool = true;
        if ((VineRecorder.this.mReturnToPreview) && (VineRecorder.this.getDurationFromSegments() >= 1000L))
        {
          VineRecorder.this.animateEditModeControlsOut(bool);
          VineRecorder.this.returnToPreview(false);
          return;
        }
        VineRecorder localVineRecorder = VineRecorder.this;
        View localView = VineRecorder.this.mEditorDoneButton;
        if (!VineRecorder.this.mEditing);
        while (true)
        {
          localVineRecorder.setEditMode(localView, bool, false);
          return;
          bool = false;
        }
      }
    });
    this.mTrashCanButton = paramActivity.findViewById(this.mTrashCanButtonId);
    this.mTrashCanButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        VineRecorder.this.mPlayButtonOnClickListener.toPlay = null;
        VineRecorder.this.mPlayButtonOnClickListener.forceRefresh = true;
        if (VineRecorder.this.mDragSortWidget != null)
          VineRecorder.this.mDragSortWidget.removeSelection();
        VineRecorder.this.animateTopButtons(2);
      }
    });
    this.mUndoButton = paramActivity.findViewById(this.mUndoButtonId);
    this.mUndoButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        VineRecorder.this.mPlayButtonOnClickListener.toPlay = null;
        VineRecorder.this.mPlayButtonOnClickListener.forceRefresh = true;
        VineRecorder.this.pausePreview(true);
        if (VineRecorder.this.mEditorAdapter != null)
        {
          VineRecorder.this.mEditorAdapter.undoDelete();
          VineRecorder.this.showThumbnailOverlay((RecordSegment)VineRecorder.this.mEditorAdapter.getItem(0));
        }
        VineRecorder.this.animateTopButtons(2);
        if (VineRecorder.this.mUndoButton != null)
          VineRecorder.this.mUndoButton.setVisibility(8);
        if (VineRecorder.this.mDragSortWidget != null)
          VineRecorder.this.mDragSortWidget.setFocused(0);
      }
    });
    this.mTrashCanButton.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        switch (paramAnonymousMotionEvent.getAction())
        {
        default:
          return false;
        case 0:
          VineRecorder.this.animateTopButtons(1);
          return false;
        case 2:
          VineRecorder.this.animateTopButtons(1);
          return false;
        case 1:
        }
        VineRecorder.this.animateTopButtons(0);
        return false;
      }
    });
    this.mEditorCancelButton = paramActivity.findViewById(this.mEditorCancelButtonId);
    this.mEditorCancelButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (VineRecorder.this.mReturnToPreview)
        {
          VineRecorder.this.returnToPreview(true);
          return;
        }
        VineRecorder localVineRecorder = VineRecorder.this;
        View localView = VineRecorder.this.mEditorCancelButton;
        if (!VineRecorder.this.mEditing);
        for (boolean bool = true; ; bool = false)
        {
          localVineRecorder.setEditMode(localView, bool, true);
          return;
        }
      }
    });
    this.mProgressView = ((ProgressView)paramActivity.findViewById(this.mProgressViewResourceId));
    this.mCameraView.setOnTouchListener(this);
    this.mProgressView.setKeepScreenOn(true);
    this.mGridSwitch = ((ToggleButton)paramActivity.findViewById(this.mGridSwitchId));
    this.mFocusView = paramActivity.findViewById(this.mFocusViewResourceId);
    this.mFinishButton = paramActivity.findViewById(this.mFinishButtonId);
    this.mFinishButton.setOnClickListener(this.mFinishClicker);
    if ((!isEditing()) && (this.currentDuration >= 1000L))
      onProgressThresholdReached();
    if (this.mCameraSwitcherId > 0)
    {
      this.mCameraSwitcher = ((ViewGroup)paramActivity.findViewById(this.mCameraSwitcherId));
      if (!RecordConfigUtils.getGenericConfig(paramActivity).cameraSwitchEnabled)
      {
        this.mCameraSwitcher.setVisibility(8);
        this.mProgressView.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            VineRecorder localVineRecorder = VineRecorder.this;
            ProgressView localProgressView = VineRecorder.this.mProgressView;
            if (!VineRecorder.this.mEditing);
            for (boolean bool = true; ; bool = false)
            {
              localVineRecorder.setEditMode(localProgressView, bool, false);
              return;
            }
          }
        });
        if (this.mFlashSwitcherId <= 0)
          break label871;
        this.mFlashSwitcher = paramActivity.findViewById(this.mFlashSwitcherId);
        if (!this.mSession.getConfig().flashSwitchEnabled)
          break label859;
        this.mFlashSwitcher.setVisibility(0);
        this.mFlashSwitcher.setOnClickListener(this.mSwitchFlashViewListener);
      }
    }
    while (true)
    {
      if (canSwitchCamera())
        showCameraSwitcher();
      this.mOnCompleteConsumer = paramRunnable;
      this.mFinishProcessRunnable.reset();
      this.mIsSwitchingCamera = false;
      this.mToast = Toast.makeText(paramActivity, this.mCameraFailString, 0);
      this.mProgressOverlay = paramActivity.findViewById(this.mProgressOverlayId);
      if (!paramBoolean)
        onResume("UI Resume", false);
      return;
      this.mCameraSwitcher.setOnClickListener(this.mCameraSwitcherViewListener);
      break;
      this.mCameraSwitcher = null;
      break;
      label859: this.mFlashSwitcher.setVisibility(8);
      continue;
      label871: this.mFlashSwitcher = null;
    }
  }

  public void pausePreview(boolean paramBoolean)
  {
    if (paramBoolean)
      animatePlayButton(true);
    while (true)
    {
      if (this.mRefreshPreviewTask != null)
        this.mRefreshPreviewTask.cancel(true);
      this.mVideoPlayer.pause();
      return;
      animatePlayButton(false);
    }
  }

  public void playPreview(RecordSegment paramRecordSegment, boolean paramBoolean)
  {
    animatePlayButton(false);
    refreshVideoView(paramRecordSegment, paramBoolean);
  }

  public void postProgressUpdate(int paramInt)
  {
    this.mChangeProgressRunnable.progress = paramInt;
    this.mHandler.post(this.mChangeProgressRunnable);
  }

  public void refreshVideoView(RecordSegment paramRecordSegment, boolean paramBoolean)
  {
    releaseSegmentChangeDetector();
    this.mSegmentChangeDetector = new SegmentChangeDetector();
    this.mSegmentChangeThread = new Thread(this.mSegmentChangeDetector);
    this.mSegmentChangeThread.start();
    if ((this.mLastPlayingSegment != paramRecordSegment) || (paramBoolean))
    {
      if (this.mEditorAdapter.getCount() > 0)
        showThumbnailOverlay(paramRecordSegment);
      if ((paramRecordSegment == null) && (this.mDragSortWidget != null))
        this.mDragSortWidget.setFocused(0);
      if (this.mRefreshPreviewTask != null)
        this.mRefreshPreviewTask.cancel(true);
      this.mVideoPlayer.suspend();
      animatePreviewSpinner(true);
      this.mRefreshPreviewTask = new RefreshPreviewTask(paramRecordSegment);
      this.mRefreshPreviewTask.execute(new Void[0]);
      return;
    }
    this.mVideoPlayer.resume();
    hideThumbnailOverlayDelayed();
    animatePreviewSpinner(false);
  }

  public boolean release()
  {
    this.mVideoController.releaseParent();
    this.mVideoController.releaseCameraResources();
    this.mVideoController.releaseCallbacks();
    this.mVideoController.logPreviewSizeExceptionIfNeeded();
    RecordingFile localRecordingFile = this.mCurrentRecordingFile;
    boolean bool1 = false;
    File localFile1;
    if (localRecordingFile != null)
    {
      localFile1 = this.mCurrentRecordingFile.folder;
      if ((this.mDoNotDeleteSession) || (RecordSessionManager.isSessionSaved(localFile1)))
        break label165;
    }
    while (true)
    {
      try
      {
        RecordSessionManager.deleteSession(localFile1, "Release");
        bool1 = true;
        SLog.i("Session deleted: {}", Boolean.valueOf(bool1));
        this.mSession = null;
        this.mCurrentRecordingFile = null;
        this.mCurrentSegment = null;
        this.mVideoController = null;
        this.mLastPlayingSegment = null;
        this.mAddedSegments.clear();
        int i = this.mEditedSegments.size();
        boolean bool2 = false;
        if (i > 0)
        {
          bool2 = false;
          if (bool1)
            bool2 = true;
        }
        this.mEditedSegments.clear();
        return bool2;
      }
      catch (IOException localIOException)
      {
        SLog.e("Failed to delete session: {}.", localIOException);
        bool1 = false;
        continue;
      }
      label165: File localFile2 = RecordSessionManager.getDataFile(localFile1, false);
      boolean bool3 = localFile2.exists();
      bool1 = false;
      if (bool3)
      {
        FileUtils.deleteQuietly(localFile2);
        bool1 = false;
      }
    }
  }

  public void reverseFrames()
  {
    if (isEditing())
      this.mEditorAdapter.reverse();
  }

  public void saveSession(Runnable paramRunnable, boolean paramBoolean)
  {
    this.mCanKeepRecording = false;
    stop("saveSession", paramRunnable, paramBoolean, true);
  }

  public void setAutoFocusing(boolean paramBoolean)
  {
    if (this.mVideoController != null)
    {
      this.mAutoFocusing = paramBoolean;
      this.mVideoController.setAutoFocus(this.mAutoFocusing);
      if (this.mAutoFocusing)
        dismissFocusIndicator();
    }
  }

  public void setDiscardChanges(boolean paramBoolean)
  {
    this.mDiscardChanges = paramBoolean;
  }

  public void setEditMode(View paramView, boolean paramBoolean1, boolean paramBoolean2)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Boolean.valueOf(paramBoolean1);
    arrayOfObject[1] = Boolean.valueOf(paramBoolean2);
    CrashUtil.log("Set edit mode: {} {}.", arrayOfObject);
    final boolean bool = this.mEditing;
    this.mEditing = paramBoolean1;
    this.mUndoButton.setVisibility(8);
    if (this.mCurrentRecordingFile.hasData())
    {
      if (this.mEditing)
      {
        this.mStartWithEditMode = false;
        if (canKeepRecording())
        {
          if (this.mVideoController.isRecordingStarted())
          {
            stop("editMode", new Runnable()
            {
              public void run()
              {
                VineRecorder.this.startEditMode(bool);
              }
            }
            , true, false);
            return;
          }
          startEditMode(bool);
          return;
        }
        this.mEditing = false;
        return;
      }
      releaseSegmentChangeDetector();
      if (this.mRefreshPreviewTask != null)
        this.mRefreshPreviewTask.cancel(true);
      if (this.mVideoPlayer != null)
        this.mVideoPlayer.stopPlayback();
      if (this.mDragSortWidget != null)
        this.mDragSortWidget.cleanUp();
      if (this.mIsGridOn)
      {
        setGridOn(false);
        this.mGridSwitch.setChecked(this.mIsGridOn);
      }
      if (this.mGhostModeEnabled)
        setGhostMode(false);
      if (!paramBoolean2)
      {
        if (commitChanges())
        {
          int i = this.mEditedSegments.size();
          if ((i > 0) && (this.mVideoController != null))
            this.mVideoController.makePreview((RecordSegment)this.mEditedSegments.get(i - 1), true);
        }
        if (this.mCurrentRecordingFile != null)
          this.mCurrentRecordingFile.invalidateGhostThumbnail();
      }
      animateEditModeControlsOut(true);
      animateCaptureControlsIn();
      invalidateGhostView();
      invalidateFinishButton();
      setHasPreviewedAlreadyIfNeeded();
      this.mReturnToPreview = false;
      this.mResumeTask = new OnResumeTask(paramView, "Set EditMode.");
      this.mResumeTask.execute(new Void[0]);
      this.mEditorAdapter = null;
      return;
    }
    this.mEditing = false;
  }

  public void setEditMode(boolean paramBoolean1, boolean paramBoolean2)
  {
    setEditMode(null, paramBoolean1, paramBoolean2);
  }

  public void setEnabled(boolean paramBoolean)
  {
    this.mEnabled = paramBoolean;
  }

  public boolean setGhostMode(boolean paramBoolean)
  {
    if (this.mGhostView != null)
    {
      if (paramBoolean)
      {
        this.mGhostView.setVisibility(0);
        this.mGhostModeEnabled = paramBoolean;
        if (!this.mGhostModeEnabled)
          break label61;
        this.mVideoController.requestGhostDrawing(false);
      }
      while (true)
      {
        this.mGhostButton.setChecked(paramBoolean);
        return paramBoolean;
        this.mGhostView.setVisibility(8);
        break;
        label61: updateGhostBitmap(null);
      }
    }
    return false;
  }

  public void setGridOn(boolean paramBoolean)
  {
    this.mIsGridOn = paramBoolean;
  }

  public void showFocusIndicator(int paramInt1, int paramInt2)
  {
    if (this.mFocusIndicator != null)
    {
      int i = this.mFocusIndicator.getMeasuredWidth();
      int j = this.mFocusIndicator.getMeasuredHeight();
      this.mFocusIndicator.layout(paramInt1 - i / 2, paramInt2 - j / 2, paramInt1 + i / 2, paramInt2 + j / 2);
      this.mFocusIndicator.setVisibility(0);
      this.mFocusIndicator.startAnimation(this.mFocusAnimationSet);
    }
  }

  public void showInitializationDialog()
  {
    if (this.mStartProgressDialog != null)
      this.mStartProgressDialog.show();
  }

  public void showThumbnailOverlay(RecordSegment paramRecordSegment)
  {
    if ((this.mThumbnailOverlay != null) && ((this.mThumbnailOverlay.getVisibility() != 0) || (paramRecordSegment != this.mThumbnailSegment)))
    {
      this.mThumbnailOverlay.setVisibility(0);
      this.mThumbnailOverlay.setAlpha(1.0F);
      if ((paramRecordSegment == null) && (this.mEditorAdapter.getCount() > 0))
        paramRecordSegment = (RecordSegment)this.mEditorAdapter.getItem(0);
      Drawable localDrawable = paramRecordSegment.getDrawableCopy(this.mActivity);
      this.mThumbnailOverlay.setImageDrawable(localDrawable);
    }
    this.mThumbnailSegment = paramRecordSegment;
  }

  public void start(final String paramString, boolean paramBoolean)
  {
    CrashUtil.log("Start called from {}.", new Object[] { paramString });
    if (!this.mCanKeepRecording)
    {
      CrashUtil.logException(new IllegalStateException("You cannot start recording again if it is finished."));
      CrashUtil.log("Start failed.");
      return;
    }
    adjustBoundaries(this.mVideoController.getCameraSetting());
    if ((this.mVideoController.isRecordingStarted()) && (paramBoolean))
    {
      stop("stopPrevious", new Runnable()
      {
        public void run()
        {
          VineRecorder.this.guardedStartRecording(paramString);
        }
      }
      , true, false);
      return;
    }
    guardedStartRecording(paramString);
  }

  public void startEditMode(boolean paramBoolean)
  {
    adjustEditBoundaries();
    if (!this.mReturnToPreview)
    {
      animateCaptureControlsOut();
      animateEditModeControlsIn();
      if (this.mTrashUndoContainer != null)
        this.mTrashUndoContainer.setActivated(false);
      this.mLastSelectedPosition = -1;
      this.mLastPlayingSegment = null;
      if (paramBoolean)
        break label165;
      this.mEditorAdapter = new SegmentEditorAdapter(this.mEditedSegments, this.mActivity, this.density);
      label71: if (!this.mEditorAdapter.canUndoDelete())
        break label183;
      this.mUndoButton.setVisibility(0);
    }
    while (true)
    {
      if (this.mDragSortWidget != null)
      {
        this.mDragSortWidget.setAdapter(this.mEditorAdapter);
        this.mEditorAdapter.notifyDataSetChanged();
        this.mDragSortWidget.setSelection(-1);
        this.mDragSortWidget.setFocused(0);
      }
      setGhostMode(false);
      if (this.mGridSwitch != null)
        this.mGridSwitch.setChecked(false);
      refreshVideoView(null, true);
      return;
      hideCaptureControls();
      break;
      label165: this.mEditorAdapter = new SegmentEditorAdapter(this.mEditorAdapter);
      break label71;
      label183: this.mUndoButton.setVisibility(4);
    }
  }

  public void stopAndDiscardChanges(String paramString, Runnable paramRunnable, boolean paramBoolean)
  {
    setDiscardChanges(true);
    this.mFinishProcessRunnable.run(paramString, paramBoolean, false);
    paramRunnable.run();
  }

  public RecordingFile swapSession(String paramString, RecordingFile paramRecordingFile)
  {
    if (paramRecordingFile != null)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramString;
      arrayOfObject[1] = paramRecordingFile.folder.getAbsolutePath();
      CrashUtil.log("Swap new Recorder for {} from {}.", arrayOfObject);
      this.mSession = paramRecordingFile.getSession();
      this.mCurrentRecordingFile = paramRecordingFile;
      this.mFinished = false;
      this.mEditedSegments.clear();
      this.mEditedSegments.addAll(this.mCurrentRecordingFile.getSession().getSegments());
      this.mToRemove.clear();
      this.mAddedSegments.clear();
      this.mCurrentRecordingFile.editedSegments = this.mEditedSegments;
      swapTimestampsFromSegments(this.mEditedSegments);
      this.mCanKeepRecording = true;
      changeProgress(this.currentDuration);
      if (this.currentDuration >= this.mSession.getConfig().maxDuration)
        this.mHasPreviewedAlready = true;
      setHasPreviewedAlreadyIfNeeded();
      this.mDiscardChanges = false;
      invalidateGhostView();
      setGhostMode(false);
      this.mVideoController.swapSession();
    }
    return paramRecordingFile;
  }

  public void switchFlash()
  {
    this.mVideoController.switchFlash();
  }

  public void switchModes()
  {
    this.mCurrentRecordingFile.setSession(this.mSession);
    this.mVideoController.refreshBufferMax(this.mSession);
    this.mVideoController.stop(this.mDiscardChanges, true);
    startRecording("switchModes");
  }

  protected void updateGhostBitmap(final Bitmap paramBitmap)
  {
    this.mHandler.post(new Runnable()
    {
      public void run()
      {
        if (paramBitmap == null)
          if (VineRecorder.this.mGhostView != null)
            VineRecorder.this.mGhostView.setVisibility(8);
        while ((VineRecorder.this.mResources == null) || (VineRecorder.this.mGhostView == null))
          return;
        if (VineRecorder.this.mEditedSegments.size() == 0)
        {
          VineRecorder.this.mGhostView.setVisibility(8);
          return;
        }
        if (VineRecorder.this.mGhostView.getVisibility() != 0)
          VineRecorder.this.mGhostView.setVisibility(0);
        VineRecorder.this.mGhostView.setImageDrawable(new BitmapDrawable(VineRecorder.this.mResources, paramBitmap));
      }
    });
  }

  public void writePreviewToFile()
  {
    try
    {
      if (this.mEditedSegments.size() > 0);
      for (this.mCurrentFrameRate = ((RecordSegment)this.mEditedSegments.get(0)).getCameraSetting().frameRate; ; this.mCurrentFrameRate = 30)
      {
        VineFFmpegFrameRecorder localVineFFmpegFrameRecorder = RecordConfigUtils.newViewRecorder(this.mCurrentRecordingFile.getVideoPath() + ".video.mp4", this.mCurrentFrameRate, 480);
        localVineFFmpegFrameRecorder.start();
        RecordSession localRecordSession = getFile().getSession();
        new CombingRunnable(getFile(), false, localRecordSession.getAudioData(), localRecordSession.getVideoData(), this.mEditedSegments, localVineFFmpegFrameRecorder, this.mVideoController.getFinishProcessTask(), this.mVideoController.getBitmap(), this.mVideoController.getFrameBuffer()).run();
        return;
      }
    }
    catch (VineFFmpegFrameRecorder.Exception localException)
    {
      CrashUtil.logException(localException, "Cannot start audio/video recorder. ", new Object[0]);
    }
  }

  private class ChangeProgressRunnable
    implements Runnable
  {
    public int progress;

    private ChangeProgressRunnable()
    {
    }

    public void run()
    {
      VineRecorder.this.changeProgress(this.progress);
    }
  }

  private class EditModePreviewClickListener
    implements View.OnClickListener
  {
    private EditModePreviewClickListener()
    {
    }

    public void onClick(View paramView)
    {
      if (VineRecorder.this.mVideoPlayer.isPlaying())
      {
        VineRecorder.this.mPlayButtonOnClickListener.toPlay = VineRecorder.this.mLastPlayingSegment;
        VineRecorder.this.mPlayButtonOnClickListener.forceRefresh = false;
        VineRecorder.this.pausePreview(true);
      }
    }
  }

  private class FinishProcessRunnable
  {
    private boolean isResumed;

    private FinishProcessRunnable()
    {
    }

    public void reset()
    {
      this.isResumed = false;
    }

    // ERROR //
    public void run(String paramString, boolean paramBoolean1, boolean paramBoolean2)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore 4
      //   3: aload_0
      //   4: monitorenter
      //   5: aload_0
      //   6: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   9: invokestatic 31	co/vine/android/recorder/VineRecorder:access$100	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;
      //   12: invokevirtual 37	co/vine/android/recorder/RecordController:isRecordingStarted	()Z
      //   15: istore 6
      //   17: bipush 7
      //   19: anewarray 4	java/lang/Object
      //   22: astore 7
      //   24: aload 7
      //   26: iconst_0
      //   27: aload_1
      //   28: aastore
      //   29: aload 7
      //   31: iconst_1
      //   32: iload 6
      //   34: invokestatic 43	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   37: aastore
      //   38: aload 7
      //   40: iconst_2
      //   41: iload_2
      //   42: invokestatic 43	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   45: aastore
      //   46: aload 7
      //   48: iconst_3
      //   49: iload_3
      //   50: invokestatic 43	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   53: aastore
      //   54: aload 7
      //   56: iconst_4
      //   57: aload_0
      //   58: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   61: getfield 46	co/vine/android/recorder/VineRecorder:mDiscardChanges	Z
      //   64: invokestatic 43	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   67: aastore
      //   68: aload 7
      //   70: iconst_5
      //   71: aload_0
      //   72: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   75: invokestatic 50	co/vine/android/recorder/VineRecorder:access$2900	(Lco/vine/android/recorder/VineRecorder;)Z
      //   78: invokestatic 43	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
      //   81: aastore
      //   82: aload 7
      //   84: bipush 6
      //   86: aload_0
      //   87: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   90: invokestatic 54	co/vine/android/recorder/VineRecorder:access$3000	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
      //   93: aastore
      //   94: ldc 56
      //   96: aload 7
      //   98: invokestatic 62	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   101: iload 6
      //   103: ifeq +51 -> 154
      //   106: aload_0
      //   107: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   110: invokestatic 65	co/vine/android/recorder/VineRecorder:access$2800	(Lco/vine/android/recorder/VineRecorder;)Z
      //   113: pop
      //   114: aload_0
      //   115: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   118: new 67	co/vine/android/recorder/RecordSegment
      //   121: dup
      //   122: aload_0
      //   123: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   126: getfield 71	co/vine/android/recorder/VineRecorder:currentDuration	J
      //   129: invokespecial 74	co/vine/android/recorder/RecordSegment:<init>	(J)V
      //   132: invokestatic 78	co/vine/android/recorder/VineRecorder:access$3102	(Lco/vine/android/recorder/VineRecorder;Lco/vine/android/recorder/RecordSegment;)Lco/vine/android/recorder/RecordSegment;
      //   135: pop
      //   136: aload_0
      //   137: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   140: invokestatic 31	co/vine/android/recorder/VineRecorder:access$100	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;
      //   143: aload_0
      //   144: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   147: getfield 46	co/vine/android/recorder/VineRecorder:mDiscardChanges	Z
      //   150: iload_2
      //   151: invokevirtual 82	co/vine/android/recorder/RecordController:stop	(ZZ)V
      //   154: iload 6
      //   156: ifne +13 -> 169
      //   159: aload_0
      //   160: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   163: invokestatic 85	co/vine/android/recorder/VineRecorder:access$3200	(Lco/vine/android/recorder/VineRecorder;)Z
      //   166: ifeq +435 -> 601
      //   169: aload_0
      //   170: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   173: invokestatic 54	co/vine/android/recorder/VineRecorder:access$3000	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
      //   176: astore 10
      //   178: aload 10
      //   180: ifnonnull +18 -> 198
      //   183: new 87	co/vine/android/VineException
      //   186: dup
      //   187: ldc 89
      //   189: invokespecial 92	co/vine/android/VineException:<init>	(Ljava/lang/String;)V
      //   192: invokestatic 98	com/crashlytics/android/Crashlytics:logException	(Ljava/lang/Throwable;)V
      //   195: aload_0
      //   196: monitorexit
      //   197: return
      //   198: aload 10
      //   200: invokevirtual 104	co/vine/android/recorder/RecordingFile:getSession	()Lco/vine/android/recorder/RecordSession;
      //   203: astore 11
      //   205: aload 11
      //   207: aload 11
      //   209: invokevirtual 110	co/vine/android/recorder/RecordSession:calculateAudioCount	()I
      //   212: invokevirtual 114	co/vine/android/recorder/RecordSession:setAudioDataCount	(I)V
      //   215: aload 11
      //   217: aload 11
      //   219: invokevirtual 117	co/vine/android/recorder/RecordSession:calculateVideoCount	()I
      //   222: invokevirtual 120	co/vine/android/recorder/RecordSession:setVideoDataCount	(I)V
      //   225: iconst_1
      //   226: istore 12
      //   228: aload_0
      //   229: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   232: getfield 46	co/vine/android/recorder/VineRecorder:mDiscardChanges	Z
      //   235: ifne +268 -> 503
      //   238: aload_0
      //   239: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   242: invokestatic 123	co/vine/android/recorder/VineRecorder:access$3300	(Lco/vine/android/recorder/VineRecorder;)Z
      //   245: ifeq +193 -> 438
      //   248: aload 10
      //   250: invokevirtual 126	co/vine/android/recorder/RecordingFile:hasData	()Z
      //   253: ifeq +185 -> 438
      //   256: aload_0
      //   257: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   260: invokevirtual 129	co/vine/android/recorder/VineRecorder:canKeepRecording	()Z
      //   263: ifne +175 -> 438
      //   266: iload 4
      //   268: istore 16
      //   270: aload_0
      //   271: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   274: astore 17
      //   276: iload 16
      //   278: ifne +391 -> 669
      //   281: aload_0
      //   282: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   285: invokestatic 85	co/vine/android/recorder/VineRecorder:access$3200	(Lco/vine/android/recorder/VineRecorder;)Z
      //   288: ifeq +156 -> 444
      //   291: goto +378 -> 669
      //   294: aload 17
      //   296: iload 18
      //   298: invokestatic 133	co/vine/android/recorder/VineRecorder:access$2902	(Lco/vine/android/recorder/VineRecorder;Z)Z
      //   301: pop
      //   302: aload_0
      //   303: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   306: invokestatic 137	co/vine/android/recorder/VineRecorder:access$1900	(Lco/vine/android/recorder/VineRecorder;)Ljava/util/ArrayList;
      //   309: invokevirtual 142	java/util/ArrayList:size	()I
      //   312: ifle +138 -> 450
      //   315: aload 11
      //   317: invokevirtual 145	co/vine/android/recorder/RecordSession:getVideoDataCount	()I
      //   320: ifle +130 -> 450
      //   323: iload 4
      //   325: istore 12
      //   327: aload_0
      //   328: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   331: invokestatic 137	co/vine/android/recorder/VineRecorder:access$1900	(Lco/vine/android/recorder/VineRecorder;)Ljava/util/ArrayList;
      //   334: invokevirtual 142	java/util/ArrayList:size	()I
      //   337: ifle +20 -> 357
      //   340: iload 12
      //   342: ifne +15 -> 357
      //   345: new 87	co/vine/android/VineException
      //   348: dup
      //   349: ldc 147
      //   351: invokespecial 92	co/vine/android/VineException:<init>	(Ljava/lang/String;)V
      //   354: invokestatic 148	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
      //   357: iload 12
      //   359: ifeq +97 -> 456
      //   362: aload 10
      //   364: iload_3
      //   365: invokestatic 154	co/vine/android/recorder/RecordSessionManager:writeRecordingFile	(Lco/vine/android/recorder/RecordingFile;Z)V
      //   368: iload_3
      //   369: ifeq +36 -> 405
      //   372: aload 10
      //   374: getfield 157	co/vine/android/recorder/RecordingFile:isLastSession	Z
      //   377: ifne +15 -> 392
      //   380: aload 10
      //   382: iconst_1
      //   383: putfield 160	co/vine/android/recorder/RecordingFile:isSavedSession	Z
      //   386: aload 10
      //   388: iconst_0
      //   389: putfield 163	co/vine/android/recorder/RecordingFile:isDirty	Z
      //   392: iload 12
      //   394: ifeq +11 -> 405
      //   397: aload_0
      //   398: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   401: iconst_0
      //   402: invokevirtual 167	co/vine/android/recorder/VineRecorder:cleanThumbnails	(Z)V
      //   405: iload 16
      //   407: ifeq -212 -> 195
      //   410: aload_0
      //   411: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   414: astore 21
      //   416: iload 12
      //   418: ifne +258 -> 676
      //   421: aload 21
      //   423: iload 4
      //   425: invokestatic 171	co/vine/android/recorder/VineRecorder:access$3400	(Lco/vine/android/recorder/VineRecorder;Z)V
      //   428: goto -233 -> 195
      //   431: astore 5
      //   433: aload_0
      //   434: monitorexit
      //   435: aload 5
      //   437: athrow
      //   438: iconst_0
      //   439: istore 16
      //   441: goto -171 -> 270
      //   444: iconst_0
      //   445: istore 18
      //   447: goto -153 -> 294
      //   450: iconst_0
      //   451: istore 12
      //   453: goto -126 -> 327
      //   456: aload_0
      //   457: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   460: invokestatic 174	co/vine/android/recorder/VineRecorder:access$300	(Lco/vine/android/recorder/VineRecorder;)Z
      //   463: ifne -95 -> 368
      //   466: aload 10
      //   468: getfield 178	co/vine/android/recorder/RecordingFile:folder	Ljava/io/File;
      //   471: ldc 180
      //   473: invokestatic 184	co/vine/android/recorder/RecordSessionManager:deleteSession	(Ljava/io/File;Ljava/lang/String;)V
      //   476: goto -108 -> 368
      //   479: astore 20
      //   481: iload_3
      //   482: ifeq +13 -> 495
      //   485: new 186	java/lang/RuntimeException
      //   488: dup
      //   489: aload 20
      //   491: invokespecial 188	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
      //   494: athrow
      //   495: aload 20
      //   497: invokestatic 148	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
      //   500: goto -95 -> 405
      //   503: aload_0
      //   504: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   507: invokestatic 50	co/vine/android/recorder/VineRecorder:access$2900	(Lco/vine/android/recorder/VineRecorder;)Z
      //   510: ifne +62 -> 572
      //   513: aload_0
      //   514: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   517: invokestatic 54	co/vine/android/recorder/VineRecorder:access$3000	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
      //   520: getfield 160	co/vine/android/recorder/RecordingFile:isSavedSession	Z
      //   523: istore 13
      //   525: iload 13
      //   527: ifne +45 -> 572
      //   530: iconst_1
      //   531: anewarray 4	java/lang/Object
      //   534: astore 15
      //   536: aload 15
      //   538: iconst_0
      //   539: aload_0
      //   540: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   543: invokestatic 54	co/vine/android/recorder/VineRecorder:access$3000	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
      //   546: getfield 178	co/vine/android/recorder/RecordingFile:folder	Ljava/io/File;
      //   549: aastore
      //   550: ldc 190
      //   552: aload 15
      //   554: invokestatic 62	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   557: aload_0
      //   558: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   561: invokestatic 54	co/vine/android/recorder/VineRecorder:access$3000	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordingFile;
      //   564: getfield 178	co/vine/android/recorder/RecordingFile:folder	Ljava/io/File;
      //   567: ldc 192
      //   569: invokestatic 184	co/vine/android/recorder/RecordSessionManager:deleteSession	(Ljava/io/File;Ljava/lang/String;)V
      //   572: aload_0
      //   573: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   576: invokestatic 196	co/vine/android/recorder/VineRecorder:access$3500	(Lco/vine/android/recorder/VineRecorder;)Ljava/util/HashSet;
      //   579: invokevirtual 201	java/util/HashSet:clear	()V
      //   582: goto -387 -> 195
      //   585: astore 14
      //   587: aload 14
      //   589: ldc 203
      //   591: iconst_0
      //   592: anewarray 4	java/lang/Object
      //   595: invokestatic 206	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
      //   598: goto -26 -> 572
      //   601: aload_0
      //   602: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   605: invokestatic 123	co/vine/android/recorder/VineRecorder:access$3300	(Lco/vine/android/recorder/VineRecorder;)Z
      //   608: ifeq -413 -> 195
      //   611: aload_0
      //   612: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   615: invokevirtual 129	co/vine/android/recorder/VineRecorder:canKeepRecording	()Z
      //   618: ifne -423 -> 195
      //   621: aload_0
      //   622: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   625: invokestatic 210	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   628: ifnull -433 -> 195
      //   631: aload_0
      //   632: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   635: invokestatic 210	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   638: invokevirtual 215	co/vine/android/recorder/ReusableHashAsyncTask:isComplete	()Z
      //   641: ifne -446 -> 195
      //   644: aload_0
      //   645: getfield 21	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:isResumed	Z
      //   648: ifne -453 -> 195
      //   651: aload_0
      //   652: iconst_1
      //   653: putfield 21	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:isResumed	Z
      //   656: aload_0
      //   657: getfield 12	co/vine/android/recorder/VineRecorder$FinishProcessRunnable:this$0	Lco/vine/android/recorder/VineRecorder;
      //   660: invokestatic 210	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   663: invokevirtual 218	co/vine/android/recorder/ReusableHashAsyncTask:resumeAll	()V
      //   666: goto -471 -> 195
      //   669: iload 4
      //   671: istore 18
      //   673: goto -379 -> 294
      //   676: iconst_0
      //   677: istore 4
      //   679: goto -258 -> 421
      //
      // Exception table:
      //   from	to	target	type
      //   5	101	431	finally
      //   106	154	431	finally
      //   159	169	431	finally
      //   169	178	431	finally
      //   183	195	431	finally
      //   198	225	431	finally
      //   228	266	431	finally
      //   270	276	431	finally
      //   281	291	431	finally
      //   294	302	431	finally
      //   302	323	431	finally
      //   327	340	431	finally
      //   345	357	431	finally
      //   362	368	431	finally
      //   372	392	431	finally
      //   397	405	431	finally
      //   410	416	431	finally
      //   421	428	431	finally
      //   456	476	431	finally
      //   485	495	431	finally
      //   495	500	431	finally
      //   503	525	431	finally
      //   530	572	431	finally
      //   572	582	431	finally
      //   587	598	431	finally
      //   601	666	431	finally
      //   302	323	479	java/io/IOException
      //   327	340	479	java/io/IOException
      //   345	357	479	java/io/IOException
      //   362	368	479	java/io/IOException
      //   372	392	479	java/io/IOException
      //   397	405	479	java/io/IOException
      //   456	476	479	java/io/IOException
      //   530	572	585	java/io/IOException
    }
  }

  public class FinishProcessTask extends AsyncTask<Void, Integer, Void>
  {
    private int mCurrentMessage;
    private long mWaitStartTime;
    public final Runnable onComplete;
    public final boolean releasePreview;
    public final boolean saveSession;
    private final String tag;

    public FinishProcessTask(String paramRunnable, Runnable paramBoolean1, boolean paramBoolean2, boolean arg5)
    {
      this.tag = paramRunnable;
      this.onComplete = paramBoolean1;
      this.releasePreview = paramBoolean2;
      boolean bool;
      this.saveSession = bool;
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      VineRecorder.this.mFinishProcessRunnable.run(this.tag, this.releasePreview, this.saveSession);
      return null;
    }

    protected void onPostExecute(Void paramVoid)
    {
      super.onPostExecute(paramVoid);
      ProgressDialog localProgressDialog = VineRecorder.this.mFinishProgressDialog;
      if (localProgressDialog != null)
        localProgressDialog.dismiss();
      SLog.d("Waited for {} ms", Long.valueOf(System.currentTimeMillis() - this.mWaitStartTime));
      if (this.onComplete != null)
        this.onComplete.run();
    }

    protected void onPreExecute()
    {
      this.mCurrentMessage = 1;
      this.mWaitStartTime = System.currentTimeMillis();
    }

    protected void onProgressUpdate(Integer[] paramArrayOfInteger)
    {
      ProgressDialog localProgressDialog = VineRecorder.this.mFinishProgressDialog;
      if (localProgressDialog != null)
      {
        if ((VineRecorder.this.mFinishProgressDialogMessage != null) && (VineRecorder.this.mFinishProgressDialogMessage.length > 2) && (paramArrayOfInteger[0].intValue() >= 100 / (-1 + VineRecorder.this.mFinishProgressDialogMessage.length) * this.mCurrentMessage))
        {
          if (1 + this.mCurrentMessage < VineRecorder.this.mFinishProgressDialogMessage.length)
            localProgressDialog.setMessage(VineRecorder.this.mFinishProgressDialogMessage[(1 + this.mCurrentMessage)]);
          this.mCurrentMessage = (1 + this.mCurrentMessage);
        }
        localProgressDialog.setProgress(paramArrayOfInteger[0].intValue());
      }
    }

    public void publish(int paramInt)
    {
      Integer[] arrayOfInteger = new Integer[1];
      arrayOfInteger[0] = Integer.valueOf(paramInt);
      publishProgress(arrayOfInteger);
    }
  }

  private class OnResumeTask extends AsyncTask<Void, CharSequence, RecordingFile>
  {
    public boolean isRunning;
    private final View mClicker;
    private final String mTag;
    public boolean showDialogDelayed;

    public OnResumeTask(View paramString, String arg3)
    {
      this.mClicker = paramString;
      Object localObject;
      this.mTag = localObject;
    }

    // ERROR //
    protected RecordingFile doInBackground(Void[] paramArrayOfVoid)
    {
      // Byte code:
      //   0: iconst_1
      //   1: anewarray 33	java/lang/Object
      //   4: astore_2
      //   5: aload_2
      //   6: iconst_0
      //   7: aload_0
      //   8: getfield 25	co/vine/android/recorder/VineRecorder$OnResumeTask:mTag	Ljava/lang/String;
      //   11: aastore
      //   12: ldc 35
      //   14: aload_2
      //   15: invokestatic 41	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   18: aload_0
      //   19: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   22: invokestatic 47	co/vine/android/recorder/VineRecorder:access$100	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;
      //   25: astore_3
      //   26: aload_3
      //   27: ifnonnull +5 -> 32
      //   30: aconst_null
      //   31: areturn
      //   32: aload_3
      //   33: invokevirtual 53	co/vine/android/recorder/RecordController:wasEncodingThreadRunning	()Z
      //   36: ifeq +53 -> 89
      //   39: iconst_1
      //   40: anewarray 55	java/lang/CharSequence
      //   43: astore 10
      //   45: aload 10
      //   47: iconst_0
      //   48: aload_0
      //   49: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   52: invokestatic 59	co/vine/android/recorder/VineRecorder:access$7000	(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;
      //   55: aastore
      //   56: aload_0
      //   57: aload 10
      //   59: invokevirtual 63	co/vine/android/recorder/VineRecorder$OnResumeTask:publishProgress	([Ljava/lang/Object;)V
      //   62: aload_3
      //   63: invokevirtual 66	co/vine/android/recorder/RecordController:finishLastIfNeeded	()V
      //   66: iconst_1
      //   67: anewarray 55	java/lang/CharSequence
      //   70: astore 12
      //   72: aload 12
      //   74: iconst_0
      //   75: aload_0
      //   76: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   79: invokestatic 69	co/vine/android/recorder/VineRecorder:access$7100	(Lco/vine/android/recorder/VineRecorder;)Ljava/lang/CharSequence;
      //   82: aastore
      //   83: aload_0
      //   84: aload 12
      //   86: invokevirtual 63	co/vine/android/recorder/VineRecorder$OnResumeTask:publishProgress	([Ljava/lang/Object;)V
      //   89: aload_0
      //   90: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   93: invokestatic 73	co/vine/android/recorder/VineRecorder:access$7200	(Lco/vine/android/recorder/VineRecorder;)V
      //   96: aload_0
      //   97: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   100: invokevirtual 76	co/vine/android/recorder/VineRecorder:canKeepRecording	()Z
      //   103: ifeq +245 -> 348
      //   106: ldc 78
      //   108: invokestatic 81	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
      //   111: aload_3
      //   112: aload_0
      //   113: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   116: invokestatic 85	co/vine/android/recorder/VineRecorder:access$900	(Lco/vine/android/recorder/VineRecorder;)Z
      //   119: iconst_0
      //   120: invokevirtual 89	co/vine/android/recorder/RecordController:openDefaultCamera	(ZZ)Z
      //   123: ifeq +209 -> 332
      //   126: aload_3
      //   127: invokevirtual 93	co/vine/android/recorder/RecordController:getCameraSetting	()Lco/vine/android/recorder/CameraSetting;
      //   130: astore 5
      //   132: aload 5
      //   134: ifnull +16 -> 150
      //   137: aload_0
      //   138: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   141: aload 5
      //   143: getfield 99	co/vine/android/recorder/CameraSetting:frameRate	I
      //   146: invokestatic 103	co/vine/android/recorder/VineRecorder:access$3702	(Lco/vine/android/recorder/VineRecorder;I)I
      //   149: pop
      //   150: aload_0
      //   151: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   154: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   157: ifnull +13 -> 170
      //   160: aload_0
      //   161: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   164: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   167: invokevirtual 112	co/vine/android/recorder/ReusableHashAsyncTask:reset	()V
      //   170: aload_0
      //   171: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   174: invokestatic 115	co/vine/android/recorder/VineRecorder:access$7300	(Lco/vine/android/recorder/VineRecorder;)V
      //   177: iconst_1
      //   178: anewarray 33	java/lang/Object
      //   181: astore 6
      //   183: aload 6
      //   185: iconst_0
      //   186: aload_0
      //   187: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   190: invokestatic 119	co/vine/android/recorder/VineRecorder:access$3700	(Lco/vine/android/recorder/VineRecorder;)I
      //   193: invokestatic 125	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   196: aastore
      //   197: ldc 127
      //   199: aload 6
      //   201: invokestatic 41	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   204: aload_0
      //   205: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   208: invokestatic 131	co/vine/android/recorder/VineRecorder:access$7400	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;
      //   211: ifnull -181 -> 30
      //   214: aload_0
      //   215: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   218: invokestatic 131	co/vine/android/recorder/VineRecorder:access$7400	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;
      //   221: invokevirtual 137	co/vine/android/recorder/RecordSession:getConfig	()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
      //   224: astore 7
      //   226: aload_3
      //   227: ifnull -197 -> 30
      //   230: aload 7
      //   232: ifnull -202 -> 30
      //   235: aload_0
      //   236: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   239: getfield 141	co/vine/android/recorder/VineRecorder:currentDuration	J
      //   242: aload 7
      //   244: getfield 146	co/vine/android/recorder/RecordConfigUtils$RecordConfig:maxDuration	I
      //   247: i2l
      //   248: lcmp
      //   249: ifge -219 -> 30
      //   252: aload_3
      //   253: invokevirtual 149	co/vine/android/recorder/RecordController:isAudioReady	()Z
      //   256: ifne -226 -> 30
      //   259: ldc 151
      //   261: invokestatic 156	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
      //   264: aload_0
      //   265: invokevirtual 159	co/vine/android/recorder/VineRecorder$OnResumeTask:isCancelled	()Z
      //   268: ifne -238 -> 30
      //   271: ldc2_w 160
      //   274: invokestatic 167	java/lang/Thread:sleep	(J)V
      //   277: aload_0
      //   278: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   281: invokestatic 131	co/vine/android/recorder/VineRecorder:access$7400	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;
      //   284: ifnull +42 -> 326
      //   287: aload_0
      //   288: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   291: invokestatic 131	co/vine/android/recorder/VineRecorder:access$7400	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordSession;
      //   294: invokevirtual 137	co/vine/android/recorder/RecordSession:getConfig	()Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;
      //   297: astore 7
      //   299: aload_0
      //   300: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   303: invokestatic 47	co/vine/android/recorder/VineRecorder:access$100	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/RecordController;
      //   306: astore_3
      //   307: goto -81 -> 226
      //   310: astore 11
      //   312: aload 11
      //   314: ldc 169
      //   316: iconst_0
      //   317: anewarray 33	java/lang/Object
      //   320: invokestatic 173	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
      //   323: goto -257 -> 66
      //   326: aconst_null
      //   327: astore 7
      //   329: goto -30 -> 299
      //   332: aload_0
      //   333: invokevirtual 159	co/vine/android/recorder/VineRecorder$OnResumeTask:isCancelled	()Z
      //   336: ifne -306 -> 30
      //   339: aload_0
      //   340: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   343: invokestatic 176	co/vine/android/recorder/VineRecorder:access$3800	(Lco/vine/android/recorder/VineRecorder;)V
      //   346: aconst_null
      //   347: areturn
      //   348: aload_0
      //   349: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   352: invokestatic 180	co/vine/android/recorder/VineRecorder:access$1400	(Lco/vine/android/recorder/VineRecorder;)Landroid/app/Activity;
      //   355: astore 4
      //   357: aload_0
      //   358: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   361: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   364: ifnull +28 -> 392
      //   367: aload_0
      //   368: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   371: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   374: invokevirtual 183	co/vine/android/recorder/ReusableHashAsyncTask:isComplete	()Z
      //   377: ifeq +15 -> 392
      //   380: aload 4
      //   382: ifnull +10 -> 392
      //   385: aload 4
      //   387: invokevirtual 188	android/app/Activity:finish	()V
      //   390: aconst_null
      //   391: areturn
      //   392: aload_0
      //   393: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   396: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   399: ifnull +27 -> 426
      //   402: aload_0
      //   403: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   406: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   409: invokevirtual 192	co/vine/android/recorder/ReusableHashAsyncTask:getComputedFile	()Lco/vine/android/recorder/RecordingFile;
      //   412: ifnull +14 -> 426
      //   415: aload_0
      //   416: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   419: invokestatic 107	co/vine/android/recorder/VineRecorder:access$3600	(Lco/vine/android/recorder/VineRecorder;)Lco/vine/android/recorder/ReusableHashAsyncTask;
      //   422: invokevirtual 192	co/vine/android/recorder/ReusableHashAsyncTask:getComputedFile	()Lco/vine/android/recorder/RecordingFile;
      //   425: areturn
      //   426: aload_0
      //   427: getfield 18	co/vine/android/recorder/VineRecorder$OnResumeTask:this$0	Lco/vine/android/recorder/VineRecorder;
      //   430: iconst_0
      //   431: invokestatic 196	co/vine/android/recorder/VineRecorder:access$3400	(Lco/vine/android/recorder/VineRecorder;Z)V
      //   434: aconst_null
      //   435: areturn
      //   436: astore 8
      //   438: goto -161 -> 277
      //
      // Exception table:
      //   from	to	target	type
      //   62	66	310	java/lang/Exception
      //   271	277	436	java/lang/InterruptedException
    }

    protected void onPostExecute(RecordingFile paramRecordingFile)
    {
      this.isRunning = false;
      if (this.mClicker != null)
        this.mClicker.setEnabled(true);
      if (paramRecordingFile != null)
        VineRecorder.this.mHashTask.resumeAll();
      if (isCancelled());
      while (VineRecorder.this.mStartProgressDialog == null)
        return;
      VineRecorder.this.mStartProgressDialog.dismiss();
    }

    protected void onPreExecute()
    {
      if (this.mClicker != null)
        this.mClicker.setEnabled(false);
      if ((VineRecorder.this.canKeepRecording()) && (!VineRecorder.this.mVideoController.isRecordingStarted()))
      {
        final ProgressDialog localProgressDialog = VineRecorder.this.mStartProgressDialog;
        if (localProgressDialog != null)
        {
          localProgressDialog.setMessage(VineRecorder.this.mStartProgressDialogMessage);
          localProgressDialog.setCanceledOnTouchOutside(false);
          localProgressDialog.setOnCancelListener(new DialogInterface.OnCancelListener()
          {
            public void onCancel(DialogInterface paramAnonymousDialogInterface)
            {
              VineRecorder.OnResumeTask.this.cancel(true);
              if (VineRecorder.this.mActivity != null)
                VineRecorder.this.mActivity.finish();
            }
          });
          if (!isCancelled())
            try
            {
              if (this.showDialogDelayed)
              {
                this.isRunning = true;
                VineRecorder.this.mHandler.postDelayed(new Runnable()
                {
                  public void run()
                  {
                    if (VineRecorder.OnResumeTask.this.isRunning);
                    try
                    {
                      localProgressDialog.show();
                      return;
                    }
                    catch (Exception localException)
                    {
                    }
                  }
                }
                , 1000L);
                return;
              }
              localProgressDialog.show();
              return;
            }
            catch (WindowManager.BadTokenException localBadTokenException)
            {
            }
        }
      }
    }

    protected void onProgressUpdate(CharSequence[] paramArrayOfCharSequence)
    {
      if (VineRecorder.this.mStartProgressDialog != null)
      {
        if ((!this.showDialogDelayed) && (!VineRecorder.this.mStartProgressDialog.isShowing()))
          VineRecorder.this.mStartProgressDialog.show();
        VineRecorder.this.mStartProgressDialog.setMessage(paramArrayOfCharSequence[0]);
      }
    }
  }

  private class PlayButtonOnClickListener
    implements View.OnClickListener
  {
    boolean forceRefresh = false;
    RecordSegment toPlay = null;

    private PlayButtonOnClickListener()
    {
    }

    public void onClick(View paramView)
    {
      if (this.toPlay == null)
      {
        VineRecorder.access$6702(VineRecorder.this, -1);
        if (VineRecorder.this.mDragSortWidget != null)
          VineRecorder.this.mDragSortWidget.setSelection(-1);
        VineRecorder.this.animateTopButtons(2);
      }
      VineRecorder.this.playPreview(this.toPlay, this.forceRefresh);
    }
  }

  private class ReallocCameraBuffersTask extends AsyncTask<Void, Void, Void>
  {
    private ReallocCameraBuffersTask()
    {
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      VineRecorder.this.switchModes();
      return null;
    }

    protected void onPostExecute(Void paramVoid)
    {
      super.onPostExecute(paramVoid);
      if (VineRecorder.this.mStartProgressDialog != null)
        VineRecorder.this.mStartProgressDialog.dismiss();
      VineRecorder.this.setEnabled(true);
    }
  }

  private class RefreshPreviewTask extends AsyncTask<Void, Void, Void>
  {
    private final RecordSegment mSegment;

    public RefreshPreviewTask(RecordSegment arg2)
    {
      Object localObject;
      this.mSegment = localObject;
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      if (!isCancelled())
      {
        if (this.mSegment == VineRecorder.this.mLastPlayingSegment)
          break label55;
        if (this.mSegment != null)
          break label37;
        VineRecorder.this.refreshFullPreview();
      }
      while (true)
      {
        return null;
        label37: VineRecorder.this.mVideoController.makePreview(this.mSegment, false);
        continue;
        label55: if ((this.mSegment == null) && (VineRecorder.this.mEditorAdapter.hasInitialized))
          VineRecorder.this.refreshFullPreview();
      }
    }

    public void onCancelled()
    {
      VineRecorder.this.animatePreviewSpinner(false);
    }

    protected void onPostExecute(Void paramVoid)
    {
      SegmentEditorAdapter localSegmentEditorAdapter = VineRecorder.this.mEditorAdapter;
      if ((localSegmentEditorAdapter != null) && (!isCancelled()) && (localSegmentEditorAdapter.getCount() > 0))
      {
        localViewGroup = (ViewGroup)VineRecorder.this.mVideoPlayer.getParent();
        if (VineRecorder.this.mVideoAttr == null)
          VineRecorder.access$4502(VineRecorder.this, VineRecorder.this.mVideoPlayer.getAttributes());
        if (VineRecorder.this.mVideoPlayer != null)
        {
          VineRecorder.this.mVideoPlayer.setLooping(true);
          VineRecorder.this.mVideoPlayer.setVisibility(0);
        }
        if (localViewGroup != null)
          localViewGroup.setOnClickListener(new VineRecorder.EditModePreviewClickListener(VineRecorder.this, null));
        if (VineRecorder.this.mDragSortWidget != null)
          VineRecorder.this.mDragSortWidget.setContentView(localViewGroup, new Rect(0, VineRecorder.this.mEditorButtonsHeight, VineRecorder.this.mSize.x, VineRecorder.this.mEditorButtonsHeight + VineRecorder.this.mSize.x));
        VineRecorder.this.adjustEditBoundaries();
        VineRecorder.access$3102(VineRecorder.this, this.mSegment);
        if (this.mSegment == null)
        {
          localRecordingFile = VineRecorder.this.mCurrentRecordingFile;
          str = null;
          if (localRecordingFile != null)
            str = VineRecorder.this.mCurrentRecordingFile.getPreviewVideoPath();
          if ((VineRecorder.this.mVideoPlayer != null) && (str != null))
          {
            localSdkVideoView = VineRecorder.this.mVideoPlayer;
            if (VineRecorder.this.mDragSortWidget != null)
            {
              bool2 = VineRecorder.this.mDragSortWidget.hasFloatView();
              bool1 = false;
              if (bool2);
            }
            else
            {
              bool1 = true;
            }
            localSdkVideoView.setAutoPlayOnPrepared(bool1);
            VineRecorder.this.mVideoPlayer.setOnPreparedListener(VineRecorder.this);
            VineRecorder.this.mVideoPlayer.setOnErrorListener(VineRecorder.this);
            VineRecorder.this.mVideoPlayer.setVideoPath(str);
          }
        }
      }
      while (VineRecorder.this.mVideoPlayer == null)
        while (true)
        {
          ViewGroup localViewGroup;
          RecordingFile localRecordingFile;
          SdkVideoView localSdkVideoView;
          boolean bool2;
          boolean bool1;
          return;
          String str = this.mSegment.videoPath;
        }
      VineRecorder.this.mVideoPlayer.setVisibility(8);
    }
  }

  private class ResumeCameraAsyncTask extends AsyncTask<Void, Void, Void>
  {
    private final boolean mSwitchCamera;

    public ResumeCameraAsyncTask(boolean arg2)
    {
      boolean bool;
      this.mSwitchCamera = bool;
    }

    protected Void doInBackground(Void[] paramArrayOfVoid)
    {
      boolean bool = true;
      if ((VineRecorder.this.canSwitchCamera()) || ((!VineRecorder.this.mVideoController.isRecording()) && (!this.mSwitchCamera)));
      while (true)
      {
        try
        {
          System.gc();
          if (this.mSwitchCamera)
          {
            VineRecorder localVineRecorder = VineRecorder.this;
            if (VineRecorder.this.mFrontFacing)
              break label148;
            VineRecorder.access$902(localVineRecorder, bool);
          }
          if (VineRecorder.this.mVideoController.openDefaultCamera(VineRecorder.this.mFrontFacing, true))
          {
            CameraSetting localCameraSetting = VineRecorder.this.mVideoController.getCameraSetting();
            if (localCameraSetting != null)
              VineRecorder.access$3702(VineRecorder.this, localCameraSetting.frameRate);
            VineRecorder.this.start("Switch camera", false);
          }
          else
          {
            VineRecorder.this.showCameraFailedToast();
          }
        }
        catch (Exception localException)
        {
          SLog.e("Error on cancel camera switching.", localException);
        }
        return null;
        label148: bool = false;
      }
    }

    protected void onPostExecute(Void paramVoid)
    {
      super.onPostExecute(paramVoid);
      VineRecorder.access$202(VineRecorder.this, false);
      if (VineRecorder.this.mOpenCameraDialog != null)
        VineRecorder.this.mOpenCameraDialog.dismiss();
      VineRecorder.access$402(VineRecorder.this, null);
    }

    protected void onPreExecute()
    {
      super.onPreExecute();
      VineRecorder.access$202(VineRecorder.this, true);
      if (VineRecorder.this.mOpenCameraDialog != null)
        VineRecorder.this.mOpenCameraDialog.show();
    }
  }

  public class SegmentChangeDetector
    implements Runnable
  {
    private static final int SLEEP_MILLIS = 40;
    public int lastFirstItem = 0;
    public boolean runThread = true;

    public SegmentChangeDetector()
    {
    }

    public void run()
    {
      while (this.runThread)
        try
        {
          int i;
          ArrayList localArrayList;
          int j;
          if ((VineRecorder.this.mLastSelectedPosition == -1) && (VineRecorder.this.mEditorAdapter != null) && (VineRecorder.this.mVideoPlayer.isPlaying()))
          {
            i = 20 + VineRecorder.this.mVideoPlayer.getCurrentPosition();
            if (i > 0)
            {
              localArrayList = VineRecorder.this.mEditorAdapter.getData();
              j = localArrayList.size();
              if (j <= 0);
            }
          }
          for (int k = j - 1; ; k--)
          {
            if (k >= 0)
            {
              if (i < ((RecordSegment)localArrayList.get(k)).startTimestamp)
                continue;
              if (this.lastFirstItem != k)
                break label128;
            }
            while (true)
            {
              Thread.sleep(40L);
              break;
              label128: this.lastFirstItem = k;
              Activity localActivity = VineRecorder.this.mActivity;
              if (localActivity != null)
                localActivity.runOnUiThread(new Runnable()
                {
                  public void run()
                  {
                    if (VineRecorder.this.mLastSelectedPosition == -1)
                    {
                      DragSortWidget localDragSortWidget = VineRecorder.this.mDragSortWidget;
                      if (localDragSortWidget != null)
                        localDragSortWidget.setFocused(VineRecorder.SegmentChangeDetector.this.lastFirstItem);
                    }
                  }
                });
            }
          }
        }
        catch (InterruptedException localInterruptedException)
        {
        }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.VineRecorder
 * JD-Core Version:    0.6.2
 */