package co.vine.android.recorder;

import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.graphics.Bitmap.Config;
import android.media.AudioRecord;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore.Images.Media;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.SystemUtil;
import com.edisonwang.android.slog.SLog;
import com.googlecode.javacv.cpp.avcodec.AVPacket;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import org.apache.commons.io.FileUtils;
import org.json.JSONObject;

public class RecordConfigUtils
{
  public static final int AUDIO_BUFFER_SIZE = 0;
  public static final String AUDIO_CONTAINER_FORMAT = "mp4";
  public static final int AUDIO_FORMAT = 16;
  public static final int AUDIO_RUNNABLE_SAMPLE_SIZE = 0;
  public static final int AUDIO_SAMPLE_PER_MS_MAX = 48;
  public static final double AUDIO_SAMPLE_PER_NS_EXACT = 0.0441D;
  public static final int AUDIO_SAMPLE_RATE_HZ = 44100;
  public static final Bitmap.Config DEFAULT_BITMAP_CONFIG;
  public static final int DEFAULT_TARGET_SIZE = 480;
  public static final int EDITING_THUMBNAIL_SIZE_DP = 64;
  public static final String FOLDER_AUDIO = "audio";
  public static final String FOLDER_RAW = "raw";
  public static final String FOLDER_ROOT_PROCESS = "process";
  private static final File FOLDER_ROOT_PROCESS_DEBUG;
  private static final String FOLDER_ROOT_SAVE;
  public static final String FOLDER_ROOT_TO_UPLOAD = "upload";
  public static final int HIGHEST_PROFILE = 4;
  public static final int MAX_DRAFTS = 9;
  public static final int N_AUDIO_CHANNELS = 1;
  public static final int N_IMAGE_CHANNELS = 4;
  public static final int PROGRESS_THRESHOLD = 1000;
  public static final int PROGRESS_TIMER_SLEEP = 35;
  private static final String UPLOAD_IMAGE_EXTENSION = "_image";
  public static final int VIDEO_BIT_RATE = 1000000;
  public static final String VIDEO_CONTAINER_FORMAT = "mp4";
  private static RecordConfig mGenericConfig;

