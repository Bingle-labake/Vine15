package com.lifevibes.videoeditor;

import android.graphics.Bitmap;
import android.graphics.Paint;
import android.util.Log;
import android.util.Pair;
import android.view.Surface;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;

class MediaArtistNativeHelper
{
  private static final String AUDIO_TRACK_PCM_FILE = "AudioPcm.pcm";
  public static final int PROCESSING_AUDIO_PCM = 1;
  public static final int PROCESSING_EXPORT = 20;
  public static final int PROCESSING_INTERMEDIATE1 = 11;
  public static final int PROCESSING_INTERMEDIATE2 = 12;
  public static final int PROCESSING_INTERMEDIATE3 = 13;
  public static final int PROCESSING_KENBURNS = 3;
  public static final int PROCESSING_NONE = 0;
  public static final int PROCESSING_TRANSITION = 2;
  private static final String TAG = "MediaArtistNativeHelper";
  public static final int TASK_ENCODING = 2;
  public static final int TASK_LOADING_SETTINGS = 1;
  public static int mTNDecConfigAccurateMode = 0;
  public static int mTNDecConfigFastMode = 1;
  private static final Paint sResizePaint = new Paint(2);
  private final int MAX_THUMBNAIL_PERMITTED = 8;
  private AudioSettings mAudioSettings = null;
  private String mAudioTrackPCMFilePath = null;
  private List<String> mClipList = new ArrayList();
  PreviewClipProperties mClipProperties = null;
  EditSettings mEditSettings = null;
  private boolean mErrorFlagSet = false;
  private String mExportFilename = null;
  private VideoEditor.ExportProgressListener mExportProgressListener;
  public boolean mInvalidatePreviewArray = true;
  private boolean mIsAbortGeneratePreviewInBGCalled = false;
  private boolean mIsFirstProgress;
  private final Semaphore mLock;
  private int mManualEditContext = 0;
  private String mOutputFilename;
  private EditSettings mPreviewEditSettings;
  int mPreviewEffectsSize = 0;
  private long mPreviewProgress = 0L;
  private Object mProcessingObject;
  private int mProcessingState;
  private int mProgressToApp;
  private final String mProjectPath;
  private boolean mRegenerateAudio = true;
  private String mRenderPreviewOverlayFile;
  private int mRenderPreviewRenderingMode;
  public EditSettings mStoryBoardSettings;
  private MediaItem.GetThumbnailListCallback mThumbnailListListener;
  int[] mThumbnailTime;
  private int mTotalClips = 0;
  int mTotalKenBurnClips = 0;
  int mTotalTransitions = 0;
  private final VideoEditor mVideoEditor;

  public MediaArtistNativeHelper(String paramString, Semaphore paramSemaphore, VideoEditor paramVideoEditor)
  {
    this.mProjectPath = paramString;
    if (paramVideoEditor != null)
    {
      this.mVideoEditor = paramVideoEditor;
      if (this.mStoryBoardSettings == null)
        this.mStoryBoardSettings = new EditSettings();
      this.mLock = paramSemaphore;
      _init(this.mProjectPath, "null");
      this.mAudioTrackPCMFilePath = null;
      Version localVersion = getVersion();
      Log.d("MediaArtistNativeHelper", "VideoEditor Version " + localVersion.major + "." + localVersion.minor + "." + localVersion.revision);
      this.mExportProgressListener = null;
      onProgressUpdate(0, 0);
      return;
    }
    this.mVideoEditor = null;
    throw new IllegalArgumentException("video editor object is null");
  }

  private native void _init(String paramString1, String paramString2)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private int findVideoBitrate(int paramInt)
  {
    switch (paramInt)
    {
    default:
      Log.e("MediaArtistNativeHelper", "bitrate for frame size not found");
      return 0;
    case 0:
    case 1:
    case 2:
    case 3:
      return 512000;
    case 4:
    case 5:
      return 1500000;
    case 6:
    case 9:
      return 2000000;
    case 7:
    case 8:
    case 10:
      return 5000000;
    case 11:
    case 12:
    case 13:
    case 14:
    }
    return 8000000;
  }

