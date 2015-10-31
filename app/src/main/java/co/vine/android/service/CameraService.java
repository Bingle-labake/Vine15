package co.vine.android.service;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import co.vine.android.recorder.PreloaderThread;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.VineFFmpegFrameRecorder;
import co.vine.android.recorder.VineFFmpegFrameRecorder.Exception;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;

public class CameraService extends Service
{
  public static boolean IS_RUNNING = false;
  private VineFFmpegFrameRecorder mVineRecorder;

  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    IS_RUNNING = true;
  }

  public void onDestroy()
  {
    super.onDestroy();
    IS_RUNNING = false;
    if (this.mVineRecorder != null);
    try
    {
      this.mVineRecorder.release();
      this.mVineRecorder = null;
      return;
    }
    catch (VineFFmpegFrameRecorder.Exception localException)
    {
      SLog.d("Failed to release vine recorder.");
    }
  }

  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    SLog.d("****Loading camera service.******");
    if (RecordConfigUtils.loadWasEverSuccessful(this))
    {
      if (this.mVineRecorder == null);
      try
      {
        new PreloaderThread(this).run();
        this.mVineRecorder = new VineFFmpegFrameRecorder("", 1);
        return 1;
      }
      catch (Throwable localThrowable)
      {
        CrashUtil.logException(localThrowable);
        return 1;
      }
    }
    stopSelf();
    return 1;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.CameraService
 * JD-Core Version:    0.6.2
 */