package co.vine.android;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Process;
import android.support.v4.app.DraftFragmentStatePagerAdapter;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.DraftViewPager;
import android.support.v4.view.DraftViewPager.OnPageChangeListener;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewPropertyAnimator;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout.LayoutParams;
import co.vine.android.animation.MoveResizeAnimator;
import co.vine.android.animation.SimpleAnimationListener;
import co.vine.android.animation.SimpleAnimatorListener;
import co.vine.android.animation.SmoothAnimator.AnimationListener;
import co.vine.android.client.AppController;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.player.SdkVideoView;
import co.vine.android.recorder.CameraManager;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordConfigUtils.RecordConfig;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.recorder.RecordSessionManager.RecordSessionInfo;
import co.vine.android.recorder.RecordSessionMeta;
import co.vine.android.recorder.RecordingFile;
import co.vine.android.recorder.ViewGoneAnimationListener;
import co.vine.android.recorder.VineRecorder;
import co.vine.android.service.VineUploadService;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FloatingViewUtils;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.UploadManager;
import co.vine.android.util.Util;
import co.vine.android.util.ViewUtil;
import co.vine.android.util.ViewUtil.ResizeAnimationType;
import co.vine.android.widget.DotIndicators;
import co.vine.android.widget.DragUpToDeleteContainer;
import co.vine.android.widget.DragUpToDeleteContainer.DragUpListener;
import co.vine.android.widgets.PromptDialogFragment;
import co.vine.android.widgets.PromptDialogFragment.OnDialogDoneListener;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

