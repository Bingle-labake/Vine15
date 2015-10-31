package co.vine.android.recorder;

import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

public final class Processor
{
  private ArrayList<String> mCommand;
  private ArrayList<String> mFilters;
  private final FFmpegInvoke mInvoker;
  private HashMap<String, String> mMetaData;
  private final int mNumCores;

  static
  {
    System.loadLibrary("ffmpeginvoke");
  }

  public Processor(String paramString)
  {
    this.mInvoker = new FFmpegInvoke(paramString);
    this.mNumCores = getNumCores();
  }

  private static int getNumCores()
  {
    try
    {
      int i = new File("/sys/devices/system/cpu/").listFiles(new FileFilter()
      {
        public boolean accept(File paramAnonymousFile)
        {
          return Pattern.matches("cpu[0-9]", paramAnonymousFile.getName());
        }
      }).length;
      return i;
    }
    catch (Exception localException)
    {
    }
    return 1;
  }

  public Processor addInputPath(String paramString)
  {
    this.mCommand.add("-i");
    this.mCommand.add(paramString);
    return this;
  }

  public Processor addMetaData(String paramString1, String paramString2)
  {
    this.mMetaData.put(paramString1, paramString2);
    return this;
  }

  public Processor enableOverwrite()
  {
    this.mCommand.add("-y");
    return this;
  }

  public Processor enableShortest()
  {
    this.mCommand.add("-shortest");
    return this;
  }

  public Processor filterCrop(int paramInt1, int paramInt2)
  {
    this.mFilters.add("crop=" + paramInt1 + ":" + paramInt2);
    return this;
  }

  public Processor filterRotation(Rotation paramRotation)
  {
    this.mFilters.add("transpose=" + paramRotation.ordinal());
    return this;
  }

  public Processor newCommand()
  {
    this.mMetaData = new HashMap();
    this.mFilters = new ArrayList();
    this.mCommand = new ArrayList();
    this.mCommand.add("ffmpeg");
    return this;
  }

  public int process(String[] paramArrayOfString)
  {
    return this.mInvoker.run(paramArrayOfString);
  }

  public int processToOutput(String paramString)
  {
    if (this.mFilters.size() > 0)
    {
      this.mCommand.add("-vf");
      StringBuilder localStringBuilder = new StringBuilder();
      Iterator localIterator3 = this.mFilters.iterator();
      while (localIterator3.hasNext())
      {
        localStringBuilder.append((String)localIterator3.next());
        localStringBuilder.append(",");
      }
      String str2 = localStringBuilder.toString();
      this.mCommand.add(str2.substring(0, -1 + str2.length()));
    }
    Iterator localIterator1 = this.mMetaData.keySet().iterator();
    while (localIterator1.hasNext())
    {
      String str1 = (String)localIterator1.next();
      this.mCommand.add("-metadata");
      this.mCommand.add(str1 + "=" + "\"" + (String)this.mMetaData.get(str1) + "\"");
    }
    if (this.mNumCores > 1);
    this.mCommand.add(paramString);
    Iterator localIterator2 = this.mCommand.iterator();
    while (localIterator2.hasNext())
      SLog.d("Add arg '{}'", (String)localIterator2.next());
    return process((String[])this.mCommand.toArray(new String[this.mCommand.size()]));
  }

  public Processor setAudioCopy()
  {
    this.mCommand.add("-acodec");
    this.mCommand.add("copy");
    return this;
  }

  public Processor setBsfA(String paramString)
  {
    this.mCommand.add("-bsf:a");
    this.mCommand.add(paramString);
    return this;
  }

  public Processor setBsfV(String paramString)
  {
    this.mCommand.add("-bsf:v");
    this.mCommand.add(paramString);
    return this;
  }

  public Processor setCopy()
  {
    this.mCommand.add("-c");
    this.mCommand.add("copy");
    return this;
  }

  public Processor setFormat(String paramString)
  {
    this.mCommand.add("-f");
    this.mCommand.add(paramString);
    return this;
  }

