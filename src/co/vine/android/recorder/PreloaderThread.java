package co.vine.android.recorder;

import android.content.Context;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import java.lang.ref.WeakReference;

public class PreloaderThread extends Thread
{
  private final WeakReference<Context> mContext;

  public PreloaderThread(Context paramContext)
  {
    this.mContext = new WeakReference(paramContext);
  }

  public void run()
  {
    long l = System.nanoTime();
    Context localContext = (Context)this.mContext.get();
    if (localContext != null);
    try
    {
      VineFFmpegFrameRecorder.tryLoad(localContext);
      opencv_core.IplImage.create(480, 480, 8, 4);
      EncoderManager.tryLoad();
      RecordConfigUtils.setLoadWasEverSuccessful(localContext, true);
      SLog.d("Loading took {} ms.", Long.valueOf((System.nanoTime() - l) / 1000000L));
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
      {
        CrashUtil.logException(localThrowable, "Failed to load", new Object[0]);
        RecordConfigUtils.setLoadWasEverSuccessful(localContext, false);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.PreloaderThread
 * JD-Core Version:    0.6.2
 */