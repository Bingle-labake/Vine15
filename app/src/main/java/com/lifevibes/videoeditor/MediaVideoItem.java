package com.lifevibes.videoeditor;

import java.io.IOException;
import java.util.concurrent.Semaphore;

public class MediaVideoItem extends MediaItem
{
  private final int mAspectRatio;
  private final int mAudioBitrate;
  private final int mAudioChannels;
  private final int mAudioSamplingFrequency;
  private final int mAudioType;
  private String mAudioWaveformFilename;
  private long mBeginBoundaryTimeMs;
  private final long mDurationMs;
  private long mEndBoundaryTimeMs;
  private boolean mExclude;
  private long mExcludeBeginTime;
  private long mExcludeEndTime;
  private final int mFileType;
  private final int mFps;
  private final int mHeight;
  private boolean mIsVideo3D;
  private MediaArtistNativeHelper mMANativeHelper;
  private boolean mMuted;
  private Semaphore mThumbnailLock;
  private final int mVideoBitrate;
  private VideoEditorImpl mVideoEditor;
  private final int mVideoProfile;
  private final int mVideoType;
  private int mVolumePercentage;
  private final int mWidth;
  private int originalVolume;

  private MediaVideoItem()
    throws IOException
  {
    this(null, null, null, 0);
  }

  public MediaVideoItem(VideoEditor paramVideoEditor, String paramString1, String paramString2, int paramInt)
    throws IOException
  {
    this(paramVideoEditor, paramString1, paramString2, paramInt, 0L, -1L, 100, false, null);
    this.mThumbnailLock = new Semaphore(1, true);
  }

  MediaVideoItem(VideoEditor paramVideoEditor, String paramString1, String paramString2, int paramInt1, long paramLong1, long paramLong2, int paramInt2, boolean paramBoolean, String paramString3)
    throws IOException
  {
    super(paramVideoEditor, paramString1, paramString2, paramInt1);
    if ((paramVideoEditor instanceof VideoEditorImpl))
    {
      this.mMANativeHelper = ((VideoEditorImpl)paramVideoEditor).getNativeContext();
      this.mVideoEditor = ((VideoEditorImpl)paramVideoEditor);
    }
    this.mThumbnailLock = new Semaphore(1, true);
    MediaArtistNativeHelper.Properties localProperties;
    try
    {
      localProperties = this.mMANativeHelper.getMediaProperties(paramString2);
      switch (this.mMANativeHelper.getFileType(localProperties.fileType))
      {
      default:
        Object[] arrayOfObject4 = new Object[1];
        arrayOfObject4[0] = Integer.valueOf(localProperties.fileType);
        throw new IllegalArgumentException(String.format("Unsupported Input File Type (%d)", arrayOfObject4));
      case 0:
      case 1:
      case 10:
      }
    }
    catch (Exception localException)
    {
      throw new IllegalArgumentException(localException.getMessage() + " : " + paramString2.substring(1 + paramString2.lastIndexOf("."), paramString2.length()));
    }
    switch (this.mMANativeHelper.getVideoCodecType(localProperties.videoFormat))
    {
    case 3:
    default:
      Object[] arrayOfObject3 = new Object[1];
      arrayOfObject3[0] = Integer.valueOf(localProperties.videoFormat);
      throw new IllegalArgumentException(String.format("Unsupported Video Codec Format in Input File (%d)", arrayOfObject3));
    case 1:
    case 2:
    case 4:
    case 5:
    case 6:
    }
    if (localProperties.audioFormat != 0)
      switch (this.mMANativeHelper.getAudioCodecType(localProperties.audioFormat))
      {
      default:
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(localProperties.audioFormat);
        throw new IllegalArgumentException(String.format("Unsupported Audio Codec Format in Input File (%d)", arrayOfObject2));
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      }
    if (localProperties.profileAndLevel == 255)
    {
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(localProperties.profileAndLevel);
      throw new IllegalArgumentException(String.format("Unsupported Video Codec Profile in Input File (%d)", arrayOfObject1));
    }
    this.mIsVideo3D = localProperties.bIsVideo3D;
    this.mWidth = localProperties.width;
    this.mHeight = localProperties.height;
    this.mAspectRatio = this.mMANativeHelper.getAspectRatio(localProperties.width, localProperties.height);
    this.mFileType = this.mMANativeHelper.getFileType(localProperties.fileType);
    this.mVideoType = this.mMANativeHelper.getVideoCodecType(localProperties.videoFormat);
    this.mVideoProfile = localProperties.profileAndLevel;
    this.mDurationMs = localProperties.videoDuration;
    this.mVideoBitrate = localProperties.videoBitrate;
    this.mAudioBitrate = localProperties.audioBitrate;
    this.mFps = ((int)localProperties.averageFrameRate);
    this.mAudioType = this.mMANativeHelper.getAudioCodecType(localProperties.audioFormat);
    this.mAudioChannels = localProperties.audioChannels;
    this.mAudioSamplingFrequency = localProperties.audioSamplingFrequency;
    this.mBeginBoundaryTimeMs = paramLong1;
    if (paramLong2 == -1L)
      paramLong2 = this.mDurationMs;
    this.mEndBoundaryTimeMs = paramLong2;
    this.mVolumePercentage = paramInt2;
    this.originalVolume = paramInt2;
    this.mMuted = paramBoolean;
    this.mAudioWaveformFilename = paramString3;
    this.mExcludeBeginTime = 0L;
    this.mExcludeEndTime = 0L;
    this.mExclude = false;
  }

  private void thumbnailLock()
    throws InterruptedException
  {
    this.mThumbnailLock.acquire();
  }

  private void thumbnailUnlock()
  {
    this.mThumbnailLock.release();
  }

  public int getAspectRatio()
  {
    return this.mAspectRatio;
  }

  public int getAudioBitrate()
  {
    return this.mAudioBitrate;
  }

  public int getAudioChannels()
  {
    return this.mAudioChannels;
  }

  public int getAudioSamplingFrequency()
  {
    return this.mAudioSamplingFrequency;
  }

  public int getAudioType()
  {
    return this.mAudioType;
  }

  public long getBoundaryBeginTime()
  {
    return this.mBeginBoundaryTimeMs;
  }

  public long getBoundaryEndTime()
  {
    return this.mEndBoundaryTimeMs;
  }

  public long getDuration()
  {
    return this.mDurationMs;
  }

  long getExcludeBeginTime()
  {
    return this.mExcludeBeginTime;
  }

  long getExcludeEndTime()
  {
    return this.mExcludeEndTime;
  }

  public int getFileType()
  {
    return this.mFileType;
  }

  public int getFps()
  {
    return this.mFps;
  }

  public int getHeight()
  {
    return this.mHeight;
  }

  public long getTimelineDuration()
  {
    if (!this.mExclude)
      return this.mEndBoundaryTimeMs - this.mBeginBoundaryTimeMs;
    return this.mExcludeBeginTime - 0L + (getDuration() - this.mExcludeEndTime);
  }

  public int getVideoBitrate()
  {
    return this.mVideoBitrate;
  }

  public int getVideoProfile()
  {
    return this.mVideoProfile;
  }

  public int getVideoType()
  {
    return this.mVideoType;
  }

  public int getWidth()
  {
    return this.mWidth;
  }

  boolean isExcludeCalled()
  {
    return this.mExclude;
  }

  public boolean isMuted()
  {
    return this.mMuted;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.MediaVideoItem
 * JD-Core Version:    0.6.2
 */