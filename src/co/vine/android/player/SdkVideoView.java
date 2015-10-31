package co.vine.android.player;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.MediaController;
import android.widget.MediaController.MediaPlayerControl;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.SystemUtil;
import com.edisonwang.android.slog.SLog;
import java.io.IOException;
import java.util.Map;

@TargetApi(14)
public class SdkVideoView extends TextureView
  implements MediaController.MediaPlayerControl, VideoViewInterface
{
  private static final int[] LOCK = new int[0];
  public static final int STATE_ERROR = -1;
  public static final int STATE_IDLE = 0;
  public static final int STATE_PAUSED = 4;
  public static final int STATE_PLAYBACK_COMPLETED = 5;
  public static final int STATE_PLAYING = 3;
  public static final int STATE_PREPARED = 2;
  public static final int STATE_PREPARING = 1;
  private static final String TAG = SdkVideoView.class.getSimpleName();
  private static int currentState;
  private static Uri currentUri;
  private static View currentView;
  private static MediaPlayer singlePlayer = null;
  private final boolean SINGLE_PLAYER;
  private AttributeSet mAttributes;
  private int mAudioSession = 0;
  private boolean mAutoPlayOnPrepared;
  private MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener()
  {
    public void onBufferingUpdate(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt)
    {
      SdkVideoView.access$1302(SdkVideoView.this, paramAnonymousInt);
    }
  };
  private MediaPlayer.OnCompletionListener mCompletionListener = new MediaPlayer.OnCompletionListener()
  {
    public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
    {
      SdkVideoView.this.setCurrentState(5);
      SdkVideoView.access$902(SdkVideoView.this, 5);
      if (SdkVideoView.this.mMediaController != null)
        SdkVideoView.this.mMediaController.hide();
      if (SdkVideoView.this.mOnCompletionListener != null)
        SdkVideoView.this.mOnCompletionListener.onCompletion(SdkVideoView.this.getPlayer());
    }
  };
  private Context mContext;
  private int mCurrentBufferPercentage;
  public int mCurrentState = 0;
  private MediaPlayer.OnErrorListener mErrorListener = new MediaPlayer.OnErrorListener()
  {
    public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      Object[] arrayOfObject = new Object[4];
      arrayOfObject[0] = Integer.valueOf(paramAnonymousInt1);
      arrayOfObject[1] = Integer.valueOf(paramAnonymousInt2);
      arrayOfObject[2] = SdkVideoView.this;
      arrayOfObject[3] = SdkVideoView.this.mPath;
      SLog.d("Error: {}, {}, {}, {}.", arrayOfObject);
      SdkVideoView.this.setCurrentState(-1);
      SdkVideoView.access$902(SdkVideoView.this, -1);
      SdkVideoView.access$1102(SdkVideoView.this, null);
      if (SdkVideoView.this.mMediaController != null)
        SdkVideoView.this.mMediaController.hide();
      if ((SdkVideoView.this.mOnErrorListener != null) && (SdkVideoView.this.mOnErrorListener.onError(SdkVideoView.this.getPlayer(), paramAnonymousInt1, paramAnonymousInt2)));
      return true;
    }
  };
  private boolean mHasNotRetriedBefore;
  private Map<String, String> mHeaders;
  private boolean mIsPrepared;
  private final int[] mLock = new int[0];
  private boolean mLooping;
  private MediaController mMediaController;
  private MediaPlayer mMediaPlayer = null;
  private boolean mMuted = false;
  private MediaPlayer.OnCompletionListener mOnCompletionListener;
  private MediaPlayer.OnErrorListener mOnErrorListener;
  private MediaPlayer.OnInfoListener mOnInfoListener;
  private MediaPlayer.OnPreparedListener mOnPreparedListener;
  private String mPath;
  MediaPlayer.OnPreparedListener mPreparedListener = new MediaPlayer.OnPreparedListener()
  {
    public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
    {
      int i;
      if (SdkVideoView.this.mAutoPlayOnPrepared)
      {
        paramAnonymousMediaPlayer.seekTo(0);
        paramAnonymousMediaPlayer.start();
        SdkVideoView.this.setCurrentState(2);
        SdkVideoView.access$202(SdkVideoView.this, true);
        if (SdkVideoView.this.mOnPreparedListener != null)
          SdkVideoView.this.mOnPreparedListener.onPrepared(SdkVideoView.this.getPlayer());
        if (SdkVideoView.this.mMediaController != null)
          SdkVideoView.this.mMediaController.setEnabled(true);
        SdkVideoView.this.mVideoWidth = paramAnonymousMediaPlayer.getVideoWidth();
        SdkVideoView.this.mVideoHeight = paramAnonymousMediaPlayer.getVideoHeight();
        i = SdkVideoView.this.mSeekWhenPrepared;
        if (i != 0)
          SdkVideoView.this.seekTo(i);
        if ((SdkVideoView.this.mVideoWidth == 0) || (SdkVideoView.this.mVideoHeight == 0))
          break label275;
        if ((SdkVideoView.this.mSurfaceWidth == SdkVideoView.this.mVideoWidth) && (SdkVideoView.this.mSurfaceHeight == SdkVideoView.this.mVideoHeight))
        {
          if (SdkVideoView.this.mTargetState != 3)
            break label229;
          SdkVideoView.this.start();
          if (SdkVideoView.this.mMediaController != null)
            SdkVideoView.this.mMediaController.show();
        }
      }
      label229: 
      while (SdkVideoView.this.mTargetState != 3)
      {
        do
        {
          return;
          paramAnonymousMediaPlayer.seekTo(0);
          break;
        }
        while ((SdkVideoView.this.isPlaying()) || ((i == 0) && (SdkVideoView.this.getCurrentPosition() <= 0)) || (SdkVideoView.this.mMediaController == null));
        SdkVideoView.this.mMediaController.show(0);
        return;
      }
      label275: SdkVideoView.this.start();
    }
  };
  private boolean mReportOpenError;
  private TextureView.SurfaceTextureListener mSHCallback = new TextureView.SurfaceTextureListener()
  {
    public void onSurfaceTextureAvailable(SurfaceTexture paramAnonymousSurfaceTexture, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      SdkVideoView.access$1402(SdkVideoView.this, new Surface(paramAnonymousSurfaceTexture));
      if (SdkVideoView.this.mSurfaceReadyListener == null)
      {
        SdkVideoView.this.openVideo();
        return;
      }
      SdkVideoView.this.mSurfaceReadyListener.onSurfaceTextureAvailable(SdkVideoView.this);
    }

    public boolean onSurfaceTextureDestroyed(SurfaceTexture paramAnonymousSurfaceTexture)
    {
      SdkVideoView.access$1402(SdkVideoView.this, null);
      if (SdkVideoView.this.mMediaController != null)
        SdkVideoView.this.mMediaController.hide();
      SdkVideoView.this.release(true);
      return true;
    }

    public void onSurfaceTextureSizeChanged(SurfaceTexture paramAnonymousSurfaceTexture, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      SdkVideoView.access$702(SdkVideoView.this, paramAnonymousInt1);
      SdkVideoView.access$802(SdkVideoView.this, paramAnonymousInt2);
      int i;
      if (SdkVideoView.this.mTargetState == 3)
      {
        i = 1;
        if ((SdkVideoView.this.mVideoWidth != paramAnonymousInt1) || (SdkVideoView.this.mVideoHeight != paramAnonymousInt2))
          break label115;
      }
      label115: for (int j = 1; ; j = 0)
      {
        if ((SdkVideoView.this.getPlayer() != null) && (i != 0) && (j != 0))
        {
          if (SdkVideoView.this.mSeekWhenPrepared != 0)
            SdkVideoView.this.seekTo(SdkVideoView.this.mSeekWhenPrepared);
          SdkVideoView.this.start();
        }
        return;
        i = 0;
        break;
      }
    }

    public void onSurfaceTextureUpdated(SurfaceTexture paramAnonymousSurfaceTexture)
    {
      SdkVideoView.access$1402(SdkVideoView.this, new Surface(paramAnonymousSurfaceTexture));
      if ((SdkVideoView.this.getPlayer() != null) && (SdkVideoView.this.mTargetState == 3))
      {
        if (SdkVideoView.this.mSeekWhenPrepared != 0)
          SdkVideoView.this.seekTo(SdkVideoView.this.mSeekWhenPrepared);
        SdkVideoView.this.start();
      }
    }
  };
  private int mSeekWhenPrepared;
  MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener()
  {
    public void onVideoSizeChanged(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      SdkVideoView.this.mVideoWidth = paramAnonymousMediaPlayer.getVideoWidth();
      SdkVideoView.this.mVideoHeight = paramAnonymousMediaPlayer.getVideoHeight();
      if ((SdkVideoView.this.mVideoWidth != 0) && (SdkVideoView.this.mVideoHeight != 0))
        SdkVideoView.this.requestLayout();
    }
  };
  private int mSurfaceHeight;
  private Surface mSurfaceHolder;
  private SurfaceReadyListener mSurfaceReadyListener;
  private int mSurfaceWidth;
  private Object mTag;
  private int mTargetState = 0;
  private Uri mUri;
  protected int mVideoHeight;
  protected int mVideoWidth;
  private boolean mWasMuted = false;
  private int playingPosition = -1;

  static
  {
    currentState = 0;
  }

  public SdkVideoView(Context paramContext)
  {
    super(paramContext);
    this.SINGLE_PLAYER = SystemUtil.isSinglePlayerEnabled(paramContext);
    initVideoView();
  }

  public SdkVideoView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.SINGLE_PLAYER = SystemUtil.isSinglePlayerEnabled(paramContext);
    this.mAttributes = paramAttributeSet;
    initVideoView();
  }

  public SdkVideoView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.SINGLE_PLAYER = SystemUtil.isSinglePlayerEnabled(paramContext);
    this.mAttributes = paramAttributeSet;
    initVideoView();
  }

  private void attachMediaController()
  {
    if ((getPlayer() != null) && (this.mMediaController != null))
    {
      this.mMediaController.setMediaPlayer(this);
      if (!(getParent() instanceof View))
        break label60;
    }
    label60: for (Object localObject = (View)getParent(); ; localObject = this)
    {
      this.mMediaController.setAnchorView((View)localObject);
      this.mMediaController.setEnabled(isInPlaybackState());
      return;
    }
  }

  private int getCurrentState()
  {
    if (this.SINGLE_PLAYER)
      return currentState;
    return this.mCurrentState;
  }

  public static Uri getCurrentUri()
  {
    return currentUri;
  }

  private MediaPlayer getPlayer()
  {
    if (this.SINGLE_PLAYER)
      return singlePlayer;
    return this.mMediaPlayer;
  }

  private void initVideoView()
  {
    this.mContext = getContext();
    this.mVideoWidth = 0;
    this.mVideoHeight = 0;
    setSurfaceTextureListener(this.mSHCallback);
    setFocusable(true);
    setFocusableInTouchMode(true);
    requestFocus();
    this.mTargetState = 0;
  }

  private void openVideo()
  {
    synchronized (LOCK)
    {
      currentView = this;
      if (this.mUri == null)
      {
        Log.d(TAG, "mUri  is not ready yet.");
        return;
      }
      if (this.mSurfaceHolder == null)
      {
        Log.d(TAG, "Surface is not ready yet.");
        return;
      }
    }
    Log.d(TAG, "Opening video.");
    Intent localIntent = new Intent("com.android.music.musicservicecommand");
    localIntent.putExtra("command", "pause");
    this.mContext.sendBroadcast(localIntent);
    if ((this.SINGLE_PLAYER) && (singlePlayer == null))
      singlePlayer = new MediaPlayer();
    release(false);
    try
    {
      if (!this.SINGLE_PLAYER)
        setPlayer(new MediaPlayer());
      MediaPlayer localMediaPlayer = getPlayer();
      if (this.mAudioSession != 0)
        localMediaPlayer.setAudioSessionId(this.mAudioSession);
      while (true)
      {
        localMediaPlayer.setOnPreparedListener(this.mPreparedListener);
        localMediaPlayer.setOnVideoSizeChangedListener(this.mSizeChangedListener);
        localMediaPlayer.setOnCompletionListener(this.mCompletionListener);
        localMediaPlayer.setOnErrorListener(this.mErrorListener);
        localMediaPlayer.setOnInfoListener(this.mOnInfoListener);
        localMediaPlayer.setOnBufferingUpdateListener(this.mBufferingUpdateListener);
        this.mCurrentBufferPercentage = 0;
        localMediaPlayer.setDataSource(this.mContext, this.mUri, this.mHeaders);
        localMediaPlayer.setSurface(this.mSurfaceHolder);
        if (this.mLooping)
          localMediaPlayer.setLooping(true);
        setKeepScreenOn(true);
        localMediaPlayer.setAudioStreamType(3);
        if (this.mMuted)
          localMediaPlayer.setVolume(0.0F, 0.0F);
        localMediaPlayer.prepareAsync();
        setCurrentState(1);
        attachMediaController();
        Log.d(TAG, "Successfully prepared the new MediaPlayer.");
        return;
        this.mAudioSession = localMediaPlayer.getAudioSessionId();
      }
    }
    catch (IOException|IllegalArgumentException|IllegalStateException|SecurityException localIOException)
    {
      while (true)
      {
        if (this.mReportOpenError)
        {
          Object[] arrayOfObject = new Object[2];
          arrayOfObject[0] = this.mUri;
          arrayOfObject[1] = this.mTag;
          CrashUtil.logException(localIOException, "Unable to open content {}, {}.", arrayOfObject);
        }
        setCurrentState(-1);
        this.mTargetState = -1;
        this.mErrorListener.onError(getPlayer(), 1, 0);
      }
    }
  }

  // ERROR //
  private void release(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 122	co/vine/android/player/SdkVideoView:mLock	[I
    //   6: astore_3
    //   7: aload_3
    //   8: monitorenter
    //   9: aload_0
    //   10: invokespecial 239	co/vine/android/player/SdkVideoView:getPlayer	()Landroid/media/MediaPlayer;
    //   13: astore 5
    //   15: aload 5
    //   17: ifnull +62 -> 79
    //   20: aload 5
    //   22: invokevirtual 450	android/media/MediaPlayer:isPlaying	()Z
    //   25: ifeq +8 -> 33
    //   28: aload 5
    //   30: invokevirtual 453	android/media/MediaPlayer:stop	()V
    //   33: aload 5
    //   35: invokevirtual 456	android/media/MediaPlayer:reset	()V
    //   38: aload_0
    //   39: getfield 168	co/vine/android/player/SdkVideoView:SINGLE_PLAYER	Z
    //   42: ifne +13 -> 55
    //   45: aload 5
    //   47: invokevirtual 458	android/media/MediaPlayer:release	()V
    //   50: aload_0
    //   51: aconst_null
    //   52: invokespecial 363	co/vine/android/player/SdkVideoView:setPlayer	(Landroid/media/MediaPlayer;)V
    //   55: aload_0
    //   56: iconst_0
    //   57: putfield 229	co/vine/android/player/SdkVideoView:mIsPrepared	Z
    //   60: aload_0
    //   61: iconst_0
    //   62: invokespecial 189	co/vine/android/player/SdkVideoView:setCurrentState	(I)V
    //   65: iload_1
    //   66: ifeq +13 -> 79
    //   69: aload_0
    //   70: iconst_0
    //   71: putfield 118	co/vine/android/player/SdkVideoView:mTargetState	I
    //   74: aload_0
    //   75: aconst_null
    //   76: putfield 197	co/vine/android/player/SdkVideoView:mPath	Ljava/lang/String;
    //   79: aload_0
    //   80: iconst_0
    //   81: invokevirtual 410	co/vine/android/player/SdkVideoView:setKeepScreenOn	(Z)V
    //   84: aload_3
    //   85: monitorexit
    //   86: aload_0
    //   87: monitorexit
    //   88: return
    //   89: astore 4
    //   91: aload_3
    //   92: monitorexit
    //   93: aload 4
    //   95: athrow
    //   96: astore_2
    //   97: aload_0
    //   98: monitorexit
    //   99: aload_2
    //   100: athrow
    //   101: astore 7
    //   103: goto -65 -> 38
    //   106: astore 6
    //   108: goto -75 -> 33
    //
    // Exception table:
    //   from	to	target	type
    //   9	15	89	finally
    //   20	33	89	finally
    //   33	38	89	finally
    //   38	55	89	finally
    //   55	65	89	finally
    //   69	79	89	finally
    //   79	86	89	finally
    //   91	93	89	finally
    //   2	9	96	finally
    //   93	96	96	finally
    //   33	38	101	java/lang/IllegalStateException
    //   20	33	106	java/lang/IllegalStateException
  }

  public static void releaseStaticIfNeeded()
  {
    synchronized (LOCK)
    {
      try
      {
        if (singlePlayer != null)
        {
          singlePlayer.release();
          singlePlayer = null;
        }
        return;
      }
      catch (Exception localException)
      {
        while (true)
          SLog.e("Failed to release static player.", localException);
      }
    }
  }

  private void setCurrentState(int paramInt)
  {
    if (this.SINGLE_PLAYER)
    {
      currentState = paramInt;
      return;
    }
    this.mCurrentState = paramInt;
  }

  private void setPlayer(MediaPlayer paramMediaPlayer)
  {
    if (this.SINGLE_PLAYER)
    {
      singlePlayer = paramMediaPlayer;
      return;
    }
    this.mMediaPlayer = paramMediaPlayer;
  }

  private void setVideoURI(Uri paramUri)
  {
    setVideoURI(paramUri, null);
  }

  private void setVideoURI(Uri paramUri, Map<String, String> paramMap)
  {
    this.mUri = paramUri;
    currentUri = this.mUri;
    this.mHeaders = paramMap;
    this.mSeekWhenPrepared = 0;
    openVideo();
    requestLayout();
    postInvalidate();
  }

  private void stopPlaybackInternal()
  {
    if (getPlayer() != null)
    {
      getPlayer().stop();
      getPlayer().release();
      setPlayer(null);
      setCurrentState(0);
      this.mTargetState = 0;
    }
  }

  private void toggleMediaControlsVisibility()
  {
    if (this.mMediaController.isShowing())
    {
      this.mMediaController.hide();
      return;
    }
    this.mMediaController.show();
  }

  public boolean canPause()
  {
    return this.mIsPrepared;
  }

  public boolean canSeekBackward()
  {
    return this.mIsPrepared;
  }

  public boolean canSeekForward()
  {
    return this.mIsPrepared;
  }

  public AttributeSet getAttributes()
  {
    return this.mAttributes;
  }

  public int getAudioSessionId()
  {
    if (this.mAudioSession == 0)
    {
      MediaPlayer localMediaPlayer = new MediaPlayer();
      this.mAudioSession = localMediaPlayer.getAudioSessionId();
      localMediaPlayer.release();
    }
    return this.mAudioSession;
  }

  public int getBufferPercentage()
  {
    if (getPlayer() != null)
      return this.mCurrentBufferPercentage;
    return 0;
  }

  public int getCurrentPosition()
  {
    try
    {
      if ((isInPlaybackState()) && (getPlayer() != null))
      {
        int i = getPlayer().getCurrentPosition();
        return i;
      }
    }
    catch (Exception localException)
    {
      return -1;
    }
    return 0;
  }

  public int getDuration()
  {
    int i = -1;
    try
    {
      MediaPlayer localMediaPlayer = getPlayer();
      if ((isInPlaybackState()) && (localMediaPlayer != null))
      {
        int j = localMediaPlayer.getDuration();
        i = j;
      }
      return i;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException, "It's ok. probably a race condition.", new Object[0]);
    }
    return i;
  }

  public MediaPlayer getMediaPlayer()
  {
    return getPlayer();
  }

  public String getPath()
  {
    return this.mPath;
  }

  public int getPlayingPosition()
  {
    return this.playingPosition;
  }

  public boolean hasControlOfPlayer()
  {
    return (!this.SINGLE_PLAYER) || ((currentView == this) && (currentUri == this.mUri));
  }

  public boolean hasStarted()
  {
    return isInPlaybackState();
  }

  public boolean isInPlaybackState()
  {
    return (getPlayer() != null) && (getCurrentState() != -1) && (getCurrentState() != 0) && (getCurrentState() != 1);
  }

  public boolean isPathPlaying(String paramString)
  {
    return (hasControlOfPlayer()) && (paramString.equals(this.mPath));
  }

  public boolean isPaused()
  {
    return getCurrentState() == 4;
  }

  public boolean isPlaying()
  {
    try
    {
      boolean bool1 = isInPlaybackState();
      boolean bool2 = false;
      if (bool1)
      {
        boolean bool3 = getPlayer().isPlaying();
        bool2 = false;
        if (bool3)
          bool2 = true;
      }
      return bool2;
    }
    catch (Exception localException)
    {
    }
    return false;
  }

  public boolean isSurfaceReady()
  {
    return this.mSurfaceHolder != null;
  }

  protected void onDetachedFromWindow()
  {
    SurfaceTexture localSurfaceTexture;
    boolean bool;
    try
    {
      super.onDetachedFromWindow();
      return;
    }
    catch (Exception localException1)
    {
      localSurfaceTexture = null;
      bool = true;
    }
    try
    {
      localSurfaceTexture = getSurfaceTexture();
      if (localSurfaceTexture != null)
        localSurfaceTexture.release();
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Boolean.valueOf(bool);
      arrayOfObject[1] = localSurfaceTexture;
      CrashUtil.logException(localException1, "Failed to detach from window, but it's ok, since we won't use this anyways: {}, {}.", arrayOfObject);
      return;
    }
    catch (Exception localException2)
    {
      while (true)
      {
        CrashUtil.log("Failed to release: {}.", new Object[] { localException2 });
        bool = false;
      }
    }
  }

  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(SdkVideoView.class.getName());
  }

  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(SdkVideoView.class.getName());
  }

  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    int i;
    if ((paramInt != 4) && (paramInt != 24) && (paramInt != 25) && (paramInt != 164) && (paramInt != 82) && (paramInt != 5) && (paramInt != 6))
    {
      i = 1;
      if ((!isInPlaybackState()) || (i == 0) || (this.mMediaController == null))
        break label182;
      if ((paramInt != 79) && (paramInt != 85))
        break label114;
      if (!getPlayer().isPlaying())
        break label101;
      pause();
      this.mMediaController.show();
    }
    label101: label114: 
    do
    {
      do
      {
        return true;
        i = 0;
        break;
        start();
        this.mMediaController.hide();
        return true;
        if (paramInt != 126)
          break label143;
      }
      while (getPlayer().isPlaying());
      start();
      this.mMediaController.hide();
      return true;
      if ((paramInt != 86) && (paramInt != 127))
        break label178;
    }
    while (!getPlayer().isPlaying());
    label143: pause();
    this.mMediaController.show();
    return true;
    label178: toggleMediaControlsVisibility();
    label182: return super.onKeyDown(paramInt, paramKeyEvent);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = getDefaultSize(this.mVideoWidth, paramInt1);
    int j = getDefaultSize(this.mVideoHeight, paramInt2);
    if ((this.mVideoWidth > 0) && (this.mVideoHeight > 0))
    {
      if (j * this.mVideoWidth <= i * this.mVideoHeight)
        break label70;
      j = i * this.mVideoHeight / this.mVideoWidth;
    }
    while (true)
    {
      setMeasuredDimension(i, j);
      return;
      label70: if (j * this.mVideoWidth < i * this.mVideoHeight)
        i = j * this.mVideoWidth / this.mVideoHeight;
    }
  }

  public void onPrepared()
  {
    if ((isInPlaybackState()) && (this.mCurrentState == 2))
    {
      MediaPlayer localMediaPlayer = getMediaPlayer();
      if (localMediaPlayer != null)
        this.mOnPreparedListener.onPrepared(localMediaPlayer);
    }
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (this.mMediaController != null))
      toggleMediaControlsVisibility();
    return false;
  }

  public boolean onTrackballEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (this.mMediaController != null))
      toggleMediaControlsVisibility();
    return false;
  }

  public void pause()
  {
    if ((isInPlaybackState()) && (getPlayer().isPlaying()))
    {
      getPlayer().pause();
      setCurrentState(4);
    }
    this.mTargetState = 4;
  }

  public void releaseSurface()
  {
    if (this.mSurfaceHolder != null)
    {
      this.mSurfaceHolder.release();
      this.mSurfaceHolder = null;
    }
  }

  public void resume()
  {
    if (!this.mMuted);
    for (boolean bool = true; ; bool = false)
    {
      this.mWasMuted = bool;
      setMute(this.mMuted);
      start();
      return;
    }
  }

  public boolean retryOpenVideo(boolean paramBoolean)
  {
    if (!this.mHasNotRetriedBefore);
    for (boolean bool1 = true; ; bool1 = false)
    {
      SLog.d("Retry open video: {}", Boolean.valueOf(bool1));
      boolean bool2;
      if (!paramBoolean)
      {
        boolean bool3 = this.mHasNotRetriedBefore;
        bool2 = false;
        if (bool3);
      }
      else
      {
        this.mHasNotRetriedBefore = true;
        openVideo();
        bool2 = true;
      }
      return bool2;
    }
  }

  public void seekTo(int paramInt)
  {
    if (isInPlaybackState())
    {
      getPlayer().seekTo(paramInt);
      this.mSeekWhenPrepared = 0;
      return;
    }
    this.mSeekWhenPrepared = paramInt;
  }

  public void setAutoPlayOnPrepared(boolean paramBoolean)
  {
    this.mAutoPlayOnPrepared = paramBoolean;
  }

  public void setLooping(boolean paramBoolean)
  {
    this.mLooping = paramBoolean;
  }

  public void setMediaController(MediaController paramMediaController)
  {
    if (this.mMediaController != null)
      this.mMediaController.hide();
    this.mMediaController = paramMediaController;
    attachMediaController();
  }

  public void setMute(boolean paramBoolean)
  {
    this.mMuted = paramBoolean;
    if ((isInPlaybackState()) && (this.mWasMuted != this.mMuted))
    {
      if (!this.mMuted)
        break label48;
      getPlayer().setVolume(0.0F, 0.0F);
    }
    while (true)
    {
      this.mWasMuted = this.mMuted;
      return;
      label48: getPlayer().setVolume(1.0F, 1.0F);
    }
  }

  public void setOnCompletionListener(MediaPlayer.OnCompletionListener paramOnCompletionListener)
  {
    this.mOnCompletionListener = paramOnCompletionListener;
  }

  public void setOnErrorListener(MediaPlayer.OnErrorListener paramOnErrorListener)
  {
    this.mOnErrorListener = paramOnErrorListener;
  }

  public void setOnInfoListener(MediaPlayer.OnInfoListener paramOnInfoListener)
  {
    this.mOnInfoListener = paramOnInfoListener;
  }

  public void setOnPreparedListener(MediaPlayer.OnPreparedListener paramOnPreparedListener)
  {
    this.mOnPreparedListener = paramOnPreparedListener;
  }

  public void setPlayingPosition(int paramInt)
  {
    this.playingPosition = paramInt;
  }

  public void setReportOpenError(boolean paramBoolean)
  {
    this.mReportOpenError = paramBoolean;
  }

  public void setSurfaceReadyListener(SurfaceReadyListener paramSurfaceReadyListener)
  {
    this.mSurfaceReadyListener = paramSurfaceReadyListener;
  }

  public void setTag(Object paramObject)
  {
    this.mTag = paramObject;
  }

  public void setVideoPath(String paramString)
  {
    setVideoPathDirect(paramString);
  }

  public void setVideoPathDirect(String paramString)
  {
    this.mPath = paramString;
    setVideoURI(Uri.parse(paramString));
  }

  public void start()
  {
    if (getVisibility() != 0)
      setVisibility(0);
    if (isInPlaybackState())
    {
      getPlayer().start();
      setCurrentState(3);
    }
    this.mTargetState = 3;
  }

  public void startOpenVideo()
  {
    openVideo();
  }

  public void stopPlayback()
  {
    if (this.SINGLE_PLAYER)
      synchronized (LOCK)
      {
        stopPlaybackInternal();
        return;
      }
    stopPlaybackInternal();
  }

  public void suspend()
  {
    release(false);
  }

  public static abstract interface SurfaceReadyListener
  {
    public abstract void onSurfaceTextureAvailable(SdkVideoView paramSdkVideoView);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.SdkVideoView
 * JD-Core Version:    0.6.2
 */