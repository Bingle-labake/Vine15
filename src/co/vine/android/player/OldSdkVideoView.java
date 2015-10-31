package co.vine.android.player;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnBufferingUpdateListener;
import android.media.MediaPlayer.OnCompletionListener;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnInfoListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.media.MediaPlayer.OnVideoSizeChangedListener;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.MediaController;
import android.widget.MediaController.MediaPlayerControl;
import co.vine.android.provider.VineVideoProvider;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import java.io.IOException;

public class OldSdkVideoView extends SurfaceView
  implements MediaController.MediaPlayerControl, VideoViewInterface
{
  private static final int STATE_ERROR = -1;
  private static final int STATE_IDLE = 0;
  private static final int STATE_PAUSED = 4;
  private static final int STATE_PLAYBACK_COMPLETED = 5;
  private static final int STATE_PLAYING = 3;
  private static final int STATE_PREPARED = 2;
  private static final int STATE_PREPARING = 1;
  private int mAudioSession;
  private boolean mAutoPlay;
  private MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener()
  {
    public void onBufferingUpdate(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt)
    {
      OldSdkVideoView.access$1902(OldSdkVideoView.this, paramAnonymousInt);
    }
  };
  private boolean mCanPause;
  private boolean mCanSeekBack;
  private boolean mCanSeekForward;
  private MediaPlayer.OnCompletionListener mCompletionListener = new MediaPlayer.OnCompletionListener()
  {
    public void onCompletion(MediaPlayer paramAnonymousMediaPlayer)
    {
      OldSdkVideoView.access$502(OldSdkVideoView.this, 5);
      OldSdkVideoView.access$1502(OldSdkVideoView.this, 5);
      if (OldSdkVideoView.this.mMediaController != null)
        OldSdkVideoView.this.mMediaController.hide();
      if (OldSdkVideoView.this.mOnCompletionListener != null)
        OldSdkVideoView.this.mOnCompletionListener.onCompletion(OldSdkVideoView.this.mMediaPlayer);
    }
  };
  private int mCurrentBufferPercentage;
  private int mCurrentState = 0;
  private MediaPlayer.OnPreparedListener mCustomOnPreParedListener;
  private MediaPlayer.OnErrorListener mErrorListener = new MediaPlayer.OnErrorListener()
  {
    public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      SLog.d("Error: " + paramAnonymousInt1 + "," + paramAnonymousInt2);
      OldSdkVideoView.access$502(OldSdkVideoView.this, -1);
      OldSdkVideoView.access$1502(OldSdkVideoView.this, -1);
      if (OldSdkVideoView.this.mMediaController != null)
        OldSdkVideoView.this.mMediaController.hide();
      if ((OldSdkVideoView.this.mOnErrorListener != null) && (OldSdkVideoView.this.mOnErrorListener.onError(OldSdkVideoView.this.mMediaPlayer, paramAnonymousInt1, paramAnonymousInt2)))
        return true;
      SLog.e("Cannot play this video.");
      return true;
    }
  };
  private MediaPlayer.OnInfoListener mInfoListener = new MediaPlayer.OnInfoListener()
  {
    public boolean onInfo(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      if (OldSdkVideoView.this.mOnInfoListener != null)
        OldSdkVideoView.this.mOnInfoListener.onInfo(paramAnonymousMediaPlayer, paramAnonymousInt1, paramAnonymousInt2);
      return true;
    }
  };
  private boolean mLooping;
  private MediaController mMediaController;
  private MediaPlayer mMediaPlayer = null;
  private boolean mMuted = false;
  private MediaPlayer.OnCompletionListener mOnCompletionListener;
  private MediaPlayer.OnErrorListener mOnErrorListener;
  private MediaPlayer.OnInfoListener mOnInfoListener;
  private final MediaPlayer.OnPreparedListener mOnPreparedListener = new MediaPlayer.OnPreparedListener()
  {
    public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
    {
      SLog.d("Videoview prepared.");
      if (OldSdkVideoView.this.mAutoPlay)
        paramAnonymousMediaPlayer.start();
      paramAnonymousMediaPlayer.setLooping(OldSdkVideoView.this.mLooping);
      if (OldSdkVideoView.this.mCustomOnPreParedListener != null)
        OldSdkVideoView.this.mCustomOnPreParedListener.onPrepared(paramAnonymousMediaPlayer);
    }
  };
  MediaPlayer.OnPreparedListener mPreparedListener = new MediaPlayer.OnPreparedListener()
  {
    public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
    {
      OldSdkVideoView.access$502(OldSdkVideoView.this, 2);
      OldSdkVideoView.access$602(OldSdkVideoView.this, OldSdkVideoView.access$702(OldSdkVideoView.this, OldSdkVideoView.access$802(OldSdkVideoView.this, true)));
      if (OldSdkVideoView.this.mOnPreparedListener != null)
        OldSdkVideoView.this.mOnPreparedListener.onPrepared(OldSdkVideoView.this.mMediaPlayer);
      if (OldSdkVideoView.this.mMediaController != null)
        OldSdkVideoView.this.mMediaController.setEnabled(true);
      OldSdkVideoView.access$302(OldSdkVideoView.this, paramAnonymousMediaPlayer.getVideoWidth());
      OldSdkVideoView.access$402(OldSdkVideoView.this, paramAnonymousMediaPlayer.getVideoHeight());
      int i = OldSdkVideoView.this.mSeekWhenPrepared;
      if (i != 0)
        OldSdkVideoView.this.seekTo(i);
      if ((OldSdkVideoView.this.mVideoWidth != 0) && (OldSdkVideoView.this.mVideoHeight != 0))
      {
        OldSdkVideoView.this.getHolder().setFixedSize(OldSdkVideoView.this.mVideoWidth, OldSdkVideoView.this.mVideoHeight);
        if ((OldSdkVideoView.this.mSurfaceWidth == OldSdkVideoView.this.mVideoWidth) && (OldSdkVideoView.this.mSurfaceHeight == OldSdkVideoView.this.mVideoHeight))
        {
          if (OldSdkVideoView.this.mTargetState != 3)
            break label248;
          OldSdkVideoView.this.start();
          if (OldSdkVideoView.this.mMediaController != null)
            OldSdkVideoView.this.mMediaController.show();
        }
      }
      label248: 
      while (OldSdkVideoView.this.mTargetState != 3)
      {
        do
          return;
        while ((OldSdkVideoView.this.isPlaying()) || ((i == 0) && (OldSdkVideoView.this.getCurrentPosition() <= 0)) || (OldSdkVideoView.this.mMediaController == null));
        OldSdkVideoView.this.mMediaController.show(0);
        return;
      }
      OldSdkVideoView.this.start();
    }
  };
  private boolean mReportVideoError;
  SurfaceHolder.Callback mSHCallback = new SurfaceHolder.Callback()
  {
    public void surfaceChanged(SurfaceHolder paramAnonymousSurfaceHolder, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
    {
      OldSdkVideoView.access$1302(OldSdkVideoView.this, paramAnonymousInt2);
      OldSdkVideoView.access$1402(OldSdkVideoView.this, paramAnonymousInt3);
      int i;
      if (OldSdkVideoView.this.mTargetState == 3)
      {
        i = 1;
        if ((OldSdkVideoView.this.mVideoWidth != paramAnonymousInt2) || (OldSdkVideoView.this.mVideoHeight != paramAnonymousInt3))
          break label117;
      }
      label117: for (int j = 1; ; j = 0)
      {
        if ((OldSdkVideoView.this.mMediaPlayer != null) && (i != 0) && (j != 0))
        {
          if (OldSdkVideoView.this.mSeekWhenPrepared != 0)
            OldSdkVideoView.this.seekTo(OldSdkVideoView.this.mSeekWhenPrepared);
          OldSdkVideoView.this.start();
        }
        return;
        i = 0;
        break;
      }
    }

    public void surfaceCreated(SurfaceHolder paramAnonymousSurfaceHolder)
    {
      OldSdkVideoView.access$2002(OldSdkVideoView.this, paramAnonymousSurfaceHolder);
      OldSdkVideoView.this.openVideo();
    }

    public void surfaceDestroyed(SurfaceHolder paramAnonymousSurfaceHolder)
    {
      OldSdkVideoView.access$2002(OldSdkVideoView.this, null);
      if (OldSdkVideoView.this.mMediaController != null)
        OldSdkVideoView.this.mMediaController.hide();
      OldSdkVideoView.this.release(true);
    }
  };
  private int mSeekWhenPrepared;
  MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener()
  {
    public void onVideoSizeChanged(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
    {
      OldSdkVideoView.access$302(OldSdkVideoView.this, paramAnonymousMediaPlayer.getVideoWidth());
      OldSdkVideoView.access$402(OldSdkVideoView.this, paramAnonymousMediaPlayer.getVideoHeight());
      if ((OldSdkVideoView.this.mVideoWidth != 0) && (OldSdkVideoView.this.mVideoHeight != 0))
      {
        OldSdkVideoView.this.getHolder().setFixedSize(OldSdkVideoView.this.mVideoWidth, OldSdkVideoView.this.mVideoHeight);
        OldSdkVideoView.this.requestLayout();
      }
    }
  };
  private int mSurfaceHeight;
  private SurfaceHolder mSurfaceHolder = null;
  private int mSurfaceWidth;
  private int mTargetState = 0;
  private Uri mUri;
  private int mVideoHeight;
  private int mVideoWidth;
  private boolean mWasMuted = false;

  public OldSdkVideoView(Context paramContext)
  {
    super(paramContext);
    initVideoView();
  }

  public OldSdkVideoView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
    initVideoView();
  }

  public OldSdkVideoView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initVideoView();
  }

  private void attachMediaController()
  {
    if ((this.mMediaPlayer != null) && (this.mMediaController != null))
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

  private void initVideoView()
  {
    this.mVideoWidth = 0;
    this.mVideoHeight = 0;
    getHolder().addCallback(this.mSHCallback);
    getHolder().setType(3);
    setFocusable(true);
    setFocusableInTouchMode(true);
    requestFocus();
    this.mCurrentState = 0;
    this.mTargetState = 0;
  }

  private boolean isInPlaybackState()
  {
    return (this.mMediaPlayer != null) && (this.mCurrentState != -1) && (this.mCurrentState != 0) && (this.mCurrentState != 1);
  }

  private void openVideo()
  {
    if ((this.mUri == null) || (this.mSurfaceHolder == null))
      return;
    Intent localIntent = new Intent("com.android.music.musicservicecommand");
    localIntent.putExtra("command", "pause");
    getContext().sendBroadcast(localIntent);
    release(false);
    try
    {
      this.mMediaPlayer = new MediaPlayer();
      Context localContext = getContext();
      if (this.mAudioSession != 0)
      {
        this.mMediaPlayer.setAudioSessionId(this.mAudioSession);
        this.mMediaPlayer.setOnPreparedListener(this.mPreparedListener);
        this.mMediaPlayer.setOnVideoSizeChangedListener(this.mSizeChangedListener);
        this.mMediaPlayer.setOnCompletionListener(this.mCompletionListener);
        this.mMediaPlayer.setOnErrorListener(this.mErrorListener);
        this.mMediaPlayer.setOnInfoListener(this.mInfoListener);
        this.mMediaPlayer.setOnBufferingUpdateListener(this.mBufferingUpdateListener);
        this.mCurrentBufferPercentage = 0;
        this.mMediaPlayer.setDataSource(localContext, this.mUri);
        this.mMediaPlayer.setDisplay(this.mSurfaceHolder);
        this.mMediaPlayer.setAudioStreamType(3);
        this.mMediaPlayer.setScreenOnWhilePlaying(true);
        this.mMediaPlayer.prepareAsync();
        if (this.mMuted)
          this.mMediaPlayer.setVolume(0.0F, 0.0F);
        this.mCurrentState = 1;
        attachMediaController();
        return;
      }
    }
    catch (IOException|IllegalArgumentException localIOException)
    {
      while (true)
      {
        if (this.mReportVideoError)
        {
          Object[] arrayOfObject2 = new Object[1];
          arrayOfObject2[0] = this.mUri;
          CrashUtil.logException(localIOException, "Unable to open content {}, {}.", arrayOfObject2);
        }
        this.mCurrentState = -1;
        this.mTargetState = -1;
        this.mErrorListener.onError(this.mMediaPlayer, 1, 0);
        return;
        this.mAudioSession = this.mMediaPlayer.getAudioSessionId();
      }
    }
    catch (IllegalStateException localIllegalStateException)
    {
      this.mCurrentState = -1;
      this.mTargetState = -1;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = this.mUri;
      CrashUtil.logException(localIllegalStateException, "IllegalState error {}, {}.", arrayOfObject1);
    }
  }

  private void release(boolean paramBoolean)
  {
    if (this.mMediaPlayer != null)
    {
      this.mMediaPlayer.reset();
      this.mMediaPlayer.release();
      this.mMediaPlayer = null;
      this.mCurrentState = 0;
      if (paramBoolean)
        this.mTargetState = 0;
    }
  }

  private void toggleMediaControlsVisiblity()
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
    return this.mCanPause;
  }

  public boolean canSeekBackward()
  {
    return this.mCanSeekBack;
  }

  public boolean canSeekForward()
  {
    return this.mCanSeekForward;
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
    if (this.mMediaPlayer != null)
      return this.mCurrentBufferPercentage;
    return 0;
  }

  public int getCurrentPosition()
  {
    if (isInPlaybackState())
      return this.mMediaPlayer.getCurrentPosition();
    return 0;
  }

  public int getDuration()
  {
    if (isInPlaybackState())
      return this.mMediaPlayer.getDuration();
    return -1;
  }

  public boolean hasStarted()
  {
    return isInPlaybackState();
  }

  public boolean isPaused()
  {
    return (isInPlaybackState()) && (!this.mMediaPlayer.isPlaying());
  }

  public boolean isPlaying()
  {
    return (isInPlaybackState()) && (this.mMediaPlayer.isPlaying());
  }

  public boolean isReportErrorOn()
  {
    return this.mReportVideoError;
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
      if (!this.mMediaPlayer.isPlaying())
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
      while (this.mMediaPlayer.isPlaying());
      start();
      this.mMediaController.hide();
      return true;
      if ((paramInt != 86) && (paramInt != 127))
        break label178;
    }
    while (!this.mMediaPlayer.isPlaying());
    label143: pause();
    this.mMediaController.show();
    return true;
    label178: toggleMediaControlsVisiblity();
    label182: return super.onKeyDown(paramInt, paramKeyEvent);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = getDefaultSize(this.mVideoWidth, paramInt1);
    int j = getDefaultSize(this.mVideoHeight, paramInt2);
    int k;
    int m;
    int n;
    int i1;
    if ((this.mVideoWidth > 0) && (this.mVideoHeight > 0))
    {
      k = View.MeasureSpec.getMode(paramInt1);
      m = View.MeasureSpec.getSize(paramInt1);
      n = View.MeasureSpec.getMode(paramInt2);
      i1 = View.MeasureSpec.getSize(paramInt2);
      if ((k != 1073741824) || (n != 1073741824))
        break label149;
      i = m;
      j = i1;
      if (j * this.mVideoWidth >= i * this.mVideoHeight)
        break label117;
      i = j * this.mVideoWidth / this.mVideoHeight;
    }
    label149: 
    while (true)
    {
      setMeasuredDimension(i, j);
      return;
      label117: if (j * this.mVideoWidth > i * this.mVideoHeight)
      {
        j = i * this.mVideoHeight / this.mVideoWidth;
        continue;
        if (k == 1073741824)
        {
          i = m;
          j = i * this.mVideoHeight / this.mVideoWidth;
          if ((n == -2147483648) && (j > i1))
            j = i1;
        }
        else if (n == 1073741824)
        {
          j = i1;
          i = j * this.mVideoWidth / this.mVideoHeight;
          if ((k == -2147483648) && (i > m))
            i = m;
        }
        else
        {
          i = this.mVideoWidth;
          j = this.mVideoHeight;
          if ((n == -2147483648) && (j > i1))
          {
            j = i1;
            i = j * this.mVideoWidth / this.mVideoHeight;
          }
          if ((k == -2147483648) && (i > m))
          {
            i = m;
            j = i * this.mVideoHeight / this.mVideoWidth;
          }
        }
      }
    }
  }

  public void onPrepared()
  {
    if ((isInPlaybackState()) && (this.mCurrentState == 2) && (this.mMediaPlayer != null))
      this.mOnPreparedListener.onPrepared(this.mMediaPlayer);
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (this.mMediaController != null))
      toggleMediaControlsVisiblity();
    return false;
  }

  public boolean onTrackballEvent(MotionEvent paramMotionEvent)
  {
    if ((isInPlaybackState()) && (this.mMediaController != null))
      toggleMediaControlsVisiblity();
    return false;
  }

  public void pause()
  {
    if ((isInPlaybackState()) && (this.mMediaPlayer.isPlaying()))
    {
      this.mMediaPlayer.pause();
      this.mCurrentState = 4;
    }
    this.mTargetState = 4;
  }

  public void removeVideoUri()
  {
    this.mUri = null;
    this.mSeekWhenPrepared = 0;
  }

  public int resolveAdjustedSize(int paramInt1, int paramInt2)
  {
    return getDefaultSize(paramInt1, paramInt2);
  }

  public void resume()
  {
    if (!this.mMuted);
    for (boolean bool = true; ; bool = false)
    {
      this.mWasMuted = bool;
      setMute(this.mMuted);
      if (!isInPlaybackState())
        break;
      this.mMediaPlayer.start();
      return;
    }
    openVideo();
  }

  public void seekTo(int paramInt)
  {
    if (isInPlaybackState())
    {
      this.mMediaPlayer.seekTo(paramInt);
      this.mSeekWhenPrepared = 0;
      return;
    }
    this.mSeekWhenPrepared = paramInt;
  }

  public void setAutoPlayOnPrepared(boolean paramBoolean)
  {
    this.mAutoPlay = paramBoolean;
  }

  public void setLooping(boolean paramBoolean)
  {
    this.mLooping = true;
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
      this.mMediaPlayer.setVolume(0.0F, 0.0F);
    }
    while (true)
    {
      this.mWasMuted = this.mMuted;
      return;
      label48: this.mMediaPlayer.setVolume(1.0F, 1.0F);
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
    this.mCustomOnPreParedListener = paramOnPreparedListener;
  }

  public void setReportOpenVideoError(boolean paramBoolean)
  {
    this.mReportVideoError = paramBoolean;
  }

  public void setVideoPath(String paramString)
  {
    setVideoURI(Uri.parse(VineVideoProvider.CONTENT_AUTHORITY + paramString));
  }

  public void setVideoPathDirect(String paramString)
  {
    setVideoURI(Uri.parse(paramString));
  }

  public void setVideoURI(Uri paramUri)
  {
    this.mUri = paramUri;
    this.mSeekWhenPrepared = 0;
    openVideo();
    requestLayout();
    invalidate();
  }

  public void start()
  {
    if (isInPlaybackState())
    {
      this.mMediaPlayer.start();
      this.mCurrentState = 3;
    }
    this.mTargetState = 3;
  }

  public void stopPlayback()
  {
    if (this.mMediaPlayer != null)
      SLog.d("Playback stopped.");
    try
    {
      this.mMediaPlayer.stop();
      try
      {
        label20: this.mMediaPlayer.reset();
        try
        {
          label27: this.mMediaPlayer.release();
          label34: this.mMediaPlayer = null;
          this.mCurrentState = 0;
          this.mTargetState = 0;
          return;
        }
        catch (IllegalStateException localIllegalStateException3)
        {
          break label34;
        }
      }
      catch (IllegalStateException localIllegalStateException2)
      {
        break label27;
      }
    }
    catch (IllegalStateException localIllegalStateException1)
    {
      break label20;
    }
  }

  public void suspend()
  {
    release(false);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.OldSdkVideoView
 * JD-Core Version:    0.6.2
 */