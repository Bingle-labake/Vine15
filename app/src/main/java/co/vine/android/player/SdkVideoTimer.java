package co.vine.android.player;

import android.media.MediaPlayer;
import android.os.Handler;
import com.edisonwang.android.slog.SLog;
import java.util.Timer;
import java.util.TimerTask;

public class SdkVideoTimer
{
  public static final int HEAD_CUT = 0;
  public static final int INTERVAL = 50;
  public static final int TAIL_CUT = 250;
  private final Timer mTimer = new Timer("VideoTimer");

  public void release()
  {
    this.mTimer.cancel();
    this.mTimer.purge();
  }

  public void start(HasVideoPlayerViewController paramHasVideoPlayerViewController)
  {
    this.mTimer.schedule(new SdkVideoTimerTask(paramHasVideoPlayerViewController), 10L, 50L);
  }

  public static abstract interface HasVideoPlayerViewController
  {
    public abstract SdkVideoView getLastPlayer();
  }

  private static class SdkVideoTimerTask extends TimerTask
    implements Runnable
  {
    private final SdkVideoTimer.HasVideoPlayerViewController mController;
    private final Handler mHandler = new Handler();

    public SdkVideoTimerTask(SdkVideoTimer.HasVideoPlayerViewController paramHasVideoPlayerViewController)
    {
      this.mController = paramHasVideoPlayerViewController;
    }

    public void run()
    {
      SdkVideoView localSdkVideoView = this.mController.getLastPlayer();
      if ((localSdkVideoView != null) && (localSdkVideoView.isInPlaybackState()))
        try
        {
          int i = localSdkVideoView.getDuration();
          if (i < 0)
            return;
          if ((localSdkVideoView.getCurrentPosition() > 0) && (i - localSdkVideoView.getCurrentPosition() < 250))
          {
            SLog.d("Restart.");
            this.mHandler.post(new Runnable()
            {
              public void run()
              {
                SdkVideoView localSdkVideoView = SdkVideoTimer.SdkVideoTimerTask.this.mController.getLastPlayer();
                if ((localSdkVideoView != null) && (localSdkVideoView.getVisibility() != 0))
                  localSdkVideoView.setVisibility(0);
              }
            });
            try
            {
              MediaPlayer localMediaPlayer = localSdkVideoView.getMediaPlayer();
              if ((localMediaPlayer != null) && (localMediaPlayer.isPlaying()))
              {
                localMediaPlayer.pause();
                localMediaPlayer.seekTo(0);
                localMediaPlayer.start();
                return;
              }
            }
            catch (Exception localException)
            {
            }
          }
        }
        catch (IllegalStateException localIllegalStateException)
        {
        }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.player.SdkVideoTimer
 * JD-Core Version:    0.6.2
 */