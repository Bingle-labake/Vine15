package co.vine.android;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;
import co.vine.android.animation.SimpleAnimationListener;
import co.vine.android.player.SdkVideoView;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.recorder.RecordingAnimations;
import co.vine.android.recorder.RecordingFile;
import co.vine.android.recorder.VineRecorder;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.ViewUtil;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;

public class RecordingFragment extends BaseFragment
{
  public static final String ARG_SCREEN_SIZE = "screen_size";
  public static final String ARG_TOP_OVERLAY = "arg_top_overlay";
  private AlphaAnimation mDismissGridAnimation;
  private View mDraftOverlayIcon;
  private TextView mDraftsButton;
  private Animation mFadeIn;
  private final Animation.AnimationListener mFadeInListener = new Animation.AnimationListener()
  {
    public void onAnimationEnd(Animation paramAnonymousAnimation)
    {
    }

    public void onAnimationRepeat(Animation paramAnonymousAnimation)
    {
    }

    public void onAnimationStart(Animation paramAnonymousAnimation)
    {
      RecordingFragment.this.mNoDraftsOverlay.setVisibility(0);
    }
  };
  private Animation mFadeOut;
  private final Animation.AnimationListener mFadeOutListener = new Animation.AnimationListener()
  {
    public void onAnimationEnd(Animation paramAnonymousAnimation)
    {
      RecordingFragment.this.mNoDraftsOverlay.setVisibility(8);
      RecordingFragment.this.mNoDraftsOverlay.setOnTouchListener(null);
    }

    public void onAnimationRepeat(Animation paramAnonymousAnimation)
    {
    }

    public void onAnimationStart(Animation paramAnonymousAnimation)
    {
      RecordingFragment.this.mDraftOverlayIcon.setVisibility(8);
    }
  };
  private RecordingFile mFileFileToUse;
  private View mFocusButton;
  private File mFolder;
  private ToggleButton mGhostButton;
  private View mGrid;
  private ToggleButton mGridButton;
  private View mNoDraftsOverlay;
  private int mNumDrafts;
  final View.OnTouchListener mOnNoDraftOverlayTouchListener = new View.OnTouchListener()
  {
    public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
    {
      RecordingFragment.this.mFadeOut.setAnimationListener(RecordingFragment.this.mFadeOutListener);
      RecordingFragment.this.mNoDraftsOverlay.startAnimation(RecordingFragment.this.mFadeOut);
      return true;
    }
  };
  private VineRecorder mRecorder;
  private View mRecordingOptions;
  private RecordSessionManager mRsm;
  private Point mScreenSize;
  private AlphaAnimation mShowGridAnimation;
  private final Runnable mStartDraftsRunnable = new Runnable()
  {
    public void run()
    {
      AbstractRecordingActivity localAbstractRecordingActivity = (AbstractRecordingActivity)RecordingFragment.this.getActivity();
      if (localAbstractRecordingActivity != null)
      {
        if (RecordingFragment.this.mGridButton.isChecked())
          RecordingFragment.this.mGridButton.setChecked(false);
        if (RecordingFragment.this.mGhostButton.isChecked())
          RecordingFragment.this.mRecorder.setGhostMode(false);
        if (!RecordingFragment.this.mRecorder.isSavedSession())
          break label100;
      }
      label100: for (String str = RecordingFragment.this.mRecorder.getFile().folder.getName(); ; str = String.valueOf("camera_preview"))
      {
        localAbstractRecordingActivity.showDrafts(str);
        return;
      }
    }
  };
  private boolean mStartWithEdit;
  private Bitmap mTopOverlay;