@TargetApi(14)
public abstract class AbstractRecordingActivity extends BaseActionBarActivity
  implements PromptDialogFragment.OnDialogDoneListener, DraftViewPager.OnPageChangeListener, SmoothAnimator.AnimationListener, DragUpToDeleteContainer.DragUpListener
{
  private static final int ANIMATION_CAMERA_ICON = 4;
  private static final int ANIMATION_DELETE = 3;
  private static final int ANIMATION_PREVIEW = 1;
  private static final int ANIMATION_PROGRESS = 2;
  private static final int ANIMATION_PROGRESS_TO_DRAFTS = 6;
  private static final int ANIMATION_TO_DRAFTS = 5;
  private static final int ANIMATION_TO_DRAFTS_CAMERA = 7;
  private static final int ANIM_DURATION = 300;
  public static final int DIALOG_DELETE = 1;
  public static final int DIALOG_DIRTY = 2;
  public static final int DIALOG_TOO_MANY_DRAFTS = 3;
  public static final int DIALOG_UNSAVED_CHANGES = 0;
  private static final String EXTRA_TOP_OVERLAY = "arg_top_overlay";
  private static final int PAGE_INVALID = -1;
  private static final int[] SECRETS = { 24, 25, 24, 24 };
  public static final String START_SESSION_ID_CAMERA = "camera_preview";
  private static final String STATE_FIRST_DRAFT_LAUNCH = "first_launch";
  private static final String STATE_FIRST_PAGE_SET = "state_fp";
  private static final int STEP_NONE = -1;
  private static final int STEP_PREVIEW = 1;
  private static final int STEP_RECORD;
  private static final HashSet<WeakReference<AbstractRecordingActivity>> sRunningStances = new HashSet();
  private boolean isSecretModeOn = false;
  private DraftPagerImpl mAdapter;
  private boolean mAnimatingIntoDrafts = false;
  private View mAnimationPreviewOverlay;
  private int mBottomMaskHeight;
  private WeakReference<DraftCameraPreviewFragment> mCameraFragment;
  private Animation mCameraIconFadeIn;
  private View mCameraIconOverlay;
  private View mCameraIconOverlayImage;
  public long mCurrentDuration;
  protected Fragment mCurrentFragment;
  int mCurrentPage;
  private int mCurrentSecret = 0;
  private RecordSessionManager.RecordSessionInfo mCurrentSession;
  private int mCurrentSteadyCount = 0;
  private boolean mDeleteWasDrag = false;
  private DotIndicators mDots;
  private final SparseArray<WeakReference<DraftFragment>> mDraftFragments = new SparseArray();
  private View mDraftFullMask;
  private View mDraftMaskLeft;
  private View mDraftMaskParent;
  private View mDraftMaskRight;
  private View mDraftMaskTop;
  private View mDraftRoot;
  private View mDraftTrashBackground;
  private View mDraftTrashButton;
  private View mDraftTrashContainer;
  private DragUpToDeleteContainer mDragUpToDeleteView;
  private final View.OnClickListener mEmptyClicker = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
    }
  };
  private boolean mFirstDraftLaunch;
  private boolean mFirstPageSet;
  private final Handler mHandler = new Handler();
  private boolean mHasPreviewedAlready;
  private boolean mIsGoingToRecord;
  private ImageView mLargeThumbnailOverlay;
  final View.OnTouchListener mOnMaskTouchListesner = new View.OnTouchListener()
  {
    public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
    {
      return true;
    }
  };
  private SetSelectedRunnable mOnPageIdleRunnable;
  private final Runnable mOnResumeDraftRunnable = new Runnable()
  {
    public void run()
    {
      if ((AbstractRecordingActivity.this.mAdapter.getCount() != 1) && (AbstractRecordingActivity.this.mCurrentPage != -1 + AbstractRecordingActivity.this.mAdapter.getCount()))
      {
        AbstractRecordingActivity.access$2702(AbstractRecordingActivity.this, (RecordSessionManager.RecordSessionInfo)AbstractRecordingActivity.this.mSessions.get(AbstractRecordingActivity.this.mCurrentPage));
        WeakReference localWeakReference = (WeakReference)AbstractRecordingActivity.this.mDraftFragments.get(AbstractRecordingActivity.this.mCurrentPage);
        if (localWeakReference != null)
        {
          DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
          if (localDraftFragment != null)
            localDraftFragment.setSelected(true);
        }
      }
    }
  };
  private int mPageScrollState;
  int mPreviewDimen;
  private View mPreviewOverlay;
  float mPreviewRatio;
  public int mProgressContainerWidth;
  private View mProgressOverlay;
  private PromptDialogFragment mPromptDialog;
  private int mRegularUiMode;
  private Point mScreenSize;
  private ArrayList<RecordSessionManager.RecordSessionInfo> mSessions;
  private int mSideMaskWidth;
  private Animation mSlowFadeIn;
  private String mStartSessionId;
  private int mStep = -1;
  private int mTopMaskHeight;
  private Bitmap mTopOverlay;
  protected String mUploadFile;
  private ArrayList<SdkVideoView> mVideoViews = new ArrayList();
  private DraftViewPager mViewPager;
  private boolean mWaitingForLogin;
  private final WeakReference<AbstractRecordingActivity> mWeakSelf = new WeakReference(this);
  private boolean mZoomEnabled;

  private void buildAndShowFloatingView(DraftFragment paramDraftFragment)
  {
    releasePlayers();
    paramDraftFragment.showImage();
    int[] arrayOfInt1 = new int[2];
    View localView1 = paramDraftFragment.getThumbnailView();
    localView1.getLocationOnScreen(arrayOfInt1);
    int i = getResources().getDimensionPixelOffset(2131427356);
    FloatingViewUtils.buildFloatingViewFor(this, localView1, this.mPreviewOverlay, localView1.getWidth(), arrayOfInt1[0], arrayOfInt1[1] - i);
    int[] arrayOfInt2 = new int[2];
    View localView2 = paramDraftFragment.getProgressView();
    localView2.getLocationOnScreen(arrayOfInt2);
    FloatingViewUtils.buildFloatingViewFor(this, localView2, this.mProgressOverlay, localView2.getWidth(), arrayOfInt2[0], arrayOfInt2[1] - i);
    this.mPreviewOverlay.setVisibility(0);
    this.mProgressOverlay.setVisibility(0);
    this.mDraftTrashContainer.setVisibility(8);
    this.mViewPager.setVisibility(8);
  }

  private void doStopMotion()
  {
    if (this.mCurrentSteadyCount < 40)
      this.mHandler.postDelayed(new Runnable()
      {
        public void run()
        {
          if ((AbstractRecordingActivity.this.mCurrentFragment instanceof RecordingFragment))
          {
            ((RecordingFragment)AbstractRecordingActivity.this.mCurrentFragment).doOneFrame();
            AbstractRecordingActivity.access$2408(AbstractRecordingActivity.this);
            AbstractRecordingActivity.this.doStopMotion();
          }
        }
      }
      , 50L);
  }

  public static Intent getIntent(Context paramContext, int paramInt, String paramString)
  {
    Intent localIntent = new Intent(paramContext, RecordingActivity.class);
    localIntent.setAction(paramString);
    if (paramInt > 0)
      localIntent.setFlags(paramInt);
    return localIntent;
  }

  private void handleDelete()
  {
    int i = 0;
    WeakReference localWeakReference1 = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
    DraftFragment localDraftFragment1;
    Animation localAnimation;
    final int j;
    final int k;
    SimpleAnimationListener local12;
    View localView6;
    if (localWeakReference1 != null)
    {
      localDraftFragment1 = (DraftFragment)localWeakReference1.get();
      localAnimation = AnimationUtils.loadAnimation(this, 2130968593);
      j = getResources().getDimensionPixelOffset(2131427356);
      k = getResources().getDimensionPixelOffset(2131427361);
      if (this.mCurrentPage > 0)
      {
        final DraftFragment localDraftFragment3 = (DraftFragment)((WeakReference)this.mDraftFragments.get(-1 + this.mCurrentPage)).get();
        if ((localDraftFragment3 != null) && (localDraftFragment1 != null))
        {
          final View localView4 = localDraftFragment3.getThumbnailView();
          final int[] arrayOfInt2 = new int[2];
          localView4.getLocationOnScreen(arrayOfInt2);
          local12 = new SimpleAnimationListener()
          {
            public void onAnimationEnd(Animation paramAnonymousAnimation)
            {
              FloatingViewUtils.buildFloatingViewFor(AbstractRecordingActivity.this, localView4, AbstractRecordingActivity.this.mPreviewOverlay, localView4.getWidth(), arrayOfInt2[0], arrayOfInt2[1] - j);
              AbstractRecordingActivity.this.mPreviewOverlay.setVisibility(0);
              new MoveResizeAnimator(3, AbstractRecordingActivity.this.mPreviewOverlay, AbstractRecordingActivity.this.mPreviewOverlay, (int)(AbstractRecordingActivity.this.mScreenSize.x * (1.0F - AbstractRecordingActivity.this.mPreviewRatio)) - 5 * k, arrayOfInt2[1] - j, 1.0D, 1.0D, 300, AbstractRecordingActivity.this, localDraftFragment3.getView()).start();
            }
          };
          localAnimation.setAnimationListener(local12);
          View localView5 = localDraftFragment3.getView();
          if (localView5 != null)
            localView5.setVisibility(4);
          localView6 = localDraftFragment1.getView();
          if ((localView6 != null) && (!this.mDeleteWasDrag))
            localView6.startAnimation(localAnimation);
        }
      }
    }
    while (true)
    {
      if (i != 0)
        deleteCurrentDraft();
      return;
      i = 0;
      if (localView6 != null)
      {
        local12.onAnimationEnd(localAnimation);
        i = 0;
        continue;
        i = 1;
        continue;
        int m = this.mCurrentPage;
        i = 0;
        if (m == 0)
          if (this.mSessions.size() == 1)
          {
            deleteCurrentDraft();
            hideDrafts(true);
            swapFolder("Delete", null);
            i = 0;
          }
          else
          {
            WeakReference localWeakReference2 = (WeakReference)this.mDraftFragments.get(1 + this.mCurrentPage);
            if (localWeakReference2 != null)
            {
              DraftFragment localDraftFragment2 = (DraftFragment)localWeakReference2.get();
              if ((localDraftFragment2 != null) && (localDraftFragment1 != null))
              {
                View localView1 = localDraftFragment2.getThumbnailView();
                int[] arrayOfInt1 = new int[2];
                localView1.getLocationOnScreen(arrayOfInt1);
                try
                {
                  FloatingViewUtils.buildFloatingViewFor(this, localView1, this.mPreviewOverlay, localView1.getWidth(), arrayOfInt1[0], arrayOfInt1[1] - j);
                  this.mPreviewOverlay.setVisibility(0);
                  localMoveResizeAnimator = new MoveResizeAnimator(3, this.mPreviewOverlay, this.mPreviewOverlay, (int)(this.mScreenSize.x * (1.0F - this.mPreviewRatio)) - k * 4, arrayOfInt1[1] - j, 1.0D, 1.0D, 300, this, localDraftFragment2.getView());
                  localAnimation.setAnimationListener(new SimpleAnimationListener()
                  {
                    public void onAnimationEnd(Animation paramAnonymousAnimation)
                    {
                      localMoveResizeAnimator.start();
                    }
                  });
                  View localView2 = localDraftFragment2.getView();
                  if (localView2 != null)
                    localView2.setVisibility(4);
                  View localView3 = localDraftFragment1.getView();
                  if ((localView3 != null) && (!this.mDeleteWasDrag))
                  {
                    localView3.startAnimation(localAnimation);
                    i = 0;
                  }
                }
                catch (Exception localException)
                {
                  final MoveResizeAnimator localMoveResizeAnimator;
                  while (true)
                    CrashUtil.logException(localException);
                  localMoveResizeAnimator.start();
                  i = 0;
                }
              }
              else
              {
                i = 1;
              }
            }
            else
            {
              i = 1;
              continue;
              i = 1;
            }
          }
      }
    }
  }

  private void hideCurrentFragment()
  {
    WeakReference localWeakReference = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
    if (localWeakReference != null)
    {
      DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
      if (localDraftFragment != null)
      {
        localDraftFragment.pausePlayer();
        View localView = localDraftFragment.getView();
        if (localView != null)
          localView.setVisibility(8);
      }
    }
  }

  private void hideDraftsInternal()
  {
    this.mDraftRoot.setVisibility(8);
    this.mProgressOverlay.setVisibility(8);
    this.mPreviewOverlay.setVisibility(8);
    this.mProgressOverlay.setVisibility(8);
    this.mDragUpToDeleteView.setVisibility(8);
    if ((this.mCurrentFragment instanceof RecordingFragment))
      ((RecordingFragment)this.mCurrentFragment).onHideDrafts();
  }

  private boolean isResuming()
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
      return (this.mIsGoingToRecord) || (((RecordingFragment)this.mCurrentFragment).isResuming());
    return this.mIsGoingToRecord;
  }

  private void releasePlayers()
  {
    for (int i = 0; i < this.mDraftFragments.size(); i++)
    {
      DraftFragment localDraftFragment = (DraftFragment)((WeakReference)this.mDraftFragments.get(this.mDraftFragments.keyAt(i))).get();
      if (localDraftFragment != null)
      {
        localDraftFragment.setSelected(false);
        localDraftFragment.release();
      }
    }
  }

  private void reload(ArrayList<RecordSessionManager.RecordSessionInfo> paramArrayList)
  {
    int i = paramArrayList.size();
    if (i > 9)
    {
      this.mPromptDialog = PromptDialogFragment.newInstance(3);
      this.mPromptDialog.setMessage(2131624387);
      this.mPromptDialog.setPositiveButton(2131624205);
      this.mPromptDialog.show(getFragmentManager());
      paramArrayList.remove(i - 1);
    }
    this.mSessions = paramArrayList;
    this.mAdapter = new DraftPagerImpl(getSupportFragmentManager());
    this.mViewPager.setAdapter(this.mAdapter);
    this.mViewPager.setOnPageChangeListener(this);
    this.mViewPager.setOffscreenPageLimit(1 + this.mAdapter.getCount());
    this.mDots.setNumberOfDots(paramArrayList.size());
    this.mDots.invalidate();
  }

  private boolean setCurrentSession()
  {
    int i = 0;
    if ((this.mViewPager.isDrawn()) && (!this.mFirstPageSet))
    {
      if ((TextUtils.isEmpty(this.mStartSessionId)) || ("camera_preview".equals(this.mStartSessionId)))
      {
        this.mViewPager.setCurrentItem(-1 + this.mAdapter.getCount(), false);
        this.mFirstPageSet = true;
        return true;
      }
      Iterator localIterator = this.mSessions.iterator();
      while (localIterator.hasNext())
      {
        RecordSessionManager.RecordSessionInfo localRecordSessionInfo = (RecordSessionManager.RecordSessionInfo)localIterator.next();
        if (this.mStartSessionId.equals(localRecordSessionInfo.folder.getName()))
        {
          this.mViewPager.setCurrentItem(i, false);
          this.mCurrentPage = i;
          this.mFirstPageSet = true;
          WeakReference localWeakReference = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
          View localView = null;
          if (localWeakReference != null)
          {
            DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
            localView = null;
            if (localDraftFragment != null)
              localView = localDraftFragment.getView().findViewById(2131361920);
          }
          this.mDragUpToDeleteView.setView(localView, this.mViewPager.getLeftOfSelectedFragment());
          return true;
        }
        i++;
      }
    }
    return false;
  }

  private void showCurrentFragment()
  {
    WeakReference localWeakReference = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
    if (localWeakReference != null)
    {
      DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
      if (localDraftFragment != null)
      {
        localDraftFragment.mCanUnhide = true;
        localDraftFragment.resumePlayer();
        View localView = localDraftFragment.getView();
        if (localView != null)
          localView.setVisibility(0);
      }
    }
  }

  public void addPlayerToPool(SdkVideoView paramSdkVideoView)
  {
    try
    {
      this.mVideoViews.add(paramSdkVideoView);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void cameraPreviewToRecorder(View paramView1, View paramView2)
  {
    if (isResuming())
      return;
    this.mIsGoingToRecord = true;
    float f = this.mScreenSize.x / paramView1.getLayoutParams().width;
    int i = getResources().getDimensionPixelOffset(2131427394);
    int j = getResources().getDimensionPixelOffset(2131427356);
    int[] arrayOfInt = new int[2];
    paramView1.getLocationInWindow(arrayOfInt);
    paramView2.setVisibility(8);
    FloatingViewUtils.buildFloatingViewFor(this, paramView1, this.mPreviewOverlay, paramView1.getWidth(), arrayOfInt[0], arrayOfInt[1] - j);
    this.mPreviewOverlay.setVisibility(0);
    new MoveResizeAnimator(4, this.mPreviewOverlay, this.mPreviewOverlay, 0, i, f, f, 300, this, paramView1).start();
  }

  protected RecordingFragment createRecordingFragment()
  {
    return new RecordingFragment();
  }

  protected RecordingPreviewFragment createRecordingPreviewFragment(RecordingFile paramRecordingFile, String paramString)
  {
    return RecordingPreviewFragment.newInstance(paramRecordingFile.getVideoPath(), this.mUploadFile, paramString, false);
  }

  protected boolean currentlyHoldsRecordingFragment()
  {
    return (this.mCurrentFragment != null) && ((this.mCurrentFragment instanceof RecordingFragment));
  }

  public void deleteCurrentDraft()
  {
    try
    {
      if (this.mCurrentPage == 0);
      int k;
      for (int i = 0; ; i = k - 1)
      {
        this.mCurrentPage = -1;
        int j = this.mViewPager.getCurrentItem();
        WeakReference localWeakReference = (WeakReference)this.mDraftFragments.get(j);
        if (localWeakReference != null)
        {
          DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
          if (localDraftFragment != null)
            localDraftFragment.setExpired(true);
        }
        if (this.mCurrentSession != null)
          RecordSessionManager.deleteSession(this.mCurrentSession.folder, "deleteCurrentDraft");
        FlurryUtils.trackAbandonedStage("draft");
        this.mStartSessionId = null;
        ArrayList localArrayList = RecordSessionManager.getValidSessions(this);
        reload(localArrayList);
        this.mSessions = localArrayList;
        this.mViewPager.requestLayout();
        this.mViewPager.invalidate();
        this.mAdapter.notifyDataSetChanged();
        this.mViewPager.setCurrentItem(i, false);
        onPageSelected(i);
        return;
        k = this.mCurrentPage;
      }
    }
    catch (IOException localIOException)
    {
      SLog.e("Failed to delete current draft.", localIOException);
    }
  }

  protected void discardUpload()
  {
    if (this.mUploadFile != null)
    {
      SLog.d("Upload discarded.");
      UploadManager.removeFromUploadQueue(this, this.mUploadFile);
    }
  }

  public Point getScreenSize()
  {
    return this.mScreenSize;
  }

  public boolean hasPreviewedAlready()
  {
    return this.mHasPreviewedAlready;
  }

  public void hideDrafts(final boolean paramBoolean)
  {
    Crashlytics.log("Fading away drafts.");
    AnimationSet localAnimationSet = new AnimationSet(true);
    if (paramBoolean)
    {
      localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.COLLAPSE_HEIGHT, this.mDraftMaskTop, 0));
      localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.COLLAPSE_WIDTH, this.mDraftMaskLeft, 0));
      localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.COLLAPSE_WIDTH, this.mDraftMaskRight, 0));
    }
    localAnimationSet.addAnimation(AnimationUtils.loadAnimation(this, 2130968590));
    localAnimationSet.setAnimationListener(new SimpleAnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation)
      {
        AbstractRecordingActivity.this.hideDraftsInternal();
      }

      public void onAnimationStart(Animation paramAnonymousAnimation)
      {
        if (paramBoolean)
        {
          AbstractRecordingActivity.this.mDraftMaskParent.setVisibility(0);
          return;
        }
        AbstractRecordingActivity.this.mDraftMaskParent.setVisibility(8);
        AbstractRecordingActivity.this.mDraftRoot.setVisibility(8);
      }
    });
    localAnimationSet.setDuration(300L);
    this.mDragUpToDeleteView.setView(null, this.mViewPager.getLeftOfSelectedFragment());
    this.mDraftRoot.startAnimation(localAnimationSet);
    this.mDraftTrashContainer.animate().cancel();
    this.mDraftTrashContainer.setVisibility(8);
  }

  public void initMasks(View paramView1, final View paramView2)
  {
    paramView1.setOnTouchListener(this.mOnMaskTouchListesner);
    paramView2.setOnTouchListener(this.mOnMaskTouchListesner);
    int i = getSharedPreferences("capture", 0).getInt(VineRecorder.getBottomMaskHeightPref(RecordConfigUtils.isDefaultFrontFacing()), 0);
    if (i > 0)
    {
      final RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)paramView2.getLayoutParams();
      localLayoutParams.height = i;
      runOnUiThread(new Runnable()
      {
        public void run()
        {
          paramView2.setLayoutParams(localLayoutParams);
        }
      });
    }
  }

  public boolean isDraftsShowing()
  {
    return this.mDraftRoot.getVisibility() != 8;
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((this.mCurrentFragment instanceof RecordingPreviewFragment))
    {
      this.mCurrentFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    if ((paramInt2 == 31) || (paramInt2 == 32))
    {
      finish();
      return;
    }
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onAnimationFinish(int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    case 2:
    default:
      return;
    case 1:
      Animation localAnimation = AnimationUtils.loadAnimation(this, 2130968590);
      this.mDraftRoot.startAnimation(localAnimation);
      hideDrafts(false);
      swapFolder("PreviewAnimationFinish", (File)paramObject);
      this.mIsGoingToRecord = false;
      return;
    case 3:
      deleteCurrentDraft();
      this.mPreviewOverlay.setVisibility(8);
      return;
    case 4:
    }
    hideDrafts(false);
    swapFolder("CameraAnimationFinish", null);
    this.mIsGoingToRecord = false;
  }

  public void onBackPressed()
  {
    try
    {
      if (this.mStep == -1)
      {
        super.onBackPressed();
        return;
      }
      if (isDraftsShowing())
      {
        hideDrafts(true);
        releasePlayers();
        ((RecordingFragment)this.mCurrentFragment).resumeFromDraft();
        return;
      }
      if (currentlyHoldsRecordingFragment())
      {
        RecordingFragment localRecordingFragment = (RecordingFragment)this.mCurrentFragment;
        boolean bool = localRecordingFragment.isEditing();
        if ((!bool) && (!localRecordingFragment.isSessionModified()))
        {
          localRecordingFragment.setDiscardChangesOnStop();
          super.onBackPressed();
          return;
        }
        if ((bool) && (!localRecordingFragment.isEditingDirty()))
        {
          localRecordingFragment.discardEditing();
          return;
        }
        showUnSavedChangesDialog(0, localRecordingFragment);
        return;
      }
      if ((this.mCurrentFragment instanceof RecordingPreviewFragment))
        ((RecordingPreviewFragment)this.mCurrentFragment).previewToRecord(this, false);
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
    }
  }

  public void onCameraSwitchPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      FlurryUtils.trackCameraSwitchPressed(paramView);
      ((RecordingFragment)this.mCurrentFragment).onCameraSwitchPressed(paramView);
    }
  }

  public void onCreate(Bundle paramBundle)
  {
    Intent localIntent = getIntent();
    String str = null;
    if (localIntent != null)
      str = localIntent.getAction();
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this;
    arrayOfObject[1] = Integer.valueOf(Process.myPid());
    arrayOfObject[2] = str;
    CrashUtil.log("AbstractRecordingActivity {} pid: {}, action tag {}.", arrayOfObject);
    sRunningStances.add(this.mWeakSelf);
    FlurryUtils.trackRecordingStart();
    super.onCreate(paramBundle, 2130903126, false, true);
    this.mScreenSize = Util.getDisplaySize(getWindowManager().getDefaultDisplay());
    this.mZoomEnabled = RecordConfigUtils.getGenericConfig(this).zoomEnabled;
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("co.vine.android.session.logout");
    localIntentFilter.addAction("co.vine.android.session.login");
    Resources localResources = getResources();
    if (paramBundle == null)
    {
      if (localIntent != null)
      {
        Bundle localBundle = localIntent.getExtras();
        if (localBundle != null)
          this.mTopOverlay = ((Bitmap)localBundle.getParcelable("arg_top_overlay"));
      }
      toRecord(true, false, null);
    }
    VineAccountHelper.resetActiveSession();
    startService(VineUploadService.getClearNotificationsIntent(this));
    this.mPreviewRatio = (localResources.getInteger(2131492867) / 100.0F);
    this.mDraftRoot = findViewById(2131362095);
    this.mDraftRoot.setVisibility(8);
    this.mViewPager = ((DraftViewPager)findViewById(2131361926));
    this.mDots = ((DotIndicators)findViewById(2131361927));
    this.mPreviewDimen = ((int)(this.mScreenSize.x * this.mPreviewRatio));
    this.mPreviewOverlay = findViewById(2131361929);
    this.mProgressOverlay = findViewById(2131361928);
    this.mDraftMaskTop = findViewById(2131362101);
    this.mDraftMaskTop.setOnClickListener(this.mEmptyClicker);
    this.mDraftMaskLeft = findViewById(2131362102);
    this.mDraftMaskLeft.setOnClickListener(this.mEmptyClicker);
    this.mDraftMaskRight = findViewById(2131362103);
    this.mDraftMaskRight.setOnClickListener(this.mEmptyClicker);
    this.mDraftMaskParent = findViewById(2131362100);
    this.mDraftTrashContainer = findViewById(2131362104);
    this.mDraftTrashBackground = findViewById(2131362105);
    this.mDraftTrashButton = findViewById(2131362106);
    View localView1 = this.mDraftTrashButton;
    View.OnClickListener local3 = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (AbstractRecordingActivity.this.mCurrentPage != AbstractRecordingActivity.this.mDraftFragments.size())
        {
          AbstractRecordingActivity.access$102(AbstractRecordingActivity.this, false);
          AbstractRecordingActivity.this.showDeleteDialog();
        }
      }
    };
    localView1.setOnClickListener(local3);
    View localView2 = this.mDraftTrashButton;
    View.OnTouchListener local4 = new View.OnTouchListener()
    {
      boolean hasMovedOut = false;

      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        boolean bool1 = true;
        switch (paramAnonymousMotionEvent.getAction())
        {
        default:
        case 0:
          do
            return false;
          while (AbstractRecordingActivity.this.mCurrentPage == AbstractRecordingActivity.this.mDraftFragments.size());
          AbstractRecordingActivity.this.mDraftTrashBackground.setActivated(bool1);
          this.hasMovedOut = false;
          return false;
        case 1:
          AbstractRecordingActivity.this.mDraftTrashBackground.setActivated(false);
          return false;
        case 2:
        }
        float f1 = paramAnonymousMotionEvent.getX();
        float f2 = paramAnonymousMotionEvent.getY();
        boolean bool2;
        boolean bool3;
        label182: View localView2;
        if ((f1 >= 0.0F) && (f1 <= AbstractRecordingActivity.this.mDraftTrashButton.getWidth()) && (f2 >= 0.0F) && (f2 <= AbstractRecordingActivity.this.mDraftTrashButton.getHeight()))
        {
          bool2 = bool1;
          if (!bool2)
            this.hasMovedOut = bool1;
          View localView1 = AbstractRecordingActivity.this.mDraftTrashBackground;
          if ((!bool2) || (this.hasMovedOut))
            break label224;
          bool3 = bool1;
          localView1.setActivated(bool3);
          localView2 = AbstractRecordingActivity.this.mDraftTrashButton;
          if ((!bool2) || (this.hasMovedOut))
            break label230;
        }
        while (true)
        {
          localView2.setActivated(bool1);
          return false;
          bool2 = false;
          break;
          label224: bool3 = false;
          break label182;
          label230: bool1 = false;
        }
      }
    };
    localView2.setOnTouchListener(local4);
    this.mDragUpToDeleteView = ((DragUpToDeleteContainer)findViewById(2131362094));
    this.mDragUpToDeleteView.setVisibility(8);
    this.mDragUpToDeleteView.setInteractionListner(this);
    this.mDraftTrashContainer.setVisibility(8);
    int i = localResources.getDimensionPixelOffset(2131427358);
    int j = localResources.getDimensionPixelOffset(2131427394);
    this.mTopMaskHeight = (j + i);
    this.mBottomMaskHeight = (this.mScreenSize.y - (this.mTopMaskHeight + (i + this.mPreviewDimen)));
    this.mSideMaskWidth = (this.mScreenSize.x / 2 - this.mPreviewDimen / 2);
    View localView3 = findViewById(2131361925);
    ViewGroup.LayoutParams localLayoutParams1 = localView3.getLayoutParams();
    localLayoutParams1.width = ((int)(this.mPreviewRatio + this.mScreenSize.x * ((1.0F - this.mPreviewRatio) / 2.0F)));
    localView3.setLayoutParams(localLayoutParams1);
    if (paramBundle != null)
    {
      if (paramBundle.containsKey("state_fp"))
        this.mFirstPageSet = paramBundle.getBoolean("state_fp");
      if (paramBundle.containsKey("first_launch"))
        this.mFirstDraftLaunch = paramBundle.getBoolean("first_launch");
    }
    while (true)
    {
      int k = localResources.getDimensionPixelOffset(2131427355);
      ViewGroup.LayoutParams localLayoutParams2 = this.mViewPager.getLayoutParams();
      localLayoutParams2.height = (k + (j + this.mScreenSize.x));
      this.mViewPager.setLayoutParams(localLayoutParams2);
      int m = localResources.getDimensionPixelOffset(2131427355);
      this.mDots.setY(j + this.mScreenSize.x + m / 4);
      this.mLargeThumbnailOverlay = ((ImageView)findViewById(2131362097));
      this.mAnimationPreviewOverlay = findViewById(2131362098);
      this.mCameraIconOverlay = findViewById(2131362099);
      this.mCameraIconOverlay.setVisibility(8);
      this.mCameraIconOverlayImage = findViewById(2131361918);
      this.mDraftFullMask = findViewById(2131362096);
      this.mSlowFadeIn = AnimationUtils.loadAnimation(this, 2130968597);
      this.mCameraIconFadeIn = AnimationUtils.loadAnimation(this, 2130968597);
      return;
      this.mFirstDraftLaunch = true;
      continue;
      this.mFirstDraftLaunch = true;
    }
  }

  protected void onDestroy()
  {
    super.onDestroy();
    try
    {
      sRunningStances.remove(this.mWeakSelf);
      if (sRunningStances.size() == 0)
      {
        CrashUtil.log("Clean up folders because we are the last one.");
        RecordSessionManager.getInstance(this).cleanUnusedFolders();
      }
      while (true)
      {
        this.mCurrentFragment = null;
        CrashUtil.log("AbstractRecordingActivity {} Destroyed.", new Object[] { this });
        FlurryUtils.trackRecordingDestroy();
        return;
        CrashUtil.logException(new VineException("Double instance violation, but it's ok."));
      }
    }
    catch (IOException localIOException)
    {
      while (true)
        CrashUtil.logException(localIOException);
    }
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    case 3:
    default:
    case 1:
    case 2:
    case 0:
    }
    do
    {
      do
      {
        do
        {
          return;
          switch (paramInt2)
          {
          default:
            return;
          case -2:
            showCurrentFragment();
            this.mDraftTrashButton.setActivated(false);
            this.mDraftTrashBackground.setActivated(false);
            return;
          case -1:
          }
          handleDelete();
          this.mDraftTrashButton.setActivated(false);
          this.mDraftTrashBackground.setActivated(false);
          return;
          switch (paramInt2)
          {
          default:
            return;
          case -2:
          case -1:
          }
        }
        while (!(this.mCurrentFragment instanceof RecordingFragment));
        ((RecordingFragment)this.mCurrentFragment).startDrafts(false);
        return;
      }
      while (!(this.mCurrentFragment instanceof RecordingFragment));
      ((RecordingFragment)this.mCurrentFragment).startDrafts(true);
      return;
      switch (paramInt2)
      {
      default:
        return;
      case -2:
        if (currentlyHoldsRecordingFragment())
          ((RecordingFragment)this.mCurrentFragment).setDiscardChangesOnStop();
        discardUpload();
        finish();
        return;
      case -1:
      }
    }
    while (!currentlyHoldsRecordingFragment());
    ((RecordingFragment)this.mCurrentFragment).saveSessionAndQuit();
  }

  public void onFinishPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
      ((RecordingFragment)this.mCurrentFragment).onFinishPressed(paramView);
  }

  public void onFocusSwitchPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      FlurryUtils.trackFocusSwitchPressed(paramView);
      ((RecordingFragment)this.mCurrentFragment).onFocusSwitchPressed(paramView);
    }
  }

  public void onGhostSwitchPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      FlurryUtils.trackGhostSwitchPressed(paramView);
      ((RecordingFragment)this.mCurrentFragment).onGhostSwitchPressed(paramView);
    }
  }

  public void onGridSwitchPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      FlurryUtils.trackGridSwitchPressed(paramView);
      ((RecordingFragment)this.mCurrentFragment).onGridSwitchPressed();
    }
  }

  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (!this.isSecretModeOn)
    {
      if (paramInt == SECRETS[this.mCurrentSecret])
      {
        this.mCurrentSecret = (1 + this.mCurrentSecret);
        if (this.mCurrentSecret == SECRETS.length)
        {
          this.isSecretModeOn = true;
          this.mCurrentSecret = 0;
          Util.showCenteredToast(this, "Secret mode enabled.");
        }
      }
      while ((!isDraftsShowing()) && (this.mZoomEnabled) && (this.mStep == 0) && ((paramInt == 25) || (paramInt == 24) || (paramInt == 168) || (paramInt == 169)) && ((this.mCurrentFragment instanceof RecordingFragment)))
        if (!((RecordingFragment)this.mCurrentFragment).isEditing())
        {
          RecordingFragment localRecordingFragment = (RecordingFragment)this.mCurrentFragment;
          boolean bool = false;
          if (paramInt == 24)
            bool = true;
          localRecordingFragment.modifyZoom(bool);
          return true;
          this.mCurrentSecret = 0;
        }
        else
        {
          return super.onKeyDown(paramInt, paramKeyEvent);
        }
      return super.onKeyDown(paramInt, paramKeyEvent);
    }
    if ((!isDraftsShowing()) && (this.mStep == 0) && ((paramInt == 25) || (paramInt == 24) || (paramInt == 168) || (paramInt == 169)) && ((this.mCurrentFragment instanceof RecordingFragment)))
    {
      if (!((RecordingFragment)this.mCurrentFragment).isEditing())
      {
        if (paramInt == 25)
        {
          ((RecordingFragment)this.mCurrentFragment).doOneFrame();
          return true;
        }
        this.mCurrentSteadyCount = 0;
        doStopMotion();
        return true;
      }
      Util.showCenteredToast(getApplicationContext(), "Reversed.");
      ((RecordingFragment)this.mCurrentFragment).reverseFrames();
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }

  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((!this.isSecretModeOn) && (!isDraftsShowing()) && (this.mZoomEnabled) && (this.mStep == 0) && ((paramInt == 25) || (paramInt == 24) || (paramInt == 168) || (paramInt == 169)) && ((this.mCurrentFragment instanceof RecordingFragment)) && (!((RecordingFragment)this.mCurrentFragment).isEditing()))
      return true;
    return super.onKeyUp(paramInt, paramKeyEvent);
  }

  public void onPageScrollStateChanged(int paramInt)
  {
    this.mPageScrollState = paramInt;
    if ((paramInt == 0) && (this.mOnPageIdleRunnable != null))
    {
      this.mOnPageIdleRunnable.run();
      this.mOnPageIdleRunnable = null;
    }
  }

  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
  }

  public void onPageSelected(int paramInt)
  {
    int i;
    int j;
    Object localObject2;
    DraftFragment localDraftFragment4;
    if (this.mSessions != null)
    {
      if (this.mPageScrollState != 0)
        break label132;
      i = 1;
      j = this.mSessions.size();
      if (paramInt != -1)
        break label147;
      int i1 = this.mCurrentPage;
      localObject1 = null;
      localObject2 = null;
      if (i1 <= j)
      {
        WeakReference localWeakReference4 = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
        localObject1 = null;
        localObject2 = null;
        if (localWeakReference4 != null)
        {
          localDraftFragment4 = (DraftFragment)localWeakReference4.get();
          localObject1 = null;
          localObject2 = null;
          if (localDraftFragment4 != null)
          {
            if (i == 0)
              break label137;
            localDraftFragment4.setSelected(false);
          }
        }
      }
    }
    while (true)
    {
      if ((localObject1 != null) || (localObject2 != null))
        this.mOnPageIdleRunnable = new SetSelectedRunnable((DraftFragment)localObject1, (DraftFragment)localObject2);
      return;
      label132: i = 0;
      break;
      label137: localObject1 = localDraftFragment4;
      localObject2 = null;
    }
    label147: this.mDots.setActiveDot(paramInt);
    if (paramInt < j)
    {
      int m = this.mCurrentPage;
      localObject1 = null;
      DraftFragment localDraftFragment3;
      if (m != -1)
      {
        int n = this.mCurrentPage;
        localObject1 = null;
        if (n <= j)
        {
          WeakReference localWeakReference3 = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
          localObject1 = null;
          if (localWeakReference3 != null)
          {
            localDraftFragment3 = (DraftFragment)localWeakReference3.get();
            localObject1 = null;
            if (localDraftFragment3 != null)
            {
              if (i == 0)
                break label425;
              localDraftFragment3.setSelected(false);
            }
          }
        }
      }
      label242: WeakReference localWeakReference2 = (WeakReference)this.mDraftFragments.get(paramInt);
      localObject2 = null;
      DraftFragment localDraftFragment2;
      if (localWeakReference2 != null)
      {
        localDraftFragment2 = (DraftFragment)localWeakReference2.get();
        localObject2 = null;
        if (localDraftFragment2 != null)
        {
          View localView1 = localDraftFragment2.getView();
          localObject2 = null;
          if (localView1 != null)
          {
            View localView2 = localView1.findViewById(2131361920);
            localObject2 = null;
            if (localView2 != null)
            {
              DragUpToDeleteContainer localDragUpToDeleteContainer = this.mDragUpToDeleteView;
              localObject2 = null;
              if (localDragUpToDeleteContainer != null)
              {
                this.mDragUpToDeleteView.setView(localView2, this.mViewPager.getLeftOfSelectedFragment());
                if ((!this.mAnimatingIntoDrafts) || (paramInt < j))
                {
                  this.mDraftTrashContainer.setVisibility(0);
                  this.mDraftTrashContainer.animate().alpha(1.0F).start();
                }
                this.mHandler.removeCallbacks(this.mOnResumeDraftRunnable);
                if (this.mPageScrollState != 0)
                  break label432;
                localDraftFragment2.setSelected(true);
              }
            }
          }
        }
      }
      while (true)
      {
        this.mCurrentSession = ((RecordSessionManager.RecordSessionInfo)this.mSessions.get(paramInt));
        this.mCurrentPage = paramInt;
        break;
        label425: localObject1 = localDraftFragment3;
        break label242;
        label432: localObject2 = localDraftFragment2;
      }
    }
    int k = this.mCurrentPage;
    Object localObject1 = null;
    DraftFragment localDraftFragment1;
    if (k != -1)
    {
      WeakReference localWeakReference1 = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
      if (localWeakReference1 == null)
        break label592;
      localDraftFragment1 = (DraftFragment)localWeakReference1.get();
      localObject1 = null;
      if (localDraftFragment1 != null)
      {
        if (i == 0)
          break label585;
        localDraftFragment1.setSelected(false);
      }
    }
    while (true)
    {
      if ((this.mCameraFragment != null) && ((DraftCameraPreviewFragment)this.mCameraFragment.get() != null))
        this.mHandler.removeCallbacks(this.mOnResumeDraftRunnable);
      this.mCurrentSession = null;
      this.mDragUpToDeleteView.setView(null, this.mViewPager.getLeftOfSelectedFragment());
      this.mDraftTrashContainer.animate().alpha(0.0F).setListener(new SimpleAnimatorListener()
      {
        public void onAnimationEnd(Animator paramAnonymousAnimator)
        {
          AbstractRecordingActivity.this.mDraftTrashContainer.setVisibility(8);
          AbstractRecordingActivity.this.mDraftTrashContainer.animate().setListener(null);
        }
      }).start();
      localObject2 = null;
      break;
      label585: localObject1 = localDraftFragment1;
      continue;
      label592: SLog.d("Fragment {} is null: size: {}.", Integer.valueOf(this.mCurrentPage), Integer.valueOf(this.mDraftFragments.size()));
      localObject1 = null;
    }
  }

  protected void onPause()
  {
    super.onPause();
    if ((this.mPromptDialog != null) && (this.mPromptDialog.isVisible()))
      this.mPromptDialog.dismiss();
    releasePlayers();
  }

  public void onRecorderBackPressed(View paramView)
  {
    try
    {
      onBackPressed();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
    }
  }

  protected void onResume()
  {
    super.onResume();
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("state_fp", this.mFirstPageSet);
    paramBundle.putBoolean("first_launch", this.mFirstDraftLaunch);
  }

  public void onSessionSwitchPressed(View paramView)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      FlurryUtils.trackSessionSwitchPressed(paramView);
      ((RecordingFragment)this.mCurrentFragment).onSessionSwitchPressed(paramView);
    }
  }

  public void preSetContentView()
  {
    if (!CameraManager.hasCamera())
    {
      Util.showNoCameraToast(this);
      finish();
    }
  }

  public boolean prepareForPickup()
  {
    if (!this.mAnimatingIntoDrafts)
    {
      WeakReference localWeakReference = (WeakReference)this.mDraftFragments.get(this.mCurrentPage);
      if (localWeakReference != null)
      {
        DraftFragment localDraftFragment = (DraftFragment)localWeakReference.get();
        localDraftFragment.mCanUnhide = false;
        localDraftFragment.pausePlayer();
        localDraftFragment.showImage();
      }
    }
    boolean bool1 = this.mAnimatingIntoDrafts;
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    return bool2;
  }

  public void releaseOtherPlayers(SdkVideoView paramSdkVideoView)
  {
    try
    {
      Iterator localIterator = this.mVideoViews.iterator();
      while (localIterator.hasNext())
      {
        SdkVideoView localSdkVideoView = (SdkVideoView)localIterator.next();
        if (localSdkVideoView != paramSdkVideoView)
          localSdkVideoView.suspend();
      }
    }
    finally
    {
    }
    this.mVideoViews.clear();
  }

  public void setWaitingForLogin(boolean paramBoolean)
  {
    this.mWaitingForLogin = paramBoolean;
  }

  public void showDeleteDialog()
  {
    PromptDialogFragment localPromptDialogFragment = PromptDialogFragment.newInstance(1);
    localPromptDialogFragment.setListener(this);
    localPromptDialogFragment.setMessage(2131624081);
    localPromptDialogFragment.setPositiveButton(2131624082);
    localPromptDialogFragment.setNegativeButton(2131624018);
    localPromptDialogFragment.show(getFragmentManager());
  }

  public void showDrafts(String paramString)
  {
    try
    {
      Crashlytics.log("Started showing drafts.");
      final boolean bool = "camera_preview".equals(paramString);
      this.mAnimatingIntoDrafts = true;
      this.mStartSessionId = paramString;
      this.mFirstPageSet = false;
      reload(RecordSessionManager.getValidSessions(this));
      this.mDraftFullMask.setVisibility(0);
      this.mDraftMaskParent.setVisibility(0);
      this.mCameraIconOverlayImage.setVisibility(8);
      Resources localResources = getResources();
      i = localResources.getDimensionPixelSize(2131427394);
      j = localResources.getDimensionPixelOffset(2131427358);
      int k = this.mTopMaskHeight;
      if (bool)
        k += j;
      if ((!bool) && ((this.mCurrentFragment instanceof RecordingFragment)))
      {
        ImageView localImageView = this.mLargeThumbnailOverlay;
        RelativeLayout.LayoutParams localLayoutParams2 = (RelativeLayout.LayoutParams)localImageView.getLayoutParams();
        localLayoutParams2.width = this.mScreenSize.x;
        localLayoutParams2.height = this.mScreenSize.x;
        localLayoutParams2.leftMargin = 0;
        localLayoutParams2.topMargin = i;
        localImageView.setLayoutParams(localLayoutParams2);
        String str = ((RecordingFragment)this.mCurrentFragment).getThumbnailPath();
        BitmapDrawable localBitmapDrawable = new BitmapDrawable(getResources(), str);
        ViewUtil.setBackground(localImageView, localBitmapDrawable);
        localImageView.setVisibility(0);
      }
      while (true)
      {
        this.mViewPager.setOnTouchListener(new View.OnTouchListener()
        {
          public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
          {
            if (bool)
              AbstractRecordingActivity.this.mCameraIconOverlay.setVisibility(8);
            while (true)
            {
              return false;
              AbstractRecordingActivity.this.mLargeThumbnailOverlay.setVisibility(8);
              AbstractRecordingActivity.this.mAnimationPreviewOverlay.setVisibility(8);
            }
          }
        });
        AnimationSet localAnimationSet = new AnimationSet(true);
        localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.EXPAND_HEIGHT, this.mDraftMaskTop, k));
        localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.EXPAND_WIDTH, this.mDraftMaskLeft, this.mSideMaskWidth));
        localAnimationSet.addAnimation(ViewUtil.makeResizeAnimation(ViewUtil.ResizeAnimationType.EXPAND_WIDTH, this.mDraftMaskRight, this.mSideMaskWidth));
        localAnimationSet.setAnimationListener(new SimpleAnimationListener()
        {
          public void onAnimationEnd(Animation paramAnonymousAnimation)
          {
            if (AbstractRecordingActivity.this.mCurrentPage != AbstractRecordingActivity.this.mDraftFragments.size())
            {
              AbstractRecordingActivity.this.mDraftTrashContainer.setAlpha(0.0F);
              AbstractRecordingActivity.this.mDraftTrashContainer.setVisibility(0);
              if (!AbstractRecordingActivity.this.isResuming())
                AbstractRecordingActivity.this.mDraftTrashContainer.animate().alpha(1.0F).start();
            }
            AbstractRecordingActivity.this.mSlowFadeIn.setAnimationListener(new SimpleAnimationListener()
            {
              public void onAnimationEnd(Animation paramAnonymous2Animation)
              {
                AbstractRecordingActivity.access$1702(AbstractRecordingActivity.this, false);
                AbstractRecordingActivity.this.mHandler.postDelayed(new Runnable()
                {
                  public void run()
                  {
                    if (!AbstractRecordingActivity.9.this.val$goToCamera)
                    {
                      AbstractRecordingActivity.this.mLargeThumbnailOverlay.setVisibility(8);
                      AbstractRecordingActivity.this.mAnimationPreviewOverlay.setVisibility(8);
                    }
                  }
                }
                , 300L);
              }

              public void onAnimationStart(Animation paramAnonymous2Animation)
              {
                if (AbstractRecordingActivity.9.this.val$goToCamera)
                {
                  AbstractRecordingActivity.this.mCameraIconOverlayImage.setVisibility(0);
                  AbstractRecordingActivity.this.mCameraIconOverlayImage.setAlpha(0.0F);
                  AbstractRecordingActivity.this.mCameraIconOverlayImage.animate().alpha(1.0F).setDuration(AbstractRecordingActivity.this.mSlowFadeIn.getDuration()).setListener(new ViewGoneAnimationListener(AbstractRecordingActivity.this.mCameraIconOverlayImage)).start();
                  AbstractRecordingActivity.this.mHandler.postDelayed(new Runnable()
                  {
                    public void run()
                    {
                      AbstractRecordingActivity.this.mCameraIconOverlay.setVisibility(8);
                    }
                  }
                  , AbstractRecordingActivity.this.mCameraIconFadeIn.getDuration());
                }
              }
            });
            AbstractRecordingActivity.this.mHandler.postDelayed(new Runnable()
            {
              public void run()
              {
                AbstractRecordingActivity.this.mDraftFullMask.setVisibility(8);
              }
            }
            , 150L);
            AbstractRecordingActivity.this.mViewPager.setVisibility(0);
            AbstractRecordingActivity.this.mViewPager.startAnimation(AbstractRecordingActivity.this.mSlowFadeIn);
            AbstractRecordingActivity.access$2002(AbstractRecordingActivity.this, 0);
            AbstractRecordingActivity.this.mDraftRoot.setVisibility(0);
            if ((AbstractRecordingActivity.this.mCurrentFragment instanceof RecordingFragment))
              ((RecordingFragment)AbstractRecordingActivity.this.mCurrentFragment).onShowDrafts();
            AbstractRecordingActivity.this.mDraftMaskParent.setVisibility(8);
            AbstractRecordingActivity.this.mDraftMaskTop.setVisibility(8);
            AbstractRecordingActivity.this.mDraftMaskLeft.setVisibility(8);
            AbstractRecordingActivity.this.mDraftMaskRight.setVisibility(8);
          }

          public void onAnimationStart(Animation paramAnonymousAnimation)
          {
            AbstractRecordingActivity.this.mHandler.removeCallbacks(AbstractRecordingActivity.this.mOnResumeDraftRunnable);
            AbstractRecordingActivity.this.mHandler.postDelayed(AbstractRecordingActivity.this.mOnResumeDraftRunnable, 300L);
          }
        });
        localAnimationSet.setDuration(300L);
        setCurrentSession();
        this.mDragUpToDeleteView.setVisibility(0);
        if ((!bool) && ((this.mCurrentFragment instanceof RecordingFragment)))
        {
          View localView = ((RecordingFragment)this.mCurrentFragment).getProgressView();
          if (localView != null)
            FloatingViewUtils.buildFloatingViewFor(this, localView, this.mAnimationPreviewOverlay, localView.getWidth(), 0, 0);
          this.mAnimationPreviewOverlay.setVisibility(0);
        }
        if (!bool)
          break;
        new MoveResizeAnimator(7, this.mCameraIconOverlay, this.mCameraIconOverlay, (int)(this.mScreenSize.x * (1.0F - this.mPreviewRatio) / 2.0F), i + j * 2, this.mPreviewRatio, this.mPreviewRatio, 300, this, null).start();
        this.mDraftRoot.startAnimation(localAnimationSet);
        return;
        if (bool)
        {
          this.mCameraIconOverlay.setVisibility(0);
          RelativeLayout.LayoutParams localLayoutParams1 = (RelativeLayout.LayoutParams)this.mCameraIconOverlay.getLayoutParams();
          localLayoutParams1.width = this.mScreenSize.x;
          localLayoutParams1.height = this.mScreenSize.x;
          localLayoutParams1.topMargin = i;
          localLayoutParams1.leftMargin = 0;
          this.mCameraIconOverlay.setLayoutParams(localLayoutParams1);
        }
      }
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        int i;
        int j;
        CrashUtil.logException(localIOException, "Error refresh reloading drafts.", new Object[0]);
        return;
        new MoveResizeAnimator(6, this.mAnimationPreviewOverlay, this.mAnimationPreviewOverlay, (int)(this.mScreenSize.x * (1.0F - this.mPreviewRatio) / 2.0F), i + j, this.mPreviewRatio, 0.5D, 300, this, null).start();
        new MoveResizeAnimator(5, this.mLargeThumbnailOverlay, this.mLargeThumbnailOverlay, (int)(this.mScreenSize.x * (1.0F - this.mPreviewRatio) / 2.0F), i + j * 2, this.mPreviewRatio, this.mPreviewRatio, 300, this, null).start();
      }
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException, "Error showing reloading drafts.", new Object[0]);
    }
  }

  public void showUnSavedChangesDialog(int paramInt, RecordingFragment paramRecordingFragment)
  {
    this.mPromptDialog = PromptDialogFragment.newInstance(paramInt);
    PromptDialogFragment localPromptDialogFragment = this.mPromptDialog;
    if (paramRecordingFragment.isSavedSession());
    for (int i = 2131624268; ; i = 2131624267)
    {
      localPromptDialogFragment.setMessage(i);
      this.mPromptDialog.setPositiveButton(2131624265);
      this.mPromptDialog.setNegativeButton(2131624087);
      this.mPromptDialog.show(getFragmentManager());
      return;
    }
  }

  public void swapFolder(String paramString, File paramFile)
  {
    if ((this.mCurrentFragment instanceof RecordingFragment))
    {
      RecordingFragment localRecordingFragment = (RecordingFragment)this.mCurrentFragment;
      if (!localRecordingFragment.isResuming())
        localRecordingFragment.swapFolder(paramString, paramFile);
    }
  }

  public void toPreview(String paramString1, RecordingFile paramRecordingFile, String paramString2)
  {
    CrashUtil.log("From {} to preview fragment: {} {}", new Object[] { paramString1, paramRecordingFile, paramString2 });
    getWindow().getDecorView().setSystemUiVisibility(this.mRegularUiMode);
    try
    {
      Cursor localCursor = UploadManager.getReferenceCursor(this, paramRecordingFile.folder.getName());
      if ((localCursor != null) && (localCursor.moveToFirst()))
      {
        CrashUtil.log("User have edited the vine already, discard until new one comes in.");
        startService(VineUploadService.getDiscardIntent(this, localCursor.getString(1)));
      }
      if (localCursor != null)
        localCursor.close();
      if (!AppController.getInstance(this).isLoggedIn());
    }
    catch (Exception localException1)
    {
      try
      {
        this.mUploadFile = UploadManager.addToUploadQueue(this, paramRecordingFile, paramString2, paramRecordingFile.folder.getName());
        if ((this.mCurrentFragment instanceof RecordingFragment))
          this.mCurrentFragment.onPause();
        RecordingPreviewFragment localRecordingPreviewFragment = createRecordingPreviewFragment(paramRecordingFile, paramString2);
        localRecordingPreviewFragment.setFinalFile(paramRecordingFile);
        this.mStep = 1;
        this.mHasPreviewedAlready = true;
        getSupportFragmentManager().beginTransaction().replace(2131361953, localRecordingPreviewFragment).commit();
        this.mCurrentFragment = localRecordingPreviewFragment;
        return;
        localException1 = localException1;
        CrashUtil.log("Failed to delete previous vines.");
      }
      catch (Exception localException2)
      {
        throw new RuntimeException(localException2);
      }
    }
  }

  public void toRecord(boolean paramBoolean1, boolean paramBoolean2, RecordingFile paramRecordingFile)
  {
    this.mStep = 0;
    this.mFirstPageSet = false;
    onPageSelected(-1);
    int i;
    RecordingFragment localRecordingFragment;
    FragmentTransaction localFragmentTransaction;
    if (paramRecordingFile != null)
    {
      i = 1;
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = Boolean.valueOf(paramBoolean1);
      arrayOfObject[1] = Boolean.valueOf(paramBoolean2);
      boolean bool = false;
      if (paramRecordingFile != null)
        bool = true;
      arrayOfObject[2] = Boolean.valueOf(bool);
      CrashUtil.log("To recording fragment: {} {} {}", arrayOfObject);
      if (i != 0)
        discardUpload();
      localRecordingFragment = createRecordingFragment();
      Bundle localBundle = new Bundle();
      localBundle.putParcelable("arg_top_overlay", this.mTopOverlay);
      localBundle.putParcelable("screen_size", this.mScreenSize);
      localRecordingFragment.setArguments(localBundle);
      localRecordingFragment.setFileFileToUse(paramRecordingFile);
      localRecordingFragment.setStartWithEdit(paramBoolean2);
      localFragmentTransaction = getSupportFragmentManager().beginTransaction();
      if (!paramBoolean1)
        break label205;
      localFragmentTransaction.add(2131361953, localRecordingFragment);
    }
    while (true)
    {
      localFragmentTransaction.commit();
      this.mCurrentFragment = localRecordingFragment;
      this.mRegularUiMode = getWindow().getDecorView().getSystemUiVisibility();
      getWindow().getDecorView().setSystemUiVisibility(1);
      return;
      i = 0;
      break;
      label205: localFragmentTransaction.replace(2131361953, localRecordingFragment);
    }
  }

  public void viewDestroyFinished()
  {
    this.mDraftTrashButton.setActivated(false);
    this.mDraftTrashBackground.setActivated(false);
  }

  public boolean viewDropped(int paramInt)
  {
    if (paramInt <= 0);
    for (boolean bool = true; (bool) && (this.mCurrentPage != this.mDraftFragments.size()); bool = false)
    {
      this.mDeleteWasDrag = true;
      showDeleteDialog();
      return bool;
    }
    this.mDraftTrashButton.setActivated(false);
    return bool;
  }

  public void viewLanded()
  {
    showCurrentFragment();
  }

  public boolean viewMoved(int paramInt)
  {
    boolean bool1 = true;
    boolean bool2;
    View localView;
    if (paramInt < 0)
    {
      bool2 = bool1;
      this.mDraftTrashBackground.setActivated(bool2);
      localView = this.mDraftTrashButton;
      if (paramInt >= this.mDraftTrashContainer.getHeight())
        break label46;
    }
    while (true)
    {
      localView.setActivated(bool1);
      return bool2;
      bool2 = false;
      break;
      label46: bool1 = false;
    }
  }

  public void viewPickedUp()
  {
    hideCurrentFragment();
  }

  private class DraftPagerImpl extends DraftFragmentStatePagerAdapter
  {
    public DraftPagerImpl(FragmentManager arg2)
    {
      super();
    }

    public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
    {
      super.destroyItem(paramViewGroup, paramInt, paramObject);
      if ((paramObject instanceof DraftFragment))
      {
        FragmentTransaction localFragmentTransaction = AbstractRecordingActivity.this.getSupportFragmentManager().beginTransaction();
        localFragmentTransaction.remove((DraftFragment)paramObject);
        localFragmentTransaction.commit();
      }
    }

    public void finishUpdate(ViewGroup paramViewGroup)
    {
      super.finishUpdate(paramViewGroup);
      AbstractRecordingActivity localAbstractRecordingActivity;
      if (AbstractRecordingActivity.this.mFirstDraftLaunch)
      {
        localAbstractRecordingActivity = AbstractRecordingActivity.this;
        if (AbstractRecordingActivity.this.setCurrentSession())
          break label39;
      }
      label39: for (boolean bool = true; ; bool = false)
      {
        AbstractRecordingActivity.access$3702(localAbstractRecordingActivity, bool);
        return;
      }
    }

    public int getCount()
    {
      return 1 + AbstractRecordingActivity.this.mSessions.size();
    }

    public Fragment getItem(int paramInt)
    {
      if (paramInt == AbstractRecordingActivity.this.mSessions.size())
      {
        DraftCameraPreviewFragment localDraftCameraPreviewFragment = new DraftCameraPreviewFragment(AbstractRecordingActivity.this.mPreviewDimen);
        AbstractRecordingActivity.access$2902(AbstractRecordingActivity.this, new WeakReference(localDraftCameraPreviewFragment));
        return localDraftCameraPreviewFragment;
      }
      RecordSessionManager.RecordSessionInfo localRecordSessionInfo = (RecordSessionManager.RecordSessionInfo)AbstractRecordingActivity.this.mSessions.get(paramInt);
      if ((paramInt == 0) && (!AbstractRecordingActivity.this.mFirstPageSet));
      for (boolean bool = true; ; bool = false)
      {
        final DraftFragment localDraftFragment = new DraftFragment(bool, paramInt, localRecordSessionInfo.video.getPath(), localRecordSessionInfo.thumb.getPath(), localRecordSessionInfo.folder, localRecordSessionInfo.meta.getProgress(), AbstractRecordingActivity.this.mPreviewDimen);
        localDraftFragment.setListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            switch (paramAnonymousView.getId())
            {
            default:
            case 2131361921:
            }
            do
              return;
            while ((AbstractRecordingActivity.this.mAnimatingIntoDrafts) || (AbstractRecordingActivity.this.isResuming()));
            CrashUtil.log("User clicked on fragment to resume.");
            AbstractRecordingActivity.access$3102(AbstractRecordingActivity.this, true);
            AbstractRecordingActivity.this.buildAndShowFloatingView(localDraftFragment);
            AbstractRecordingActivity.this.releasePlayers();
            float f = AbstractRecordingActivity.this.mScreenSize.x / AbstractRecordingActivity.this.mPreviewOverlay.getLayoutParams().width;
            new MoveResizeAnimator(2, AbstractRecordingActivity.this.mProgressOverlay, 0, f, 2.0D, 300, null, paramAnonymousView.getTag()).start();
            new MoveResizeAnimator(1, AbstractRecordingActivity.this.mPreviewOverlay, 2 * AbstractRecordingActivity.this.mProgressOverlay.getLayoutParams().height, f, f, 300, AbstractRecordingActivity.this, paramAnonymousView.getTag()).start();
          }
        });
        AbstractRecordingActivity.this.mDraftFragments.put(paramInt, new WeakReference(localDraftFragment));
        return localDraftFragment;
      }
    }

    public int getItemPosition(Object paramObject)
    {
      if ((paramObject instanceof DraftFragment))
      {
        if (((DraftFragment)paramObject).isExpired())
          return -2;
        return -1;
      }
      return super.getItemPosition(paramObject);
    }
  }

  public class SetSelectedRunnable
    implements Runnable
  {
    public final DraftFragment fragmentToSetSelectedFalse;
    public final DraftFragment fragmentToSetSelectedTrue;

    public SetSelectedRunnable(DraftFragment paramDraftFragment1, DraftFragment arg3)
    {
      this.fragmentToSetSelectedFalse = paramDraftFragment1;
      Object localObject;
      this.fragmentToSetSelectedTrue = localObject;
    }

    public void run()
    {
      if (this.fragmentToSetSelectedFalse != null)
        this.fragmentToSetSelectedFalse.setSelected(false);
      if (this.fragmentToSetSelectedTrue != null)
        this.fragmentToSetSelectedTrue.setSelected(true);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.AbstractRecordingActivity
 * JD-Core Version:    0.6.2
 */