  private Pair<Integer, Integer> findVideoFrameDimensions(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return new Pair(Integer.valueOf(0), Integer.valueOf(0));
    case 0:
      return new Pair(Integer.valueOf(128), Integer.valueOf(96));
    case 1:
      return new Pair(Integer.valueOf(160), Integer.valueOf(120));
    case 2:
      return new Pair(Integer.valueOf(176), Integer.valueOf(144));
    case 3:
      return new Pair(Integer.valueOf(320), Integer.valueOf(240));
    case 4:
      return new Pair(Integer.valueOf(352), Integer.valueOf(288));
    case 6:
      return new Pair(Integer.valueOf(640), Integer.valueOf(480));
    case 7:
      return new Pair(Integer.valueOf(800), Integer.valueOf(480));
    case 8:
      return new Pair(Integer.valueOf(720), Integer.valueOf(480));
    case 9:
      return new Pair(Integer.valueOf(640), Integer.valueOf(360));
    case 10:
      return new Pair(Integer.valueOf(854), Integer.valueOf(480));
    case 11:
      return new Pair(Integer.valueOf(1280), Integer.valueOf(720));
    case 12:
      return new Pair(Integer.valueOf(1080), Integer.valueOf(720));
    case 13:
      return new Pair(Integer.valueOf(960), Integer.valueOf(720));
    case 14:
      return new Pair(Integer.valueOf(1920), Integer.valueOf(1080));
    case 5:
    }
    return new Pair(Integer.valueOf(480), Integer.valueOf(480));
  }

  private int findVideoResolution(int paramInt1, int paramInt2)
  {
    int i = -1;
    switch (paramInt1)
    {
    default:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    }
    while (true)
    {
      if (i == -1)
      {
        Pair[] arrayOfPair = MediaProperties.getSupportedResolutions(this.mVideoEditor.getAspectRatio());
        Pair localPair = arrayOfPair[(-1 + arrayOfPair.length)];
        i = findVideoResolution(this.mVideoEditor.getAspectRatio(), ((Integer)localPair.second).intValue());
      }
      return i;
      if (paramInt2 == 480)
      {
        i = 8;
      }
      else if (paramInt2 == 720)
      {
        i = 12;
        continue;
        if (paramInt2 == 480)
        {
          i = 10;
        }
        else if (paramInt2 == 720)
        {
          i = 11;
        }
        else if (paramInt2 == 1080)
        {
          i = 14;
        }
        else if (paramInt2 == 360)
        {
          i = 9;
          continue;
          if (paramInt2 == 96)
          {
            i = 0;
          }
          else if (paramInt2 == 120)
          {
            i = 1;
          }
          else if (paramInt2 == 240)
          {
            i = 3;
          }
          else if (paramInt2 == 480)
          {
            i = 6;
          }
          else if (paramInt2 == 720)
          {
            i = 13;
            continue;
            if (paramInt2 == 480)
            {
              i = 7;
              continue;
              if (paramInt2 == 144)
              {
                i = 2;
              }
              else if (paramInt2 == 288)
              {
                i = 4;
                continue;
                if (paramInt2 == 480)
                  i = 5;
              }
            }
          }
        }
      }
    }
  }

  private void getMediaItemProperties(List<MediaItem> paramList)
  {
    this.mTotalClips = 0;
    this.mPreviewEditSettings = new EditSettings();
    this.mClipProperties = new PreviewClipProperties();
    new ClipSettings[2];
    ClipSettings localClipSettings = new ClipSettings();
    if (!(paramList.get(0) instanceof MediaVideoItem))
      throw new IllegalStateException("Not a media video item");
    MediaVideoItem localMediaVideoItem = (MediaVideoItem)paramList.get(0);
    this.mTotalClips = paramList.size();
    this.mPreviewEditSettings.clipSettingsArray = new ClipSettings[this.mTotalClips];
    this.mPreviewEditSettings.effectSettingsArray = new EffectSettings[0];
    this.mPreviewEditSettings.transitionSettingsArray = new TransitionSettings[-1 + this.mTotalClips];
    this.mPreviewEditSettings.backgroundMusicSettings = null;
    this.mPreviewEditSettings.primaryTrackVolume = 100;
    this.mClipProperties.clipProperties = new Properties[this.mTotalClips];
    initClipSettings(localClipSettings);
    localClipSettings.clipPath = localMediaVideoItem.getFilename();
    localClipSettings.fileType = getMediaItemFileType(localMediaVideoItem.getFileType());
    while (true)
    {
      try
      {
        this.mClipProperties.clipProperties[0] = getMediaProperties(localMediaVideoItem.getFilename());
        localClipSettings.arrayBeginCutTime = new int[2];
        localClipSettings.arrayEndCutTime = new int[2];
        if (localMediaVideoItem.isExcludeCalled())
        {
          this.mClipProperties.clipProperties[0].duration = ((int)localMediaVideoItem.getDuration() - ((int)localMediaVideoItem.getExcludeEndTime() - (int)localMediaVideoItem.getExcludeBeginTime()));
          localClipSettings.arrayBeginCutTime[0] = 0;
          localClipSettings.arrayEndCutTime[0] = (-1 + (int)localMediaVideoItem.getExcludeBeginTime());
          localClipSettings.arrayBeginCutTime[1] = (1 + (int)localMediaVideoItem.getExcludeEndTime());
          localClipSettings.arrayEndCutTime[1] = ((int)localMediaVideoItem.getDuration());
          localClipSettings.mNumCuts = 2;
          if (this.mClipProperties.clipProperties[0].videoDuration != 0)
            this.mClipProperties.clipProperties[0].videoDuration = this.mClipProperties.clipProperties[0].duration;
          if (this.mClipProperties.clipProperties[0].audioDuration != 0)
            this.mClipProperties.clipProperties[0].audioDuration = this.mClipProperties.clipProperties[0].duration;
          localClipSettings.mediaRendering = getMediaItemRenderingMode(localMediaVideoItem.getRenderingMode());
          localClipSettings.clipVolumePercentage = 100;
          this.mPreviewEditSettings.clipSettingsArray[0] = localClipSettings;
          this.mPreviewEditSettings.videoFrameSize = findVideoResolution(this.mVideoEditor.getAspectRatio(), localMediaVideoItem.getHeight());
          return;
        }
      }
      catch (Exception localException)
      {
        throw new IllegalArgumentException("Unsupported file or file not found");
      }
      localClipSettings.arrayBeginCutTime[0] = ((int)localMediaVideoItem.getBoundaryBeginTime());
      localClipSettings.arrayBeginCutTime[1] = 0;
      localClipSettings.arrayEndCutTime[0] = ((int)localMediaVideoItem.getBoundaryEndTime());
      localClipSettings.arrayEndCutTime[1] = 0;
      localClipSettings.mNumCuts = 1;
      this.mClipProperties.clipProperties[0].duration = (localClipSettings.arrayEndCutTime[0] - localClipSettings.arrayBeginCutTime[0]);
      if (this.mClipProperties.clipProperties[0].videoDuration != 0)
        this.mClipProperties.clipProperties[0].videoDuration = this.mClipProperties.clipProperties[0].duration;
      if (this.mClipProperties.clipProperties[0].audioDuration != 0)
        this.mClipProperties.clipProperties[0].audioDuration = this.mClipProperties.clipProperties[0].duration;
    }
  }

  private native Version getVersion()
    throws RuntimeException;

  private void lock()
    throws InterruptedException
  {
    if (Log.isLoggable("MediaArtistNativeHelper", 3))
      Log.d("MediaArtistNativeHelper", "lock: grabbing semaphore", new Throwable());
    this.mLock.acquire();
    if (Log.isLoggable("MediaArtistNativeHelper", 3))
      Log.d("MediaArtistNativeHelper", "lock: grabbed semaphore");
  }

  private native void nativeClearSurface(Surface paramSurface);

  private native int nativeGenerateAudioGraph(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3);

  private native int nativeGenerateClip(EditSettings paramEditSettings)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private native int nativeGenerateRawAudio(String paramString1, String paramString2);

  private native int nativeGenerateRawAudioMedia(String paramString1, String paramString2, long paramLong1, long paramLong2);

  private native Bitmap nativeGetPixels(String paramString, int paramInt1, int paramInt2, long paramLong, int paramInt3);

  private native int nativeGetPixelsList(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int[] paramArrayOfInt, int paramInt7, MediaItem.GetThumbnailListCallback paramGetThumbnailListCallback);

  private native Bitmap[] nativeGetPixelsList(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int[] paramArrayOfInt, int paramInt7);

  private native void nativePopulateSettings(EditSettings paramEditSettings, PreviewClipProperties paramPreviewClipProperties, AudioSettings paramAudioSettings)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private native int nativeRenderMediaItemPreviewFrame(Surface paramSurface, String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, long paramLong)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private native int nativeRenderPreviewFrame(Surface paramSurface, long paramLong, int paramInt1, int paramInt2)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private native void nativeStartPreview(Surface paramSurface, long paramLong1, long paramLong2, int paramInt, boolean paramBoolean)
    throws IllegalArgumentException, IllegalStateException, RuntimeException;

  private native int nativeStopPreview();

  private void onAudioGraphExtractProgressUpdate(int paramInt, boolean paramBoolean)
  {
  }

  private void onProgressUpdate(int paramInt1, int paramInt2)
  {
    if ((this.mProcessingState == 20) && (this.mExportProgressListener != null) && (this.mProgressToApp <= 100))
      if (this.mProgressToApp > paramInt2)
        break label60;
    for (this.mProgressToApp = paramInt2; ; this.mProgressToApp = (1 + this.mProgressToApp))
    {
      this.mExportProgressListener.onProgress(this.mVideoEditor, this.mOutputFilename, this.mProgressToApp);
      label60: 
      do
        return;
      while (paramInt2 % 2 != 0);
    }
  }

  private native void release()
    throws IllegalStateException, RuntimeException;

  private native void stopEncoding()
    throws IllegalStateException, RuntimeException;

  private native void stopExtraction()
    throws IllegalStateException, RuntimeException;

  private native void stopThumbnail()
    throws IllegalStateException;

  private void unlock()
  {
    if (Log.isLoggable("MediaArtistNativeHelper", 3))
      Log.d("MediaArtistNativeHelper", "unlock: releasing semaphore");
    this.mLock.release();
  }

  int GetClosestVideoFrameRate(int paramInt)
  {
    int i = 5;
    if (paramInt > 25)
      i = 7;
    do
    {
      return i;
      if (paramInt > 20)
        return 6;
    }
    while (paramInt > 15);
    if (paramInt > 12.5D)
      return 4;
    if (paramInt > 10)
      return 3;
    if (paramInt > 7.5D)
      return 2;
    if (paramInt > i)
      return 1;
    return 0;
  }

  public void export(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, long paramLong, List<MediaItem> paramList, VideoEditor.ExportProgressListener paramExportProgressListener)
  {
    this.mExportFilename = paramString1;
    this.mProgressToApp = 0;
    if (paramExportProgressListener != null)
      this.mExportProgressListener = paramExportProgressListener;
    getMediaItemProperties(paramList);
    int i;
    switch (paramInt2)
    {
    default:
      throw new IllegalArgumentException("Argument Bitrate incorrect");
    case 28000:
      i = 32000;
      this.mPreviewEditSettings.videoFrameRate = 7;
      EditSettings localEditSettings = this.mPreviewEditSettings;
      this.mOutputFilename = paramString1;
      localEditSettings.outputFile = paramString1;
      this.mPreviewEditSettings.videoRenderingType = 0;
      int j = this.mVideoEditor.getAspectRatio();
      this.mPreviewEditSettings.videoFrameSize = findVideoResolution(j, paramInt1);
      if (this.mPreviewEditSettings.videoFrameSize == 6)
      {
        if (i == 800000)
          this.mPreviewEditSettings.videoFrameRate = 5;
        if (i == 512000)
          this.mPreviewEditSettings.videoFrameRate = 4;
      }
      if (this.mPreviewEditSettings.videoFrameSize == 4)
      {
        if (i == 384000)
        {
          if (paramInt4 == 1)
            break label511;
          this.mPreviewEditSettings.videoFrameRate = 6;
        }
        label320: if (i == 256000)
          this.mPreviewEditSettings.videoFrameRate = 4;
      }
      if (this.mPreviewEditSettings.videoFrameSize == 2)
      {
        if (i != 192000)
          break label533;
        if (paramInt4 == 1)
          break label522;
        this.mPreviewEditSettings.videoFrameRate = 5;
      }
      break;
    case 40000:
    case 64000:
    case 96000:
    case 128000:
    case 192000:
    case 256000:
    case 384000:
    case 512000:
    case 800000:
    case 1000000:
    case 1200000:
    case 1500000:
    case 2000000:
    case 5000000:
    case 8000000:
    }
    while (true)
    {
      if (findVideoBitrate(this.mPreviewEditSettings.videoFrameSize) >= i)
        break label590;
      throw new IllegalArgumentException("Argument Bitrate NOT Supported for supplied resolution");
      i = 48000;
      break;
      i = 64000;
      break;
      i = 96000;
      break;
      i = 128000;
      break;
      i = 192000;
      break;
      i = 256000;
      break;
      i = 384000;
      break;
      i = 512000;
      break;
      i = 800000;
      break;
      i = 1000000;
      break;
      i = 1200000;
      break;
      i = 1500000;
      break;
      i = 2000000;
      break;
      i = 5000000;
      break;
      i = 8000000;
      break;
      label511: this.mPreviewEditSettings.videoFrameRate = 4;
      break label320;
      label522: this.mPreviewEditSettings.videoFrameRate = 4;
      continue;
      label533: if (i == 128000)
        this.mPreviewEditSettings.videoFrameRate = 4;
      else if (i == 96000)
        this.mPreviewEditSettings.videoFrameRate = 2;
      else if (i == 64000)
        this.mPreviewEditSettings.videoFrameRate = 2;
    }
    label590: switch (paramInt3)
    {
    default:
    case 2:
    case 1:
    }
    while (true)
      switch (paramInt4)
      {
      case 3:
      default:
        throw new IllegalArgumentException("Argument Video codec NOT Supported");
        MediaVideoItem localMediaVideoItem = (MediaVideoItem)paramList.get(0);
        this.mPreviewEditSettings.audioFormat = 254;
        this.mPreviewEditSettings.audioBitrate = localMediaVideoItem.getAudioBitrate();
        this.mPreviewEditSettings.audioSamplingFreq = localMediaVideoItem.getAudioSamplingFrequency();
        this.mPreviewEditSettings.audioChannels = localMediaVideoItem.getAudioChannels();
        continue;
        this.mPreviewEditSettings.audioFormat = 1;
        this.mPreviewEditSettings.audioBitrate = 12200;
        this.mPreviewEditSettings.audioSamplingFreq = 8000;
        this.mPreviewEditSettings.audioChannels = 1;
      case 1:
      case 4:
      case 5:
      case 6:
      case 2:
      }
    this.mPreviewEditSettings.videoFormat = 1;
    while (true)
    {
      if (paramLong != 0L)
      {
        this.mPreviewEditSettings.maxFileSize = ((int)paramLong);
        if (this.mTotalClips == 1)
        {
          long l1 = ((MediaItem)paramList.get(0)).getTimelineDuration();
          long l2 = ()(1.04D * (this.mPreviewEditSettings.audioBitrate + this.mClipProperties.clipProperties[0].videoBitrate) * l1 / 8000.0D);
          Pair localPair = findVideoFrameDimensions(this.mPreviewEditSettings.videoFrameSize);
          int n;
          if ((this.mPreviewEditSettings.maxFileSize == 0) || (l2 > this.mPreviewEditSettings.maxFileSize))
          {
            int m = this.mPreviewEditSettings.maxFileSize;
            n = 0;
            if (m != 0);
          }
          else
          {
            n = 1;
          }
          if ((this.mPreviewEditSettings.videoFormat == this.mClipProperties.clipProperties[0].videoFormat) && (((Integer)localPair.first).intValue() == this.mClipProperties.clipProperties[0].width) && (((Integer)localPair.second).intValue() == this.mClipProperties.clipProperties[0].height) && (n == 1))
            this.mPreviewEditSettings.videoFormat = 254;
        }
        this.mPreviewEditSettings.videoBitrate = i;
        this.mPreviewEditSettings.transitionSettingsArray = new TransitionSettings[-1 + this.mTotalClips];
      }
      try
      {
        this.mProcessingState = 20;
        this.mProcessingObject = null;
        int k = generateClip(this.mPreviewEditSettings);
        this.mProcessingState = 0;
        if (k != 0)
        {
          Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
          throw new RuntimeException("generateClip failed with error=" + k);
          this.mPreviewEditSettings.videoFormat = 4;
          continue;
          this.mPreviewEditSettings.videoFormat = 5;
          continue;
          this.mPreviewEditSettings.videoFormat = 6;
          continue;
          this.mPreviewEditSettings.videoFormat = 2;
          continue;
          this.mPreviewEditSettings.maxFileSize = 0;
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalArgument for generateClip");
        throw localIllegalArgumentException;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalStateExceptiont for generateClip");
        throw localIllegalStateException;
      }
      catch (RuntimeException localRuntimeException)
      {
        Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
        throw localRuntimeException;
      }
    }
    this.mExportProgressListener = null;
  }

  void export(String paramString1, String paramString2, int paramInt1, int paramInt2, List<MediaItem> paramList, VideoEditor.ExportProgressListener paramExportProgressListener)
  {
    if (!(paramList.get(0) instanceof MediaVideoItem))
      throw new IllegalStateException("Not a media video item");
    this.mExportFilename = paramString1;
    this.mProgressToApp = 0;
    if (paramExportProgressListener != null)
      this.mExportProgressListener = paramExportProgressListener;
    getMediaItemProperties(paramList);
    int i;
    switch (paramInt2)
    {
    default:
      throw new IllegalArgumentException("Argument Bitrate incorrect");
    case 28000:
      i = 32000;
    case 40000:
    case 64000:
    case 96000:
    case 128000:
    case 192000:
    case 256000:
    case 384000:
    case 512000:
    case 800000:
    case 1000000:
    case 1200000:
    case 1500000:
    case 2000000:
    case 5000000:
    case 8000000:
    }
    while (true)
    {
      this.mPreviewEditSettings.videoFrameRate = 7;
      EditSettings localEditSettings = this.mPreviewEditSettings;
      this.mOutputFilename = paramString1;
      localEditSettings.outputFile = paramString1;
      this.mPreviewEditSettings.videoRenderingType = 0;
      int j = this.mVideoEditor.getAspectRatio();
      this.mPreviewEditSettings.videoFrameSize = findVideoResolution(j, paramInt1);
      if (findVideoBitrate(this.mPreviewEditSettings.videoFrameSize) >= i)
        break;
      throw new IllegalArgumentException("Argument Bitrate NOT Supported for supplied resolution");
      i = 48000;
      continue;
      i = 64000;
      continue;
      i = 96000;
      continue;
      i = 128000;
      continue;
      i = 192000;
      continue;
      i = 256000;
      continue;
      i = 384000;
      continue;
      i = 512000;
      continue;
      i = 800000;
      continue;
      i = 1000000;
      continue;
      i = 1200000;
      continue;
      i = 1500000;
      continue;
      i = 2000000;
      continue;
      i = 5000000;
      continue;
      i = 8000000;
    }
    this.mPreviewEditSettings.videoFormat = 4;
    this.mPreviewEditSettings.audioFormat = 2;
    this.mPreviewEditSettings.audioBitrate = 96000;
    this.mPreviewEditSettings.audioSamplingFreq = 32000;
    this.mPreviewEditSettings.audioChannels = 2;
    this.mPreviewEditSettings.maxFileSize = 0;
    this.mPreviewEditSettings.videoBitrate = i;
    MediaVideoItem localMediaVideoItem = (MediaVideoItem)paramList.get(0);
    if ((localMediaVideoItem.getVideoType() != 1) || ((localMediaVideoItem.getVideoType() == 1) && (this.mPreviewEditSettings.videoFrameSize <= 4)))
    {
      this.mPreviewEditSettings.audioFormat = 254;
      if (localMediaVideoItem.getAudioType() != -1)
      {
        this.mPreviewEditSettings.audioBitrate = localMediaVideoItem.getAudioBitrate();
        this.mPreviewEditSettings.audioSamplingFreq = localMediaVideoItem.getAudioSamplingFrequency();
        this.mPreviewEditSettings.audioChannels = localMediaVideoItem.getAudioChannels();
      }
      switch (localMediaVideoItem.getVideoType())
      {
      case 3:
      default:
        throw new IllegalArgumentException("Argument Video codec NOT Supported");
      case 1:
        this.mPreviewEditSettings.videoFormat = 1;
      case 4:
      case 5:
      case 6:
      case 2:
      }
    }
    while (true)
    {
      if (this.mPreviewEditSettings.videoFormat == 1)
      {
        this.mPreviewEditSettings.videoFrameRate = 4;
        this.mPreviewEditSettings.transitionSettingsArray = new TransitionSettings[-1 + this.mTotalClips];
        if (this.mTotalClips == 1)
        {
          Pair localPair = findVideoFrameDimensions(this.mPreviewEditSettings.videoFrameSize);
          if ((this.mPreviewEditSettings.videoFormat == this.mClipProperties.clipProperties[0].videoFormat) && (((Integer)localPair.first).intValue() == this.mClipProperties.clipProperties[0].width) && (((Integer)localPair.second).intValue() == this.mClipProperties.clipProperties[0].height))
            this.mPreviewEditSettings.videoFormat = 254;
        }
      }
      try
      {
        this.mProcessingState = 20;
        this.mProcessingObject = null;
        int k = generateClip(this.mPreviewEditSettings);
        this.mProcessingState = 0;
        if (k != 0)
        {
          Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
          throw new RuntimeException("generateClip failed with error=" + k);
          this.mPreviewEditSettings.videoFormat = 4;
          continue;
          this.mPreviewEditSettings.videoFormat = 5;
          continue;
          this.mPreviewEditSettings.videoFormat = 6;
          continue;
          this.mPreviewEditSettings.videoFormat = 2;
          continue;
          this.mPreviewEditSettings.videoFrameRate = GetClosestVideoFrameRate(localMediaVideoItem.getFps());
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalArgument for generateClip");
        throw localIllegalArgumentException;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalStateExceptiont for generateClip");
        throw localIllegalStateException;
      }
      catch (RuntimeException localRuntimeException)
      {
        Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
        throw localRuntimeException;
      }
    }
    this.mExportProgressListener = null;
  }

  void exportAs2D(String paramString1, String paramString2, List<MediaItem> paramList, VideoEditor.ExportProgressListener paramExportProgressListener)
  {
    if (!(paramList.get(0) instanceof MediaVideoItem))
      throw new IllegalStateException("Not a media video item");
    getMediaItemProperties(paramList);
    if (paramExportProgressListener != null)
      this.mExportProgressListener = paramExportProgressListener;
    this.mExportFilename = paramString1;
    this.mPreviewEditSettings.videoFrameRate = GetClosestVideoFrameRate(((MediaVideoItem)paramList.get(0)).getFps());
    EditSettings localEditSettings = this.mPreviewEditSettings;
    this.mOutputFilename = paramString1;
    localEditSettings.outputFile = paramString1;
    this.mPreviewEditSettings.videoFrameSize = findVideoResolution(getAspectRatio(((MediaItem)paramList.get(0)).getWidth(), ((MediaItem)paramList.get(0)).getHeight()), ((MediaItem)paramList.get(0)).getHeight());
    this.mPreviewEditSettings.videoBitrate = getClosestVideoBitrate(((MediaVideoItem)paramList.get(0)).getVideoBitrate());
    this.mPreviewEditSettings.videoRenderingType = 1;
    switch (((MediaVideoItem)paramList.get(0)).getVideoType())
    {
    case 3:
    default:
      throw new IllegalArgumentException("Argument Video codec NOT Supported");
    case 1:
      this.mPreviewEditSettings.videoFormat = 1;
    case 4:
    case 5:
    case 6:
    case 2:
    }
    while (true)
    {
      if (this.mPreviewEditSettings.videoFormat == 1)
      {
        this.mPreviewEditSettings.videoFrameRate = 4;
        if (this.mPreviewEditSettings.videoBitrate > 384000)
          this.mPreviewEditSettings.videoBitrate = 384000;
      }
      if (((MediaVideoItem)paramList.get(0)).getAudioType() != -1);
      switch (((MediaVideoItem)paramList.get(0)).getAudioType())
      {
      default:
        label336: this.mPreviewEditSettings.maxFileSize = 0;
        this.mPreviewEditSettings.transitionSettingsArray = new TransitionSettings[-1 + this.mTotalClips];
        if (this.mPreviewEditSettings.videoFormat == 1)
        {
          this.mPreviewEditSettings.videoFrameRate = 4;
          this.mPreviewEditSettings.videoBitrate = 256000;
          if (this.mPreviewEditSettings.videoFrameSize > 4)
            this.mPreviewEditSettings.videoFrameSize = 4;
        }
        break;
      case 2:
      case 1:
      }
      try
      {
        this.mProcessingState = 20;
        this.mProcessingObject = null;
        int i = generateClip(this.mPreviewEditSettings);
        this.mProcessingState = 0;
        if (i != 0)
        {
          Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
          throw new RuntimeException("generateClip failed with error=" + i);
          this.mPreviewEditSettings.videoFormat = 4;
          continue;
          this.mPreviewEditSettings.videoFormat = 5;
          continue;
          this.mPreviewEditSettings.videoFormat = 6;
          continue;
          this.mPreviewEditSettings.videoFormat = 2;
          continue;
          this.mPreviewEditSettings.audioFormat = 2;
          this.mPreviewEditSettings.audioBitrate = getClosestAudioBitrate(((MediaVideoItem)paramList.get(0)).getAudioBitrate());
          this.mPreviewEditSettings.audioSamplingFreq = ((MediaVideoItem)paramList.get(0)).getAudioSamplingFrequency();
          this.mPreviewEditSettings.audioChannels = ((MediaVideoItem)paramList.get(0)).getAudioChannels();
          break label336;
          this.mPreviewEditSettings.audioFormat = 1;
          this.mPreviewEditSettings.audioBitrate = 12200;
          this.mPreviewEditSettings.audioSamplingFreq = 8000;
          this.mPreviewEditSettings.audioChannels = 1;
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalArgument for generateClip");
        throw localIllegalArgumentException;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        Log.e("MediaArtistNativeHelper", "IllegalStateExceptiont for generateClip");
        throw localIllegalStateException;
      }
      catch (RuntimeException localRuntimeException)
      {
        Log.e("MediaArtistNativeHelper", "RuntimeException for generateClip");
        throw localRuntimeException;
      }
    }
    this.mExportProgressListener = null;
  }

  boolean findThumbnailMode(String paramString, int paramInt, long paramLong1, long paramLong2)
    throws IllegalStateException, IllegalArgumentException
  {
    try
    {
      boolean bool = nativeFindThumbnailMode(paramString, paramInt, paramLong1, paramLong2);
      return bool;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exception in nativeFindThumbnailMode");
    }
    return false;
  }

  public int generateClip(EditSettings paramEditSettings)
  {
    int i = -1;
    try
    {
      int j = nativeGenerateClip(paramEditSettings);
      i = j;
      return i;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      do
        Log.e("MediaArtistNativeHelper", "Illegal Argument exception in load settings");
      while (0 == 0);
      return 0;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      do
        Log.e("MediaArtistNativeHelper", "Illegal state exception in load settings");
      while (0 == 0);
      return 0;
    }
    catch (RuntimeException localRuntimeException)
    {
      do
        Log.e("MediaArtistNativeHelper", "Runtime exception in load settings");
      while (0 == 0);
    }
    return 0;
  }

  int getAspectRatio(int paramInt1, int paramInt2)
  {
    double d = new BigDecimal(paramInt1 / paramInt2).setScale(3, 4).doubleValue();
    int i = 2;
    if (d >= 1.7D)
      i = 2;
    do
    {
      return i;
      if (d >= 1.6D)
        return 4;
      if (d >= 1.5D)
        return 1;
      if (d > 1.3D)
        return 3;
      if (d >= 1.2D)
        return 5;
    }
    while (d != 1.0D);
    return 6;
  }

  int getAudioCodecType(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return -1;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
    }
    return 5;
  }

  boolean getAudioflag()
  {
    return this.mRegenerateAudio;
  }

  int getClosestAudioBitrate(int paramInt)
  {
    if ((paramInt > 0) && (paramInt <= 16000))
      return 16000;
    if ((paramInt > 16000) && (paramInt <= 24000))
      return 24000;
    if ((paramInt > 24000) && (paramInt <= 32000))
      return 32000;
    if ((paramInt > 32000) && (paramInt <= 48000))
      return 48000;
    if ((paramInt > 48000) && (paramInt <= 64000))
      return 64000;
    if ((paramInt > 64000) && (paramInt <= 96000))
      return 96000;
    if ((paramInt > 96000) && (paramInt <= 128000))
      return 128000;
    if ((paramInt > 128000) && (paramInt <= 192000))
      return 192000;
    if ((paramInt > 192000) && (paramInt <= 256000))
      return 256000;
    return -1;
  }

  int getClosestVideoBitrate(int paramInt)
  {
    if ((paramInt > 0) && (paramInt <= 64000))
      return 64000;
    if ((paramInt > 64000) && (paramInt <= 96000))
      return 96000;
    if ((paramInt > 96000) && (paramInt <= 128000))
      return 128000;
    if ((paramInt > 128000) && (paramInt <= 192000))
      return 192000;
    if ((paramInt > 192000) && (paramInt <= 256000))
      return 256000;
    if ((paramInt > 256000) && (paramInt <= 288000))
      return 288000;
    if ((paramInt > 288000) && (paramInt <= 384000))
      return 384000;
    if ((paramInt > 384000) && (paramInt <= 512000))
      return 512000;
    if ((paramInt > 512000) && (paramInt <= 800000))
      return 800000;
    if ((paramInt > 800000) && (paramInt <= 1000000))
      return 1000000;
    if ((paramInt > 1000000) && (paramInt <= 1200000))
      return 1200000;
    if ((paramInt > 1200000) && (paramInt <= 1500000))
      return 1500000;
    if ((paramInt > 1500000) && (paramInt <= 2000000))
      return 2000000;
    if ((paramInt > 2000000) && (paramInt <= 5000000))
      return 5000000;
    if ((paramInt > 5000000) && (paramInt <= 8000000))
      return 8000000;
    if (paramInt > 8000000)
      return 8000000;
    return -1;
  }

  int getFileType(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return -1;
    case 255:
      return 255;
    case 0:
      return 0;
    case 1:
      return 1;
    case 5:
      return 5;
    case 8:
      return 8;
    case 3:
      return 3;
    case 10:
      return 10;
    case 2:
    }
    return 2;
  }

  int getFrameRate(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return -1;
    case 0:
      return 5;
    case 1:
      return 8;
    case 2:
      return 10;
    case 3:
      return 13;
    case 4:
      return 15;
    case 5:
      return 20;
    case 6:
      return 25;
    case 7:
    }
    return 30;
  }

  boolean getGeneratePreview()
  {
    return this.mInvalidatePreviewArray;
  }

  int getMediaItemFileType(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return -1;
    case 255:
      return 255;
    case 0:
      return 0;
    case 1:
      return 1;
    case 5:
      return 5;
    case 8:
      return 8;
    case 10:
      return 10;
    case 2:
    }
    return 2;
  }

  int getMediaItemRenderingMode(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return -1;
    case 0:
      return 2;
    case 1:
      return 0;
    case 2:
    }
    return 1;
  }

  native Properties getMediaProperties(String paramString)
    throws IllegalArgumentException, IllegalStateException, RuntimeException, Exception;

  Bitmap getPixels(String paramString, int paramInt1, int paramInt2, long paramLong)
    throws IllegalStateException, IllegalArgumentException
  {
    if (paramString == null)
      throw new IllegalArgumentException("Invalid input file");
    return nativeGetPixels(paramString, paramInt1, paramInt2, paramLong, getTNAccurateCodecConfig());
  }

  Bitmap getPixelsFast(String paramString, int paramInt1, int paramInt2, long paramLong)
    throws IllegalArgumentException
  {
    if (paramString == null)
      throw new IllegalArgumentException();
    try
    {
      Bitmap localBitmap2 = nativeGetPixelsFast(paramString, paramInt1, paramInt2, paramLong, getTNFastCodecConfig());
      return localBitmap2;
    }
    catch (Exception localException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsFast call ");
      if (1 == 1)
        try
        {
          Bitmap localBitmap1 = nativeGetPixelsFast(paramString, paramInt1, paramInt2, paramLong, getTNAccurateCodecConfig());
          return localBitmap1;
        }
        catch (RuntimeException localRuntimeException)
        {
          Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsFast call with fallback");
          throw localRuntimeException;
        }
    }
    return null;
  }

  void getPixelsList(String paramString, int paramInt1, int paramInt2, long paramLong1, long paramLong2, int paramInt3, MediaItem.GetThumbnailListCallback paramGetThumbnailListCallback)
  {
    int[] arrayOfInt = new int[paramInt3];
    int i = (int)(paramLong2 - paramLong1) / paramInt3;
    this.mThumbnailListListener = paramGetThumbnailListCallback;
    nativeGetPixelsList(paramString, paramInt1, paramInt2, i, paramInt3, (int)paramLong1, (int)paramLong2, arrayOfInt, getTNAccurateCodecConfig(), this.mThumbnailListListener);
  }

  Bitmap[] getPixelsList(String paramString, int paramInt1, int paramInt2, long paramLong1, long paramLong2, int paramInt3)
  {
    int[] arrayOfInt = new int[paramInt3];
    Bitmap[] arrayOfBitmap = nativeGetPixelsList(paramString, paramInt1, paramInt2, (int)(paramLong2 - paramLong1) / paramInt3, paramInt3, (int)paramLong1, (int)paramLong2, arrayOfInt, getTNAccurateCodecConfig());
    this.mThumbnailTime = arrayOfInt;
    return arrayOfBitmap;
  }

  void getPixelsListFast(String paramString, int paramInt1, int paramInt2, long paramLong1, long paramLong2, int paramInt3, MediaItem.GetThumbnailListCallback paramGetThumbnailListCallback)
  {
    int i = 0;
    (0xFFFFFFFE & paramInt1 + 1);
    (0xFFFFFFFE & paramInt2 + 1);
    int[] arrayOfInt = new int[paramInt3];
    int j = (int)(paramLong2 - paramLong1) / paramInt3;
    this.mThumbnailListListener = paramGetThumbnailListCallback;
    int k = (int)paramLong1;
    int m = (int)paramLong2;
    try
    {
      nativeGetPixelsListFastCB(paramString, paramInt1, paramInt2, j, paramInt3, k, m, arrayOfInt, getTNFastCodecConfig(), this.mThumbnailListListener);
      if (i == 1)
      {
        n = (int)paramLong1;
        i1 = (int)paramLong2;
      }
    }
    catch (Exception localException)
    {
      try
      {
        int n;
        int i1;
        nativeGetPixelsListFastCB(paramString, paramInt1, paramInt2, j, paramInt3, n, i1, arrayOfInt, getTNAccurateCodecConfig(), this.mThumbnailListListener);
        return;
        localException = localException;
        Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsListFast call ");
        i = 1;
      }
      catch (RuntimeException localRuntimeException)
      {
        Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsListFast call with fallback");
        throw localRuntimeException;
      }
    }
  }

  Pair<Integer, Bitmap>[] getPixelsListFast(String paramString, int paramInt1, int paramInt2, long paramLong1, long paramLong2, int paramInt3)
  {
    (4 * ((0xFFFFFFFE & paramInt1 + 1) * (0xFFFFFFFE & paramInt2 + 1)));
    int i = 0;
    int[] arrayOfInt = new int[paramInt3];
    Pair[] arrayOfPair = new Pair[paramInt3];
    int j = (int)(paramLong2 - paramLong1) / paramInt3;
    int k = (int)paramLong1;
    int m = (int)paramLong2;
    try
    {
      Bitmap[] arrayOfBitmap2 = nativeGetPixelsListFast(paramString, paramInt1, paramInt2, j, paramInt3, k, m, arrayOfInt, getTNFastCodecConfig());
      while (true)
      {
        n = 0;
        if (i >= paramInt3)
          break;
        arrayOfPair[i] = new Pair(Integer.valueOf(arrayOfInt[i]), arrayOfBitmap2[i]);
        i++;
      }
    }
    catch (Exception localException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsListFast call ");
      int n = 1;
      if (n == 1)
      {
        int i1 = (int)paramLong1;
        int i2 = (int)paramLong2;
        try
        {
          Bitmap[] arrayOfBitmap1 = nativeGetPixelsListFast(paramString, paramInt1, paramInt2, j, paramInt3, i1, i2, arrayOfInt, getTNAccurateCodecConfig());
          while (i < paramInt3)
          {
            arrayOfPair[i] = new Pair(Integer.valueOf(arrayOfInt[i]), arrayOfBitmap1[i]);
            i++;
          }
        }
        catch (RuntimeException localRuntimeException)
        {
          Log.e("MediaArtistNativeHelper", "Runtime exception in getPixelsListFast call with fallback");
          throw localRuntimeException;
        }
      }
    }
    return arrayOfPair;
  }

  String getProjectAudioTrackPCMFilePath()
  {
    return this.mAudioTrackPCMFilePath;
  }

  String getProjectPath()
  {
    return this.mProjectPath;
  }

  public int getTNAccurateCodecConfig()
  {
    return mTNDecConfigAccurateMode;
  }

  public int getTNFastCodecConfig()
  {
    return mTNDecConfigFastMode;
  }

  public int getVideoCodecType(int paramInt)
  {
    switch (paramInt)
    {
    case 3:
    default:
      return -1;
    case 1:
      return 1;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 2:
      return 2;
    case 0:
    }
    return 0;
  }

  void initClipSettings(ClipSettings paramClipSettings)
  {
    paramClipSettings.clipPath = null;
    paramClipSettings.clipDecodedPath = null;
    paramClipSettings.clipOriginalPath = null;
    paramClipSettings.fileType = 0;
    paramClipSettings.endCutTime = 0;
    paramClipSettings.beginCutTime = 0;
    paramClipSettings.beginCutPercent = 0;
    paramClipSettings.endCutPercent = 0;
    paramClipSettings.panZoomEnabled = false;
    paramClipSettings.panZoomPercentStart = 0;
    paramClipSettings.panZoomTopLeftXStart = 0;
    paramClipSettings.panZoomTopLeftYStart = 0;
    paramClipSettings.panZoomPercentEnd = 0;
    paramClipSettings.panZoomTopLeftXEnd = 0;
    paramClipSettings.panZoomTopLeftYEnd = 0;
    paramClipSettings.mediaRendering = 0;
    paramClipSettings.rgbWidth = 0;
    paramClipSettings.rgbHeight = 0;
    paramClipSettings.clipVolumePercentage = 0;
    paramClipSettings.mNumCuts = 0;
  }

  void invalidatePcmFile()
  {
    if (this.mAudioTrackPCMFilePath != null)
    {
      new File(this.mAudioTrackPCMFilePath).delete();
      this.mAudioTrackPCMFilePath = null;
    }
  }

  public native boolean nativeFindThumbnailMode(String paramString, int paramInt, long paramLong1, long paramLong2)
    throws RuntimeException;

  public native Bitmap nativeGetPixelsFast(String paramString, int paramInt1, int paramInt2, long paramLong, int paramInt3);

  public native Bitmap[] nativeGetPixelsListFast(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int[] paramArrayOfInt, int paramInt7);

  public native int nativeGetPixelsListFastCB(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int[] paramArrayOfInt, int paramInt7, MediaItem.GetThumbnailListCallback paramGetThumbnailListCallback);

  int nativeHelperGetAspectRatio()
  {
    return this.mVideoEditor.getAspectRatio();
  }

  public void releaseNativeHelper()
  {
    try
    {
      release();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Log.e("MediaArtistNativeHelper", "Illegal State exeption caught in releaseNativeHelper");
      throw localIllegalStateException;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exeption caught in releaseNativeHelper");
      throw localRuntimeException;
    }
  }

  void setAudioflag(boolean paramBoolean)
  {
    if (!new File(String.format(this.mProjectPath + "/" + "AudioPcm.pcm", new Object[0])).exists())
      paramBoolean = true;
    this.mRegenerateAudio = paramBoolean;
  }

  void setFit2ShareFile(String paramString)
  {
    this.mExportFilename = paramString;
  }

  void stop(String paramString)
  {
    try
    {
      stopEncoding();
      new File(this.mExportFilename).delete();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Log.e("MediaArtistNativeHelper", "Illegal state exception in unload settings");
      throw localIllegalStateException;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exception in unload settings");
      throw localRuntimeException;
    }
  }

  void stopAudioWaveformExtraction()
  {
    try
    {
      stopExtraction();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Log.e("MediaArtistNativeHelper", "Illegal state exception in unload settings");
      throw localIllegalStateException;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("MediaArtistNativeHelper", "Runtime exception in unload settings");
      throw localRuntimeException;
    }
  }

  void stopThumbnailList()
  {
    try
    {
      stopThumbnail();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Log.e("MediaArtistNativeHelper", "Illegal state exception in stopThumbnail");
      throw localIllegalStateException;
    }
  }

  public static class AlphaMagicSettings
  {
    public int blendingPercent;
    public String file;
    public boolean invertRotation;
    public int rgbHeight;
    public int rgbWidth;
  }

  public static class AudioEffect
  {
    public static final int FADE_IN = 8;
    public static final int FADE_OUT = 16;
    public static final int NONE;
  }

  public final class AudioFormat
  {
    public static final int AAC = 2;
    public static final int AAC_PLUS = 3;
    public static final int AMR_NB = 1;
    public static final int ENHANCED_AAC_PLUS = 4;
    public static final int EVRC = 6;
    public static final int MP3 = 5;
    public static final int NO_AUDIO = 0;
    public static final int NULL_AUDIO = 254;
    public static final int PCM = 7;
    public static final int UNSUPPORTED_AUDIO = 255;

    public AudioFormat()
    {
    }
  }

  public final class AudioSamplingFrequency
  {
    public static final int FREQ_11025 = 11025;
    public static final int FREQ_12000 = 12000;
    public static final int FREQ_16000 = 16000;
    public static final int FREQ_22050 = 22050;
    public static final int FREQ_24000 = 24000;
    public static final int FREQ_32000 = 32000;
    public static final int FREQ_44100 = 44100;
    public static final int FREQ_48000 = 48000;
    public static final int FREQ_8000 = 8000;
    public static final int FREQ_DEFAULT;

    public AudioSamplingFrequency()
    {
    }
  }

  public static class AudioSettings
  {
    int ExtendedFs;
    int Fs;
    String Id;
    boolean bInDucking_enable;
    boolean bRemoveOriginal;
    long beginCutTime;
    int channels;
    int ducking_lowVolume;
    int ducking_threshold;
    long endCutTime;
    int fileType;
    boolean loop;
    String pFile;
    String pcmFilePath;
    long startMs;
    int volume;
  }

  public static final class AudioTransition
  {
    public static final int CROSS_FADE = 1;
    public static final int NONE;
  }

  public static class BackgroundMusicSettings
  {
    public long beginLoop;
    public int duckingThreshold;
    public boolean enableDucking;
    public long endLoop;
    public String file;
    public int fileType;
    public long insertionTime;
    public boolean isLooping;
    public int lowVolume;
    public int volumePercent;
  }

  public final class Bitrate
  {
    public static final int BR_128_KBPS = 128000;
    public static final int BR_12_2_KBPS = 12200;
    public static final int BR_16_KBPS = 16000;
    public static final int BR_192_KBPS = 192000;
    public static final int BR_1_2_MBPS = 1200000;
    public static final int BR_1_5_MBPS = 1500000;
    public static final int BR_1_MBPS = 1000000;
    public static final int BR_24_KBPS = 24000;
    public static final int BR_256_KBPS = 256000;
    public static final int BR_288_KBPS = 288000;
    public static final int BR_2_MBPS = 2000000;
    public static final int BR_32_KBPS = 32000;
    public static final int BR_384_KBPS = 384000;
    public static final int BR_48_KBPS = 48000;
    public static final int BR_512_KBPS = 512000;
    public static final int BR_5_MBPS = 5000000;
    public static final int BR_64_KBPS = 64000;
    public static final int BR_800_KBPS = 800000;
    public static final int BR_8_MBPS = 8000000;
    public static final int BR_96_KBPS = 96000;
    public static final int BR_9_2_KBPS = 9200;
    public static final int UNDEFINED = 0;
    public static final int VARIABLE = -1;

    public Bitrate()
    {
    }
  }

  public static class ClipSettings
  {
    public int[] arrayBeginCutTime;
    public int[] arrayEndCutTime;
    public int beginCutPercent;
    public int beginCutTime;
    public String clipDecodedPath;
    public String clipOriginalPath;
    public String clipPath;
    public int clipVolumePercentage;
    public int endCutPercent;
    public int endCutTime;
    public int fileType;
    public int mNumCuts;
    public int mediaRendering;
    public boolean panZoomEnabled;
    public int panZoomPercentEnd;
    public int panZoomPercentStart;
    public int panZoomTopLeftXEnd;
    public int panZoomTopLeftXStart;
    public int panZoomTopLeftYEnd;
    public int panZoomTopLeftYStart;
    public int rgbHeight;
    public int rgbWidth;
  }

  public static class CodecConfig
  {
    public static final int NXPSWVDEC = 1;
    public static final int SFHWVDEC = 2;
    public static final int UNDEFINED;
  }

  public static class EditSettings
  {
    public int audioBitrate;
    public int audioChannels;
    public int audioFormat;
    public int audioSamplingFreq;
    public MediaArtistNativeHelper.BackgroundMusicSettings backgroundMusicSettings;
    public MediaArtistNativeHelper.ClipSettings[] clipSettingsArray;
    public MediaArtistNativeHelper.EffectSettings[] effectSettingsArray;
    public int maxFileSize;
    public String outputFile;
    public int primaryTrackVolume;
    public MediaArtistNativeHelper.TransitionSettings[] transitionSettingsArray;
    public int videoBitrate;
    public int videoFormat;
    public int videoFrameRate;
    public int videoFrameSize;
    public int videoRenderingType;
  }

  public static class EffectSettings
  {
    public int alphaBlendingEndPercent;
    public int alphaBlendingFadeInTimePercent;
    public int alphaBlendingFadeOutTimePercent;
    public int alphaBlendingMiddlePercent;
    public int alphaBlendingStartPercent;
    public int audioEffectType;
    public int bitmapType;
    public int duration;
    public int durationPercent;
    public int fiftiesFrameRate;
    public int[] framingBuffer;
    public String framingFile;
    public boolean framingResize;
    public int framingScaledSize;
    public int height;
    public int rgb16InputColor;
    public int startPercent;
    public int startTime;
    public String text;
    public int textBufferHeight;
    public int textBufferWidth;
    public String textRenderingData;
    public int topLeftX;
    public int topLeftY;
    public int videoEffectType;
    public int width;
  }

  public final class FileType
  {
    public static final int AMR = 2;
    public static final int GIF = 7;
    public static final int JPG = 5;
    public static final int M4V = 10;
    public static final int MP3 = 3;
    public static final int MP4 = 1;
    public static final int PCM = 4;
    public static final int PNG = 8;
    public static final int THREE_GPP = 0;
    public static final int UNSUPPORTED = 255;

    public FileType()
    {
    }
  }

  public final class MediaRendering
  {
    public static final int BLACK_BORDERS = 2;
    public static final int CROPPING = 1;
    public static final int RESIZING;

    public MediaRendering()
    {
    }
  }

  public static abstract interface OnProgressUpdateListener
  {
    public abstract void OnProgressUpdate(int paramInt1, int paramInt2);
  }

  public static class PreviewClipProperties
  {
    public MediaArtistNativeHelper.Properties[] clipProperties;
  }

  public static class PreviewClips
  {
    public long beginPlayTime;
    public String clipPath;
    public long endPlayTime;
    public int fileType;
    public int mediaRendering;
  }

  public static class PreviewSettings
  {
    public MediaArtistNativeHelper.EffectSettings[] effectSettingsArray;
    public MediaArtistNativeHelper.PreviewClips[] previewClipsArray;
  }

  public static class Properties
  {
    public String Id;
    public int audioBitrate;
    public int audioChannels;
    public int audioDuration;
    public int audioFormat;
    public int audioSamplingFrequency;
    public int audioVolumeValue;
    public float averageFrameRate;
    public boolean bIsVideo3D;
    public int duration;
    public int fileType;
    public int height;
    public int profileAndLevel;
    public int videoBitrate;
    public int videoDuration;
    public int videoFormat;
    public int width;
  }

  public final class Result
  {
    public static final int ERR_ADDCTS_HIGHER_THAN_VIDEO_DURATION = 40;
    public static final int ERR_ADDVOLUME_EQUALS_ZERO = 39;
    public static final int ERR_ALLOC = 62;
    public static final int ERR_AMR_EDITING_UNSUPPORTED = 19;
    public static final int ERR_ANALYSIS_DATA_SIZE_TOO_SMALL = 15;
    public static final int ERR_AUDIOBITRATE_TOO_HIGH = 121;
    public static final int ERR_AUDIOBITRATE_TOO_LOW = 119;
    public static final int ERR_AUDIO_CANNOT_BE_MIXED = 47;
    public static final int ERR_AUDIO_CONVERSION_FAILED = 114;
    public static final int ERR_AUDIO_MIXING_MP3_UNSUPPORTED = 44;
    public static final int ERR_AUDIO_MIXING_UNSUPPORTED = 43;
    public static final int ERR_BAD_CONTEXT = 63;
    public static final int ERR_BAD_OPTION_ID = 66;
    public static final int ERR_BAD_STREAM_ID = 65;
    public static final int ERR_BEGIN_CUT_EQUALS_END_CUT = 115;
    public static final int ERR_BEGIN_CUT_LARGER_THAN_DURATION = 12;
    public static final int ERR_BEGIN_CUT_LARGER_THAN_END_CUT = 13;
    public static final int ERR_BUFFER_OUT_TOO_SMALL = 2;
    public static final int ERR_CLOCK_BAD_REF_YEAR = 56;
    public static final int ERR_CONTEXT_FAILED = 64;
    public static final int ERR_DECODER_H263_NOT_BASELINE = 135;
    public static final int ERR_DECODER_H263_PROFILE_NOT_SUPPORTED = 134;
    public static final int ERR_DIR_NO_MORE_ENTRY = 59;
    public static final int ERR_DIR_OPEN_FAILED = 57;
    public static final int ERR_DIR_READ_FAILED = 58;
    public static final int ERR_DURATION_IS_NULL = 111;
    public static final int ERR_EDITING_NO_SUPPORTED_STREAM_IN_FILE = 29;
    public static final int ERR_EDITING_NO_SUPPORTED_VIDEO_STREAM_IN_FILE = 30;
    public static final int ERR_EDITING_UNSUPPORTED_AUDIO_FORMAT = 28;
    public static final int ERR_EDITING_UNSUPPORTED_H263_PROFILE = 25;
    public static final int ERR_EDITING_UNSUPPORTED_MPEG4_PROFILE = 26;
    public static final int ERR_EDITING_UNSUPPORTED_MPEG4_RVLC = 27;
    public static final int ERR_EDITING_UNSUPPORTED_VIDEO_FORMAT = 24;
    public static final int ERR_ENCODER_ACCES_UNIT_ERROR = 23;
    public static final int ERR_END_CUT_SMALLER_THAN_BEGIN_CUT = 116;
    public static final int ERR_EXTERNAL_EFFECT_NULL = 10;
    public static final int ERR_EXTERNAL_TRANSITION_NULL = 11;
    public static final int ERR_FEATURE_UNSUPPORTED_WITH_AAC = 46;
    public static final int ERR_FEATURE_UNSUPPORTED_WITH_AUDIO_TRACK = 45;
    public static final int ERR_FEATURE_UNSUPPORTED_WITH_EVRC = 49;
    public static final int ERR_FILE_BAD_MODE_ACCESS = 80;
    public static final int ERR_FILE_INVALID_POSITION = 81;
    public static final int ERR_FILE_LOCKED = 79;
    public static final int ERR_FILE_NOT_FOUND = 1;
    public static final int ERR_H263_FORBIDDEN_IN_MP4_FILE = 112;
    public static final int ERR_H263_PROFILE_NOT_SUPPORTED = 51;
    public static final int ERR_INCOMPATIBLE_VIDEO_DATA_PARTITIONING = 36;
    public static final int ERR_INCOMPATIBLE_VIDEO_FORMAT = 33;
    public static final int ERR_INCOMPATIBLE_VIDEO_FRAME_SIZE = 34;
    public static final int ERR_INCOMPATIBLE_VIDEO_TIME_SCALE = 35;
    public static final int ERR_INPUT_AUDIO_AU_TOO_LARGE = 21;
    public static final int ERR_INPUT_AUDIO_CORRUPTED_AU = 22;
    public static final int ERR_INPUT_FILE_CONTAINS_NO_SUPPORTED_STREAM = 103;
    public static final int ERR_INPUT_VIDEO_AU_TOO_LARGE = 20;
    public static final int ERR_INTERNAL = 255;
    public static final int ERR_INVALID_3GPP_FILE = 16;
    public static final int ERR_INVALID_AAC_SAMPLING_FREQUENCY = 113;
    public static final int ERR_INVALID_AUDIO_EFFECT_TYPE = 6;
    public static final int ERR_INVALID_AUDIO_TRANSITION_TYPE = 8;
    public static final int ERR_INVALID_CLIP_ANALYSIS_PLATFORM = 32;
    public static final int ERR_INVALID_CLIP_ANALYSIS_VERSION = 31;
    public static final int ERR_INVALID_EFFECT_KIND = 4;
    public static final int ERR_INVALID_FILE_TYPE = 3;
    public static final int ERR_INVALID_INPUT_FILE = 104;
    public static final int ERR_INVALID_VIDEO_EFFECT_TYPE = 5;
    public static final int ERR_INVALID_VIDEO_ENCODING_FRAME_RATE = 9;
    public static final int ERR_INVALID_VIDEO_FRAME_RATE_FOR_H263 = 110;
    public static final int ERR_INVALID_VIDEO_FRAME_SIZE_FOR_H263 = 109;
    public static final int ERR_INVALID_VIDEO_TRANSITION_TYPE = 7;
    public static final int ERR_MAXFILESIZE_TOO_SMALL = 117;
    public static final int ERR_NOMORE_SPACE_FOR_FILE = 136;
    public static final int ERR_NOT_IMPLEMENTED = 69;
    public static final int ERR_NO_SUPPORTED_STREAM_IN_FILE = 38;
    public static final int ERR_NO_SUPPORTED_VIDEO_STREAM_IN_FILE = 52;
    public static final int ERR_ONLY_AMRNB_INPUT_CAN_BE_MIXED = 48;
    public static final int ERR_OUTPUT_FILE_SIZE_TOO_SMALL = 122;
    public static final int ERR_OVERLAPPING_TRANSITIONS = 14;
    public static final int ERR_PARAMETER = 60;
    public static final int ERR_READER_UNKNOWN_STREAM_TYPE = 123;
    public static final int ERR_READ_ONLY = 68;
    public static final int ERR_STATE = 61;
    public static final int ERR_STR_BAD_ARGS = 97;
    public static final int ERR_STR_BAD_STRING = 94;
    public static final int ERR_STR_CONV_FAILED = 95;
    public static final int ERR_STR_OVERFLOW = 96;
    public static final int ERR_THREAD_NOT_STARTED = 100;
    public static final int ERR_UNDEFINED_AUDIO_TRACK_FILE_FORMAT = 41;
    public static final int ERR_UNDEFINED_OUTPUT_AUDIO_FORMAT = 108;
    public static final int ERR_UNDEFINED_OUTPUT_VIDEO_FORMAT = 105;
    public static final int ERR_UNDEFINED_OUTPUT_VIDEO_FRAME_RATE = 107;
    public static final int ERR_UNDEFINED_OUTPUT_VIDEO_FRAME_SIZE = 106;
    public static final int ERR_UNSUPPORTED_ADDED_AUDIO_STREAM = 42;
    public static final int ERR_UNSUPPORTED_INPUT_AUDIO_FORMAT = 18;
    public static final int ERR_UNSUPPORTED_INPUT_VIDEO_FORMAT = 17;
    public static final int ERR_UNSUPPORTED_MEDIA_TYPE = 70;
    public static final int ERR_UNSUPPORTED_MP3_ASSEMBLY = 37;
    public static final int ERR_VIDEOBITRATE_TOO_HIGH = 120;
    public static final int ERR_VIDEOBITRATE_TOO_LOW = 118;
    public static final int ERR_WRITE_ONLY = 67;
    public static final int NO_ERROR = 0;
    public static final int WAR_BUFFER_FULL = 76;
    public static final int WAR_DEBLOCKING_FILTER_NOT_IMPLEMENTED = 133;
    public static final int WAR_INVALID_TIME = 73;
    public static final int WAR_MAX_OUTPUT_SIZE_EXCEEDED = 54;
    public static final int WAR_MEDIATYPE_NOT_SUPPORTED = 102;
    public static final int WAR_NO_DATA_YET = 71;
    public static final int WAR_NO_MORE_AU = 74;
    public static final int WAR_NO_MORE_STREAM = 72;
    public static final int WAR_READER_INFORMATION_NOT_PRESENT = 125;
    public static final int WAR_READER_NO_METADATA = 124;
    public static final int WAR_REDIRECT = 77;
    public static final int WAR_STR_NOT_FOUND = 99;
    public static final int WAR_STR_OVERFLOW = 98;
    public static final int WAR_TIMESCALE_TOO_BIG = 55;
    public static final int WAR_TIME_OUT = 75;
    public static final int WAR_TOO_MUCH_STREAMS = 78;
    public static final int WAR_TRANSCODING_DONE = 101;
    public static final int WAR_TRANSCODING_NECESSARY = 53;
    public static final int WAR_VIDEORENDERER_NO_NEW_FRAME = 132;
    public static final int WAR_WRITER_STOP_REQ = 131;

    public Result()
    {
    }
  }

  public static final class SlideDirection
  {
    public static final int BOTTOM_OUT_TOP_IN = 3;
    public static final int LEFT_OUT_RIGTH_IN = 1;
    public static final int RIGHT_OUT_LEFT_IN = 0;
    public static final int TOP_OUT_BOTTOM_IN = 2;
  }

  public static class SlideTransitionSettings
  {
    public int direction;
  }

  public static final class TransitionBehaviour
  {
    public static final int FAST_MIDDLE = 4;
    public static final int LINEAR = 1;
    public static final int SLOW_MIDDLE = 3;
    public static final int SPEED_DOWN = 2;
    public static final int SPEED_UP;
  }

  public static class TransitionSettings
  {
    public MediaArtistNativeHelper.AlphaMagicSettings alphaSettings;
    public int audioTransitionType;
    public int duration;
    public MediaArtistNativeHelper.SlideTransitionSettings slideSettings;
    public int transitionBehaviour;
    public int videoTransitionType;
  }

  public final class Version
  {
    public int major;
    public int minor;
    public int revision;

    public Version()
    {
    }
  }

  public static class VideoEffect
  {
    public static final int BLACK_AND_WHITE = 257;
    public static final int COLORRGB16 = 267;
    public static final int CURTAIN_CLOSING = 17;
    public static final int CURTAIN_OPENING = 9;
    public static final int EXTERNAL = 256;
    public static final int FADE_FROM_BLACK = 8;
    public static final int FADE_TO_BLACK = 16;
    public static final int FIFTIES = 266;
    public static final int FRAMING = 262;
    public static final int GRADIENT = 268;
    public static final int GREEN = 259;
    public static final int NEGATIVE = 261;
    public static final int NONE = 0;
    public static final int PINK = 258;
    public static final int SEPIA = 260;
    public static final int TEXT = 263;
    public static final int ZOOM_IN = 264;
    public static final int ZOOM_OUT = 265;
  }

  public final class VideoFormat
  {
    public static final int H263 = 1;
    public static final int H264 = 4;
    public static final int H264_HP = 6;
    public static final int H264_MP = 5;
    public static final int MPEG4 = 2;
    public static final int MPEG4_EMP = 3;
    public static final int NO_VIDEO = 0;
    public static final int NULL_VIDEO = 254;
    public static final int UNSUPPORTED = 255;

    public VideoFormat()
    {
    }
  }

  public final class VideoFrameRate
  {
    public static final int FR_10_FPS = 2;
    public static final int FR_12_5_FPS = 3;
    public static final int FR_15_FPS = 4;
    public static final int FR_20_FPS = 5;
    public static final int FR_25_FPS = 6;
    public static final int FR_30_FPS = 7;
    public static final int FR_5_FPS = 0;
    public static final int FR_7_5_FPS = 1;

    public VideoFrameRate()
    {
    }
  }

  public final class VideoFrameSize
  {
    public static final int CIF = 4;
    public static final int NTSC = 8;
    public static final int QCIF = 2;
    public static final int QQVGA = 1;
    public static final int QVGA = 3;
    public static final int S1080p = 14;
    public static final int S720p = 13;
    public static final int SIZE_UNDEFINED = -1;
    public static final int SQCIF = 0;
    public static final int TWITTER480x480 = 5;
    public static final int V720p = 11;
    public static final int VGA = 6;
    public static final int W720p = 12;
    public static final int WVGA = 7;
    public static final int WVGA16x9 = 10;
    public static final int nHD = 9;

    public VideoFrameSize()
    {
    }
  }

  public final class VideoProfile
  {
    public static final int H263_PROFILE_0_LEVEL_10 = 0;
    public static final int H263_PROFILE_0_LEVEL_20 = 1;
    public static final int H263_PROFILE_0_LEVEL_30 = 2;
    public static final int H263_PROFILE_0_LEVEL_40 = 3;
    public static final int H263_PROFILE_0_LEVEL_45 = 4;
    public static final int H264_PROFILE_0_LEVEL_1 = 150;
    public static final int H264_PROFILE_0_LEVEL_1_1 = 152;
    public static final int H264_PROFILE_0_LEVEL_1_2 = 153;
    public static final int H264_PROFILE_0_LEVEL_1_3 = 154;
    public static final int H264_PROFILE_0_LEVEL_1b = 151;
    public static final int H264_PROFILE_0_LEVEL_2 = 155;
    public static final int H264_PROFILE_0_LEVEL_2_1 = 156;
    public static final int H264_PROFILE_0_LEVEL_2_2 = 157;
    public static final int H264_PROFILE_0_LEVEL_3 = 158;
    public static final int H264_PROFILE_0_LEVEL_3_1 = 159;
    public static final int H264_PROFILE_0_LEVEL_3_2 = 160;
    public static final int H264_PROFILE_0_LEVEL_4 = 161;
    public static final int H264_PROFILE_0_LEVEL_4_1 = 162;
    public static final int H264_PROFILE_0_LEVEL_4_2 = 163;
    public static final int H264_PROFILE_0_LEVEL_5 = 164;
    public static final int H264_PROFILE_0_LEVEL_5_1 = 165;
    public static final int H264_PROFILE_H_LEVEL_1 = 210;
    public static final int H264_PROFILE_H_LEVEL_1_1 = 212;
    public static final int H264_PROFILE_H_LEVEL_1_2 = 213;
    public static final int H264_PROFILE_H_LEVEL_1_3 = 214;
    public static final int H264_PROFILE_H_LEVEL_1b = 211;
    public static final int H264_PROFILE_H_LEVEL_2 = 215;
    public static final int H264_PROFILE_H_LEVEL_2_1 = 216;
    public static final int H264_PROFILE_H_LEVEL_2_2 = 217;
    public static final int H264_PROFILE_H_LEVEL_3 = 218;
    public static final int H264_PROFILE_H_LEVEL_3_1 = 219;
    public static final int H264_PROFILE_H_LEVEL_3_2 = 220;
    public static final int H264_PROFILE_H_LEVEL_4 = 221;
    public static final int H264_PROFILE_H_LEVEL_4_1 = 222;
    public static final int H264_PROFILE_H_LEVEL_4_2 = 223;
    public static final int H264_PROFILE_H_LEVEL_5 = 224;
    public static final int H264_PROFILE_H_LEVEL_5_1 = 225;
    public static final int H264_PROFILE_M_LEVEL_1 = 180;
    public static final int H264_PROFILE_M_LEVEL_1_1 = 182;
    public static final int H264_PROFILE_M_LEVEL_1_2 = 183;
    public static final int H264_PROFILE_M_LEVEL_1_3 = 184;
    public static final int H264_PROFILE_M_LEVEL_1b = 181;
    public static final int H264_PROFILE_M_LEVEL_2 = 185;
    public static final int H264_PROFILE_M_LEVEL_2_1 = 186;
    public static final int H264_PROFILE_M_LEVEL_2_2 = 187;
    public static final int H264_PROFILE_M_LEVEL_3 = 188;
    public static final int H264_PROFILE_M_LEVEL_3_1 = 189;
    public static final int H264_PROFILE_M_LEVEL_3_2 = 190;
    public static final int H264_PROFILE_M_LEVEL_4 = 191;
    public static final int H264_PROFILE_M_LEVEL_4_1 = 192;
    public static final int H264_PROFILE_M_LEVEL_4_2 = 193;
    public static final int H264_PROFILE_M_LEVEL_5 = 194;
    public static final int H264_PROFILE_M_LEVEL_5_1 = 195;
    public static final int MPEG4_SP_LEVEL_0 = 50;
    public static final int MPEG4_SP_LEVEL_0B = 51;
    public static final int MPEG4_SP_LEVEL_1 = 52;
    public static final int MPEG4_SP_LEVEL_2 = 53;
    public static final int MPEG4_SP_LEVEL_3 = 54;
    public static final int MPEG4_SP_LEVEL_4A = 55;
    public static final int MPEG4_SP_LEVEL_5 = 56;
    public static final int MPEG4_SP_LEVEL_6 = 57;
    public static final int OUT_OF_RANGE = 255;

    public VideoProfile()
    {
    }
  }

  public static class VideoRendering
  {
    public static final int RENDERAS2D = 1;
    public static final int RENDERAS3D = 2;
    public static final int RENDERASINPUT_TYPE;
  }

  public static class VideoTransition
  {
    public static final int ALPHA_MAGIC = 257;
    public static final int CROSS_FADE = 1;
    public static final int EXTERNAL = 256;
    public static final int FADE_BLACK = 259;
    public static final int NONE = 0;
    public static final int SLIDE_TRANSITION = 258;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.MediaArtistNativeHelper
 * JD-Core Version:    0.6.2
 */