  // ERROR //
  private RecordingFile determineSessionFileForSwap(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 125	co/vine/android/RecordingFragment:getActivity	()Landroid/support/v4/app/FragmentActivity;
    //   4: checkcast 127	co/vine/android/AbstractRecordingActivity
    //   7: astore_2
    //   8: aload_2
    //   9: invokestatic 133	co/vine/android/recorder/RecordSessionManager:getValidSessions	(Landroid/content/Context;)Ljava/util/ArrayList;
    //   12: astore 4
    //   14: aload 4
    //   16: invokevirtual 139	java/util/ArrayList:size	()I
    //   19: istore 5
    //   21: aconst_null
    //   22: astore 6
    //   24: iload 5
    //   26: bipush 9
    //   28: if_icmple +23 -> 51
    //   31: aload 4
    //   33: iconst_m1
    //   34: aload 4
    //   36: invokevirtual 139	java/util/ArrayList:size	()I
    //   39: iadd
    //   40: invokevirtual 143	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   43: checkcast 145	co/vine/android/recorder/RecordSessionManager$RecordSessionInfo
    //   46: getfield 148	co/vine/android/recorder/RecordSessionManager$RecordSessionInfo:folder	Ljava/io/File;
    //   49: astore 6
    //   51: aconst_null
    //   52: astore 7
    //   54: aload_0
    //   55: getfield 150	co/vine/android/RecordingFragment:mFileFileToUse	Lco/vine/android/recorder/RecordingFile;
    //   58: astore 8
    //   60: iload_1
    //   61: ifeq +34 -> 95
    //   64: aload 8
    //   66: ifnull +29 -> 95
    //   69: ldc 152
    //   71: invokestatic 158	com/edisonwang/android/slog/SLog:i	(Ljava/lang/String;)V
    //   74: aload 8
    //   76: getfield 163	co/vine/android/recorder/RecordingFile:isSavedSession	Z
    //   79: ifne +419 -> 498
    //   82: iconst_1
    //   83: istore 19
    //   85: aload 8
    //   87: iload 19
    //   89: putfield 166	co/vine/android/recorder/RecordingFile:isDirty	Z
    //   92: aload 8
    //   94: areturn
    //   95: aload_0
    //   96: getfield 168	co/vine/android/RecordingFragment:mFolder	Ljava/io/File;
    //   99: ifnull +405 -> 504
    //   102: iconst_1
    //   103: istore 9
    //   105: iconst_0
    //   106: istore 10
    //   108: aconst_null
    //   109: astore 11
    //   111: aload 8
    //   113: ifnull +397 -> 510
    //   116: aload 8
    //   118: invokevirtual 172	co/vine/android/recorder/RecordingFile:getSession	()Lco/vine/android/recorder/RecordSession;
    //   121: astore 11
    //   123: aload 8
    //   125: getfield 173	co/vine/android/recorder/RecordingFile:folder	Ljava/io/File;
    //   128: astore 7
    //   130: aload 7
    //   132: aload 6
    //   134: if_acmpne +358 -> 492
    //   137: iconst_1
    //   138: istore 12
    //   140: new 160	co/vine/android/recorder/RecordingFile
    //   143: dup
    //   144: aload 7
    //   146: aload 11
    //   148: iload 9
    //   150: iload 10
    //   152: iload 12
    //   154: invokespecial 176	co/vine/android/recorder/RecordingFile:<init>	(Ljava/io/File;Lco/vine/android/recorder/RecordSession;ZZZ)V
    //   157: areturn
    //   158: iload 13
    //   160: ifne +41 -> 201
    //   163: iload 9
    //   165: ifeq +13 -> 178
    //   168: aload_0
    //   169: getfield 168	co/vine/android/RecordingFragment:mFolder	Ljava/io/File;
    //   172: invokevirtual 182	java/io/File:exists	()Z
    //   175: ifeq +20 -> 195
    //   178: aload 6
    //   180: ifnull +21 -> 201
    //   183: aload 6
    //   185: invokevirtual 182	java/io/File:exists	()Z
    //   188: istore 18
    //   190: iload 18
    //   192: ifne +9 -> 201
    //   195: iconst_1
    //   196: istore 13
    //   198: iconst_0
    //   199: istore 9
    //   201: iload 13
    //   203: ifeq +214 -> 417
    //   206: aload_0
    //   207: getfield 184	co/vine/android/RecordingFragment:mRsm	Lco/vine/android/recorder/RecordSessionManager;
    //   210: invokevirtual 188	co/vine/android/recorder/RecordSessionManager:getCrashedSession	()Ljava/util/HashMap;
    //   213: astore 17
    //   215: aconst_null
    //   216: astore 7
    //   218: aconst_null
    //   219: astore 11
    //   221: iconst_0
    //   222: istore 10
    //   224: aload 17
    //   226: ifnull +67 -> 293
    //   229: aload 17
    //   231: invokevirtual 194	java/util/HashMap:keySet	()Ljava/util/Set;
    //   234: invokeinterface 200 1 0
    //   239: invokeinterface 206 1 0
    //   244: checkcast 208	co/vine/android/recorder/RecordSession
    //   247: astore 11
    //   249: aload 11
    //   251: new 210	co/vine/android/recorder/RecordConfigUtils$RecordConfig
    //   254: dup
    //   255: aload_2
    //   256: invokespecial 213	co/vine/android/recorder/RecordConfigUtils$RecordConfig:<init>	(Landroid/content/Context;)V
    //   259: invokevirtual 217	co/vine/android/recorder/RecordSession:setConfig	(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)V
    //   262: aload 17
    //   264: aload 11
    //   266: invokevirtual 220	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   269: checkcast 178	java/io/File
    //   272: astore 7
    //   274: aload 11
    //   276: invokevirtual 224	co/vine/android/recorder/RecordSession:getSegments	()Ljava/util/ArrayList;
    //   279: invokevirtual 139	java/util/ArrayList:size	()I
    //   282: ifle +70 -> 352
    //   285: iconst_1
    //   286: istore 10
    //   288: ldc 226
    //   290: invokestatic 231	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   293: aload 11
    //   295: ifnonnull -165 -> 130
    //   298: ldc 233
    //   300: invokestatic 231	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;)V
    //   303: aload_0
    //   304: getfield 184	co/vine/android/RecordingFragment:mRsm	Lco/vine/android/recorder/RecordSessionManager;
    //   307: invokevirtual 237	co/vine/android/recorder/RecordSessionManager:createFolderForSession	()Ljava/io/File;
    //   310: astore 7
    //   312: new 210	co/vine/android/recorder/RecordConfigUtils$RecordConfig
    //   315: dup
    //   316: aload_2
    //   317: invokespecial 213	co/vine/android/recorder/RecordConfigUtils$RecordConfig:<init>	(Landroid/content/Context;)V
    //   320: invokestatic 241	co/vine/android/recorder/RecordSession:newSession	(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)Lco/vine/android/recorder/RecordSession;
    //   323: astore 11
    //   325: aload 4
    //   327: invokevirtual 139	java/util/ArrayList:size	()I
    //   330: istore 16
    //   332: iload 16
    //   334: bipush 9
    //   336: if_icmpne -206 -> 130
    //   339: aload 7
    //   341: astore 6
    //   343: goto -213 -> 130
    //   346: iconst_0
    //   347: istore 13
    //   349: goto -191 -> 158
    //   352: iconst_0
    //   353: istore 10
    //   355: goto -67 -> 288
    //   358: astore 14
    //   360: ldc 243
    //   362: invokestatic 246	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;)V
    //   365: goto -72 -> 293
    //   368: astore_3
    //   369: ldc 248
    //   371: aload_3
    //   372: invokestatic 251	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   375: aload_2
    //   376: ldc 252
    //   378: iconst_0
    //   379: invokestatic 258	android/widget/Toast:makeText	(Landroid/content/Context;II)Landroid/widget/Toast;
    //   382: invokevirtual 261	android/widget/Toast:show	()V
    //   385: aload_2
    //   386: invokevirtual 264	co/vine/android/AbstractRecordingActivity:finish	()V
    //   389: aconst_null
    //   390: areturn
    //   391: astore 15
    //   393: ldc_w 266
    //   396: iconst_1
    //   397: anewarray 268	java/lang/Object
    //   400: dup
    //   401: iconst_0
    //   402: aload 15
    //   404: aastore
    //   405: invokestatic 271	co/vine/android/util/CrashUtil:log	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   408: aload_0
    //   409: invokevirtual 125	co/vine/android/RecordingFragment:getActivity	()Landroid/support/v4/app/FragmentActivity;
    //   412: invokevirtual 274	android/support/v4/app/FragmentActivity:finish	()V
    //   415: aconst_null
    //   416: areturn
    //   417: iload 9
    //   419: ifeq +63 -> 482
    //   422: aload_0
    //   423: getfield 168	co/vine/android/RecordingFragment:mFolder	Ljava/io/File;
    //   426: astore 7
    //   428: aload 7
    //   430: invokestatic 278	co/vine/android/recorder/RecordSessionManager:readDataObject	(Ljava/io/File;)Lco/vine/android/recorder/RecordSession;
    //   433: astore 11
    //   435: aload 11
    //   437: new 210	co/vine/android/recorder/RecordConfigUtils$RecordConfig
    //   440: dup
    //   441: aload_2
    //   442: invokespecial 213	co/vine/android/recorder/RecordConfigUtils$RecordConfig:<init>	(Landroid/content/Context;)V
    //   445: invokevirtual 217	co/vine/android/recorder/RecordSession:setConfig	(Lco/vine/android/recorder/RecordConfigUtils$RecordConfig;)V
    //   448: aload 11
    //   450: aload 11
    //   452: invokevirtual 281	co/vine/android/recorder/RecordSession:calculateAudioCount	()I
    //   455: invokevirtual 285	co/vine/android/recorder/RecordSession:setAudioDataCount	(I)V
    //   458: aload 11
    //   460: aload 11
    //   462: invokevirtual 288	co/vine/android/recorder/RecordSession:calculateVideoCount	()I
    //   465: invokevirtual 291	co/vine/android/recorder/RecordSession:setVideoDataCount	(I)V
    //   468: ldc_w 293
    //   471: aload 7
    //   473: invokevirtual 297	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   476: invokestatic 300	com/edisonwang/android/slog/SLog:i	(Ljava/lang/String;Ljava/lang/Object;)V
    //   479: goto -349 -> 130
    //   482: aload 6
    //   484: astore 7
    //   486: iconst_1
    //   487: istore 10
    //   489: goto -61 -> 428
    //   492: iconst_0
    //   493: istore 12
    //   495: goto -355 -> 140
    //   498: iconst_0
    //   499: istore 19
    //   501: goto -416 -> 85
    //   504: iconst_0
    //   505: istore 9
    //   507: goto -402 -> 105
    //   510: aload 6
    //   512: ifnonnull -166 -> 346
    //   515: iload 9
    //   517: ifne -171 -> 346
    //   520: iconst_1
    //   521: istore 13
    //   523: goto -365 -> 158
    //
    // Exception table:
    //   from	to	target	type
    //   206	215	358	java/io/IOException
    //   229	285	358	java/io/IOException
    //   288	293	358	java/io/IOException
    //   8	21	368	java/io/IOException
    //   31	51	368	java/io/IOException
    //   54	60	368	java/io/IOException
    //   69	82	368	java/io/IOException
    //   85	92	368	java/io/IOException
    //   95	102	368	java/io/IOException
    //   116	130	368	java/io/IOException
    //   140	158	368	java/io/IOException
    //   168	178	368	java/io/IOException
    //   183	190	368	java/io/IOException
    //   298	303	368	java/io/IOException
    //   360	365	368	java/io/IOException
    //   393	415	368	java/io/IOException
    //   422	428	368	java/io/IOException
    //   428	479	368	java/io/IOException
    //   303	332	391	java/io/IOException
  }