  static
  {
    if (AUDIO_BUFFER_SIZE > 0);
    for (int i = AUDIO_BUFFER_SIZE; ; i = 7680)
    {
      AUDIO_RUNNABLE_SAMPLE_SIZE = i;
      DEFAULT_BITMAP_CONFIG = Bitmap.Config.ARGB_8888;
      FOLDER_ROOT_SAVE = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "Vine").getPath();
      FOLDER_ROOT_PROCESS_DEBUG = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM), "vine_capture");
      return;
    }
  }

  public static File copyForUpload(File paramFile, String paramString1, String paramString2)
    throws IOException
  {
    File localFile1 = new File(paramString1);
    File localFile2 = getUploadFile(paramFile, paramString2);
    FileUtils.copyFile(localFile1, localFile2);
    return localFile2;
  }

  public static boolean copySilently(File paramFile1, File paramFile2)
  {
    try
    {
      FileUtils.copyFile(paramFile1, paramFile2);
      return true;
    }
    catch (Exception localException)
    {
      SLog.e("Failed to copy", localException);
    }
    return false;
  }

  public static void deleteNonFolders(File paramFile)
  {
    if (paramFile.isDirectory())
    {
      File[] arrayOfFile = paramFile.listFiles();
      int i = arrayOfFile.length;
      for (int j = 0; j < i; j++)
        deleteNonFolders(arrayOfFile[j]);
    }
  }

  public static void deletePreProcess(File paramFile)
  {
    deleteNonFolders(new File(paramFile, "process"));
  }

  public static File getCameraRollFile(Context paramContext, long paramLong)
  {
    while (true)
    {
      Object localObject2;
      File localFile2;
      try
      {
        if ("mounted".equals(Environment.getExternalStorageState()))
        {
          File localFile1 = new File(FOLDER_ROOT_SAVE);
          localObject2 = localFile1;
          if (localObject2 == null)
          {
            localFile2 = null;
            return localFile2;
          }
        }
        else
        {
          try
          {
            String[] arrayOfString = { "_id", "_data", "datetaken" };
            Cursor localCursor = paramContext.getContentResolver().query(MediaStore.Images.Media.INTERNAL_CONTENT_URI, arrayOfString, null, null, "datetaken DESC");
            localObject2 = null;
            if (localCursor == null)
              continue;
            boolean bool = localCursor.moveToFirst();
            localObject2 = null;
            if (!bool)
              continue;
            File localFile3 = new File(new File(localCursor.getString(localCursor.getColumnIndexOrThrow("_data"))).getParentFile(), "Vine");
            localObject2 = localFile3;
          }
          catch (Exception localException)
          {
            SLog.e("Failed to get internal path", localException);
            localObject2 = null;
          }
          continue;
        }
      }
      finally
      {
      }
      if ((!((File)localObject2).exists()) && (!((File)localObject2).mkdirs()))
      {
        SLog.d("Failed to make dirs.");
        CrashUtil.logException(new RuntimeException("Failed to make directories. You will be doomed."));
        localFile2 = null;
      }
      else
      {
        String str = new SimpleDateFormat("yyyy_MM_dd_HH_mm_sss").format(Long.valueOf(paramLong));
        localFile2 = new File(((File)localObject2).getPath() + File.separator + str + "." + "mp4");
      }
    }
  }

  public static String getFrameInfoPath(String paramString)
  {
    return paramString + ".info";
  }

  public static RecordConfig getGenericConfig(Context paramContext)
  {
    if (mGenericConfig == null)
      mGenericConfig = new RecordConfig(paramContext);
    return mGenericConfig;
  }

  public static int getMaxAudioBufferSize(RecordConfig paramRecordConfig)
  {
    return (int)(1.1D * (48 * paramRecordConfig.maxDuration));
  }

  public static File getPreProcessFile(RecordConfig paramRecordConfig, String paramString1, String paramString2, String paramString3)
  {
    try
    {
      File localFile = getPreProcessFile(paramRecordConfig.processDir, paramString1, paramString2, paramString3);
      return localFile;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static File getPreProcessFile(File paramFile, String paramString1, String paramString2, String paramString3)
  {
    File localFile1;
    try
    {
      localFile1 = new File(new File(paramFile, "process"), paramString1);
      if ((!localFile1.exists()) && (!localFile1.mkdirs()))
      {
        SLog.d("Failed to make dirs.");
        throw new RuntimeException("Failed to make directories. You will be doomed.");
      }
    }
    finally
    {
    }
    StringBuilder localStringBuilder = new StringBuilder().append(localFile1.getPath()).append(File.separator).append(paramString2);
    if (paramString3 != null);
    for (String str = "." + paramString3; ; str = "")
    {
      File localFile2 = new File(str);
      return localFile2;
    }
  }

  public static String getThumbnailPath(String paramString)
  {
    return paramString + "_image";
  }

  public static int getTimeStampInNsFromSampleCounted(int paramInt)
  {
    return (int)(paramInt / 0.0441D);
  }

  private static File getUploadFile(File paramFile, String paramString)
  {
    File localFile1;
    try
    {
      localFile1 = new File(paramFile, "upload");
      if ((!localFile1.exists()) && (!localFile1.mkdirs()))
      {
        SLog.d("Failed to make dirs: {},", paramString);
        throw new RuntimeException("Failed to make directories. You will be doomed.");
      }
    }
    finally
    {
    }
    File localFile2 = new File(localFile1, paramString);
    return localFile2;
  }

  public static int getVideoBufferMax(RecordConfig paramRecordConfig)
  {
    return (int)(1100000.0D * paramRecordConfig.maxDuration / 1000.0D);
  }

  public static boolean isDefaultFrontFacing()
  {
    return !CameraManager.hasBackFacingCamera();
  }

  public static boolean loadWasEverSuccessful(Context paramContext)
  {
    return paramContext.getSharedPreferences(VineFFmpegFrameRecorder.class.getName(), 0).getBoolean("canLoad", false);
  }

  public static VineFFmpegFrameRecorder newViewRecorder(String paramString, int paramInt1, int paramInt2)
  {
    return newViewRecorder(paramString, paramInt1, paramInt2, null, null);
  }

  public static VineFFmpegFrameRecorder newViewRecorder(String paramString, int paramInt1, int paramInt2, avcodec.AVPacket paramAVPacket1, avcodec.AVPacket paramAVPacket2)
  {
    VineFFmpegFrameRecorder localVineFFmpegFrameRecorder = new VineFFmpegFrameRecorder(paramString, paramInt2, paramInt2, 1, paramAVPacket1, paramAVPacket2);
    localVineFFmpegFrameRecorder.setVideoCodec(13);
    localVineFFmpegFrameRecorder.setAudioCodec(86018);
    localVineFFmpegFrameRecorder.setFormat("mp4");
    localVineFFmpegFrameRecorder.setSampleRate(44100);
    localVineFFmpegFrameRecorder.setFrameRate(paramInt1);
    return localVineFFmpegFrameRecorder;
  }

  public static void setLoadWasEverSuccessful(Context paramContext, boolean paramBoolean)
  {
    if (paramContext == null)
      return;
    paramContext.getSharedPreferences(VineFFmpegFrameRecorder.class.getName(), 0).edit().putBoolean("canLoad", paramBoolean).commit();
  }

  public static class RecordConfig
  {
    private static final boolean CAMERA_SWITCH_ENABLED = true;
    private static final boolean FLASH_SWITCH_ENABLED = false;
    public static final boolean HAS_GALAXY_FOCUS_PROBLEM = false;
    private static final int INITIAL_VIDEO_BUFFER_COUNT = 150;
    private static final float INVALID_ASPECT_RATIO = 0.0F;
    private static final String KEY_ASPECT_RATIO_OVERRIDE_bf = "aspect_ratio_or_bf";
    private static final String KEY_ASPECT_RATIO_OVERRIDE_ff = "aspect_ratio_or_ff";
    private static final String KEY_BUFFER_SIZE = "bufferSize";
    private static final String KEY_CAMERA_SWITCH_ENABLED = "cameraSwitchEnabled";
    private static final String KEY_FLASH_SWITCH_ENABLED = "flashSwitchEnabled";
    private static final String KEY_FRAME_RATE = "frameRate";
    private static final String KEY_MAX_DURATION = "maxDuration";
    private static final String KEY_PREALLOCATE_BUFFER = "preAllocateBuffer";
    private static final String KEY_PREF = "RecordConfig";
    private static final String KEY_PREVIEW_HEIGHT = "previewHeight";
    private static final String KEY_PREVIEW_WIDTH = "previewWidth";
    private static final String KEY_PRE_RATIO = "pre_ratio";
    private static final String KEY_PROCESS_ON_SD = "processOnSD";
    private static final String KEY_RECORDING_ENABLED = "recordingEnabled";
    private static final String KEY_TARGET_SIZE = "targetSize";
    private static final String KEY_UPDATE_TIME = "updateTime";
    private static final String KEY_ZOOM_ENABLED = "zoomEnabled";
    private static final int PREVIEW_WIDTH = 640;
    private static final float PRE_ALLOCATE_RATIO = 1.5F;
    private static final boolean PROCESS_ON_SD_CARD = false;
    private static final int PROGRESS_MAX = 6000;
    public static final boolean SHOULD_OVERRIDED_FRONTFACING_ASPECT_RATIO = false;
    public static final boolean SHOULD_OVERRIDE_BACKFACING_ASPECT_RATIO = false;
    private static final float SIX_SECONDS = 6000.0F;
    private static final int TARGET_FRAME_RATE = 30;
    private static final boolean ZOOM_ENABLED = true;
    public final float backFacingAspectRatioOverride;
    public final int bufferCount;
    public final boolean cameraSwitchEnabled;
    public final boolean flashSwitchEnabled;
    public final float frontFacingAspectRatioOverride;
    public final boolean highQuality;
    public final int maxDuration;
    public final double preAllocRatio;
    public final boolean preAllocateBuffer;
    public final int previewHeight;
    public final int previewWidth;
    public final File processDir;
    public final boolean processOnSd;
    public final boolean recordingEnabled;
    public final int targetFrameRate;
    public final int targetSize;
    public final boolean zoomEnabled;

    static
    {
      if ((Build.MODEL.contains("GT-I9505")) || (Build.MODEL.contains("GT-I9506")) || (Build.MODEL.contains("GT-I9500")) || (Build.MODEL.contains("SGH-I337")) || (Build.MODEL.contains("SGH-M919")) || (Build.MODEL.contains("SCH-I545")) || (Build.MODEL.contains("SPH-L720")) || (Build.MODEL.contains("GT-I9508")) || (Build.MODEL.contains("SHV-E300")) || (Build.MODEL.contains("SCH-R970")) || (Build.MODEL.contains("SM-N900")) || (Build.MODEL.contains("LG-D801")));
      for (boolean bool = true; ; bool = false)
      {
        HAS_GALAXY_FOCUS_PROBLEM = bool;
        PROCESS_ON_SD_CARD = SLog.sLogsOn;
        return;
      }
    }

    public RecordConfig(Context paramContext)
    {
      double d1 = SystemUtil.getMemoryRatio(paramContext, i);
      boolean bool1;
      SharedPreferences localSharedPreferences;
      double d2;
      label57: boolean bool2;
      label141: File localFile;
      label159: boolean bool3;
      label193: int i1;
      if (d1 >= 1.0D)
      {
        bool1 = i;
        this.highQuality = i;
        localSharedPreferences = paramContext.getSharedPreferences("RecordConfig", 0);
        if (d1 < 2.0D)
          break label384;
        d2 = localSharedPreferences.getFloat("pre_ratio", 1.5F);
        this.preAllocRatio = d2;
        this.preAllocateBuffer = localSharedPreferences.getBoolean("preAllocateBuffer", i);
        this.recordingEnabled = localSharedPreferences.getBoolean("recordingEnabled", bool1);
        this.zoomEnabled = localSharedPreferences.getBoolean("zoomEnabled", i);
        if (((!PROCESS_ON_SD_CARD) && (!localSharedPreferences.getBoolean("processOnSD", PROCESS_ON_SD_CARD))) || (!"mounted".equals(Environment.getExternalStorageState())))
          break label392;
        bool2 = i;
        this.processOnSd = bool2;
        if (!this.processOnSd)
          break label398;
        localFile = RecordConfigUtils.FOLDER_ROOT_PROCESS_DEBUG;
        this.processDir = localFile;
        if ((!localSharedPreferences.getBoolean("cameraSwitchEnabled", i)) || (!CameraManager.hasFrontFacingCamera()) || (!CameraManager.hasBackFacingCamera()))
          break label407;
        bool3 = i;
        this.cameraSwitchEnabled = bool3;
        this.flashSwitchEnabled = localSharedPreferences.getBoolean("flashSwitchEnabled", false);
        this.targetFrameRate = localSharedPreferences.getInt("frameRate", 30);
        this.targetSize = localSharedPreferences.getInt("targetSize", 480);
        int k = localSharedPreferences.getInt("previewWidth", 640);
        if (!this.highQuality)
          break label413;
        int m = i;
        label268: this.previewWidth = (k / m);
        i1 = localSharedPreferences.getInt("previewHeight", 480);
        if (!this.highQuality)
          break label419;
      }
      while (true)
      {
        this.previewHeight = (i1 / i);
        this.maxDuration = localSharedPreferences.getInt("maxDuration", 6000);
        this.bufferCount = ((int)(localSharedPreferences.getInt("bufferSize", 150) * (this.maxDuration / 6000.0F)));
        this.frontFacingAspectRatioOverride = localSharedPreferences.getFloat("aspect_ratio_or_ff", 0.0F);
        this.backFacingAspectRatioOverride = localSharedPreferences.getFloat("aspect_ratio_or_bf", 0.0F);
        return;
        bool1 = false;
        break;
        label384: d2 = 0.8D;
        break label57;
        label392: bool2 = false;
        break label141;
        label398: localFile = paramContext.getFilesDir();
        break label159;
        label407: bool3 = false;
        break label193;
        label413: int n = 2;
        break label268;
        label419: int j = 2;
      }
    }

    public static boolean needsUpdate(Context paramContext)
    {
      boolean bool1 = System.currentTimeMillis() - paramContext.getSharedPreferences("RecordConfig", 0).getLong("updateTime", 0L) < 300000L;
      boolean bool2 = false;
      if (bool1)
        bool2 = true;
      return bool2;
    }

    public static RecordConfig update(Context paramContext, JSONObject paramJSONObject)
    {
      try
      {
        SLog.d("Update config: {}.", paramJSONObject);
        RecordConfig localRecordConfig1 = new RecordConfig(paramContext);
        SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("RecordConfig", 0).edit();
        localEditor.putBoolean("preAllocateBuffer", paramJSONObject.optBoolean("preAllocateBuffer", localRecordConfig1.preAllocateBuffer));
        localEditor.putBoolean("recordingEnabled", paramJSONObject.optBoolean("recordingEnabled", localRecordConfig1.recordingEnabled));
        localEditor.putBoolean("zoomEnabled", paramJSONObject.optBoolean("zoomEnabled", localRecordConfig1.zoomEnabled));
        localEditor.putBoolean("cameraSwitchEnabled", paramJSONObject.optBoolean("cameraSwitchEnabled", localRecordConfig1.cameraSwitchEnabled));
        localEditor.putBoolean("flashSwitchEnabled", paramJSONObject.optBoolean("flashSwitchEnabled", localRecordConfig1.flashSwitchEnabled));
        localEditor.putBoolean("processOnSD", paramJSONObject.optBoolean("processOnSD", localRecordConfig1.processOnSd));
        localEditor.putInt("frameRate", paramJSONObject.optInt("frameRate", localRecordConfig1.targetFrameRate));
        localEditor.putInt("targetSize", paramJSONObject.optInt("targetSize", localRecordConfig1.targetSize));
        localEditor.putInt("previewWidth", paramJSONObject.optInt("previewWidth", localRecordConfig1.previewWidth));
        localEditor.putInt("previewHeight", paramJSONObject.optInt("previewHeight", localRecordConfig1.previewHeight));
        localEditor.putInt("bufferSize", paramJSONObject.optInt("bufferSize", localRecordConfig1.bufferCount));
        localEditor.putInt("maxDuration", paramJSONObject.optInt("maxDuration", localRecordConfig1.maxDuration));
        localEditor.putFloat("pre_ratio", (float)paramJSONObject.optDouble("pre_ratio", localRecordConfig1.preAllocRatio));
        localEditor.putFloat("aspect_ratio_or_ff", (float)paramJSONObject.optDouble("aspect_ratio_or_ff", localRecordConfig1.frontFacingAspectRatioOverride));
        localEditor.putFloat("aspect_ratio_or_bf", (float)paramJSONObject.optDouble("aspect_ratio_or_bf", localRecordConfig1.backFacingAspectRatioOverride));
        localEditor.putLong("updateTime", System.currentTimeMillis());
        localEditor.commit();
        RecordConfig localRecordConfig2 = new RecordConfig(paramContext);
        return localRecordConfig2;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordConfigUtils
 * JD-Core Version:    0.6.2
 */