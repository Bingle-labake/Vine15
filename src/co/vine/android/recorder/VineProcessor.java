package co.vine.android.recorder;

import co.vine.android.VineException;
import java.util.HashMap;
import java.util.List;

public class VineProcessor
{
  private final Processor mProcessor;

  public VineProcessor(String paramString)
    throws VineException
  {
    try
    {
      this.mProcessor = new Processor(paramString);
      return;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
    {
      throw new VineException(localUnsatisfiedLinkError);
    }
  }

  public int combineVideoAndAudio(String paramString1, String paramString2, String paramString3)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).addInputPath(paramString2).setMap("0:0").setMap("1:0").setCopy().enableOverwrite().processToOutput(paramString3);
  }

  public int combineVideoAndAudio(String paramString1, String paramString2, String paramString3, HashMap<String, String> paramHashMap)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).addInputPath(paramString2).setMap("0:0").setMap("1:0").setCopy().setMetaData(paramHashMap).enableOverwrite().processToOutput(paramString3);
  }

  public int concat(List<String> paramList, String paramString, HashMap<String, String> paramHashMap)
  {
    StringBuilder localStringBuilder = new StringBuilder("concat:");
    int i = -1 + paramList.size();
    for (int j = 0; j < i; j++)
    {
      localStringBuilder.append((String)paramList.get(j));
      localStringBuilder.append("|");
    }
    localStringBuilder.append((String)paramList.get(i));
    return this.mProcessor.newCommand().addInputPath(localStringBuilder.toString()).setCopy().setBsfA("aac_adtstoasc").enableOverwrite().setMetaData(paramHashMap).processToOutput(paramString);
  }

  public int cropTo480(String paramString1, String paramString2)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setAudioCopy().filterCrop(480, 480).enableOverwrite().processToOutput(paramString2);
  }

  public int cropTo480andRotate(String paramString1, String paramString2)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setAudioCopy().filterCrop(480, 480).filterRotation(Processor.Rotation.NO_FLIP_90_CLOCKWISE).enableOverwrite().processToOutput(paramString2);
  }

  public int getImageForFrame(String paramString1, long paramLong, int paramInt1, int paramInt2, String paramString2)
  {
    return this.mProcessor.newCommand().setStart(paramLong).addInputPath(paramString1).setVFrames(1).setFormat("image2").enableOverwrite().processToOutput(paramString2);
  }

  public void init()
  {
    this.mProcessor.process(new String[] { "ffmpeg", "-h" });
  }

  public int rotate(String paramString1, String paramString2)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setAudioCopy().filterRotation(Processor.Rotation.NO_FLIP_90_CLOCKWISE).enableOverwrite().processToOutput(paramString2);
  }

  public int setMetadata(String paramString1, String paramString2, HashMap<String, String> paramHashMap)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setCopy().setMetaData(paramHashMap).enableOverwrite().processToOutput(paramString2);
  }

  public int split(String paramString1, RelativeTime paramRelativeTime, String paramString2, int paramInt)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setStart(paramRelativeTime.start).setFrames(paramRelativeTime.getDuration(paramInt), paramInt).setVideoCopy().setAudioCopy().enableOverwrite().processToOutput(paramString2);
  }

  public int splitTs(String paramString1, RelativeTime paramRelativeTime, String paramString2, int paramInt)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setStart(paramRelativeTime.start).setFrames(paramRelativeTime.getDuration(paramInt), paramInt).setCopy().setBsfV("h264_mp4toannexb").setFormat("mpegts").enableOverwrite().processToOutput(paramString2);
  }

  public int toH264(String paramString1, Processor.Preset paramPreset, String paramString2, HashMap<String, String> paramHashMap)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).useX264().setPreset(paramPreset).setAudioCopy().setMetaData(paramHashMap).enableOverwrite().processToOutput(paramString2);
  }

  public int toTs(String paramString1, String paramString2)
  {
    return this.mProcessor.newCommand().addInputPath(paramString1).setCopy().setBsfV("h264_mp4toannexb").setFormat("mpegts").enableOverwrite().processToOutput(paramString2);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.VineProcessor
 * JD-Core Version:    0.6.2
 */