  private void notifyActivity(String paramString, boolean paramBoolean)
  {
    AbstractRecordingActivity localAbstractRecordingActivity;
    if (this.mRecorder.finalFile != null)
    {
      localAbstractRecordingActivity = (AbstractRecordingActivity)getActivity();
      if (localAbstractRecordingActivity != null)
      {
        if (!paramBoolean)
          break label51;
        CrashUtil.logException(new IllegalStateException("Detected invalid session."));
        Util.showCenteredToast(localAbstractRecordingActivity, 2131624149);
        localAbstractRecordingActivity.finish();
      }
    }
    return;
    label51: localAbstractRecordingActivity.mProgressContainerWidth = ((ViewGroup)this.mRecorder.getCameraView().getParent()).getMeasuredWidth();
    localAbstractRecordingActivity.mCurrentDuration = this.mRecorder.currentDuration;
    localAbstractRecordingActivity.toPreview(paramString, this.mRecorder.finalFile, this.mRecorder.getThumbnailPath());
  }

  private void refreshDraftNumber()
  {
    try
    {
      int i = RecordSessionManager.getNumberOfValidSessions(getActivity());
      if (i > 0)
      {
        if (i > 9)
          i--;
        this.mDraftsButton.setText(String.valueOf(i));
      }
      while (true)
      {
        this.mNumDrafts = i;
        return;
        this.mDraftsButton.setText("");
      }
    }
    catch (IOException localIOException)
    {
      CrashUtil.logException(localIOException);
    }
  }