  public Processor setFrames(long paramLong, int paramInt)
  {
    this.mCommand.add("-vframes");
    this.mCommand.add(String.valueOf((int)(paramLong / 1000.0D * paramInt)));
    return this;
  }

  public Processor setMap(String paramString)
  {
    this.mCommand.add("-map");
    this.mCommand.add(paramString);
    return this;
  }

  public Processor setMetaData(HashMap<String, String> paramHashMap)
  {
    this.mMetaData = paramHashMap;
    return this;
  }

  public Processor setPreset(Preset paramPreset)
  {
    this.mCommand.add("-preset");
    this.mCommand.add(paramPreset.name().toLowerCase(Locale.US));
    return this;
  }

  public Processor setShortest()
  {
    this.mCommand.add("-shortest");
    return this;
  }

  public Processor setSize(int paramInt1, int paramInt2)
  {
    this.mCommand.add("-s");
    this.mCommand.add("" + paramInt1 + "x" + paramInt2);
    return this;
  }

  public Processor setStart(long paramLong)
  {
    this.mCommand.add("-ss");
    this.mCommand.add(String.valueOf(paramLong / 1000.0D));
    return this;
  }

  public Processor setTotalDuration(long paramLong)
  {
    this.mCommand.add("-t");
    this.mCommand.add(String.valueOf(paramLong / 1000.0D));
    return this;
  }

  public Processor setVFrames(int paramInt)
  {
    this.mCommand.add("-vframes");
    this.mCommand.add(String.valueOf(paramInt));
    return this;
  }

  public Processor setVideoCopy()
  {
    this.mCommand.add("-vcodec");
    this.mCommand.add("copy");
    return this;
  }

  public Processor useMjpeg()
  {
    this.mCommand.add("-vcodec");
    this.mCommand.add("mjpeg");
    return this;
  }

  public Processor useX264()
  {
    this.mCommand.add("-vcodec");
    this.mCommand.add("libx264");
    return this;
  }

  public static enum Preset
  {
    static
    {
      SUPERFAST = new Preset("SUPERFAST", 1);
      VERYFAST = new Preset("VERYFAST", 2);
      FASTER = new Preset("FASTER", 3);
      FAST = new Preset("FAST", 4);
      MEDIUM = new Preset("MEDIUM", 5);
      SLOW = new Preset("SLOW", 6);
      SLOWER = new Preset("SLOWER", 7);
      Preset[] arrayOfPreset = new Preset[8];
      arrayOfPreset[0] = ULTRAFAST;
      arrayOfPreset[1] = SUPERFAST;
      arrayOfPreset[2] = VERYFAST;
      arrayOfPreset[3] = FASTER;
      arrayOfPreset[4] = FAST;
      arrayOfPreset[5] = MEDIUM;
      arrayOfPreset[6] = SLOW;
      arrayOfPreset[7] = SLOWER;
    }
  }

  public static enum Rotation
  {
    static
    {
      NO_FLIP_90_CLOCKWISE = new Rotation("NO_FLIP_90_CLOCKWISE", 1);
      NO_FLIP_90_COUNTER_CLOCKWISE = new Rotation("NO_FLIP_90_COUNTER_CLOCKWISE", 2);
      VERTICAL_FLIP_AND_90_CLOCKWISE = new Rotation("VERTICAL_FLIP_AND_90_CLOCKWISE", 3);
      Rotation[] arrayOfRotation = new Rotation[4];
      arrayOfRotation[0] = VERTICAL_FLIP_AND_90_COUNTER_CLOCKWISE;
      arrayOfRotation[1] = NO_FLIP_90_CLOCKWISE;
      arrayOfRotation[2] = NO_FLIP_90_COUNTER_CLOCKWISE;
      arrayOfRotation[3] = VERTICAL_FLIP_AND_90_CLOCKWISE;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.Processor
 * JD-Core Version:    0.6.2
 */