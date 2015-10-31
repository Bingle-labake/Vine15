package co.vine.android.lifevibes;

import android.os.Build.VERSION;
import co.vine.android.recorder.EncoderManager.Encoder;
import co.vine.android.recorder.EncoderManager.EncoderBoss;
import co.vine.android.recorder.EncoderManager.EncodingException;
import com.lifevibes.videoeditor.MediaVideoItem;
import com.lifevibes.videoeditor.VideoEditor;
import com.lifevibes.videoeditor.VideoEditor.ExportProgressListener;
import com.lifevibes.videoeditor.VideoEditorFactory;
import java.io.File;
import java.util.ArrayList;
import org.apache.commons.io.FileUtils;

public class LifeVibesTranscoder
  implements EncoderManager.Encoder, VideoEditor.ExportProgressListener
{
  private int mProgress;

  static
  {
    switch (Build.VERSION.SDK_INT)
    {
    default:
      System.loadLibrary("lifevibes_sw_JB");
      return;
    case 14:
    case 15:
    }
    System.loadLibrary("lifevibes_sw_ICS");
  }

  public void onProgress(VideoEditor paramVideoEditor, String paramString, int paramInt)
  {
    this.mProgress = paramInt;
  }

  public void transcode(EncoderManager.EncoderBoss paramEncoderBoss, String paramString1, String paramString2, ArrayList<Integer> paramArrayList)
    throws EncoderManager.EncodingException
  {
    Object localObject1 = new File(paramString1);
    boolean bool = paramString1.endsWith(".mp4");
    File localFile1 = null;
    if (!bool)
    {
      localFile1 = new File(paramString1);
      File localFile2 = new File(paramString1 + "_t.mp4");
      ((File)localObject1).renameTo(localFile2);
      paramString1 = localFile2.getAbsolutePath();
      localObject1 = localFile2;
    }
    try
    {
      File localFile3 = new File(((File)localObject1).getParentFile(), "temp");
      FileUtils.forceMkdir(localFile3);
      VideoEditor localVideoEditor = VideoEditorFactory.create(localFile3.getAbsolutePath());
      localVideoEditor.addMediaItem(new MediaVideoItem(localVideoEditor, ((File)localObject1).getName(), paramString1, 0));
      localVideoEditor.setAspectRatio(6);
      localVideoEditor.export(paramString2, 480, 1500000, 2, 4, this);
      while (this.mProgress != 100)
      {
        if (paramEncoderBoss.isCancelled())
          localVideoEditor.cancelExport(paramString2);
        paramEncoderBoss.updateLastProcess(this.mProgress);
        Thread.sleep(1000L);
      }
    }
    catch (Exception localException)
    {
      throw new EncoderManager.EncodingException(localException);
    }
    finally
    {
      if (localFile1 != null)
        ((File)localObject1).renameTo(localFile1);
    }
    if (localFile1 != null)
      ((File)localObject1).renameTo(localFile1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.lifevibes.LifeVibesTranscoder
 * JD-Core Version:    0.6.2
 */