  public void discardEditing()
  {
    if (this.mRecorder != null)
      this.mRecorder.setEditMode(false, true);
  }

  public void doOneFrame()
  {
    if ((this.mRecorder != null) && (this.mRecorder.canKeepRecording()))
      this.mRecorder.doOneFrame();
  }

  public View getProgressView()
  {
    return this.mRecorder.getProgressView();
  }

  public String getThumbnailPath()
  {
    return this.mRecorder.getThumbnailPath();
  }

  public boolean isEditing()
  {
    return (this.mRecorder != null) && (this.mRecorder.isEditing());
  }

  public boolean isEditingDirty()
  {
    return (this.mRecorder != null) && (this.mRecorder.isEditingDirty());
  }

  public boolean isResuming()
  {
    return (this.mRecorder != null) && (this.mRecorder.isResuming());
  }

  public boolean isSavedSession()
  {
    return this.mRecorder.isSavedSession();
  }

  public boolean isSessionModified()
  {
    if (this.mRecorder != null)
      return this.mRecorder.isSessionDirty();
    return false;
  }

  public void modifyZoom(boolean paramBoolean)
  {
    if (this.mRecorder != null)
      this.mRecorder.modifyZoom(paramBoolean);
  }

  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    AbstractRecordingActivity localAbstractRecordingActivity = (AbstractRecordingActivity)getActivity();
    try
    {
      this.mRsm = RecordSessionManager.getInstance(getActivity());
      Resources localResources = getResources();
      boolean bool1 = this.mStartWithEdit;
      Point localPoint = localAbstractRecordingActivity.getScreenSize();
      if ((this.mFileFileToUse != null) && (this.mStartWithEdit));
      for (boolean bool2 = true; ; bool2 = false)
      {
        boolean bool3 = localAbstractRecordingActivity.hasPreviewedAlready();
        RecordingFile localRecordingFile = determineSessionFileForSwap(true);
        SdkVideoView localSdkVideoView = (SdkVideoView)localAbstractRecordingActivity.findViewById(2131362036);
        int i = localResources.getDimensionPixelSize(2131427367);
        int j = localResources.getDimensionPixelSize(2131427363);
        String str = getString(2131624395);
        ToggleButton localToggleButton = this.mGhostButton;
        CharSequence[] arrayOfCharSequence = new CharSequence[4];
        arrayOfCharSequence[0] = getText(2131624144);
        arrayOfCharSequence[1] = getText(2131624133);
        arrayOfCharSequence[2] = getText(2131624134);
        arrayOfCharSequence[3] = getText(2131624135);
        this.mRecorder = new VineRecorder(bool1, localPoint, bool2, bool3, localRecordingFile, localAbstractRecordingActivity, localSdkVideoView, 2131362079, 2131362060, 2131362081, 2131362088, 2131362068, 2130837631, 2130837829, 2131362082, 2131361924, 2131362067, 2131362080, -1, 2131362078, 2131362075, 2131362037, 2131362069, 2131362071, 2131362070, 2131362072, 2131362073, 2131362074, 2131624136, 2131624015, 2131624208, 2131362064, 2131362061, 2131361969, i, j, 2131362062, 2131361928, str, localToggleButton, arrayOfCharSequence);
        this.mShowGridAnimation = RecordingAnimations.getShowGridAinimation(new SimpleAnimationListener()
        {
          public void onAnimationEnd(Animation paramAnonymousAnimation)
          {
            if (RecordingFragment.this.mRecorder != null)
              RecordingFragment.this.mRecorder.setGridOn(true);
            RecordingFragment.this.mGrid.setVisibility(0);
          }

          public void onAnimationStart(Animation paramAnonymousAnimation)
          {
            RecordingFragment.this.mGrid.setVisibility(0);
            RecordingFragment.this.mGridButton.setChecked(true);
          }
        });
        this.mDismissGridAnimation = RecordingAnimations.getGridDimissAnimation(new SimpleAnimationListener()
        {
          public void onAnimationEnd(Animation paramAnonymousAnimation)
          {
            RecordingFragment.this.mGrid.setVisibility(8);
            RecordingFragment.this.mGridButton.setChecked(false);
            if (RecordingFragment.this.mRecorder != null)
              RecordingFragment.this.mRecorder.setGridOn(false);
          }
        });
        if (this.mGrid.getVisibility() == 0)
          this.mGrid.startAnimation(this.mDismissGridAnimation);
        return;
      }
    }
    catch (IOException localIOException)
    {
      SLog.e("Error creating folder. ", localIOException);
      Toast.makeText(localAbstractRecordingActivity, 2131624370, 0).show();
      localAbstractRecordingActivity.finish();
    }
  }

  public void onCameraSwitchPressed(View paramView)
  {
    if (this.mRecorder != null)
      this.mRecorder.onCameraSwitcherPressed(paramView);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Bundle localBundle = getArguments();
    this.mTopOverlay = ((Bitmap)localBundle.getParcelable("arg_top_overlay"));
    this.mScreenSize = ((Point)localBundle.getParcelable("screen_size"));
    this.mFadeIn = AnimationUtils.loadAnimation(getActivity(), 2130968589);
    this.mFadeOut = AnimationUtils.loadAnimation(getActivity(), 2130968590);
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView1 = paramLayoutInflater.inflate(2130903125, paramViewGroup, false);
    View localView2 = localView1.findViewById(2131362075);
    View localView3 = localView1.findViewById(2131362037);
    this.mFocusButton = localView1.findViewById(2131362082);
    this.mGridButton = ((ToggleButton)localView1.findViewById(2131362081));
    this.mGridButton.setText(null);
    this.mGridButton.setTextOn(null);
    this.mGridButton.setTextOff(null);
    this.mGridButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean)
        {
          RecordingFragment.this.mGrid.startAnimation(RecordingFragment.this.mShowGridAnimation);
          return;
        }
        RecordingFragment.this.mGrid.startAnimation(RecordingFragment.this.mDismissGridAnimation);
      }
    });
    this.mGrid = localView1.findViewById(2131362089);
    View localView4 = localView1.findViewById(2131361928);
    if (this.mTopOverlay != null)
    {
      localView4.setVisibility(0);
      ViewUtil.setBackground(getResources(), localView4, this.mTopOverlay);
    }
    while (true)
    {
      this.mGhostButton = ((ToggleButton)localView1.findViewById(2131362083));
      this.mGhostButton.setText(null);
      this.mGhostButton.setTextOn(null);
      this.mGhostButton.setTextOff(null);
      this.mDraftsButton = ((TextView)localView1.findViewById(2131362085));
      refreshDraftNumber();
      this.mRecordingOptions = localView1.findViewById(2131362079);
      this.mNoDraftsOverlay = localView1.findViewById(2131362090);
      ((AbstractRecordingActivity)getActivity()).initMasks(localView2, localView3);
      return localView1;
      localView4.setVisibility(8);
    }
  }

  public void onDestroy()
  {
    super.onDestroy();
    if (this.mRecorder != null)
    {
      if (this.mRecorder.release())
        FlurryUtils.trackAbandonedStage("capture");
      this.mRecorder = null;
      this.mFileFileToUse = null;
    }
  }

  public void onFinishPressed(View paramView)
  {
    if (this.mRecorder != null)
      this.mRecorder.onFinishPressed(paramView);
  }

  public void onFocusSwitchPressed(View paramView)
  {
    int i;
    VineRecorder localVineRecorder;
    if ((this.mRecorder != null) && (this.mRecorder.canChangeFocus()))
    {
      View localView = this.mFocusButton;
      if (!this.mRecorder.isAutoFocusing())
        break label68;
      i = 2130837830;
      localView.setBackgroundResource(i);
      localVineRecorder = this.mRecorder;
      if (this.mRecorder.isAutoFocusing())
        break label75;
    }
    label68: label75: for (boolean bool = true; ; bool = false)
    {
      localVineRecorder.setAutoFocusing(bool);
      return;
      i = 2130837828;
      break;
    }
  }

  public void onGhostSwitchPressed(View paramView)
  {
    if (this.mRecorder != null)
      this.mRecorder.onGhostSwitchPressed();
  }

  public void onGridSwitchPressed()
  {
    if (this.mGrid.getVisibility() == 8)
    {
      this.mGrid.startAnimation(this.mShowGridAnimation);
      return;
    }
    this.mGrid.startAnimation(this.mDismissGridAnimation);
  }

  public void onHideDrafts()
  {
    refreshDraftNumber();
    this.mRecordingOptions.setAlpha(0.0F);
    this.mRecordingOptions.setVisibility(0);
    this.mRecordingOptions.animate().alpha(1.0F).start();
  }

  public void onPause()
  {
    super.onPause();
    if (this.mRecorder != null)
      this.mRecorder.onUiPaused();
  }

  public void onResume()
  {
    super.onResume();
    if (this.mRecorder != null)
    {
      AbstractRecordingActivity localAbstractRecordingActivity = (AbstractRecordingActivity)getActivity();
      boolean bool1 = localAbstractRecordingActivity.isDraftsShowing();
      if (!bool1)
      {
        refreshDraftNumber();
        RecordingFile localRecordingFile = this.mRecorder.getFile();
        if ((localRecordingFile != null) && (!localRecordingFile.folder.exists()))
        {
          CrashUtil.logException(new VineException("Invalid folder"));
          setFileFileToUse(null);
          this.mRecorder.swapSession("Resume invalid.", determineSessionFileForSwap(false));
        }
      }
      this.mRecorder.onUiResumed(localAbstractRecordingActivity, new OnRecordingFinishRunnable(new WeakReference(this)), bool1);
      if (this.mGridButton.isChecked())
      {
        ToggleButton localToggleButton = this.mGridButton;
        int i = this.mGrid.getVisibility();
        boolean bool2 = false;
        if (i != 8)
          bool2 = true;
        localToggleButton.setChecked(bool2);
      }
    }
  }

  public void onSessionSwitchPressed(View paramView)
  {
    if ((this.mRecorder != null) && ((this.mNumDrafts > 0) || (this.mRecorder.isSessionDirty())))
    {
      if (this.mRecorder.isSessionDirty())
      {
        ((AbstractRecordingActivity)getActivity()).showUnSavedChangesDialog(2, this);
        return;
      }
      startDrafts(false);
      return;
    }
    this.mDraftOverlayIcon.setVisibility(0);
    int[] arrayOfInt = new int[2];
    this.mDraftsButton.getLocationOnScreen(arrayOfInt);
    int i = arrayOfInt[0];
    int j = arrayOfInt[1];
    this.mDraftOverlayIcon.setX(i);
    int k = getResources().getDimensionPixelOffset(2131427356);
    this.mDraftOverlayIcon.setY(j - k);
    this.mNoDraftsOverlay.setOnTouchListener(this.mOnNoDraftOverlayTouchListener);
    this.mFadeIn.setAnimationListener(this.mFadeInListener);
    this.mNoDraftsOverlay.startAnimation(this.mFadeIn);
  }

  public void onShowDrafts()
  {
    this.mRecordingOptions.setVisibility(8);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    Resources localResources = getResources();
    View localView = this.mNoDraftsOverlay.findViewById(2131362091);
    float f1 = localResources.getDimensionPixelOffset(2131427394);
    float f2 = localResources.getDimensionPixelOffset(2131427359);
    localView.setY(f1 + this.mScreenSize.x / 2 - f2);
    this.mNoDraftsOverlay.findViewById(2131362092).setY(localResources.getDimensionPixelOffset(2131427360) + localView.getY());
    this.mDraftOverlayIcon = paramView.findViewById(2131362093);
  }

  public void resumeFromDraft()
  {
    RecordingFile localRecordingFile1;
    if ((this.mRecorder != null) && (!this.mRecorder.isResuming()))
    {
      localRecordingFile1 = this.mRecorder.getFile();
      if (!localRecordingFile1.folder.exists())
        break label63;
    }
    label63: for (RecordingFile localRecordingFile2 = this.mRecorder.swapSession("BackPress, Resume from draft using resumeFile.", localRecordingFile1); ; localRecordingFile2 = this.mRecorder.swapSession("BackPress, Resume from draft using determined.", determineSessionFileForSwap(false)))
    {
      if (localRecordingFile2 != null)
        this.mRecorder.onResume("Resume draft", true);
      return;
    }
  }

  public void reverseFrames()
  {
    if (this.mRecorder != null)
      this.mRecorder.reverseFrames();
  }

  public void saveSession()
  {
    if (this.mRecorder != null)
    {
      FlurryUtils.trackSaveSession("saveNoQuit");
      this.mRecorder.saveSession(null, true);
    }
  }

  public void saveSessionAndQuit()
  {
    if (this.mRecorder != null)
    {
      FlurryUtils.trackSaveSession("quit");
      this.mRecorder.saveSession(new Runnable()
      {
        public void run()
        {
          FragmentActivity localFragmentActivity = RecordingFragment.this.getActivity();
          if (localFragmentActivity != null)
            localFragmentActivity.finish();
        }
      }
      , true);
    }
  }

  public void setDiscardChangesOnStop()
  {
    if (this.mRecorder != null)
      this.mRecorder.setDiscardChanges(true);
  }

  public void setFileFileToUse(RecordingFile paramRecordingFile)
  {
    this.mFileFileToUse = paramRecordingFile;
  }

  public void setStartWithEdit(boolean paramBoolean)
  {
    this.mStartWithEdit = paramBoolean;
  }

  public void startDrafts(boolean paramBoolean)
  {
    SLog.d("Start Drafts: {}.", Boolean.valueOf(paramBoolean));
    if (paramBoolean)
    {
      FlurryUtils.trackSaveSession("drafts");
      this.mRecorder.saveSession(this.mStartDraftsRunnable, false);
      return;
    }
    this.mFileFileToUse = null;
    this.mRecorder.stopAndDiscardChanges("StartDrafts", this.mStartDraftsRunnable, false);
  }

  public void swapFolder(String paramString, File paramFile)
  {
    this.mFolder = paramFile;
    if (this.mRecorder != null)
    {
      setFileFileToUse(null);
      this.mRecorder.swapSession(paramString + " swap", determineSessionFileForSwap(false));
      this.mRecorder.onResume("Swap folder", true);
    }
  }

  public static class OnRecordingFinishRunnable
    implements Runnable
  {
    private WeakReference<RecordingFragment> mFragment;

    public OnRecordingFinishRunnable(WeakReference<RecordingFragment> paramWeakReference)
    {
      this.mFragment = paramWeakReference;
    }

    public void run()
    {
      RecordingFragment localRecordingFragment = (RecordingFragment)this.mFragment.get();
      if ((localRecordingFragment != null) && (localRecordingFragment.mRecorder.finalFile != null))
        localRecordingFragment.notifyActivity("OnRecordingFinishRunnable", localRecordingFragment.mRecorder.detectedInvalidSession);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.RecordingFragment
 * JD-Core Version:    0.6.2
 */