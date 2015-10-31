package com.lifevibes.videoeditor;

import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class VideoEditorImpl
  implements VideoEditor
{
  private static final String CODECCONFIG_FILENAME = "CodecConfig.xml";
  private static final String TAG = "VideoEditorImpl";
  private static final String TAG_DEC_CONFIG_TN_ACCURATE_MODE = "ThubmnailAccurateMode";
  private static final String TAG_DEC_CONFIG_TN_FAST_MODE = "ThubmnailFastMode";
  private static final String TAG_TN = "ThumbNailcodecConfig";
  private int mAspectRatio;
  private List<String> mClipsList = new ArrayList();
  private long mDurationMs;
  private boolean mIsFirstVideoItemAdded;
  private boolean mIsList3D;
  private final Semaphore mLock = new Semaphore(1, true);
  private MediaArtistNativeHelper mMANativeHelper = new MediaArtistNativeHelper(paramString1, this.mLock, this);
  private final List<MediaItem> mMediaItems = new ArrayList();
  private final String mProjectPath;
  private int modifiedBitrate;

  VideoEditorImpl(String paramString)
    throws IOException
  {
    this.mProjectPath = paramString;
    this.mAspectRatio = 3;
    this.mDurationMs = 0L;
  }

  VideoEditorImpl(String paramString1, String paramString2)
    throws IOException
  {
    this.mProjectPath = paramString1;
    this.mAspectRatio = 3;
    this.mDurationMs = 0L;
    if (new File(paramString2, "CodecConfig.xml").exists());
    try
    {
      readCodecConfigFile(paramString2);
      return;
    }
    catch (Exception localException)
    {
    }
  }

  private void computeTimelineDuration()
  {
    this.mDurationMs = 0L;
    int i = this.mMediaItems.size();
    for (int j = 0; j < i; j++)
    {
      MediaItem localMediaItem = (MediaItem)this.mMediaItems.get(j);
      this.mDurationMs += localMediaItem.getTimelineDuration();
    }
  }

  private void lock()
    throws InterruptedException
  {
    if (Log.isLoggable("VideoEditorImpl", 3))
      Log.d("VideoEditorImpl", "lock: grabbing semaphore", new Throwable());
    this.mLock.acquire();
    if (Log.isLoggable("VideoEditorImpl", 3))
      Log.d("VideoEditorImpl", "lock: grabbed semaphore");
  }

  private boolean lock(long paramLong)
    throws InterruptedException
  {
    if (Log.isLoggable("VideoEditorImpl", 3))
      Log.d("VideoEditorImpl", "lock: grabbing semaphore with timeout " + paramLong, new Throwable());
    boolean bool = this.mLock.tryAcquire(paramLong, TimeUnit.MILLISECONDS);
    if (Log.isLoggable("VideoEditorImpl", 3))
      Log.d("VideoEditorImpl", "lock: grabbed semaphore status " + bool);
    return bool;
  }

  private void readCodecConfigFile(String paramString)
    throws FileNotFoundException, XmlPullParserException, IOException
  {
    FileInputStream localFileInputStream = new FileInputStream(new File(paramString, "CodecConfig.xml"));
    XmlPullParserFactory localXmlPullParserFactory = XmlPullParserFactory.newInstance();
    localXmlPullParserFactory.setNamespaceAware(true);
    XmlPullParser localXmlPullParser = localXmlPullParserFactory.newPullParser();
    localXmlPullParser.setInput(localFileInputStream, "UTF-8");
    int i = localXmlPullParser.getEventType();
    int j = 0;
    int k = 0;
    if (i != 1)
    {
      switch (i)
      {
      case 3:
      default:
      case 2:
      case 4:
      }
      do
      {
        while (true)
        {
          i = localXmlPullParser.next();
          break;
          String str = localXmlPullParser.getName();
          if (!"ThumbNailcodecConfig".equals(str))
            if ("ThubmnailFastMode".equals(str))
              j = 1;
            else if ("ThubmnailAccurateMode".equals(str))
              k = 1;
        }
        if (j != 0)
        {
          if (localXmlPullParser.getText().equalsIgnoreCase("NXPSWVDEC"))
            MediaArtistNativeHelper.mTNDecConfigFastMode = 1;
          while (true)
          {
            j = 0;
            break;
            if (localXmlPullParser.getText().equalsIgnoreCase("SFHWVDEC"))
              MediaArtistNativeHelper.mTNDecConfigFastMode = 2;
          }
        }
      }
      while (k == 0);
      if (localXmlPullParser.getText().equalsIgnoreCase("NXPSWVDEC"))
        MediaArtistNativeHelper.mTNDecConfigAccurateMode = 1;
      while (true)
      {
        k = 0;
        break;
        if (localXmlPullParser.getText().equalsIgnoreCase("SFHWVDEC"))
          MediaArtistNativeHelper.mTNDecConfigAccurateMode = 2;
      }
    }
    localFileInputStream.close();
  }

  private int setOptimalConfiguration(int paramInt)
  {
    int i;
    int j;
    if (paramInt >= 8000000)
    {
      i = 8000000;
      j = 1080;
      this.mAspectRatio = 2;
    }
    while (true)
    {
      this.modifiedBitrate = i;
      return j;
      if (paramInt >= 5000000)
      {
        i = 5000000;
        j = 720;
        this.mAspectRatio = 1;
      }
      else if (paramInt >= 2000000)
      {
        i = 2000000;
        j = 480;
        this.mAspectRatio = 1;
      }
      else if (paramInt >= 1000000)
      {
        i = 1000000;
        j = 480;
        this.mAspectRatio = 1;
      }
      else if (paramInt >= 800000)
      {
        i = 800000;
        j = 480;
        this.mAspectRatio = 3;
      }
      else if (paramInt >= 512000)
      {
        i = 512000;
        j = 480;
        this.mAspectRatio = 3;
      }
      else if (paramInt >= 384000)
      {
        i = 384000;
        j = 288;
        this.mAspectRatio = 5;
      }
      else if (paramInt >= 256000)
      {
        i = 256000;
        j = 288;
        this.mAspectRatio = 5;
      }
      else if (paramInt >= 192000)
      {
        i = 192000;
        j = 144;
        this.mAspectRatio = 5;
      }
      else if (paramInt >= 128000)
      {
        i = 128000;
        j = 144;
        this.mAspectRatio = 5;
      }
      else if (paramInt >= 96000)
      {
        i = 96000;
        j = 144;
        this.mAspectRatio = 5;
      }
      else
      {
        i = 64000;
        j = 144;
        this.mAspectRatio = 5;
      }
    }
  }

  private void unlock()
  {
    if (Log.isLoggable("VideoEditorImpl", 3))
      Log.d("VideoEditorImpl", "unlock: releasing semaphore");
    this.mLock.release();
  }

  public void addMediaItem(MediaItem paramMediaItem)
  {
    if (paramMediaItem == null)
      try
      {
        throw new IllegalArgumentException("Media item is null");
      }
      finally
      {
      }
    if (this.mMediaItems.contains(paramMediaItem))
      throw new IllegalArgumentException("Media item already exists: " + paramMediaItem.getId());
    if (this.mMediaItems.size() == 1)
      throw new IllegalStateException("More than one media item cannot be added for MediaShare configuration");
    this.mMediaItems.add(paramMediaItem);
    computeTimelineDuration();
  }

  public void cancelExport(String paramString)
  {
    if ((this.mMANativeHelper != null) && (paramString != null))
      this.mMANativeHelper.stop(paramString);
  }

  @Deprecated
  public void cancelFit2Share(String paramString)
  {
    if ((this.mMANativeHelper != null) && (paramString != null))
      this.mMANativeHelper.stop(paramString);
  }

  @Deprecated
  public long export(String paramString, long paramLong, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException, UnsupportedOperationException
  {
    if (paramString == null)
      throw new IllegalArgumentException("export: filename is null");
    File localFile = new File(paramString);
    if (localFile == null)
      throw new IOException(paramString + "can not be created");
    if (this.mMediaItems.size() == 0)
      throw new IllegalStateException("No MediaItems added");
    if (paramLong <= 0L)
      throw new IllegalArgumentException("Size is Zero");
    int i = (int)(this.mDurationMs / 1000L);
    int j = -12200 + (int)(8.0D * ((paramLong - 0.04D * paramLong) / i));
    if (j <= 64000)
    {
      float f = (float)(1000.0D * (8.0D * ((paramLong - 0.04D * paramLong) / 64000.0D)));
      throw new UnsupportedOperationException("export: limit file duration to " + f + " ms");
    }
    int k = setOptimalConfiguration(j);
    int m = this.mAspectRatio;
    int n = 0;
    try
    {
      lock();
      n = 1;
      if (this.mMANativeHelper == null)
        throw new IllegalStateException("The video editor is not initialized");
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
      if (n != 0)
        unlock();
      while (true)
      {
        this.mAspectRatio = m;
        if (localFile.length() <= paramLong)
          break;
        localFile.delete();
        throw new RuntimeException("Generated File size > outputsize; reduce Input file duration and retry");
        this.mMANativeHelper.export(paramString, this.mProjectPath, k, this.modifiedBitrate, 1, 4, paramLong, this.mMediaItems, paramExportProgressListener);
        if (n != 0)
          unlock();
      }
    }
    finally
    {
      if (n != 0)
        unlock();
    }
    return localFile.length();
  }

  public void export(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException
  {
    if (paramString == null)
      throw new IllegalArgumentException("export: filename is null");
    if (this.mMediaItems.size() == 0)
      throw new IllegalStateException("No MediaItems added");
    switch (paramInt3)
    {
    default:
      throw new IllegalArgumentException("Unsupported audio codec type " + paramInt3);
    case 2:
    }
    switch (paramInt4)
    {
    default:
      throw new IllegalArgumentException("Unsupported video codec type " + paramInt4);
    case 4:
    }
    switch (paramInt1)
    {
    default:
      throw new IllegalArgumentException("Argument Height incorrect");
    case 480:
    }
    switch (paramInt2)
    {
    default:
      throw new IllegalArgumentException("Argument Bitrate incorrect");
    case 28000:
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
    if (paramInt4 == 1)
      switch (paramInt1)
      {
      default:
        throw new IllegalArgumentException("Argument Height incorrect for H263 output codec");
      case 96:
        if (getAspectRatio() != 3)
          throw new IllegalArgumentException("Aspect ratio not correct for H263 output codec");
        break;
      case 144:
      case 288:
        if (getAspectRatio() != 5)
          throw new IllegalArgumentException("Aspect ratio not correct for H263 output codec");
        break;
      }
    int i = 0;
    try
    {
      lock();
      i = 1;
      if (this.mMANativeHelper == null)
        throw new IllegalStateException("The video editor is not initialized");
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
      return;
      this.mMANativeHelper.export(paramString, this.mProjectPath, paramInt1, paramInt2, paramInt3, paramInt4, 0L, this.mMediaItems, paramExportProgressListener);
      return;
    }
    finally
    {
      if (i != 0)
        unlock();
    }
  }

  public void export(String paramString, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException
  {
    if (paramString == null)
      throw new IllegalArgumentException("export: filename is null");
    if (new File(paramString) == null)
      throw new IOException(paramString + "can not be created");
    int i = this.mMediaItems.size();
    MediaItem localMediaItem1 = null;
    if (i > 0)
      localMediaItem1 = (MediaItem)this.mMediaItems.get(0);
    if ((this.mMediaItems.size() == 1) && ((localMediaItem1 instanceof MediaVideoItem)))
    {
      MediaItem localMediaItem2 = (MediaItem)this.mMediaItems.get(0);
      setAspectRatio(this.mMANativeHelper.getAspectRatio(localMediaItem2.getWidth(), localMediaItem2.getHeight()));
    }
    int j = 0;
    try
    {
      lock();
      j = 1;
      if (this.mMANativeHelper == null)
        throw new IllegalStateException("The video editor is not initialized");
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
      return;
      return;
    }
    finally
    {
      if (j != 0)
        unlock();
    }
  }

  @Deprecated
  public void exportAs2D(String paramString, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException
  {
    if (paramString == null)
      throw new IllegalArgumentException("export: filename is null");
    if (new File(paramString) == null)
      throw new IOException(paramString + "can not be created");
    int i = 0;
    try
    {
      lock();
      i = 1;
      if (this.mMANativeHelper == null)
        throw new IllegalStateException("The video editor is not initialized");
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
      return;
      this.mMANativeHelper.exportAs2D(paramString, this.mProjectPath, this.mMediaItems, paramExportProgressListener);
      return;
    }
    finally
    {
      if (i != 0)
        unlock();
    }
  }

  @Deprecated
  public long fit2Share(String paramString1, String paramString2, long paramLong, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException, UnsupportedOperationException
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException("fit2Share: filename is null");
    File localFile1 = new File(paramString2);
    if (localFile1 == null)
      throw new IOException(paramString2 + "can not be created");
    File localFile2 = new File(paramString1);
    if (localFile2 == null)
      throw new IOException(paramString1 + "can not be created");
    if (paramLong <= 0L)
      throw new IllegalArgumentException("fit2Share: File Size is Zero");
    ArrayList localArrayList = new ArrayList();
    MediaVideoItem localMediaVideoItem;
    FileOutputStream localFileOutputStream;
    FileInputStream localFileInputStream;
    long l1;
    try
    {
      localMediaVideoItem = new MediaVideoItem(this, "mediaVidItem", paramString1, 0);
      localArrayList.add(localMediaVideoItem);
      if ((localFile2.exists() != true) || (localFile2.length() > paramLong))
        break label385;
      Log.i("FIT2SHARE", "Copying inputfile to output");
      localFileOutputStream = new FileOutputStream(paramString2);
      localFileInputStream = new FileInputStream(paramString1);
      this.mMANativeHelper.setFit2ShareFile(paramString2);
      byte[] arrayOfByte = new byte[1];
      l1 = 0L;
      long l2 = 0L;
      long l3 = localFile2.length();
      while (true)
      {
        int i2 = localFileInputStream.read(arrayOfByte);
        if (i2 <= 0)
          break;
        localFileOutputStream.write(arrayOfByte);
        if (paramExportProgressListener != null)
        {
          l2 += i2;
          if ((100L * l2 / l3 != l1) && (l1 != 0L))
            paramExportProgressListener.onProgress(this, paramString2, (int)l1);
          l1 = 100L * l2 / l3;
        }
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new IllegalArgumentException("Can not create an Media Video Item of fileIn  Issue = " + localIllegalArgumentException.toString());
    }
    if (paramExportProgressListener != null)
      paramExportProgressListener.onProgress(this, paramString2, (int)l1);
    localFileOutputStream.flush();
    localFileOutputStream.close();
    localFileInputStream.close();
    return localFile2.length();
    label385: int i = (int)(localMediaVideoItem.getTimelineDuration() / 1000L);
    int j = -12200 + (int)(8.0D * ((paramLong - 0.04D * paramLong) / i));
    if (j <= 64000)
    {
      float f = (float)(1000.0D * (8.0D * ((paramLong - 0.04D * paramLong) / 64000.0D)));
      throw new UnsupportedOperationException("fit2share: limit file duration to " + f + " ms");
    }
    int k = this.mAspectRatio;
    int m = setOptimalConfiguration(j);
    if (k == this.mAspectRatio)
      localMediaVideoItem.setRenderingMode(1);
    int n = this.mAspectRatio;
    int i1 = 0;
    try
    {
      lock();
      i1 = 1;
      if (this.mMANativeHelper == null)
        throw new IllegalStateException("The video editor is not initialized");
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
      if (i1 != 0)
        unlock();
      while (true)
      {
        this.mAspectRatio = n;
        if (localFile1.length() <= paramLong)
          break;
        localFile1.delete();
        throw new RuntimeException("Generated File size > outputsize; reduce Input file duration and retry");
        this.mMANativeHelper.export(paramString2, this.mProjectPath, m, this.modifiedBitrate, 1, 4, paramLong, localArrayList, paramExportProgressListener);
        if (i1 != 0)
          unlock();
      }
    }
    finally
    {
      if (i1 != 0)
        unlock();
    }
    return localFile1.length();
  }

  @Deprecated
  public long fit2ShareMMS(String paramString1, String paramString2, VideoEditor.ExportProgressListener paramExportProgressListener)
    throws IOException, UnsupportedOperationException
  {
    if ((paramString1 == null) || (paramString2 == null))
      throw new IllegalArgumentException("fit2ShareMMS: filename is null");
    File localFile1 = new File(paramString2);
    if (localFile1 == null)
      throw new IOException(paramString2 + "can not be created");
    if (this.mMANativeHelper == null)
      throw new IllegalStateException("The video editor is not initialized");
    int i = this.mAspectRatio;
    if (this.mAspectRatio != 5)
      this.mAspectRatio = 5;
    ArrayList localArrayList = new ArrayList();
    MediaVideoItem localMediaVideoItem;
    FileOutputStream localFileOutputStream;
    FileInputStream localFileInputStream;
    long l1;
    try
    {
      localMediaVideoItem = new MediaVideoItem(this, "mmsMediaItem", paramString1, 0);
      localArrayList.add(localMediaVideoItem);
      File localFile2 = new File(paramString1);
      if ((localFile2 == null) || (localFile2.length() > 307200L) || (localMediaVideoItem.getVideoType() != 1) || (this.mMANativeHelper.GetClosestVideoFrameRate(localMediaVideoItem.getFps()) != 4) || (localMediaVideoItem.getVideoProfile() > 4) || (localMediaVideoItem.getAudioType() > 1))
        break label391;
      localFileOutputStream = new FileOutputStream(paramString2);
      localFileInputStream = new FileInputStream(paramString1);
      byte[] arrayOfByte = new byte[1];
      l1 = 0L;
      long l2 = 0L;
      long l3 = localFile2.length();
      while (true)
      {
        int n = localFileInputStream.read(arrayOfByte);
        if (n <= 0)
          break;
        localFileOutputStream.write(arrayOfByte);
        if (paramExportProgressListener != null)
        {
          l2 += n;
          if ((100L * l2 / l3 != l1) && (l1 != 0L))
            paramExportProgressListener.onProgress(this, paramString2, (int)l1);
          l1 = 100L * l2 / l3;
        }
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new IllegalArgumentException("Can not create an Media Video Item of fileIn file for MMS  Issue = " + localIllegalArgumentException.toString());
    }
    if (paramExportProgressListener != null)
      paramExportProgressListener.onProgress(this, paramString2, (int)l1);
    localFileOutputStream.flush();
    localFileOutputStream.close();
    localFileInputStream.close();
    return localFile1.length();
    label391: if (localMediaVideoItem.getAspectRatio() == 5)
      localMediaVideoItem.setRenderingMode(1);
    int j = -12200 + (int)(8L * (291840L / (localMediaVideoItem.getDuration() / 1000L)));
    int k;
    if ((j < 8000000) && (j >= 5000000))
      k = 5000000;
    while (true)
    {
      int m = 0;
      try
      {
        lock();
        m = 1;
        this.mMANativeHelper.export(paramString2, this.mProjectPath, 144, k, 1, 1, 307200L, localArrayList, paramExportProgressListener);
        if (m != 0)
          unlock();
        this.mAspectRatio = i;
        if (localFile1.length() > 307200L)
        {
          localFile1.delete();
          throw new RuntimeException("Generated File size > MAX_MMS_CLIP_SIZE; reduce Input file duration and retry");
          if ((j < 5000000) && (j >= 2000000))
          {
            k = 2000000;
            continue;
          }
          if ((j < 2000000) && (j >= 1500000))
          {
            k = 1500000;
            continue;
          }
          if ((j < 1500000) && (j >= 1200000))
          {
            k = 1200000;
            continue;
          }
          if ((j < 1200000) && (j >= 1000000))
          {
            k = 1000000;
            continue;
          }
          if ((j < 1000000) && (j >= 800000))
          {
            k = 800000;
            continue;
          }
          if ((j < 800000) && (j >= 512000))
          {
            k = 512000;
            continue;
          }
          if ((j < 512000) && (j >= 384000))
          {
            k = 384000;
            continue;
          }
          if ((j < 384000) && (j >= 256000))
          {
            k = 256000;
            continue;
          }
          if ((j < 256000) && (j >= 192000))
          {
            k = 192000;
            continue;
          }
          if ((j < 192000) && (j >= 128000))
          {
            k = 128000;
            continue;
          }
          if ((j < 128000) && (j >= 96000))
          {
            k = 96000;
            continue;
          }
          if ((j < 96000) && (j >= 64000))
          {
            k = 64000;
            continue;
          }
          throw new UnsupportedOperationException("fit2ShareMMS: limit file duration to " + 32000 + " ms");
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        while (true)
        {
          Log.e("VideoEditorImpl", "Sem acquire NOT successful in export");
          if (m != 0)
            unlock();
        }
      }
      finally
      {
        if (m != 0)
          unlock();
      }
    }
    return localFile1.length();
  }

  public int getAspectRatio()
  {
    return this.mAspectRatio;
  }

  public long getDuration()
  {
    computeTimelineDuration();
    return this.mDurationMs;
  }

  MediaArtistNativeHelper getNativeContext()
  {
    return this.mMANativeHelper;
  }

  public String getPath()
  {
    return this.mProjectPath;
  }

  public void release()
  {
    int i = 0;
    try
    {
      lock();
      i = 1;
      if (this.mMANativeHelper != null)
      {
        this.mMediaItems.clear();
        this.mMANativeHelper.releaseNativeHelper();
        this.mMANativeHelper = null;
      }
      return;
    }
    catch (Exception localException)
    {
      Log.e("VideoEditorImpl", "Sem acquire NOT successful in export", localException);
      return;
    }
    finally
    {
      if (i != 0)
        unlock();
    }
  }

  public MediaItem removeMediaItem(String paramString)
  {
    try
    {
      MediaItem localMediaItem;
      if (this.mMediaItems.size() > 0)
      {
        localMediaItem = (MediaItem)this.mMediaItems.get(0);
        if (localMediaItem != null)
          this.mMediaItems.remove(localMediaItem);
        if (this.mMediaItems.size() == 0)
        {
          this.mIsList3D = false;
          this.mIsFirstVideoItemAdded = false;
        }
      }
      while (true)
      {
        return localMediaItem;
        localMediaItem = null;
      }
    }
    finally
    {
    }
  }

  public void setAspectRatio(int paramInt)
  {
    try
    {
      this.mAspectRatio = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void updateTimelineDuration()
  {
    computeTimelineDuration();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.lifevibes.videoeditor.VideoEditorImpl
 * JD-Core Version:    0.6.2
 */