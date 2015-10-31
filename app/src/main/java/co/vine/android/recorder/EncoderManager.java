package co.vine.android.recorder;

import co.vine.android.lifevibes.LifeVibesTranscoder;
import com.edisonwang.android.slog.SLog;
import java.util.ArrayList;

public class EncoderManager
{
  public static void transcode(EncoderBoss paramEncoderBoss, String paramString1, String paramString2, ArrayList<Integer> paramArrayList)
    throws EncoderManager.EncodingException
  {
    SLog.d("Start transcoding from {} to {}.", paramString1, paramString2);
    new LifeVibesTranscoder().transcode(paramEncoderBoss, paramString1, paramString2, paramArrayList);
  }

  public static void tryLoad()
  {
    new LifeVibesTranscoder();
  }

  public static abstract interface Encoder
  {
    public abstract void transcode(EncoderManager.EncoderBoss paramEncoderBoss, String paramString1, String paramString2, ArrayList<Integer> paramArrayList)
      throws EncoderManager.EncodingException;
  }

  public static abstract interface EncoderBoss
  {
    public abstract boolean isCancelled();

    public abstract void updateLastProcess(int paramInt);

    public abstract void updateProgress(int paramInt);
  }

  public static class EncodingException extends Exception
  {
    public EncodingException(Exception paramException)
    {
      super();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.EncoderManager
 * JD-Core Version:    0.6.2
 */